<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="checksParam" class="datapro.eibs.beans.ECH011001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%>

<H3 align="center">Checkbook Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="checkbook_parameter_details.jsp, ECH0110"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECH0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01CHKATY" value="<%= userPO.getType()%>">
  <input type=HIDDEN name="E01CHKTCB" value="<%= userPO.getHeader1()%>">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Description :</b></div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="E01CHKDES" maxlength="35" size="36" value="<%= checksParam.getE01CHKDES().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
            </td>
            <td nowrap colspan="3" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Bank :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left"> <b>
                <input type="text" name="E01CHKBNK" size="3" maxlength="2"  value="<%= userPO.getBank()%>" readonly>
                </b></div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CHKCCY" size="4"  maxlength="3" value="<%= userPO.getCurrency()%>" readonly>
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Account Type :</b></div>
            </td>
            <td nowrap width="20%" >
              <select name="E01CHKATY1" disabled>
                <option value="" ></option>
                <option value="DDA" <% if (userPO.getType().equals("DDA")) out.print("selected"); %>>Demand
                Deposit Account</option>
                <option value="MMK" <% if (userPO.getType().equals("MMK")) out.print("selected"); %>>Money
                Market Account</option>
                <option value="NOW" <% if (userPO.getType().equals("NOW")) out.print("selected"); %>>Now
                Account</option>
                <option value="SAV" <% if (userPO.getType().equals("SAV")) out.print("selected"); %>>Savings
                Account</option>
              </select>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Checkbook Type :</b></div>
            </td>
            <td nowrap colspan="3" >
              <select name="E01CHKTCB1" disabled>
                <option value="" ></option>
                <option value="1" <% if (userPO.getHeader1().equals("1")) out.print("selected"); %>>Standard</option>
                <option value="2" <% if (userPO.getHeader1().equals("2")) out.print("selected"); %>>Continuos
                Paper and Left Checkstub</option>
                <option value="3" <% if (userPO.getHeader1().equals("3")) out.print("selected"); %>>Continuos
                Paper and buttom checkstub</option>
              </select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right">Checkbook :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHKCOD" size="5" maxlength="4" value="<%= checksParam.getE01CHKCOD().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">Checkbook Number :</div>
            </td>
            <td nowrap height="23">
              <input type="text" name="E01CHKNCK" size="5" maxlength="4" value="<%= checksParam.getE01CHKNCK().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">G/L Checkbook Cost </div>
            </td>
            <td nowrap width="40%" height="19"><b><font face="Arial"><font face="Arial"><font size="2">
              <input type="text" name="E01CHKCOC" size="4"  maxlength="3" value="<%= checksParam.getE01CHKCOC().trim()%>">
              <a href="javascript:GetCurrency('E01CHKCOC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <input type="text" name="E01CHKCOG" size="17" maxlength="16" value="<%= checksParam.getE01CHKCOG().trim()%>">
              <a href="javascript:GetLedger('E01CHKCOG',document.forms[0].E01CHKBNK.value,document.forms[0].E01CHKCOC.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </font></font></font></b> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="right">Checkbook Cost :</div>
            </td>
            <td nowrap width="40%" height="19">
              <input type="text" name="E01CHKCOR" maxlength="315" size="17" value="<%= checksParam.getE01CHKCOR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">G/L Checkbook Taxes :</div>
            </td>
            <td nowrap height="19"> <b><font face="Arial"><font face="Arial"><font size="2">
              <input type="text" name="E01CHKTXC" size="4"  maxlength="3" value="<%= checksParam.getE01CHKTXC().trim()%>">
              <a href="javascript:GetCurrency('E01CHKTXC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <input type="text" name="E01CHKTXG" size="17" maxlength="16" value="<%= checksParam.getE01CHKTXG().trim()%>">
              <a href="javascript:GetLedger('E01CHKTXG',document.forms[0].E01CHKBNK.value,document.forms[0].E01CHKTXC.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></font></font></font></b></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="right">Checkbook Tax :</div>
            </td>
            <td nowrap height="19">
              <input type="text" name="E01CHKTXR" size="8" maxlength="6" value="<%= checksParam.getE01CHKTXR().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">Provider Number :</div>
            </td>
            <td nowrap height="19">
              <input type="text" name="E01CHKPRO" size="10" maxlength="9" value="<%= checksParam.getE01CHKPRO().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
