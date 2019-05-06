<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Inquiry of Certificates</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL016002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_i_opt);
   
</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Time Deposit Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_inq_basic.jsp,EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="41">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Portfolio/Customer :</b></div>
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
              <div align="right"><b>Officer :</b></div>
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
    <table class=tbenter>
   <tr > 
      <td nowrap>
		<h4><b>Basic Information</b></h4>
		</td>
      <td nowrap align=right> 
   		<b>Status :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cdMant.getE02STATUS().trim()%></font></b>
      </td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="26%" height="35"> 
              <div align="right">Original Amount:</div>
            </td>
            <td nowrap width="31%" height="35"> 
              <input type="text" name="E02DEAOAM" size="15" maxlength="15" value="<%= cdMant.getE02DEAOAM().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="35"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="23%" height="35"> 
              <input type="text" name="E02DEAOD1" size="2" maxlength="2" value="<%= cdMant.getE02DEAOD1().trim()%>" readonly>
              <input type="text" name="E02DEAOD2" size="2" maxlength="2" value="<%= cdMant.getE02DEAOD2().trim()%>" readonly>
              <input type="text" name="E02DEAOD3" size="2" maxlength="2" value="<%= cdMant.getE02DEAOD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Interest Rate/Spread :</div>
            </td>
            <td nowrap width="31%"> 
              <input type="text" name="E02DEARTE" size="10" maxlength="9" value="<%= cdMant.getE02DEARTE().trim()%>" readonly>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E02DEAMD1" size="2" maxlength="2" value="<%= cdMant.getE02DEAMD1().trim()%>" readonly>
              <input type="text" name="E02DEAMD2" size="2" maxlength="2" value="<%= cdMant.getE02DEAMD2().trim()%>" readonly>
              <input type="text" name="E02DEAMD3" size="2" maxlength="2" value="<%= cdMant.getE02DEAMD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="26%" height="23">
              <div align="right">Accrual Basis :</div>
            </td>
            <td nowrap width="31%" height="23"> 
              <input type="text" name="E02DEABAS" size="3" maxlength="3" value="<%= cdMant.getE02DEABAS().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right">Term :</div>
            </td>
            <td nowrap width="23%" height="23"> 
              <input type="text" name="E02DEATRM" size="4" maxlength="4" value="<%= cdMant.getE02DEATRM().trim()%>" readonly>
              <input type="text" name="E02DEATRC" size="10" 
				  value="<% if (cdMant.getE02DEATRC().equals("D")) out.print("Day(s)");
							else if (cdMant.getE02DEATRC().equals("M")) out.print("Month(s)");
							else if (cdMant.getE02DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="23"> 
              <div align="right">Interest Accrual :</div>
            </td>
            <td nowrap width="31%" height="23"> 
              <input type="text" name="E02DEAIFL" size="3" 
				  value="<% if (cdMant.getE02DEAIFL().equals("N")) out.print("Yes");
							else if (cdMant.getE02DEAIFL().equals("1")) out.print("No");
							else out.print("");%>" 
				readonly maxlength="3">
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right">Float Table Code :</div>
            </td>
            <td nowrap width="23%" height="23"> 
              <input type="text" name="E02DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE02DEAFTB().trim()%>" readonly>
              <input type="text" name="E02DEAFTY" size="20" 
				  value="<% if (cdMant.getE02DEAFTY().equals("FP")) out.print("Floating Primary");
							else if (cdMant.getE02DEAFTY().equals("FS")) out.print("Floating Secondary");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Interest Calculation Method :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEAICT" size="2" maxlength="1" value="<%= cdMant.getE02DEAICT().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Contract Condition :</div>
            </td>
            <td nowrap width="23%" height="19"> 
              <input type="text" name="E02DEADLC" size="10" 
				  value="<% if (cdMant.getE02DEADLC().equals("1")) out.print("Current");
							else if (cdMant.getE02DEADLC().equals("2")) out.print("Suspended");
							else if (cdMant.getE02DEADLC().equals("3")) out.print("Expired");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEABNK" size="2" maxlength="2" value="<%= cdMant.getE02DEABNK().trim()%>" readonly>
              / 
              <input type="text" name="E02DEABRN" size="3" maxlength="3" value="<%= cdMant.getE02DEABRN().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">General Ledger Account :</div>
            </td>
            <td nowrap width="23%" height="19">
              <input type="text" name="E02DEAGLN" size="16" maxlength="16" value="<%= cdMant.getE02DEAGLN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Foreing Exchange Rate :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEAEXR" size="11" maxlength="11" value="<%= cdMant.getE02DEAEXR().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="23%" height="19">
              <input type="text" name="E02DEACCN" size="8" maxlength="8" value="<%= cdMant.getE02DEACCN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Offset Account :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEAOFB" size="2" maxlength="2" value="<%= cdMant.getE02DEAOFB().trim()%>" readonly>
              <input type="text" name="E02DEAOCR" size="3" maxlength="3" value="<%= cdMant.getE02DEAOCR().trim()%>" readonly>
              <input type="text" name="E02DEAOCY" size="3" maxlength="3" value="<%= cdMant.getE02DEAOCY().trim()%>" readonly>
              <input type="text" name="E02DEAOFA" size="16" maxlength="16" value="<%= cdMant.getE02DEAOFA().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Credit Line :</div>
            </td>
            <td nowrap width="23%" height="19">
              <input type="text" name="E02DEACMC" size="9" maxlength="9" value="<%= cdMant.getE02DEACMC().trim()%>" readonly>
              <input type="text" name="E02DEACMN" size="4" maxlength="4" value="<%= cdMant.getE02DEACMN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Rate Revision Period / Date :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEARRP" size="3" maxlength="3" value="<%= cdMant.getE02DEARRP().trim()%>" readonly>
              / 
              <input type="text" name="E02DEARR1" size="2" maxlength="2" value="<%= cdMant.getE02DEARR1().trim()%>" readonly>
              <input type="text" name="E02DEARR2" size="2" maxlength="2" value="<%= cdMant.getE02DEARR2().trim()%>" readonly>
              <input type="text" name="E02DEARR3" size="2" maxlength="2" value="<%= cdMant.getE02DEARR3().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Withholding/Deductions :</div>
            </td>
            <td nowrap width="23%" height="19"> 
              <input type="text" name="E02DEAWHF" size="2" maxlength="1" value="<%= cdMant.getE02DEAWHF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEAMLA2" size="2" maxlength="1" value="<%= cdMant.getE02DEAMLA().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="23%" height="19"> 
              <input type="text" name="E02DEAREF" size="12" maxlength="12" value="<%= cdMant.getE02DEAREF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Collateral Percent :</div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text" name="E02DEACPE2" size="7" maxlength="7" value="<%= cdMant.getE02DEACPE().trim()%>" readonly>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Deal Class :</div>
            </td>
            <td nowrap width="23%" height="19"> 
              <input type="text" name="E02DEACLF" size="2" maxlength="1" value="<%= cdMant.getE02DEACLF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Inquiry Level (0-9) : </div>
            </td>
            <td nowrap width="31%" height="19"> 
              <input type="text"  name="E02DEAOPT" size="2" maxlength="1" value="<%= cdMant.getE02DEAOPT().trim()%>" readonly>
            </td>
          <% if (cdMant.getE02DEAACD().equals("14")
        || cdMant.getE02DEAACD().equals("15")) { %>
	            <td nowrap width="25%">
	              <div align="right">Line of Credit :</div>
	            </td>
	            <td nowrap width="23%">
				  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= cdMant.getE02DEACMC().trim()%>"  readonly>
	              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= cdMant.getE02DEACMN().trim()%>"  readonly>
	            </td>
   		  <% } %>	              
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <h4>Roll-Over Payment Instructions</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%"> 
              <div align="right">Renewal Code :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E02DEAROC" size="2" maxlength="1" value="<%= cdMant.getE02DEAROC().trim()%>" readonly>
            </td>
            <td nowrap width="18%"> 
              <div align="right">Renewal Rate / Options :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E02DEAROR" size="9" maxlength="9" value="<%= cdMant.getE02DEAROR().trim()%>" readonly>
              <input type="text" name="E02DEAHTM" size="2" maxlength="1" value="<%= cdMant.getE02DEAHTM().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%"> 
              <div align="right">Repayment Account :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E02DEAREB" size="2" maxlength="2" value="<%= cdMant.getE02DEAREB().trim()%>" readonly>
              <input type="text" name="E02DEARPR" size="3" maxlength="3" value="<%= cdMant.getE02DEARPR().trim()%>" readonly>
              <input type="text" name="E02DEARPC" size="3" maxlength="3" value="<%= cdMant.getE02DEARPC().trim()%>" readonly>
              <input type="text" name="E02DEARAC" size="16" maxlength="16" value="<%= cdMant.getE02DEARAC().trim()%>" readonly>
            </td>
            <td nowrap width="18%"> 
              <div align="right">Period :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E02DEAROY" size="4" maxlength="3" value="<%= cdMant.getE02DEAROY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" height="23"> 
              <div align="right">Repayment Amount :</div>
            </td>
            <td nowrap width="35%" height="23"> 
              <input type="text" name="E02DEAROA" size="15" maxlength="15" value="<%= cdMant.getE02DEAROA().trim()%>" readonly>
            </td>
            <td nowrap width="18%" height="23"> 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="23%" height="23">
              <input type="text" name="E02DEAPVI" size="2" maxlength="1" value="<%= cdMant.getE02DEAPVI().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" height="19"> 
              <div align="right">Rate Table :</div>
            </td>
            <td nowrap width="35%" height="19"> 
              <input type="text" name="E02DEARTB" size="2" maxlength="1" value="<%= cdMant.getE02DEARTB().trim()%>" readonly>
            </td>
            <td nowrap width="18%" height="19"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" height="19">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  </form>
</body>
</html>
