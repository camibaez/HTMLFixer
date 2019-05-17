<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0003DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="JavaScript">
function validate() {
	if (document.forms[0].E03CDRDAE.value == "" ||
		document.forms[0].E03CDRMOE.value == "" ||
		document.forms[0].E03CDRYEE.value == "" ||
		document.forms[0].E03CDRDAY.value == "" ||
		document.forms[0].E03CDRMON.value == "" ||
		document.forms[0].E03CDRYEA.value == "") {
		alert("Introduce a complete date");
		return false;
	}
	else {
		return true;
	}
}

function goDetail(){
	document.forms[0].SCREEN.value = 102;
	document.forms[0].submit();
}

function goGeneral(){
	document.forms[0].SCREEN.value = 101;
	document.forms[0].submit();
}

</script>

</head>
<body>
<h3 align="center">Card Inventory<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_inv_inq_enter.jsp, ECD0003"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0003" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="104">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Card Type :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03CDRTPL" size="3" maxlength="2" value="<%= msgCD.getE03CDRTPL() %>">
				<a href="javascript:GetDescATMCard('E03CDRTPL','','D')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Branch :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03CDRBRD" size="5" maxlength="4" value="<%= msgCD.getE03CDRBRD() %>">
				<a href="javascript:GetBranch('E03CDRBRD','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"  ></a>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Status :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
				<input type="hidden" name="E03CDRSTS" size="5" maxlength="4" value="<%= msgCD.getE03CDRSTS() %>">
                <input type="text" name="E03CDRSTD" size="17" maxlength="15" value="<%= msgCD.getE03CDRSTD() %>">
<%--
				<a href="javascript:GetPlasticStatus('E03CDRSTS', 'E03CDRSTD')">
--%>
			<%--  <a href="javascript:GetCodeCNOFC_St_FIPS('E03CDRSTS', 'E03CDRSTD', '17')">  --%>  
			
			   	<a href="javascript:GetCodeDescCNOFC('E03CDRSTS','E03CDRSTD','17')"> 
				
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a>
			  </div>
            </td>
            <td nowrap width="16%" > 
            </td>
            <td nowrap width="20%" > 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right">From Date :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03CDRDAE" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <INPUT type="text" name="E03CDRMOE" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <INPUT type="text" name="E03CDRYEE" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E03CDRDAE, document.forms[0].E03CDRMOE, document.forms[0].E03CDRYEE)">
                <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">To Date :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03CDRDAY" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <INPUT type="text" name="E03CDRMON" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <INPUT type="text" name="E03CDRYEA" size="3" maxlength="2" value="" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E03CDRDAY, document.forms[0].E03CDRMON, document.forms[0].E03CDRYEA)">
                <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>

         </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
		<INPUT id="EIBSBTN" type="button" name="Detail" value="Detail" onclick="goDetail()">
		<INPUT id="EIBSBTN" type="button" name="General" value="General" onclick="goGeneral()">
<%--		<INPUT id="EIBSBTN" type="submit" name="History" value="Historic">  --%>
  </div>
  </form>
</body>
</html>
