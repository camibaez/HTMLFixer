<html>
<head>
<title>Overnight Concentration</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtOvernight" class="datapro.eibs.beans.EDD000005Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
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
%>
<SCRIPT> initMenu();  </SCRIPT>


<H3 align="center">Overnight Concentration<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_overdraft, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="46">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly  name="E05ACMCUN" size="9" maxlength="9"  value="<%= userPO.getHeader2()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly  name="E05CUSNA1" size="45"  maxlength="45" value="<%= userPO.getHeader3()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly  name="E05ACMACC"  size="12" maxlength="9" value="<%= userPO.getIdentifier()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly  name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly  name="E05ACMPRO" size="4"  maxlength="4" value="<%= userPO.getHeader1()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Overnight Concentration</h4>  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Operation Type :</div>
            </td>
            <td nowrap width="30%"> 
                 <input type="text" readonly    name="E05ACMITY" size="35" maxlength="35" 
				  value="<% if (rtOvernight.getE05ACMITY().equals("B")) out.print("Transfer &amp; O/D Protection");
							else if (rtOvernight.getE05ACMITY().equals("C")) out.print("Transfer the Excess of Fund");
							else if (rtOvernight.getE05ACMITY().equals("D")) out.print("Overdraft Protection if any");
							else if (rtOvernight.getE05ACMITY().equals("R")) out.print("Regular Overnight Investment");
							else if (rtOvernight.getE05ACMITY().equals("N")) out.print("None");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%"> 
              <div align="right">Minimum Balance Required :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" readonly   name="E05ACMIVL" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMIVL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right">Investment Multiple :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly   name="E05ACMIFM" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMIFM().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="23"> 
              <div align="right">Investment Rate Table :</div>
            </td>
            <td nowrap width="30%" height="23"> 
              <input type="text" readonly  name="E05ACMRTB" size="5" maxlength="5" value="<%= rtOvernight.getE05ACMRTB().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" height="38"> 
              <div align="right">Investment Spread Rate :</div>
            </td>
            <td nowrap width="30%" height="38"> 
              <input type="text" readonly    name="E05ACMOIS" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMOIS().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" height="19">
              <div align="right">Investment Retail Account :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" readonly   name="E05ACMRAC" size="12" maxlength="12" value="<%= rtOvernight.getE05ACMRAC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" height="19"> 
              <div align="right">Investment G/L Account (Branch &amp; G/L) :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" readonly   name="E05ACMRBR" size="3" maxlength="3" value="<%= rtOvernight.getE05ACMRBR().trim()%>">
              <input type="text" readonly    name="E05ACMRGL" size="16" maxlength="16" value="<%= rtOvernight.getE05ACMRGL().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  </form>
</body>
</html>
