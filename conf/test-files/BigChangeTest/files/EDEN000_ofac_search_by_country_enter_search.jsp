<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Conexi�n</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="JavaScript">

function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}

function enterSearch(firsTime){
	var RWDNAM = document.forms[0].RWDNAM.value;
	var FromRecord = 0;

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/e/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDEN000?SCREEN=400@RWDNAM=" + RWDNAM + "@FromRecord=" + FromRecord  + "'";
    return false;
}

</script>


</HEAD>


<body>
<%if (currUser.getH01WK3().equals("4")|| currUser.getH01WK3().equals("5")) {%>
<H3 align="center">World Check Search<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ofac_search_by_country_enter_search, EDEN000"></H3>
<% } else { %>
<h3 align="center">Office of Foreign and Assets Control<br>(OFAC Search)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ofac_search_by_country_enter_search, EDEN000"></h3>
<% } %>

<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%><%= userPO.getRedirect()%>" onsubmit="return(enterSearch(false))" target="_parent" >

  <CENTER>
  	 <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead" >
		<tr id="trdark">
		  <td nowrap width="50%">
		  	<div align="right">Country Code :</div>
		  </td>
		  <td nowrap width="50%" colspan="3">
		   	<input type="text" name="RWDNAM" size="4" maxlength="3" value="" >
		   	<a href="javascript:GetCountryCodeOfac('RWDNAM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		  </td>
		</tr>
	</table>
  		<div id=DIVSUBMIT align="center">
  		  <p align=center>
			<input id="EIBSBTN" type=button name="Submit" value="Submit" onclick="javascript:enterSearch(false)">
  		   </p>
  		</div>

 </CENTER>
</FORM>

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
     <SCRIPT Language="Javascript">
           enterSearch(true);
     </SCRIPT>

</BODY>
</HTML>
