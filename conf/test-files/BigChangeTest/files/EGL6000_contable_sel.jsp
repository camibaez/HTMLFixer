<html>
<head>       
<title>Ambient selection Countable Previous Month</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgM" class= "datapro.eibs.beans.EGL600001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<% 


	int NEW = 0;
	try { NEW = Integer.parseInt(request.getParameter("NEW"));} catch (Exception e) {}
	if (NEW == 1) {
	msgM.destroy();
	}

   	if (msgM == null) msgM = new datapro.eibs.beans.EGL600001Message();
   	   
%>
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
</head>
<body >

<H3 align="center">Ambient selection Countable Previous Month<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="products,EGL6000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL6000">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="0002">
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">        
     	<tr id=trdark> 	      
	      <td> 
	        <div align="center">Erase Library : </div>
	      </td>
          <td nowrap width="18%"> 
            <input type="radio" name="E01CONLIB" value="Y" onClick="document.forms[0].E01CONLIB.value='Y'" <%if(msgM.getE01CONLIB().equals("Y")) out.print("checked");%>>Yes
            <input type="radio" name="E01CONLIB" value="N" onClick="document.forms[0].E01CONLIB.value='N'" <%if(msgM.getE01CONLIB().equals("N")) out.print("checked");%>>No 
          </td>	      
     	</tr>  		
     </table>
  	</td>      
   </tr>     
   </table>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
