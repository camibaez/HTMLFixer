<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>>Alarm Messages Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="iin" class="datapro.eibs.beans.EIN053001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


function CheckACC(){
	if(document.forms[0].E01IAMCDE.value.length < 1 || document.forms[0].E01IAMCDE.value == '0'){
		alert("A valid number must be entered");
		document.forms[0].E01IAMCDE.value='';
		document.forms[0].E01IAMCDE.focus();
	}
	else {
  		document.forms[0].submit();
	}
}

</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

<H3 align="center">Alarm Messages Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="msg_code_enter, EIN0530"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSEIN0530">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>

  <h4>Operation Type</h4>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr> 
      <td > 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">      
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="E01OPETYP" value="0002" checked > Maintenance   
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>  
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="E01OPETYP" value="0001" > New
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>                                     
        </table>      
      </td>
    </tr>  
  </table>  
  <h4>Enter Information</h4>
   <table class="tableinfo"  cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="trdark"> 
      <td valign="middle" align="center" width="49%"> 
        <div align="right">Alarm Code : </div>
      </td>
      <td valign="middle" align="center" width="51%"> 
        <div align="left"> 
          <input type="text" name="E01IAMCDE"  size="5" maxlength="4" value="<%= iin.getE01IAMCDE().trim()%>" onkeypress="enterInteger()" >
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td valign="middle" align="center" width="49%"> 
        <div align="right">Aplication Code : </div>
      </td>
      <td valign="middle" align="center" width="51%"> 
        <div align="left"> 
              <select name="E01IAMAPC">
                <option value="93" >Transactions</option>
                <option value="15" >CD's</option>
                <option value="00" >Customers</option>                
              </select>          
        </div>
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
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%> 
</form>
</body>
</html>
