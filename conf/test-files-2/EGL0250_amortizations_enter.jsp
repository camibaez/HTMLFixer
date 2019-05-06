<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="msgAmort" class="datapro.eibs.beans.EGL025001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Stop/Delete Amortizations<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="amortizations_enter, EGL0250"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0250">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr>
      <td width="50%">
        <div align="right">Bank Code : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="H01SELBNK" size="3" maxlength="2" value="<%= msgAmort.getH01SELBNK()%>">
         </div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">Branch Number : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="H01SELBRN" onKeypress="enterInteger()" size="5" maxlength="4" value="<%= msgAmort.getH01SELBRN()%>">
          <a href="javascript:GetBranch('H01SELBRN', document.forms[0].H01SELBNK.value)">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        </div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">Currency Code : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="H01SELCCY" size="4" maxlength="3" value="<%= msgAmort.getH01SELCCY()%>">
          <a href="javascript:GetCurrency('H01SELCCY', document.forms[0].H01SELBNK.value)">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        </div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">General Ledger : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="H01SELGLN" size="16" maxlength="13" value="<%= msgAmort.getH01SELCCY()%>">
              <a href="javascript:GetLedger('H01SELGLN',document.forms[0].H01SELBNK.value,document.forms[0].H01SELCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
        </div>
      </td>
    </tr>
    <tr>
      <td width="50%">
        <div align="right">Reference Number : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="H01SELACC" size="16" maxlength="13" value="<%= msgAmort.getH01SELACC()%>">
        </div>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].H01SELBNK.focus();
  document.forms[0].H01SELBNK.select();
</script>

</form>
</body>
</html>
