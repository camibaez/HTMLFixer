<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="Javascript"> 
	
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }
</SCRIPT>
  
  
  
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id="trMant" class="datapro.eibs.beans.EGL004001Message"  scope="session" />

<body bgcolor="#FFFFFF">
 
<H3 align="center">Batch Reversal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="batch_enter_rever,EGL0040"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0040">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td width="50%"> 
        <div align="right">Batch Number : </div>
      </td>
      <td width="50%"> 
        <div align="left">
          <input type="text" name="E01TRABTH" onKeypress="enterInteger()" size="4" maxlength="4" value="<%= trMant.getE01TRABTH()%>">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></div>
      </td>
    </tr>
    
    <tr> 
	        <td nowrap width=40% align="right" > Batch Date : </td>
	        <td nowrap width=40% align="left"  > 
              <input type="text" name="E01TRABDM" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01TRABDD" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01TRABDY" size="2" maxlength="2"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01TRABDM,document.forms[0].E01TRABDD,document.forms[0].E01TRABDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
	        </td>
	      </tr>
	 
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E01TRABTH.focus();
  document.forms[0].E01TRABTH.select();
</script>

</form>
</body>
</html>
