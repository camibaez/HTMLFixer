<html>
<head>
<title>Account Status Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtStatus" class="datapro.eibs.beans.EDD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%
}
%>

</SCRIPT>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<H3 align="center">Account Status Maintenance <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_chg_status, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
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
                <input type="text" name="E02ACMCUN" readonly size="9" maxlength="9" value="<%= rtStatus.getE02ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E02CUSNA1" size="45" readonly maxlength="45" value="<%= rtStatus.getE02CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E02ACMACC" size="12" readonly maxlength="12" value="<%= rtStatus.getE02ACMACC().trim()%>">
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
                <input type="text" name="E02ACMPRO" size="4" readonly maxlength="4" value="<%= rtStatus.getE02ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="41%">
              <div align="right">Account Status :</div>
            </td>
            <td nowrap width="59%">
              <select name="E02ACMAST">
                <option value=" " <% if (!(rtStatus.getE02ACMAST().equals("A") ||rtStatus.getE02ACMAST().equals("C")
				||rtStatus.getE02ACMAST().equals("I")||rtStatus.getE02ACMAST().equals("D")
				||rtStatus.getE02ACMAST().equals("O")||rtStatus.getE02ACMAST().equals("E")
				||rtStatus.getE02ACMAST().equals("T"))) out.print("selected"); %>></option>
                <option value="A" <% if (rtStatus.getE02ACMAST().equals("A")) out.print("selected"); %>>Active</option>
                <option value="C" <% if (rtStatus.getE02ACMAST().equals("C")) out.print("selected"); %>>Cancelled</option>
                <option value="I" <% if (rtStatus.getE02ACMAST().equals("I")) out.print("selected"); %>>Inactive 1</option>
                <option value="D" <% if (rtStatus.getE02ACMAST().equals("D")) out.print("selected"); %>>Inactive 2</option>
                <option value="O" <% if (rtStatus.getE02ACMAST().equals("O")) out.print("selected"); %>>Controlled</option>
				<option value="E" <% if (rtStatus.getE02ACMAST().equals("E")) out.print("selected"); %>>Embargoed</option>
				<option value="T" <% if (rtStatus.getE02ACMAST().equals("T")) out.print("selected"); %>>Deposit Only</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="41%">
              <div align="right">Changed by Officer :</div>
            </td>
            <td nowrap width="59%">
              <input type="text" name="E02ACMUIN" size="5" maxlength="4" value="<%= rtStatus.getE02ACMUIN().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02ACMUIN','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="41%" height="23">
              <div align="right">Last Date Changed :</div>
            </td>
            <td nowrap width="59%" height="23">
              <input type="text" name="E02ACMCH1" size="2" maxlength="2" value="<%= rtStatus.getE02ACMCH1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02ACMCH2" size="2" maxlength="2" value="<%= rtStatus.getE02ACMCH2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E02ACMCH3" size="2" maxlength="2" value="<%= rtStatus.getE02ACMCH3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02ACMCH1,document.forms[0].E02ACMCH2,document.forms[0].E02ACMCH3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="41%" height="19">
              <div align="right">Change Last Activity Date / Last Update :</div>
            </td>
            <td nowrap width="59%" height="19">
              <input type="hidden" name="E02ACMACT">
              <input type="radio" name="CE02ACMACT" value="Y" onClick="document.forms[0].E02ACMACT.value='Y'"
			  <%if(rtStatus.getE02ACMACT().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE02ACMACT" value="N" onClick="document.forms[0].E02ACMACT.value='N'"
			  <%if(rtStatus.getE02ACMACT().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="41%" height="19">
              <div align="right">Description :</div>
            </td>
            <td nowrap width="59%" height="19">
              <input type="text" name="E02ADECRI" size="35" maxlength="35" value="<%= rtStatus.getE02ADECRI().trim()%>">
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
