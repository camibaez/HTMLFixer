<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Inquiry Loans Balances</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqLoans" class= "datapro.eibs.beans.EDL016001Message"  scope="session"/>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function goRePrint() {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=61&FLAG=P";
	CenterWindow(page,600,400,2);
 
}

function goPayOffReport() {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=61&FLAG=C";
	CenterWindow(page,600,400,2);
 
}

<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}
else  {
%>
	builtNewMenu(ln_i_2_opt);
<%   
}
%>

</SCRIPT>


</head>

<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 
%> 
<div align="center"></div>
<h3 align="center"> Loan Inquiry - Balance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_balances.jsp,EDL0160"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160" >
  <p><b><font color=red> <%= inqLoans.getE01COLATR()%></font> </b>
    <input type=HIDDEN name="SCREEN" value="1">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer/Portfolio :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Status :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <b><font color="#ff6600"><%= inqLoans.getE01STATUS().trim()%></font></b>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
 				<b><font color="#ff6600">
		   		<% if (inqLoans.getH01FLGWK1().equals("1")) out.print("Special Instructions");
		   		   else if (inqLoans.getH01FLGWK1().equals("2")) out.print("Teller Messages"); 
		   		   else if (inqLoans.getH01FLGWK1().equals("3")) out.print("Special Instructions/Teller Messages");
		   		%>
		   		</font></b>               
		      </div>            
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
 				<b><font color="#ff6600">
		   		<% if (!inqLoans.getE01VALPAR().equals("0.00")) out.print("Participated");%>
		   		</font></b>               
		      </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"> 
 				<b><a href="javascript:goRePrint()">Reprint Last Statement</a></b>               
		      </div>
            </td>      
          <% if (inqLoans.getE01STATUS().trim().toUpperCase().equals("CLOSED") || inqLoans.getE01STATUS().trim().toUpperCase().equals("CERRADO")) { %>
          <tr id="trdark">
          	<td colspan="5">
               <div align="right"> 
 				<b><a href="javascript:goPayOffReport()">Pay Off Report</a></b>               
		      </div>         	
          	</td>
          </tr>  
          <%}%>    
        </table>
      </td>
    </tr>
  </table>   
  <h4><b>Summary</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOAM" size="15" maxlength="15" value="<%= inqLoans.getE01DEAOAM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOD1" size="1" maxlength="2" value="<%= inqLoans.getE01DEAOD1().trim()%>" readonly>
              <input type="text" name="E01DEAOD2" size="1" maxlength="2" value="<%= inqLoans.getE01DEAOD2().trim()%>" readonly>
              <input type="text" name="E01DEAOD3" size="1" maxlength="2" value="<%= inqLoans.getE01DEAOD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEP" size="15" maxlength="15" value="<%= inqLoans.getE01DEAMEP().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMD1" size="1" maxlength="2" value="<%= inqLoans.getE01DEAMD1().trim()%>" readonly>
              <input type="text" name="E01DEAMD2" size="1" maxlength="2" value="<%= inqLoans.getE01DEAMD2().trim()%>" readonly>
              <input type="text" name="E01DEAMD3" size="1" maxlength="2" value="<%= inqLoans.getE01DEAMD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Adjustment Principal :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAREA" size="15" maxlength="15" value="<%= inqLoans.getE01DEAREA().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= inqLoans.getE01DEATRM().trim()%>">
              <input type="text" name="E01DEATRC" size="10" 
				  value="<% if (inqLoans.getE01DEATRC().equals("D")) out.print("Day(s)");
							else if (inqLoans.getE01DEATRC().equals("M")) out.print("Month(s)");
							else if (inqLoans.getE01DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest Balance :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEI" size="15" maxlength="15" value="<%= inqLoans.getE01DEAMEI().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01NOWRTE" size="9" maxlength="9" value="<%= inqLoans.getE01NOWRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Late Charges:</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEM" size="15" maxlength="15" value="<%= inqLoans.getE01DEAMEM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= inqLoans.getE01DEABAS().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Escrow Due:</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTDED" size="15" maxlength="15" value="<%= inqLoans.getE01TOTDED().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right"> Last Accrual Date:</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEALC1" size="2" maxlength="2" value="<%= inqLoans.getE01DEALC1().trim()%>" readonly>
              <input type="text" name="E01DEALC2" size="2" maxlength="2" value="<%= inqLoans.getE01DEALC2().trim()%>" readonly>
              <input type="text" name="E01DEALC3" size="2" maxlength="2" value="<%= inqLoans.getE01DEALC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">Commissions :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTCOM" size="15" maxlength="15" value="<%= inqLoans.getE01TOTCOM().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Next Principal Pymnt. / Cycle :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAPPD().trim()%>" readonly>
              / 
              <input type="text" name="E01DEAHE1" size="1" maxlength="2" value="<%= inqLoans.getE01DEAHE1().trim()%>" readonly>
              <input type="text" name="E01DEAHE2" size="1" maxlength="2" value="<%= inqLoans.getE01DEAHE2().trim()%>" readonly>
              <input type="text" name="E01DEAHE3" size="1" maxlength="2" value="<%= inqLoans.getE01DEAHE3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right">Taxes :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTIMP" size="15" maxlength="15" value="<%= inqLoans.getE01TOTIMP().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Next Interest Pymnt. / Cycle :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAIPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAIPD().trim()%>" readonly>
              / 
              <input type="text" name="E01DEARD1" size="1" maxlength="2" value="<%= inqLoans.getE01DEARD1().trim()%>" readonly>
              <input type="text" name="E01DEARD2" size="1" maxlength="2" value="<%= inqLoans.getE01DEARD2().trim()%>" readonly>
              <input type="text" name="E01DEARD3" size="1" maxlength="2" value="<%= inqLoans.getE01DEARD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">Sale Tax :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTIVA" size="15" maxlength="15" value="<%= inqLoans.getE01TOTIVA().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAROA" size="15" maxlength="15" value="<%= inqLoans.getE01DEAROA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right">Balance Total :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01MEMBAL" size="15" maxlength="15" value="<%= inqLoans.getE01MEMBAL().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Other Charges :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01OTHCHG" size="15" maxlength="15" value="<%= inqLoans.getE01OTHCHG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Total Payments :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTPYM" size="15" maxlength="15" value="<%= inqLoans.getE01TOTPYM().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Partial/Early Payment :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DLCAV1" size="15" maxlength="15" value="<%= inqLoans.getE01DLCAV1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Debit Account :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEARAC" size="15" maxlength="15" value="<%= inqLoans.getE01DEARAC().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Principal Due :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPDU" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPDU().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Qualification :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01CALIFI" size="2" maxlength="1" value="<%= inqLoans.getE01CALIFI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Interest Due :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAIDU" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIDU().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Penalty Days :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01MORDYS" size="4" maxlength="4" value="<%= inqLoans.getE01MORDYS().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Reserved for Principal :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DLCPPR" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPPR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Payments Received :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01CUOPAG" size="4" maxlength="4" value="<%= inqLoans.getE01CUOPAG().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Reserved for Interest :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01DLCPIN" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPIN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Payments Due :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="32"> 
              <input type="text" name="E01CUOVEN" size="4" maxlength="4" value="<%= inqLoans.getE01CUOVEN().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" height="32"> 
              <div align="right">Unrecognized Interest :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="32">
              <input type="text" name="E01DLCICO" size="15" maxlength="15" value="<%= inqLoans.getE01DLCICO().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Last Renewal Date :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAEX1" size="2" maxlength="2" value="<%= inqLoans.getE01DEAEX1().trim()%>" readonly>
              <input type="text" name="E01DEAEX2" size="2" maxlength="2" value="<%= inqLoans.getE01DEAEX2().trim()%>" readonly>
              <input type="text" name="E01DEAEX3" size="2" maxlength="2" value="<%= inqLoans.getE01DEAEX3().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right"> Unrecognized Late Charges :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DLCPCO" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPCO().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">Number of Renewals :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEARON" size="2" maxlength="2" value="<%= inqLoans.getE01DEARON().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right">Last Qualification Date :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DLCCO1" size="2" maxlength="2" value="<%= inqLoans.getE01DLCCO1().trim()%>" readonly>
              <input type="text" name="E01DLCCO2" size="2" maxlength="2" value="<%= inqLoans.getE01DLCCO2().trim()%>" readonly>
              <input type="text" name="E01DLCCO3" size="2" maxlength="2" value="<%= inqLoans.getE01DLCCO3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Collateral :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAHTM" size="2" maxlength="1" value="<%= inqLoans.getE01DEAHTM().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right"><a href="javascript:showLCInq('<%= inqLoans.getE01DEACMC().trim()%>')">Line of Credit :</a></div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= inqLoans.getE01DEACMC().trim()%>" readonly>
              <input type="text" name="E01DEACMN2" size="4" maxlength="4" value="<%= inqLoans.getE01DEACMN().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Other Balances</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Principal Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRIPYM" size="15" maxlength="15" value="<%= inqLoans.getE01PRIPYM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interest Accrued LTD :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIAL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIAL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Principal Average :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E01DEAAVP" size="15" maxlength="15" value="<%= inqLoans.getE01DEAAVP().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interest Paid LTD :</div>
            </td>
            <td nowrap  > 
              <input type="text" name="E01DEAIPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIPL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Yesterday's Principal :</div>
            </td>
            <td nowrap  > 
              <input type="text" name="E01DEAPRI" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPRI().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Yesterday's Interest :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01YESINT" size="15" maxlength="15" value="<%= inqLoans.getE01YESINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right">Participation Value :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01VALPAR" size="15" maxlength="15" value="<%= inqLoans.getE01VALPAR().trim()%>" readonly>
            </td>
            <td nowrap  >
              <div align="right">Adjusted Interest :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAIJL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIJL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Interest Paid YTD :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIPY" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIPY().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right"></div>
            </td>
            <td nowrap > 
              
            </td>
          </tr>
           <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Escrow Contribution :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01SCWCTR" size="15" maxlength="15" value="<%= inqLoans.getE01SCWCTR().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Monthly Escrow Deduction :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEADED" size="15" maxlength="15" value="<%= inqLoans.getE01DEADED().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Escrow Disbursement :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01SCWDSB" size="15" maxlength="15" value="<%= inqLoans.getE01SCWDSB().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Escrow Balance :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01SCWBLN" size="15" maxlength="15" value="<%= inqLoans.getE01SCWBLN().trim()%>" readonly>
            </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Commissions Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEACPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEACPL().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Daily Interest :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <input type="text" name="E01DLYINT" size="15" maxlength="15" value="<%= inqLoans.getE01DLYINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Taxes Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEATPL().trim()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Late Charge Accrued :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01DEAPIA" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPIA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Sales Tax Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIVL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIVL().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Late Charges Paid :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPIP" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPIP().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Late Charges Waived :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATDM" size="15" maxlength="15" value="<%= inqLoans.getE01DEATDM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Charge-Off :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLCAV4" size="15" maxlength="15" value="<%= inqLoans.getE01DLCAV4().trim()%>" readonly>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <h4>Rates</h4>  
   <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Actual Base Rate : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01NOWRTE2" size="9" maxlength="9" value="<%= inqLoans.getE01NOWRTE().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Current Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAFRT" size="9" maxlength="9" value="<%= inqLoans.getE01DEAFRT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Previous Base Rate : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAPBR" size="9" maxlength="9" value="<%= inqLoans.getE01DEAPBR().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Previous Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAPFR" size="9" maxlength="9" value="<%= inqLoans.getE01DEAPFR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Effective Rate : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEASPR" size="9" maxlength="9" value="<%= inqLoans.getE01DEASPR().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Next Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEANER" size="9" maxlength="9" value="<%= inqLoans.getE01DEANER().trim()%>" readonly>
            </td>
          </tr>   
        <%if (!inqLoans.getE01DEAFTB().equals("")) {%>
         <tr id="trdark"> 
            <td nowrap >             	
	              <div align="right">VIR Index Table :</div>	            
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAFTB" size="2" maxlength="2" value="<%= inqLoans.getE01DEAFTB().trim()%>">
              <input type="text" readonly name="E01DEAFTY" size="20" maxlength="15" 
				  value="<% if (inqLoans.getE01DEAFTY().equals("FP")) out.print("Primary");
							else if (inqLoans.getE01DEAFTY().equals("FS")) out.print("Secondary ");
							else if (inqLoans.getE01DEAFTY().equals("DS")) out.print("Time Deposits");
							else out.print("");%>">
            </td>
            <td nowrap > 
              <div align="right">Current Rate/Spread :</div>
            </td>
            <td nowrap > 
            <INPUT type="text" name="E01DEARTE" size="10" maxlength="9"
					value="<%= inqLoans.getE01DEARTE()%>" readonly></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">First VIR Effective Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLCPM2" size="2" maxlength="2" value="<%= inqLoans.getE01DLCPM2().trim()%>" readonly>
              <input type="text" name="E01DLCPD2" size="2" maxlength="2" value="<%= inqLoans.getE01DLCPD2().trim()%>" readonly>
              <input type="text" name="E01DLCPY2" size="2" maxlength="2" value="<%= inqLoans.getE01DLCPY2().trim()%>" readonly>
            </td>
            <td > 
              <div align="right">Point Over VIR :</div>
            </td>
            <td > 
               <input type="text"  name="E01DLCFVR" size="10" maxlength="9" value="<%= inqLoans.getE01DLCFVR()%>" readonly>
            </td> 
          </tr> 
          <tr id="trdark"> 
           <td > 
              <div align="right">First VIR Variance No Greater Than :</div>
            </td>
            <td > 
			  <input type="text"  name="E01DLCFVL" size="10" maxlength="9" value="<%= inqLoans.getE01DLCFVL()%>" readonly>
            </td>
            <td > 
              <div align="right"> Days to Obtain VIR :</div>
            </td>
            <td > 
			  <input type="text"  name="E01DLCDOV"  size="3" maxlength="2" value="<%= inqLoans.getE01DLCDOV()%>" readonly>
            </td>           
          </tr>             
          <tr id="trclear"> 
            <td > 
              <div align="right">Rounding Rate :</div>
            </td>
            <td > 
              <input type="text" name="E01DLCRDT" size="40" 
              value="<%if (inqLoans.getE01DLCRDT().equals("1")) { out.print("0.001 to the Nearest"); } 
			  	else if (inqLoans.getE01DLCRDT().equals("2")) { out.print("0.010 to the Neartest"); } 
				else if (inqLoans.getE01DLCRDT().equals("3")) { out.print("0.100 to the Nearest"); }
				else if (inqLoans.getE01DLCRDT().equals("4")) { out.print("0.125 to the Nearest"); }
				else if (inqLoans.getE01DLCRDT().equals("5")) { out.print("0.250 to the Nearest"); }
				else if (inqLoans.getE01DLCRDT().equals("6")) { out.print("0.500 to the Nearest"); }
				else if (inqLoans.getE01DLCRDT().equals("7")) { out.print("1.000 to the Nearest"); }
				else if (inqLoans.getE01DLCRDT().equals("N")) { out.print("None Routing"); }%>" readonly>              
            </td>
            <td > 
              <div align="right">Maximum VIR Change Allowed :</div>
            </td>
            <td > 
              <input type="text"  name="E01DLCMRA" size="10" maxlength="9" value="<%= inqLoans.getE01DLCMRA()%>" readonly>
            </td>
           
          </tr> 
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= inqLoans.getE01DEARRP().trim()%>" readonly>
              <input type="text" name="E01DEAF03" size="10" 
				  value="<% if (inqLoans.getE01DEAF03().equals("D")) out.print("Day(s)");
							else if (inqLoans.getE01DEAF03().equals("M")) out.print("Month(s)");
							else if (inqLoans.getE01DEAF03().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
			</td>
            <td nowrap > 
              <div align="right">Rate Revision Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARR1" size="2" maxlength="2" value="<%= inqLoans.getE01DEARR1().trim()%>" readonly>
              <input type="text" name="E01DEARR2" size="2" maxlength="2" value="<%= inqLoans.getE01DEARR2().trim()%>" readonly>
              <input type="text" name="E01DEARR3" size="2" maxlength="2" value="<%= inqLoans.getE01DEARR3().trim()%>" readonly>
            </td>
          </tr>                     
          <%}%>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap  > 
			  <input type="text"  name="E01DEAMXR" size="10" maxlength="9" value="<%= inqLoans.getE01DEAMXR()%>" readonly>
            </td>
            <td nowrap  > 
              <div align="right">Minimum Rate Allowed :</div>
            </td>           
            <td nowrap  > 
              <input type="text"  name="E01DEAMIR" size="10" maxlength="9" value="<%= inqLoans.getE01DEAMIR()%>" readonly>
            </td>
          </tr>                 
        </table>
      </td>
    </tr>
  </table>
  <h4>Dates </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Funding Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEASD1" size="2" maxlength="2" value="<%= inqLoans.getE01DEASD1().trim()%>" readonly>
              <input type="text" name="E01DEASD2" size="2" maxlength="2" value="<%= inqLoans.getE01DEASD2().trim()%>" readonly>
              <input type="text" name="E01DEASD3" size="2" maxlength="2" value="<%= inqLoans.getE01DEASD3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Last G / L Change Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEALG1" size="2" maxlength="2" value="<%= inqLoans.getE01DEALG1().trim()%>" readonly>
              <input type="text" name="E01DEALG2" size="2" maxlength="2" value="<%= inqLoans.getE01DEALG2().trim()%>" readonly>
              <input type="text" name="E01DEALG3" size="2" maxlength="2" value="<%= inqLoans.getE01DEALG3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Last Rate Change Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARC1" size="2" maxlength="2" value="<%= inqLoans.getE01DEARC1().trim()%>" readonly>
              <input type="text" name="E01DEARC2" size="2" maxlength="2" value="<%= inqLoans.getE01DEARC2().trim()%>" readonly>
              <input type="text" name="E01DEARC3" size="2" maxlength="2" value="<%= inqLoans.getE01DEARC3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right"> Last Pricipal Payment Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEALP1" size="2" maxlength="2" value="<%= inqLoans.getE01DEALP1().trim()%>" readonly>
              <input type="text" name="E01DEALP2" size="2" maxlength="2" value="<%= inqLoans.getE01DEALP2().trim()%>" readonly>
              <input type="text" name="E01DEALP3" size="2" maxlength="2" value="<%= inqLoans.getE01DEALP3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Next Rate Change Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01DEANR1" size="2" maxlength="2" value="<%= inqLoans.getE01DEANR1().trim()%>" readonly>
              <input type="text" name="E01DEANR2" size="2" maxlength="2" value="<%= inqLoans.getE01DEANR2().trim()%>" readonly>
              <input type="text" name="E01DEANR3" size="2" maxlength="2" value="<%= inqLoans.getE01DEANR3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Last Interest Payment Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEALI1" size="2" maxlength="2" value="<%= inqLoans.getE01DEALI1().trim()%>" readonly>
              <input type="text" name="E01DEALI2" size="2" maxlength="2" value="<%= inqLoans.getE01DEALI2().trim()%>" readonly>
              <input type="text" name="E01DEALI3" size="2" maxlength="2" value="<%= inqLoans.getE01DEALI3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Last Modification Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEALM1" size="2" maxlength="2" value="<%= inqLoans.getE01DEALM1().trim()%>" readonly>
              <input type="text" name="E01DEALM2" size="2" maxlength="2" value="<%= inqLoans.getE01DEALM2().trim()%>" readonly>
              <input type="text" name="E01DEALM3" size="2" maxlength="2" value="<%= inqLoans.getE01DEALM3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Modified by :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAUSR" size="15" maxlength="10" value="<%= inqLoans.getE01DEAUSR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Interest Paid Thru :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIT1" size="2" maxlength="2" value="<%= inqLoans.getE01DEAIT1().trim()%>" readonly>
              <input type="text" name="E01DEAIT2" size="2" maxlength="2" value="<%= inqLoans.getE01DEAIT2().trim()%>" readonly>
              <input type="text" name="E01DEAIT3" size="2" maxlength="2" value="<%= inqLoans.getE01DEAIT3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Principal Paid Thru :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAPT1" size="2" maxlength="2" value="<%= inqLoans.getE01DEAPT1().trim()%>" readonly>
              <input type="text" name="E01DEAPT2" size="2" maxlength="2" value="<%= inqLoans.getE01DEAPT2().trim()%>" readonly>
              <input type="text" name="E01DEAPT3" size="2" maxlength="2" value="<%= inqLoans.getE01DEAPT3().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
