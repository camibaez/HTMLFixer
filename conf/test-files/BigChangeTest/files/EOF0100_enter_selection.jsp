<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Stop Payment/Release Checks</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
	
	if ( document.forms[0].E01SELSCH.value == 'C') {
		if ( document.forms[0].E01OFMNCH.value.length < 1) {
		  alert("A valid account number must be entered");
		  document.forms[0].E01OFMNCH.value='';
		  document.forms[0].E01OFMNCH.focus();
		}
		else {
		  document.forms[0].SCREEN.value = '5';
		  document.forms[0].submit();
		}
	} 
	else {
	  document.forms[0].SCREEN.value = '2';
	  document.forms[0].submit();
	} 
}

function goValue(opt) {
	document.forms[0].E01SELSCH.value = opt;
}

</SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Stop Payment/Release Checks<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="enter_selection, EOF0100"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0100">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01SELSCH" VALUE="D">
  </p>

  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr> 
      <td > 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">      
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="E01SELSCH1" value="D" checked onclick="goValue('D')"> Availables Checks  
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>  
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="E01SELSCH1" value="S" onclick="goValue('S')"> Stop Payments
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>        
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="E01SELSCH1" value="C" onclick="goValue('C')"> Check Number :
              <input type="text" name="E01OFMNCH" size="10" maxlength="9" value="" >
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>                                         
        </table>      
      </td>
    </tr>  
  </table>  
 <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
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
</form>
</body>
</html>
