<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
  <META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
  <META http-equiv="Content-Style-Type" content="text/css"> 
  <TITLE>Access List</TITLE>
  <link href="<%=request.getContextPath()%>/pages/etyle.css" rel="stylesheet">
  <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
  <script language="JavaScript">

</script>

<jsp:useBean id= "optList746"  class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error"     class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</HEAD>


<body bgcolor="#FFFFFF">

<h3 align="center">Maintenance Documents Required by Product<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ListRecDoc_filter,EDP0718"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0718" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="150">
        <input type=HIDDEN name="PRD" value=""> 
    </p>
    
    <table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% align="center" >
      
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Product : 
        </td>
        <td nowrap width=60% align="left"> 
            <input type=TEXT name="E01FILPRD" size="6" maxlength="4" value="<%= userPO.getHeader9().trim()%>">
            <input type=TEXT name="E01FILTYP" size="6" maxlength="4" value="<%= userPO.getHeader10().trim()%>">
	        <a href="javascript:GetProposalsProducts('E01FILPRD','E01FILTYP','','')">
	        <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a> 
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Subject Credit : 
        </td>
        <td nowrap width=60% align="left"> 
            <input type=TEXT name="E01DPHCN1" size="6" maxlength="4" value="<%= userPO.getHeader12().trim()%>">
            <input type=TEXT name="E01DPHCND" size="36" maxlength="35" value="<%= userPO.getHeader13().trim()%>">
			<A href="javascript:GetCodeDescCNOFC('E01DPHCN1','E01DPHCND','PD')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0">
			</a> 
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Table of Documents : 
        </td>
        <td nowrap width=60% align="left"> 
            <input type=TEXT name="E01DPHCN3" size="3" maxlength="2" value="<%= userPO.getHeader14().trim()%>" onKeypress="enterInteger()">
              <a href="javascript:GetDocInv('E01DPHCN3')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0">
			</a> 
        </td>
      </tr>
      
      <tr>
		<td nowrap colspan="2" valign="middle" height="146">
		  <div align="center">
		   <INPUT id="EIBSBTN" type="button" name="Submit"
			value="Submit" onclick="goConfirm()">
		 </div>
		</td>
	</tr>
      <tr>
		<td nowrap colspan="2" valign="middle" height="41">&nbsp;</td>
	</tr>
            	  
    </table>
  </CENTER>
</FORM>
<script language="JavaScript">

function goConfirm() {
	//alert(document.forms[0].SCREEN.value);
	document.forms[0].PRD.value=document.forms[0].E01FILPRD.value; 
	document.forms[0].submit();	  		  
}

</script>

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
</BODY>
</HTML>
 