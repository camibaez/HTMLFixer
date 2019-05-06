<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="invPort" class="datapro.eibs.beans.EIE001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }


  builtNewMenu(cus_a_port_opt);
  initMenu();

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
%>
<div align="center">
  <h3>Investments / Customer Portfolio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_port_basic.jsp,EIE0010A"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN" value="2" >
  </h4>
  <table border="0" width="100%">
    <tr id="trclear"> 
      <td width="82%"> 
        <div align="right">Status :</div>
      </td>
      <td width="18%"><% if(invPort.getE01PRFFL1().equals("P")) out.print("Pending");
              				else if(invPort.getE01PRFFL1().equals("A")) out.print("Active");
							else if(invPort.getE01PRFFL1().equals("I")) out.print("Inactive");
							else out.print("");%></td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
            </td>
            <td nowrap> 
              <input type="hidden" readonly  name="E01PRFCUN" size="12" maxlength="9" value="<%= invPort.getE01PRFCUN().trim()%>" 
			  <% if (invPort.getF01PRFCUN().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="hidden" readonly  name="D01CUSNA1" size="35" maxlength="35" value="<%= invPort.getD01CUSNA1().trim()%>" 
			  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Portfolio / Description :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFNUM" size="12" maxlength="9" value="<%= invPort.getE01PRFNUM().trim()%>" 
		      <% if (invPort.getF01PRFNUM().equals("Y")) out.print("id=\"txtchanged\""); %>>
              / 
              <input type="text" readonly  name="E01PRFDSC" size="35" maxlength="35" value="<%= invPort.getE01PRFDSC()%>"
			  <% if (invPort.getF01PRFDSC().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Account Officer :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly  name="E01PRFOFC" size="6" maxlength="4" value="<%= invPort.getE01PRFOFC().trim()%>"
			   <% if (invPort.getF01PRFOFC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="D01OFCNME" size="35" maxlength="35" value="<%= invPort.getD01OFCNME()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFOP1" size="3" maxlength="2" value="<%= invPort.getE01PRFOP1().trim()%>" onKeyPress="enterInteger()"
			  <% if (invPort.getF01PRFOP1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01PRFOP2" size="3" maxlength="2" value="<%= invPort.getE01PRFOP2().trim()%>" onKeyPress="enterInteger()"
			  <% if (invPort.getF01PRFOP2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01PRFOP3" size="3" maxlength="2" value="<%= invPort.getE01PRFOP3().trim()%>" onKeyPress="enterInteger()"
			  <% if (invPort.getF01PRFOP3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Portfolio Currency :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFVCY" size="4" maxlength="3" value="<%= invPort.getE01PRFVCY().trim()%>"
			 <% if (invPort.getF01PRFVCY().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Custody Table :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFCUT" size="4" maxlength="2" value="<%= invPort.getE01PRFCUT()%>"
				<% if (invPort.getF01PRFCUT().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          
          <tr id="trdark">
            <td nowrap width="34%" > 
              <div align="right">Referred by :</div>
            </td>          
            <td nowrap > 
              <input type="text" name="E01PRFFL4" size="4" maxlength="3" value="<%= invPort.getE01PRFFL4().trim()%>" readonly>
              <input type="text" name="E01PRFRBY" size="35" maxlength="35" value="<%= invPort.getE01PRFRBY().trim()%>" readonly>
            </td>           
          </tr>
                    
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Default Confirmation Via :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01PRFCNF" size="20" maxlength="15" 
				<% if (invPort.getF01PRFCNF().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFCNF().equals("P")) out.print("Printer");
							else if (invPort.getE01PRFCNF().equals("E")) out.print("e-Mail");
							else if (invPort.getE01PRFCNF().equals("F")) out.print("Fax");
							else out.print("None");%>" >
              </div>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Portfolio Type :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFTYP" size="20" maxlength="15" 
				<% if (invPort.getF01PRFTYP().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFTYP().equals("D")) out.print("Discretionary");
							else if (invPort.getE01PRFTYP().equals("N")) out.print(" Non Discretionary");
							else out.print("");%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Valid W8? :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <div align="left"> 
                <input type="radio" disabled name="E01PRFFL0" value="Y" onClick="document.forms[0].E01PRFFL0.value='Y'" <%if(invPort.getE01PRFFL0().equals("Y")) out.print("checked");%>>
                Yes 
                <input type="radio" disabled name="E01PRFFL0" value="N" onClick="document.forms[0].E01PRFFL0.value='N'" <%if(invPort.getE01PRFFL0().equals("N")) out.print("checked");%>>
                No
              </div>
              </div>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Information Shown on Statements :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01PRFFL2" size="70" maxlength="70" 
				<% if (invPort.getF01PRFFL2().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFFL2().equals("2")) out.print("Do not display accumulated interests in Bonds nor in Time Deposits");
							else if (invPort.getE01PRFFL2().equals("3")) out.print("Display accumulated interests in Bonds but not in Time Deposits");
							else if (invPort.getE01PRFFL2().equals("4")) out.print("Do not display accumulated interests in Bonds but display in Deposits");
							else out.print("Display accumulated interests in Bonds and in Time Deposits");%>" >
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <h4>Investment Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan=2 > 
              <div align="left"><b>Investments on</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Fixed Income :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRFFXR" size="5" maxlength="3" 
				<% if (invPort.getF01PRFFXR().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFFXR().equals("Y")) out.print("YES");
							else if (invPort.getE01PRFFXR().equals("N")) out.print(" NO");
							else out.print("");%>" >
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Variable Income :</div>
            </td>
            <td nowrap>
			  <input type="text" readonly  name="E01PRFVIR" size="5" maxlength="3" 
				<% if (invPort.getF01PRFVIR().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFVIR().equals("Y")) out.print("YES");
							else if (invPort.getE01PRFVIR().equals("N")) out.print(" NO");
							else out.print("");%>" >               
               </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Banking Products :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly  name="E01PRFBPR" size="5" maxlength="3" 
				<% if (invPort.getF01PRFBPR().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invPort.getE01PRFBPR().equals("Y")) out.print("YES");
							else if (invPort.getE01PRFBPR().equals("N")) out.print(" NO");
							else out.print("");%>" > 
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Default Payment Account </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"><b>Payment Accounts</b></div>
            </td>
            <td nowrap> 
              <div align="center">Bank</div>
            </td>
            <td nowrap> 
              <div align="center">Branch</div>
            </td>
            <td nowrap> 
              <div align="center">Currency</div>
            </td>
            <td nowrap> 
              <div align="center">G/L</div>
            </td>
            <td nowrap> 
              <div align="center">Reference</div>
            </td>
            <td nowrap> 
              <div align="center">Cost Center</div>
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Interest (Coupons) :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFIBK" size="2" maxlength="2" value="<%= invPort.getE01PRFIBK()%>"
				<% if (invPort.getF01PRFIBK().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFIBR" size="3" maxlength="3" value="<%= invPort.getE01PRFIBR()%>"
                <% if (invPort.getF01PRFIBR().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFICY" size="3" maxlength="3" value="<%= invPort.getE01PRFICY()%>"
                <% if (invPort.getF01PRFICY().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFIGL" size="15" maxlength="13" value="<%= invPort.getE01PRFIGL()%>" 
				<% if (invPort.getF01PRFIGL().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFIAC" size="12" maxlength="9" value="<%= invPort.getE01PRFIAC()%>"
                <% if (invPort.getF01PRFIAC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFICC" size="12" maxlength="9" value="<%= invPort.getE01PRFICC()%>"
               <% if (invPort.getF01PRFICC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Dividends :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDBK" size="2" maxlength="2" value="<%= invPort.getE01PRFDBK()%>"
				<% if (invPort.getF01PRFDBK().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDBR" size="3" maxlength="3" value="<%= invPort.getE01PRFDBR()%>"
                <% if (invPort.getF01PRFDBR().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDCY" size="3" maxlength="3" value="<%= invPort.getE01PRFDCY()%>"
                <% if (invPort.getF01PRFDCY().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDGL" size="15" maxlength="13" value="<%= invPort.getE01PRFDGL()%>" 
				<% if (invPort.getF01PRFDGL().equals("Y")) out.print("id=\"txtchanged\""); %> >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDAC" size="12" maxlength="9" value="<%= invPort.getE01PRFDAC()%>"
                <% if (invPort.getF01PRFDAC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFDCC" size="12" maxlength="9" value="<%= invPort.getE01PRFDCC()%>"
                <% if (invPort.getF01PRFDCC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap id="trdark"> 
              <div align="right">Capital :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCBK" size="2" maxlength="2" value="<%= invPort.getE01PRFCBK()%>"
				<% if (invPort.getF01PRFCBK().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCBR" size="3" maxlength="3" value="<%= invPort.getE01PRFCBR()%>"
                <% if (invPort.getF01PRFCBR().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCCY" size="3" maxlength="3" value="<%= invPort.getE01PRFCCY()%>"
                <% if (invPort.getF01PRFCCY().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCGL" size="15" maxlength="13" value="<%= invPort.getE01PRFCGL()%>" 
				<% if (invPort.getF01PRFCGL().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCAC" size="12" maxlength="9" value="<%= invPort.getE01PRFCAC()%>"
                <% if (invPort.getF01PRFCAC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" readonly  name="E01PRFCCC" size="12" maxlength="9" value="<%= invPort.getE01PRFCCC()%>"
                <% if (invPort.getF01PRFCCC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <input type="hidden" readonly  name="E01PRFCM1" size="80" maxlength="80" value="<%= invPort.getE01PRFCM1() %>"
	 <% if (invPort.getF01PRFCM1().equals("Y")) out.print("id=\"txtchanged\""); %>>
    <input type="hidden" readonly  name="E01PRFCM2" size="80" maxlength="80" value="<%= invPort.getE01PRFCM2() %>"
	 <% if (invPort.getF01PRFCM2().equals("Y")) out.print("id=\"txtchanged\""); %>>
    <input type="hidden" readonly  name="E01PRFCM3" size="80" maxlength="80" value="<%= invPort.getE01PRFCM3() %>"
	 <% if (invPort.getF01PRFCM3().equals("Y")) out.print("id=\"txtchanged\""); %>>
    <input type="hidden" readonly  name="E01PRFCM4" size="80" maxlength="80" value="<%= invPort.getE01PRFCM4() %>"
	 <% if (invPort.getF01PRFCM4().equals("Y")) out.print("id=\"txtchanged\""); %>>  
  </form>
</body>
</html>
