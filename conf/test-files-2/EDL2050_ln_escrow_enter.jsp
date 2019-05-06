<html>
<head>
<title>Loan Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
function typeClick(value){
  if (value == "ACC"){
   DIVACC.style.display="";
   DIVCIA.style.display="none";
   DIVDED.style.display="none";
  }
  else{
   DIVACC.style.display="none";
   DIVCIA.style.display="";
   DIVDED.style.display="";
  }
}


</SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
</head>

<body nowrap bgcolor="#FFFFFF">
<h3 align="center">Escrow  Payment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_escrow_enter.jsp,EDL2050"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050">
  <CENTER>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">

  <table class="tableinfo" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
	 <td nowrap>
	   <table  align="center" width="250" border="0" cellspacing="0" cellpadding="0">
		<tr id=trdark>
		  <td nowrap><b>Select by :</b></td>
		  <td nowrap><input type="radio" name="E01OPETYP" value="ACC" checked onclick="typeClick('ACC')">Account</td>
		  <td nowrap >&nbsp;&nbsp;&nbsp;</td>
		  <td nowrap>
		  	<div id=DIVACC >
		  		Account Number :
		        <input type="text" name="E01DEAACC" size="12" maxlength="9" onKeyPress="enterInteger()">
		        <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		  	</div>
		  </td>
		</tr>
		<tr id=trclear>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="E01OPETYP" value="CIA" onclick="typeClick('CIA')">Company-Deduction</td>
		  <td nowrap >&nbsp;&nbsp;&nbsp;</td>
		  <td nowrap>
		  	<div id=DIVCIA style="display:none">
		  		Company Code :
                <input type="text" name="E01DLICIA" size="4" maxlength="3" >
                 <input type="hidden" name="E01DSC"  >
                <a href="javascript:GetInsuranceCompany('E01DLICIA','E01DSC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		  	</div>
		  </td>
		</tr>
		<tr id=trdark>
		  <td nowrap ></td>
		  <td nowrap></td>
		  <td nowrap >&nbsp;&nbsp;&nbsp;</td>
		  <td nowrap>
		  	<div id=DIVDED style="display:none" >
		  		Deduction Code :
                <input type="text" name="E01DLICDE" size="4" maxlength="3" >
                <a href="javascript:GetCodeCNOFC('E01DLICDE','26')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		  	</div>
		  </td>
		</tr>
	   </table>
	 </td>
	 <td nowrap>
     </td>
   </tr>

 </table>
       	  <p>
          	<div id=DIVSUBMIT align="center">
    			<input id="EIBSBTN" type="submit" name="Submit" value="Submit">
          	</div>
          </p>

 </CENTER>

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
