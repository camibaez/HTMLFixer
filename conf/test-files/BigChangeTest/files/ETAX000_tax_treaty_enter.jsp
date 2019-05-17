<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE></TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT Language="javascript">

function CheckACC(){
	if ( document.forms[0].E01TAXINC.value.length < 1) {
  		alert("A valid Income Code must be entered");
  		document.forms[0].E01TAXINC.value='';
  		document.forms[0].E01TAXINC.focus();
	}
	else {
		if ( document.forms[0].E01TAXCTR.value.length < 1) {
  			alert("A valid Country Code must be entered");
  			document.forms[0].E01TAXCTR.value='';
  			document.forms[0].E01TAXCTR.focus();
		}
		else {
	  		document.forms[0].submit();
  		}
  	}
}

</SCRIPT>

</HEAD>

<body>

<h3 align="center">Tax Treaty Table<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cl_enter_maint, ELN0000"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSETAX000" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    </p>
  <h4>Enter the Following Information :</h4>
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

	      <tr id="trdark">
	        <td nowrap width=40% align="right" > Income Code : </td>
	        <td nowrap width=40% align="left"  >
	          <INPUT type="text" name="E01TAXINC" size="7" maxlength="6" >
	          <A href="javascript:GetSpecUsrTab('E01TAXINC','11')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absmiddle" border="0"></A>
	        </td>
	      </tr>
	      <tr id="trclear">
	        <td nowrap width=40% align="right"> Country Code :
	        </td>
	        <td nowrap width=40% align="left">
	              <input type="text" name="E01TAXCTR" size="4" maxlength="3"  >
	              <a href="javascript:GetCodeCNOFC('E01TAXCTR','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
	        </td>
	      </tr>
        </table>
      </td>
    </tr>
  </table>
 <br>
  <div align="center">
	<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
 </div>
    </CENTER>
<script language="JavaScript">
  document.forms[0].E01TAXINC.focus();
  document.forms[0].E01TAXINC.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
