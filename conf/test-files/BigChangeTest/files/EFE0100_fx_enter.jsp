<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE></TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<h3 align="center">Foreign Exchange G/L Cross Reference<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cl_enter_maint, ELN0000"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFE0100" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    </p>
  <h4>Enter the Following Information :</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

	      <tr id="trdark"> 
	        <td nowrap width=40% align="right" > Bank : </td>
	        <td nowrap width=40% align="left"  > 
	          <INPUT type="text" name="E01FEGBNK" size="3" maxlength="2" onkeypress="enterInteger()">
	        </td>
	      </tr>
	      <tr id="trclear"> 
	        <td nowrap width=40% align="right"> Currency : 
	        </td>
	        <td nowrap width=40% align="left"> 
	              <input type="text" name="E01FEGCCY" size="4" maxlength="3"  >
	              <a href="javascript:GetCurrency('E01FEGCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
	        </td>
	      </tr>
	      <tr id="trdark"> 
	        <td nowrap width=40% align="right"> Contract Type : 
	        </td>
	        <td nowrap width=40% align="left"> 
	          <div align="left">
	            <select name="E01FEGTYP" >
	              <option value=" " selected></option>
	              <option value="SPT" >Spot</option>
	              <option value="FWR" >Forward</option>
	              <option value="OPT" >Options</option>
	              <option value="SWP" >Swap</option>
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
  document.forms[0].E01FEGBNK.focus();
  document.forms[0].E01FEGBNK.select();
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
 