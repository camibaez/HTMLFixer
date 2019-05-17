<html>
<head>
<title>Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqBasic" class= "datapro.eibs.beans.EDL016002Message"  scope="session"/>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
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

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_inq_basic.jsp,EDL0160"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
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
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
    <%if (inqBasic.getE02DEAPAR().equals("P")){%>
  <h4>Participated Loan Information</h4>
  <table class="tableinfo" width="582">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> <b> 
                <input type="text" name="E02PARCUN" size="9" maxlength="9" value="<%= inqBasic.getE02PARCUN()%>" readonly>
                </b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name : </b></div>
            </td>
            <td nowrap > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02PARNA1" size="45" maxlength="45" value="<%= inqBasic.getE02PARNA1().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Loan # :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> <b><b> 
                <input type="text" name="E02PARCUN2" size="13" maxlength="12" value="<%= inqBasic.getE02DEAPAC()%>" readonly>
                </b> </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Original Amount: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PAROAM" size="17" maxlength="15" value="<%= inqBasic.getE02PAROAM().trim()%>" readonly>
                </b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Sold Amount : </b></div>
            </td>
            <td nowrap width="20%"><b> 
              <input type="text" name="E02PARASD" size="17" maxlength="15" value="<%= inqBasic.getE02PARASD().trim()%>" readonly>
              </b></td>
            <td nowrap width="16%"> 
              <div align="right"><b>Available :</b></div>
            </td>
            <td nowrap width="16%"><b> 
              <input type="text" name="E02PARAVL" size="17" maxlength="15" value="<%= inqBasic.getE02PARAVL().trim()%>" readonly>
              </b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td nowrap width="20%"><b> 
              <input type="text" name="E02PARMD1" size="3" maxlength="2" value="<%= inqBasic.getE02PARMD1().trim()%>" readonly>
              <input type="text" name="E02PARMD2" size="3" maxlength="2" value="<%= inqBasic.getE02PARMD2().trim()%>" readonly>
              <input type="text" name="E02PARMD3" size="3" maxlength="2" value="<%= inqBasic.getE02PARMD3().trim()%>" readonly>
              </b></td>
            <td nowrap width="16%"> 
              <div align="right"><b>Rate :</b></div>
            </td>
            <td nowrap width="16%"><b> 
              <input type="text" name="E02PARRTE" size="12" maxlength="11" value="<%= inqBasic.getE02PARRTE().trim()%>" readonly>
              </b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>    
    <table class=tbenter>
   <tr > 
      <td nowrap>
		<h4><b>Basic Information</b></h4>
		</td>
      <td nowrap align=right> 
   		<b>Status :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= inqBasic.getE02STATUS().trim()%></font></b>
      </td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAOAM" size="15" maxlength="15" value="<%= inqBasic.getE02DEAOAM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Note Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEAOD1" size="2" maxlength="2" value="<%= inqBasic.getE02DEAOD1().trim()%>" readonly>
              <input type="text" name="E02DEAOD2" size="2" maxlength="2" value="<%= inqBasic.getE02DEAOD2().trim()%>" readonly>
              <input type="text" name="E02DEAOD3" size="2" maxlength="2" value="<%= inqBasic.getE02DEAOD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest Rate/Spread :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEARTE" size="10" maxlength="9" value="<%= inqBasic.getE02DEARTE().trim()%>"readonly>
            </td>
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMD1" size="2" maxlength="2" value="<%= inqBasic.getE02DEAMD1().trim()%>" readonly>
              <input type="text" name="E02DEAMD2" size="2" maxlength="2" value="<%= inqBasic.getE02DEAMD2().trim()%>" readonly>
              <input type="text" name="E02DEAMD3" size="2" maxlength="2" value="<%= inqBasic.getE02DEAMD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEABAS" size="3" maxlength="3" value="<%= inqBasic.getE02DEABAS().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEATRM" size="4" maxlength="4" value="<%= inqBasic.getE02DEATRM().trim()%>"readonly>
              <input type="text" name="E02DEATRC" size="10" 
				  value="<% if (inqBasic.getE02DEATRC().equals("D")) out.print("Day(s)");
							else if (inqBasic.getE02DEATRC().equals("M")) out.print("Month(s)");
							else if (inqBasic.getE02DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAICT" size="2" maxlength="1" value="<%= inqBasic.getE02DEAICT().trim()%>"readonly>
            </td>
            <td nowrap > 
            	<%if (inqBasic.getE02DEACLF().equals("M")){%>
	              <div align="right">VIR Index Table :</div>
	            <%} else {%>  	
              		<div align="right">Floating Rate Table :</div>
              	<%}%>  		
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAFTB" size="2" maxlength="2" value="<%= inqBasic.getE02DEAFTB().trim()%>"readonly>
              <input type="text" name="E02DEAFTY" size="20" 
				  value="<% if (inqBasic.getE02DEAFTY().equals("FP")) out.print("Floating Primary");
							else if (inqBasic.getE02DEAFTY().equals("FS")) out.print("Floating Secondary");
							else if (inqBasic.getE02DEAFTY().equals("DS")) out.print("Time Deposits");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <%if (inqBasic.getE02DEACLF().equals("M")){%>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">VIR Change Date :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E02DEARR1" size="2" maxlength="2" readonly value="<%= inqBasic.getE02DEARR1().trim()%>" >
              <input type="text" name="E02DEARR2" size="2" maxlength="2" readonly value="<%= inqBasic.getE02DEARR2().trim()%>" >
              <input type="text" name="E02DEARR3" size="2" maxlength="2" readonly value="<%= inqBasic.getE02DEARR3().trim()%>" >
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>           
            <td nowrap width="27%" >               
            </td>
          </tr> 
          <tr id="trdark"> 
            <td > 
              <div align="right">VIR Effective :</div>
            </td>
            <td > 
				<input type="text" name="E02DLCVAT" size="30" maxlength="30" readonly
			  	value="<% if (inqBasic.getE02DLCVAT().equals("1")) out.print("At Openning");
							else if (inqBasic.getE02DLCVAT().equals("2")) out.print("At First Change Date");
							else if (inqBasic.getE02DLCVAT().equals("")) out.print("");%>">                         
            </td>
            <td > 
              <div align="right">Maximum Rate Change Allowed :</div>
            </td>
            <td > 
              <input type="text"  name="E02DLCMRA" size="10" maxlength="9" readonly value="<%= inqBasic.getE02DLCMRA()%>">
            </td>
          </tr>          
          <tr id="trclear"> 
           <td > 
              <div align="right">First VIR No Greater Than :</div>
            </td>
            <td > 
			  <input type="text"  name="E02DLCFVL" size="10" maxlength="9" readonly value="<%= inqBasic.getE02DLCFVL()%>">
            </td>
            <td > 
              <div align="right"> Days to Obtain VIR :</div>
            </td>
            <td > 
			  <input type="text"  name="E02DLCDOV" size="3" maxlength="2" readonly value="<%= inqBasic.getE02DLCDOV()%>" >
            </td>           
          </tr>                           
          <tr id="trdark"> 
            <td > 
              <div align="right">First Spread Rate :</div>
            </td>
            <td > 
               <input type="text"  name="E02DLCFVR" size="10" maxlength="9" readonly value="<%= inqBasic.getE02DLCFVR()%>">
            </td>          
            <td > 
              <div align="right">Rounding Rate :</div>
            </td>
            <td > 
				<input type="text" name="E02DLCRDT" size="30" maxlength="30" readonly
			  	value="<% if (inqBasic.getE02DLCRDT().equals("1")) out.print("0.125 to the Nearest");
							else if (inqBasic.getE02DLCRDT().equals("2")) out.print("0.250 to the Neartest");
							else if (inqBasic.getE02DLCRDT().equals("3")) out.print("0.5 to the Neares");
							else if (inqBasic.getE02DLCRDT().equals("N")) out.print("None Routing");%>">	                        
            </td>
          </tr>         
          <%}%>          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Normal Interest Calculation :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAIFL" size="2" maxlength="1" value="<%= inqBasic.getE02DEAIFL().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Maximum Rate Allowed :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMXR" size="9" 
				  value="<%= inqBasic.getE02DEAMXR().trim()%>" 
				readonly maxlength="9">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Penalty Fees Interest Calculation :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAPCL" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPCL().trim()%>" readonly>
              Grace : 
              <input type="text" name="E02DEAGPD" size="2" maxlength="2" value="<%= inqBasic.getE02DEAGPD().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Minimun Rate Allowed :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEAMIR" size="9" 
				  value="<%= inqBasic.getE02DEAMIR().trim()%>" 
				readonly maxlength="9">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Fees Table :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEATLN" size="2" maxlength="2" value="<%= inqBasic.getE02DEATLN().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Penalty Fees Interest :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAPIF" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPIF().trim()%>"readonly>
              <input type="text" name="E02DEAPEI" size="7" maxlength="7" value="<%= inqBasic.getE02DEAPEI().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Bank / Branch / GL :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEABNK" size="2" maxlength="2" value="<%= inqBasic.getE02DEABNK().trim()%>" readonly>
              / 
              <input type="text" name="E02DEABRN" size="3" maxlength="3" value="<%= inqBasic.getE02DEABRN().trim()%>" readonly>
              /
              <input type="text" name="E02DEAGLN" size="16" maxlength="16" value="<%= inqBasic.getE02DEAGLN().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEACOT" size="4" maxlength="3" value="<%= inqBasic.getE02DEACOT().trim()%>" readonly>
            </td>          
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Foreing Exchange Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAEXR" size="11" maxlength="11" value="<%= inqBasic.getE02DEAEXR().trim()%>"readonly>
            </td>
            <td nowrap > 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEACCN" size="8" maxlength="8" value="<%= inqBasic.getE02DEACCN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Risk Clasification :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEARRC" size="11" maxlength="11" value="<%= inqBasic.getE02DEARRC().trim()%>"readonly>
            </td>
            <td nowrap > 
              <div align="right">Obligor Code :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAOBL" size="8" maxlength="8" value="<%= inqBasic.getE02DEAOBL().trim()%>" readonly>
            </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Offset Account :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAOFB" size="2" maxlength="2" value="<%= inqBasic.getE02DEAOFB().trim()%>" readonly>
              <input type="text" name="E02DEAOCR" size="3" maxlength="3" value="<%= inqBasic.getE02DEAOCR().trim()%>" readonly>
              <input type="text" name="E02DEAOCY" size="3" maxlength="3" value="<%= inqBasic.getE02DEAOCY().trim()%>" readonly>
              <input type="text" name="E02DEAOFA" size="16" maxlength="16" value="<%= inqBasic.getE02DEAOFA().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Commitment :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEACMC" size="9" maxlength="9" value="<%= inqBasic.getE02DEACMC().trim()%>" readonly>
              <input type="text" name="E02DEACMN" size="4" maxlength="4" value="<%= inqBasic.getE02DEACMN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Demand Loans :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEALNC" size="2" 
				  value="<% if (inqBasic.getE02DEALNC().equals("Y")) out.print("Yes");
							else if (inqBasic.getE02DEALNC().equals("N")) out.print("No");
							else out.print("");%>" 
				readonly maxlength="2">
            </td>
            <td nowrap > 
              <div align="right">Loan Type :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEACLF" size="2" maxlength="1" 
				value="<%= inqBasic.getE02DEACLF().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Taxes Calculation :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAWHF" size="25" maxlength="25" readonly
			   	value="<% if (inqBasic.getE02DEAWHF().equals("1")) out.print("Withholding Deduction");
				else if (inqBasic.getE02DEAWHF().equals("2")) out.print("Sales Tax");
				else if (inqBasic.getE02DEAWHF().equals("3")) out.print("Both(Withholding and Taxes)");
				else if (inqBasic.getE02DEAWHF().equals("4")) out.print("Taxes in Commissions");
				else if (inqBasic.getE02DEAWHF().equals("5")) out.print("Taxes in Interest");
				else out.print("None");%>">
            </td>
            <td nowrap > 
              <div align="right">Current Status :</div>
            </td>
            <td nowrap >
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEAMLA" size="2" maxlength="1" value="<%= inqBasic.getE02DEAMLA().trim()%>"readonly>
            </td>
            <td nowrap >
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEAREF" size="12" maxlength="12" value="<%= inqBasic.getE02DEAREF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right"> Type Relation 1 :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEAPAR" size="25" maxlength="25" readonly
			  	value="<% if (inqBasic.getE02DEAPAR().equals("F")) out.print("Funding");
							else if (inqBasic.getE02DEAPAR().equals("S")) out.print("Sindicated");
							else if (inqBasic.getE02DEAPAR().equals("P")) out.print("Participation");
							else if (inqBasic.getE02DEAPAR().equals("T")) out.print("Tied to a CDS or a TDS");
							else if (inqBasic.getE02DEAPAR().equals("A")) out.print("Leasing");
							else out.print("None");%>" 
>
            </td>
            <td nowrap >
              <div align="right">Account Relation 1 :</div>
            </td>
            <td nowrap width="23%" height="19">
              <input type="text" name="E02DEAPAC" size="7" maxlength="7" value="<%= inqBasic.getE02DEAPAC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEABRK" size="4" maxlength="3" value="<%= inqBasic.getE02DEABRK().trim()%>"readonly>
            </td>
            <td nowrap > 
              <div align="right">Broker Percentage :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEABCP" size="9" maxlength="9" value="<%= inqBasic.getE02DEABCP().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Loan Revision Date :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02DEAPS1" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPS1().trim()%>" readonly>
              <input type="text" name="E02DEAPS2" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPS2().trim()%>" readonly>
              <input type="text" name="E02DEAPS3" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPS3().trim()%>" readonly>
            </td>
            <td nowrap ><div align="right">Inquiry Level (0-9) : </div></td>
            <td nowrap ><input type="text"  name="E02DEAOPT" size="2" maxlength="1" value="<%= inqBasic.getE02DEAOPT().trim()%>" readonly></td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>

<h4>Community Reinvestment Act (CRA) Information</h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Action Taken Type :</div>
            </td>
            <td nowrap width="23%">            
				<input type="text" readonly  name="E02CRLACT" size="25" maxlength="25" 
			  		value="<% if (inqBasic.getE02CRLACT().equals("1")) out.print("Loan Originated");
							else if (inqBasic.getE02CRLACT().equals("2")) out.print("Purchased by Institution");
							else out.print("");%>">              
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="27%"> 
               
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">FIPS State Code :</div>
            </td>
            <td nowrap width="23%"> 
            	<input type="text" readonly name="E02CRLSTC" size="3" maxlength="2" value="<%= inqBasic.getE02CRLSTC().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">FIPS County Code :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E02CRLCTC" size="4" maxlength="3" value="<%= inqBasic.getE02CRLCTC().trim()%>" >
            </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">MSA/MD Code :</div>
            </td>
            <td nowrap width="23%"> 
            	<input readonly type="text" name="E02CRLMSA" size="6" maxlength="5" value="<%= inqBasic.getE02CRLMSA().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Census Track :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E02CRLCET" size="7" maxlength="6" value="<%= inqBasic.getE02CRLCET().trim()%>" >
            </td>
          </tr>  
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Gross Anual Revenue :</div>
            </td>
            <td nowrap width="23%"> 
			  <input type="text" readonly  name="E02CRLRVC" size="30" maxlength="30" 
			  		value="<% if (inqBasic.getE02CRLRVC().equals("1")) out.print("Less Or Equal To 1 Million");
							else if (inqBasic.getE02CRLRVC().equals("2")) out.print("Greater Than 1 Million");
							else if (inqBasic.getE02CRLRVC().equals("3")) out.print("Not Known");
							else if (inqBasic.getE02CRLRVC().equals("4")) out.print("N/A");
							else out.print("");%>">              
              
            </td>
            <td nowrap width="25%"> 
              <div align="right">Affiliate Code :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly  name="E02CRLAFC" size="35" maxlength="35" 
			  		value="<% if (inqBasic.getE02CRLAFC().equals("1")) out.print("Action Taked at this Institution");
							else if (inqBasic.getE02CRLAFC().equals("2")) out.print("Action Taken at an Affiliate");
							else out.print("");%>">  
              
            </td>
          </tr>                              
   		</table>
      </td>
    </tr>
  </table>   
  
  
  <%if (inqBasic.getE02DEACLF().equals("M")){%>
    <h4>Payment Override </h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
           	<td>
            	<div align="right">Payment Option :</div>
            </td>
			<td>
				<input type="text" name="E02DLCPOP" size="30" maxlength="30" readonly
			  	value="<% if (inqBasic.getE02DLCPOP().equals("1")) out.print("Min. Payment Due");
							else if (inqBasic.getE02DLCPOP().equals("2")) out.print("Int. Only Payment");
							else if (inqBasic.getE02DLCPOP().equals("3")) out.print("XX Years Full Ppal. and Int.");
							else if (inqBasic.getE02DLCPOP().equals("4")) out.print("Normal Loan Payment");
							else out.print("");%>">			           
			</td>
           <td > 
              <div align="right">Payment Amount :</div>
            </td>
            <td > 
              <input type="text"  name="E02DLCMPA" size="14" maxlength="13" readonly value="<%= inqBasic.getE02DLCMPA() %>" >
            </td>
          </tr>        
          <tr id="trdark"> 
           	<td>
            	<div align="right">Initial Payment Number :</div>
            </td>
			<td>
				<input type="text"  name="E02DLCIPN" size="14" maxlength="13" readonly value="<%= inqBasic.getE02DLCIPN() %>" >         
			</td>
           <td > 
              <div align="right">Number of Payments :</div>
            </td>
            <td > 
              <input type="text"  name="E02DLCNPM" size="14" maxlength="13" readonly value="<%= inqBasic.getE02DLCNPM() %>" >
            </td>
          </tr>           
          <tr id="trclear"> 
            <td nowrap width="33%" ><b>Only for "Minimum Payment Due" Option</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td>
            	<div align="right">Factor (%) :</div>
            </td>
			<td>
				<input type="text"  name="E02DLCMFA" size="10" maxlength="9" readonly value="<%= inqBasic.getE02DLCMFA() %>" >
			</td>
           <td > 
              <div align="right">Change Frequency :</div>
            </td>
            <td > 
            	<input type="text" name="E02DLCMPF" size="20" maxlength="20" readonly
			  	value="<% if (inqBasic.getE02DLCMPF().equals("M")) out.print("Monthly");
							else if (inqBasic.getE02DLCMPF().equals("Q")) out.print("Quarterly");
							else if (inqBasic.getE02DLCMPF().equals("S")) out.print("Semiannually");
							else if (inqBasic.getE02DLCMPF().equals("Y")) out.print("Annually");
							else out.print("None");%>">		
            </td>
          </tr>          
          <tr id="trclear">
            <td > 
              <div align="right">Change Cap (%) :</div>
            </td>
            <td > 
              <input type="text"  name="E02DLCMPR" size="10" maxlength="9" readonly value="<%= inqBasic.getE02DLCMPR() %>" >
            </td>
            <td > 
              <div align="right">First Time to Override Minimum Payment (Months) :</div>
            </td>
            <td > 
              <input type="text"  name="E02DLCEMP" size="4" maxlength="3" readonly value="<%= inqBasic.getE02DLCEMP() %>" >
            </td>
          </tr>           
          <tr id="trdark"> 
            <td>
               <div align="right">Minimum Payment Override Cycle (Months) :</div>
            </td>
            <td>
               <input type="text"  name="E02DLCEMF" size="4" maxlength="3" readonly value="<%= inqBasic.getE02DLCEMF() %>" >
            </td>     
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>    
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" ><b>Only for "XX-Years Full Principal and Interest" Option</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td>
               <div align="right">Loan Terms (Years) :</div>
            </td>
            <td>
               <input type="text"  name="E02DLCTER" size="4" maxlength="3" readonly value="<%= inqBasic.getE02DLCTER() %>" onKeypress="enterInteger()">
            </td>     
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>           
          </tr>       
        </table>
      </td>
    </tr>
  </table>  
  <%}%>   
  <h4>Payments Conditions </h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="27%" > 
              <div align="right">Debit Account :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E02DEAREB" size="2" maxlength="2" value="<%= inqBasic.getE02DEAREB().trim()%>" readonly>
              <input type="text" name="E02DEARPR" size="3" maxlength="3" value="<%= inqBasic.getE02DEARPR().trim()%>" readonly>
              <input type="text" name="E02DEARPC" size="3" maxlength="3" value="<%= inqBasic.getE02DEARPC().trim()%>" readonly>
              <input type="text" name="E02DEARAC" size="16" maxlength="16" value="<%= inqBasic.getE02DEARAC().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Overdraft Authorization :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEAODA" size="2" 
			  value="<%= inqBasic.getE02DEAODA().trim()%>" readonly maxlength="2">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Cycle / Date Refinanced Int. :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E02DEAXRC" size="3" maxlength="3" value="<%= inqBasic.getE02DEAXRC().trim()%>" readonly>
              / 
              <input type="text" name="E02DEAXR1" size="2" maxlength="2" value="<%= inqBasic.getE02DEAXR1().trim()%>" readonly>
              <input type="text" name="E02DEAXR2" size="2" maxlength="2" value="<%= inqBasic.getE02DEAXR2().trim()%>" readonly>
              <input type="text" name="E02DEAXR3" size="2" maxlength="2" value="<%= inqBasic.getE02DEAXR3().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Refinance Until :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEAPC1" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPC1().trim()%>" readonly>
              <input type="text" name="E02DEAPC2" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPC2().trim()%>" readonly>
              <input type="text" name="E02DEAPC3" size="2" maxlength="2" value="<%= inqBasic.getE02DEAPC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%" > 
              <div align="right">Final Payment Amount :</div>
            </td>
            <td nowrap width="26%" > 
              <input type="text" name="E02DEABAP" size="15" maxlength="15" value="<%= inqBasic.getE02DEABAP().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Final Payment Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEABA1" size="2" maxlength="2" value="<%= inqBasic.getE02DEABA1().trim()%>" readonly>
              <input type="text" name="E02DEABA2" size="2" maxlength="2" value="<%= inqBasic.getE02DEABA2().trim()%>" readonly>
              <input type="text" name="E02DEABA3" size="2" maxlength="2" value="<%= inqBasic.getE02DEABA3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Schedule % / Increase Payment : </div>
            </td>
            <td nowrap width="26%" >
              <input type="text" name="E02DEAPAP" size="9" maxlength="9" value="<%= inqBasic.getE02DEAPAP().trim()%>" readonly>
              / 
              <input type="text" name="E02DEA2TC" size="2" maxlength="1" value="<%= inqBasic.getE02DEA2TC().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Cycle/ Next Payment Incr. :</div>
            </td>
            <td nowrap width="10%" height="20">
              <input type="text" name="E02DEAPCU" size="3" maxlength="3" value="<%= inqBasic.getE02DEAPCU().trim()%>" readonly>
              / 
              <input type="text" name="E02DEALS1" size="2" maxlength="2" value="<%= inqBasic.getE02DEALS1().trim()%>" readonly>
              <input type="text" name="E02DEALS2" size="2" maxlength="2" value="<%= inqBasic.getE02DEALS2().trim()%>" readonly>
              <input type="text" name="E02DEALS3" size="2" maxlength="2" value="<%= inqBasic.getE02DEALS3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%" > 
              <div align="right">Principal Payments :</div>
            </td>
            <td nowrap width="26%" >
              <input type="text" name="E02DLCABC" size="3" maxlength="3" value="<%= inqBasic.getE02DLCABC().trim()%>" readonly>
              <input type="text" name="E02DLCABF" size="2" maxlength="1" value="<%= inqBasic.getE02DLCABF().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Cycle/ Next Principal Payment :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLCABC2" size="3" maxlength="3" value="<%= inqBasic.getE02DLCABC().trim()%>" readonly>
              / 
              <input type="text" name="E02DLCAB1" size="2" maxlength="2" value="<%= inqBasic.getE02DLCAB1().trim()%>" readonly>
              <input type="text" name="E02DLCAB2" size="2" maxlength="2" value="<%= inqBasic.getE02DLCAB2().trim()%>" readonly>
              <input type="text" name="E02DLCAB3" size="2" maxlength="2" value="<%= inqBasic.getE02DLCAB3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Payment Excluded Month :</div>
            </td>
            <td nowrap width="26%" >
              <input type="text" name="E02DEARPT" size="2" maxlength="2" value="<%= inqBasic.getE02DEARPT().trim()%>" readonly>
            </td>
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap>&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
