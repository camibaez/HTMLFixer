<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0156" >
	<input type=hidden name="SCREEN" VALUE="1">
 	<input type=hidden name="SEARCHC" VALUE="">

<h3 align="center">Loan Cost FASB 91<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_enter_sel_cost.jsp, EDL0156"></h3>
<hr size="4">
  <br><br><br><br>
  <table class="tableinfo">
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Bank : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
          <input type="text" name="E01DLEBNK"  size=3 maxlength="2">
        </div>
      </td>
    </tr>
    <tr > 
      <td width="49%" nowrap> 
        <div align="right">Product Code : </div>
      </td>
      <td width="51%" nowrap> 
        <input type="text" name="E01DLEPRO"  size=5 maxlength="4" onKeyPress="document.forms[0].SEARCHC.value='I'">
        <input type="hidden" name="E01DLEDSC"  size=5 maxlength="4" onKeyPress="document.forms[0].SEARCHC.value='I'">
         <a href="javascript:GetProductT('E01DLEPRO','E01DLEDSC','','LNS')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
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
</form>
</body>
</html>
