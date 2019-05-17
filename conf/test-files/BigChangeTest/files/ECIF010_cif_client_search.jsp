<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<style>
TH {
  background: #FFFFFF;
}
</style>
<script language="JavaScript">
function enter(){
var NameSearch = document.forms[0].NameSearch.value
var FromRecord = 0
	if (NameSearch.length > 0){
		for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked){
			var Type = document.forms[0].Type[i].value
			}
 		}
 		document.forms[0].submit();
	}
	else {
		alert("Enter search criteria")
	}
}

</script>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
%>
     <SCRIPT Language="Javascript">
            showErrors()
     </SCRIPT>
<% 
 }
%>
<h3 align="center">Client Search<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" alt="cif_client_search, ECIF010"></h3>

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  
  <br>
  <br>
  <br>
  <table class="tableinfo"> 
    <tr>
		<td width="17%">&nbsp;</td>
		<td width="51%">
		<table align="center">
			<tr>
				<td width="69%">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" width="282">Search Type</td>
					</tr>
					<tr>
						<td width="282">&nbsp;</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="1" checked> Customer /
						Portfolio Number<A
							href="javascript:GetCustomerDescId('NameSearch','','')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
							align="bottom" border="0"></A></td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="2"> ID Number</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="8"><%= !currUser.getH01WK3().equals("4")?"Social Security":"Tax ID." %>
						Number</td>
					</tr>

					<tr>
						<td width="282"><input type="radio" name="Type" value="3" > Short Name</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="4"> Full Name</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="5"> Account Number</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="6"> Our Reference</td>
					</tr>
					<tr>
						<td width="282"><input type="radio" name="Type" value="7"> Other Bank's
						Reference </td>
					</tr>
				</table>
				</td>
				<td NOWRAP width="31%">
				
				<div align="center"><input type="text" name="NameSearch" size=14>
				&nbsp;&nbsp;</div>
				</td>
			</tr>
		</table>
		</td>
		<td width="32%">&nbsp;</td>
	</tr>
  </table>	

  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

<script language="JavaScript">
  document.forms[0].NameSearch.focus();
  document.forms[0].NameSearch.select();
</script>
</form>
</body>
</html>
