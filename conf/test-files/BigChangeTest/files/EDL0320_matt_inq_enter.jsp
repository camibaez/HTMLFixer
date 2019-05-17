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

<h3 align="center">Money Market Processing List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="matt_inq_enter, EDL0320"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0320" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    </p>
    
  <h4>Enter the Following Information :</h4>
  <table class="tableinfo" border="0" cellspacing=0 cellpadding=2>
    <tr > 
      <td>  
	      <tr id="trdark"> 	      
	        <td nowrap width=10% align="center" > From Date : </td>
	        <td nowrap width=70% align="left" > 
              <input type="text" name="E01DTEFRM" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01DTEFRD" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01DTEFRY" size="2" maxlength="2"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DTEFRM,document.forms[0].E01DTEFRD,document.forms[0].E01DTEFRY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>	        	        
	          
	         To Date :
              <input type="text" name="E01DTETOM" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01DTETOD" size="2" maxlength="2"  onkeypress="enterInteger()">
              <input type="text" name="E01DTETOY" size="2" maxlength="2"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DTETOM,document.forms[0].E01DTETOD,document.forms[0].E01DTETOY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>	        	        
	        </td>
	        
	      </tr>     
	      
	      <br>
	      
	      <tr id="trdark"> 
	        <td nowrap width=10% align="center"> Selection Type : </td>	        
	        <td nowrap width=70% align="left" > 
	          <div align="left">
	            <select name="E01EVETYP" >
	              <option value=" " selected></option>
	              <option value="1" >Call and Put Dates</option>
	              <option value="2" >Maturities of Securities</option>
	              <option value="3" >Settlement Dates on FX Deals - Spots and Forwards</option>
	              <option value="4" >Settlement Dates on Interes Rate swaps</option>
	               	                            
	            </select>
	              Blank for All
	          </div>
	        </td>
	      
	      </tr>
	        
	      <br>   
	    
	  
       
     
  </table>
 <br>         
  <div align="center"> 
	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
 </div>
    </CENTER>
<script language="JavaScript">
if (document.getElementsByName('E01SELFM1')[0]!=null)
{
  document.forms[0].E01SELFM1.focus();
  document.forms[0].E01SELFM1.select();
}

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
 