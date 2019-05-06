<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<TITLE>N/M Exception</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="exMaint" class="datapro.eibs.beans.ELD001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
</HEAD>

<body bgcolor="#FFFFFF">

<SCRIPT LANGUAGE="JavaScript">
function verifyIt() {
 var form = document.forms[0]
  for ( var i=0; i < form.elements.length;  i++ ) {
    if ( form.elements[i].type =="text" && form.elements[i].value == "") {
    alert(" All fields most be filled out.")
    form.elements[i].focus()
    return false
    break
		}
	}
 document.forms[0].submit();	
}

function isMonth(field) {
 var month = parseInt(field.value)
 if ( field.value.length > 0 ) {
   if ( month < 0 || month > 12 ) {
   alert("Please enter a valid month")
   field.focus()
	}
 } 
}

function isYear(field) {
var year = parseInt(field.value)
if ( field.value.length > 0 ) {
   if ( (""+year).length < 4 || year == 0 ) {
   alert("Please, enter a valid year ( 4 digits )")
   //field.focus()
	}
 }
}

</SCRIPT>
<h3 align="center">New/Maintenance of Exceptions <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="exception_enter_maint, ELD0010"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSELD0010" onSubmit="return verifyIt()">
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
    <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=81% align="center" height="80%">
      <tr valign="middle"> 
        <td nowrap colspan="2" align="middle" height="131">&nbsp;</td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=45% align="right" height="24"> Account Number: </td>
        <td nowrap width=55% align="left" height="24" > 
          <input type=TEXT name="E01LDEACC" size=15 maxlength=12 onkeypress="enterInteger()" value="<%= exMaint.getE01LDEACC().trim()%>" >
          <a href="javascript:GetAccount('E01LDEACC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=45% align="right" height="28" > Month/ Year of Exception 
          : </td>
        <td nowrap width=55% align="left" height="28" > 
          <input type=TEXT name="E01LDEBDM" size=2 maxlength=2 value="<%= exMaint.getE01LDEBDM().trim()%>"   onkeypress="enterInteger()" onBlur="isMonth(this)">
          <input type=TEXT name="E01LDEBDY" size=4 maxlength=4 value="<%= exMaint.getE01LDEBDY().trim()%>"  onkeypress="enterInteger()" onBlur="isYear(this)">
        </td>
      </tr>
      <tr> 
        <td nowrap align="right" valign="middle" height="28" width="45%"> Sequence 
          : </td>
        <td nowrap width="55%" valign="middle" height="28" align="left"> 
          <input type=TEXT name="E01LDESEQ" size=2 maxlength=2 value="<%= exMaint.getE01LDESEQ().trim()%>" >
          <%-- <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" >--%> 
          ( "0" if a<b> New</b> one )</td>
      </tr>
      <tr> 
        <td nowrap colspan="2" valign="middle"> 
          <div align="center"> <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="verifyIt()"> 
          </div>
        </td>
      </tr>
    </table>
  </CENTER>
<script language="JavaScript">
  document.forms[0].E01LDEACC.focus();
  document.forms[0].E01LDEACC.select();
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
 