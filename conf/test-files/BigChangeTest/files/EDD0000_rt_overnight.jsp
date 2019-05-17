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

	builtNewMenu(rt_m_opt);


	function ClearFields() {

		if (document.forms[0].E05ACMITY.value == 'N') {

			document.forms[0].E05ACMIVL.value = '0';
			document.forms[0].E05ACMIFM.value = '0';
			document.forms[0].E05ACMRTB.value = '';
			document.forms[0].E05ACMOIS.value = '0.000000';
			document.forms[0].E05ACMRAC.value = '0';
			document.forms[0].E05ACMRBR.value = '0';
			document.forms[0].E05ACMRGL.value = '0';
		}
	}

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


<H3 align="center">Overnight Concentration<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_overnight, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="46">
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E05ACMCUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E05CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getHeader3()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E05ACMACC" readonly size="12" maxlength="9" value="<%= userPO.getIdentifier()%>">
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E05ACMPRO" size="4" readonly maxlength="4" value="<%= userPO.getHeader1()%>">
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
          <tr id="trclear">
            <td nowrap width="17%">
              <div align="right">Operation Type :</div>
            </td>
            <td nowrap width="30%">
              <select name="E05ACMITY" onchange="ClearFields();">
                <option value="N" <% if (rtOvernight.getE05ACMITY().equals("N")) out.print("selected"); %>>None</option>
                <option value="B" <% if (rtOvernight.getE05ACMITY().equals("B")) out.print("selected"); %>>Transfer &amp; O/D Protection</option>
                <option value="C" <% if (rtOvernight.getE05ACMITY().equals("C")) out.print("selected"); %>>Transfer the Excess of Fund</option>
                <option value="D" <% if (rtOvernight.getE05ACMITY().equals("D")) out.print("selected"); %>>Overdraft Protection if any</option>
                <option value="R" <% if (rtOvernight.getE05ACMITY().equals("R")) out.print("selected"); %>>Regular Overnight Investment</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%">
              <div align="right">REPO Investment :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="radio" name="E05ACMP12" value="Y" <% if (rtOvernight.getE05ACMP12().equals("Y")) out.print("checked");%>>
                Yes
                <input type="radio" name="E05ACMP12" value="N" <% if (rtOvernight.getE05ACMP12().equals("N")) out.print("checked");%>>
                No 
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%">
              <div align="right">Minimum Balance Required :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E05ACMIVL" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMIVL().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%">
              <div align="right">Investment Multiple :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E05ACMIFM" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMIFM().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" height="23">
              <div align="right">Investment Rate Table :</div>
            </td>
            <td nowrap width="30%" height="23">
              <input type="text" name="E05ACMRTB" size="5" maxlength="5" value="<%= rtOvernight.getE05ACMRTB().trim()%>" onkeypress="enterDecimal()">
              <a href="javascript:GetOvernightTable('E05ACMRTB','<%= rtOvernight.getE05ACMRBK().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" height="19">
              <div align="right">Investment Spread Rate :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E05ACMOIS" maxlength="11" size="11" value="<%= rtOvernight.getE05ACMOIS().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" height="19">
              <div align="right">Investment Retail Account :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E05ACMRAC" size="12" maxlength="12" value="<%= rtOvernight.getE05ACMRAC().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E05ACMRAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" height="19">
              <div align="right">Investment G/L Account (Branch &amp; G/L) :</div>
            </td>
            <td nowrap width="30%" height="19">
              <input type="text" name="E05ACMRBR" size="3" maxlength="3" value="<%= rtOvernight.getE05ACMRBR().trim()%>" onKeyPress="enterInteger()">
              <a href="javascript:GetBranch('E05ACMRBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a>
              <input type="text" name="E05ACMRGL" size="16" maxlength="16" value="<%= rtOvernight.getE05ACMRGL().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E05ACMRGL','<%= rtOvernight.getE05ACMRBK().trim()%>','<%= rtOvernight.getE05ACMRCY().trim()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
 <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
