<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Anti-Money Laundering ("AML")</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<h3 align="center">Anti-Money Laundering ("AML")<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rolling_money_enter, ELD0110"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELD0110" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    </p>
  <h4>Enter the Following Information :</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

	      <tr id="trdark"> 
	        <td nowrap width=40% align="right" > Reporting Date : </td>
	        <td nowrap width=40% align="left"  > 
              <input type="text" name="E01FRODT1" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01FRODT2" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01FRODT3" size="2" maxlength="2"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01FRODT1,document.forms[0].E01FRODT2,document.forms[0].E01FRODT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
	        </td>
	      </tr>
	      <tr id="trdark"> 
	        <td nowrap width=40% align="right"> Rolling : 
	        </td>
	        <td nowrap width=40% align="left"> 
	          <div align="left">
	            <select name="E01RANGO" >
	              <option value=" " selected></option>
	              <option value="180" >180 Days</option>
	              <option value="90" >90 Days</option>
	              <option value="60" >60 Days</option>
	              <option value="30" >30 Days</option>	              
	            </select>
	          </div>
	        </td>
	      </tr>
	       
        </table>
      </td>
    </tr>
  </table>
 <br>         
  <div align="center"> 
	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
 </div>
    </CENTER>
<script language="JavaScript">
  document.forms[0].E01FRODT1.focus();
  document.forms[0].E01FRODT1.select();
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
 