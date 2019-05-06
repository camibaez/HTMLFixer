<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

</SCRIPT>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="msgSrc" class="datapro.eibs.beans.EDEN01001Message"  scope="session" />

</HEAD>

<body>

 <h3 align="center"> FINCEN Search Parameters</h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDEN015">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0"> 
 
        <tr id=trdark> 
	      <td nowrap width="50%"> 
	        <div align="right">Search Type</div>
	      </td>
		  <td nowrap width="50%" >
              <input type="radio" name="E01SRCHTP" value="S"  <%if(msgSrc.getE01SRCHTP().equals("S")) out.print("checked");%>>Soundex 
              <input type="radio" name="E01SRCHTP" value="W"  <%if(msgSrc.getE01SRCHTP().equals("W")) out.print("checked");%>>Word		  
		  </td>
		</tr>  
		 <tr id=trclear> 
	      <td nowrap width="50%"> 
	        <div align="right">Minimum Number of Coincidences to Match (Word or Soundex) :</div>
	      </td>
		  <td nowrap width="50%" >
 			<input type="text" name="E01NROWOR" size="3" maxlength="2" value="<%= msgSrc.getE01NROWOR().trim()%>" onkeypress="enterInteger()">	
 		  </td>
		</tr>  
        <tr id=trdark> 
	      <td nowrap width="50%"> 
	        <div align="right">Number of Coincidences to Show :</div>
	      </td>
		  <td nowrap width="50%" >
		  	<input type="text" name="E01NROMAT" size="3" maxlength="2" value="<%= msgSrc.getE01NROMAT().trim()%>" onkeypress="enterInteger()">
		  </td>
		</tr>  		  
 	  </table>
    </td>
   </tr>
  </table>
  <br>
	<p align="center"> 
	  <input id="EIBSBTN" type="submit" name="Submit" value="Submit" > 
 	</p> 
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
 