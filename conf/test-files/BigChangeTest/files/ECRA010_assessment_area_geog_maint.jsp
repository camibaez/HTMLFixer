<html>
<head>
<title>Assessment Area Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ECRA01002Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT Language="Javascript">

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

<H3 align="center">Assessment Area Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="assessment_area_geog_maint, ECRA010"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECRA010">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="510">
    <INPUT TYPE=HIDDEN NAME="E01CRABNK" VALUE="<%=msgPart.getE02CRGBNK()%>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Assessment Area Number : </div>
	      </td>
		  <td nowrap width="60%" colspan="7"><input type="text"
					name="E02CRGARN" size="6" maxlength="4"
					value="<%= msgPart.getE02CRGARN() %>" readonly>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		  </td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">Action : </div>
	      </td>
            <td nowrap > 
              <input type="radio" name="E02CRGIEF" value="+" <% if (msgPart.getE02CRGIEF().equals("+")) out.print("checked"); %>>
              Include 
              <input type="radio" name="E02CRGIEF" value="-" <% if (msgPart.getE02CRGIEF().equals("-")) out.print("checked"); %>>
              Exclude 
             </td>
     	</TR>
		<TR id=trdark>
			<td nowrap> 
	        <div align="right">FIPS State Code : </div>
	      </td>
	      <td nowrap colspan="3"><div align="left">
	      	<input type="text" name="E02CRGSTC" size="3" maxlength="2" value="<%= msgPart.getE02CRGSTC() %>">
      	    <a href="javascript:GetCodeCNOFC_St_FIPS('E02CRGSTC','D02STCDSC','27')">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      	    <input type="text" name="D02STCDSC" size="37" maxlength="35"
					value="<%= msgPart.getD02STCDSC() %>" readonly> 
      	    </div>
		  </td>
		</TR>
		<TR id=trclear>
			<td nowrap> 
	        <div align="right">FIPS County Code : </div>
	      </td>
	      <td nowrap colspan="3"><div align="left">
	      	<input type="text" name="E02CRGCTC" size="4" maxlength="3" value="<%= msgPart.getE02CRGCTC() %>">
      	    <a href="javascript:GetCodeCounty('E02CRGCTC','',document.forms[0].E02CRGSTC.value)">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
      	    <input type="text" name="D02CTCDSC" size="37" maxlength="35"
					value="<%= msgPart.getD02CTCDSC() %>" readonly> 
      	    </div>
		  </td>
		</TR>
		<TR id=trdark>
			<td nowrap> 
	        <div align="right">MSA/MD Code : </div>
	      </td>
	      <td nowrap colspan="3"><div align="left">
	      	<input type="text" name="E02CRGMSA" size="6" maxlength="5" value="<%= msgPart.getE02CRGMSA() %>">
      	    <a href="javascript:GetCodeMSA('E02CRGMSA','D02MSADSC', document.forms[0].E02CRGCTC.value)">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
			<input type="text" name="D02MSADSC" size="37" maxlength="35"
					value="<%= msgPart.getD02MSADSC() %>" readonly> 
      	    </div>
		  </td>
		</TR>	
		<TR id=trclear>
			<td nowrap> 
	        <div align="right">Census Tract : </div>
	      </td>
	      <td nowrap colspan="3"><div align="left">
	      	<input type="text" name="E02CRGCET" size="7" maxlength="6" value="<%= msgPart.getE02CRGCET() %>">
      	    <a href="javascript:GetCodeCensus('E02CRGCET','D02CETDSC')">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
			<input type="text" name="D02CETDSC" size="37" maxlength="35"
					value="<%= msgPart.getD02CETDSC() %>" readonly> 
      	    </div>
		  </td>
		</TR>			
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
