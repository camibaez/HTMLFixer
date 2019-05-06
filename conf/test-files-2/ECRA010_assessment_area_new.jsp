<html>
<head>
<title>Assessment Area</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ECRA01001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">

  function getValue(){
		if (document.forms[0].E01CRAMPF.checked){
  			document.forms[0].E01CRAMPF.value="2";
	  	} else {
	  		document.forms[0].E01CRAMPF.value="1";
	  	}
  	
  }
</SCRIPT>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Assessment Area<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="assessment_area_new, ECRA010"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Assessment Area Number : </div>
	      </td>
				<td nowrap width="60%" colspan="3">
				<div align="left"><input type="text" name="E01CRAARN" size="5"
					maxlength="4" value="<%= msgPart.getE01CRAARN() %>" readonly> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01CRAADS" size="50"
					maxlength="50" value="<%= msgPart.getE01CRAADS() %>"> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></div>
				</td>
			</tr>
			
		 <tr id=trclear> 
	      <td nowrap valign="bottom"> 
	        <div align="right">Military Personnel Assessment Area : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<INPUT type="checkbox" name="E01CRAMPF"	value="<%= msgPart.getE01CRAMPF()%>" 
						<%if (msgPart.getE01CRAMPF().equals("2")) { out.print("checked"); }%> 
						onclick="getValue()">
				</div>
				</td>
		</tr>
		 <TR>
				<TD colspan="4">(Military Personnel dependents and the dependents) --&gt; Checked</TD>
			</TR></table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
