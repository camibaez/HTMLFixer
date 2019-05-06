<html>
<head>
<title>Safe Deposit Types</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB001001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

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

<H3 align="center">Safe Deposit Box Type New<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="safe_deposit_types_new, ESB0010"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0010">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
	      <td nowrap width="40%"> 
	        <div align="right">Type : </div>
	      </td>
	      <td nowrap width="60%"> 
	        <input type="text" name="E01SBTTYP" size="6" maxlength="6" value="<%= userPO.getHeader1() %>" readonly>
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Description : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01SBTDSC" size="35" maxlength="35" value="<%= msgPart.getE01SBTDSC() %>">
		  </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Vendor : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01SBTVEN" size="10" maxlength="10" value="<%= msgPart.getE01SBTVEN() %>">
	      	<input type="text" name="D01BAVNM1" size="35" maxlength="35" value="<%= msgPart.getD01BAVNM1() %>" readonly >
      	    <a href="javascript:GetVendor('E01SBTVEN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
		  </td>
     	</tr>
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Brand : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBTBRA" size="10" maxlength="10" value="<%= msgPart.getE01SBTBRA() %>">
      	  </td>     
      	</tr>
      	<tr id=trdark>
          <td nowrap>
              <div align="right">Model : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01SBTMOD" size="10" maxlength="10" value="<%= msgPart.getE01SBTMOD() %>">
          </td>
        </tr>
     </table>
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
