 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].INSTCODE.value.length < 1) {
  alert("A valid Instrument Code must be entered");
  document.forms[0].INSTCODE.value='';
  document.forms[0].INSTCODE.focus();
  return false;
}
else {
  return true;
  }
}

</SCRIPT>
 
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%> 
<div align="center"> 
  <h3>Dividends Payment Schedule<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_enter_dividen.jsp,EIE0080"> 
  </h3>
</div>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0080" onsubmit="return(CheckACC())">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
      <td nowrap align="center">
           Instrument Code :
           <input type="text" name="INSTCODE" size="9" maxlength="9" >
           <input type="text" name="DESCRIPTION" size="35" maxlength="30"> 
           <a href="javascript:GetInstrumentParams('INSTCODE','DESCRIPTION','','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
               
		   
		 <br>
		 <br>
		
  		 <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
   	 		<tr bgcolor="#FFFFFF"> 
      			<td> 
       		 		<div align="center"> </div>
      			</td>
    		</tr>
    		<tr bgcolor="#FFFFFF"> 
     		 	<td width="33%"> 
  					<div align="center"> 
	   					<input id="EIBSBTN" type=submit name="Submit" value="Submit">
  					</div>      
  				</td>
    		</tr>
    		<tr bgcolor="#FFFFFF"> 
      			<td> 
       		 		<div align="center"> </div>
      			</td>
    		</tr>
  		</table>
     </td>
   </tr>
  </table>
      
</form>
 
</body>
</html>
 