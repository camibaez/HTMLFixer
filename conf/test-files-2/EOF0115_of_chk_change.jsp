<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Official Checks</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

 builtNewMenu(of_np_opt);
  initMenu();
</SCRIPT>


</head>

<body  nowrap bgcolor="#FFFFFF">

<h3 align="center">Official Checks Change Number<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="of_chk_print.jsp , EOF0115"></h3>
<hr size="4">
<p align="center">&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  </p>
  <table cellspacing=0 cellpadding=2 border="0" bordercolor="#000000" align="center">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="600px" height="250px" border="0" background="<%=request.getContextPath()%>/images/e/dat_check.gif">
          <tr> 
            <td nowrap rowspan="3" colspan="2" align="center" valign="middle"> 
              <div align="center"></div>
              <div align="right"></div>
            </td>
            <td nowrap width="45%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><i><b>Check 
                No. :</b></i></font></div>
            </td>
            <td nowrap width="30%"><%= userPO.getIdentifier().trim()%> </td>
          </tr>
          <tr > 
            <td nowrap width="45%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Date 
                :</i></b></font></div>
            </td>
            <td nowrap width="30%"> <%
            try { out.print(Util.formatDateFull(userPO.getHeader21().trim(),userPO.getHeader22().trim(),userPO.getHeader5().trim(),userPO.getHeader6().trim(),userPO.getHeader7().trim())); }
            catch(NumberFormatException nfe) {out.print(Util.formatDateFull("MDY","E",userPO.getHeader5().trim(),userPO.getHeader6().trim(),userPO.getHeader7().trim())); }
            catch(Exception e) { out.print("err");} %>
            </td>
          </tr>
          <tr > 
            <td nowrap height="23" width="45%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Amount 
                :</i></b></font></div>
            </td>
            <td nowrap height="23" width="30%"> $<%= Util.addLeftChar('*',15,Util.fcolorCCY(userPO.getHeader8().trim()))%> 
            </td>
          </tr>
          <tr > 
            <td nowrap width="23%" height="23">&nbsp;</td>
            <td nowrap height="23" colspan="3">&nbsp;</td>
          </tr>
          <tr > 
            <td nowrap width="23%" height="23"> 
              <div align="right"><font color="#000000"><b><i>Pay to the Order 
                of :</i></b></font></div>
            </td>
            <td nowrap height="23" colspan="3"> <%= userPO.getHeader9().trim()%> 
            </td>
          </tr>
          <tr > 
            <td nowrap width="23%" height="19"><font color="#000000"></font></td>
            <td nowrap height="19" colspan="3"><%= userPO.getHeader10().trim()%></td>
          </tr>
          <tr > 
            <td nowrap width="23%" height="19"> 
              <div align="right"><font color="#000000"><b><i>The Amount of :</i></b></font></div>
            </td>
            <td nowrap height="19" colspan="3" valign="middle"> <%= userPO.getHeader11().trim()%> 
            </td>
          </tr>
          <tr > 
            <td nowrap width="23%"> 
              <div align="right"><font color="#000000"><b><i>Concept :</i></b></font></div>
            </td>
            <td nowrap colspan="3"> <%= userPO.getHeader12().trim()%> </td>
          </tr>
          <tr > 
            <td nowrap width="23%">&nbsp;</td>
            <td nowrap colspan="2"><%= userPO.getHeader13().trim()%> </td>
            <td nowrap width="30%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="23%">&nbsp;</td>
            <td nowrap colspan="2"><%= userPO.getHeader14().trim()%> </td>
            <td nowrap width="30%"> 
              <div align="center"><font face="Times New Roman, Times, serif" size="2"><b><i>MP</i></b></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">New Number of Check :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01NEWCKN" size="12" maxlength="12" onkeypress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
 <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  <script language="JavaScript">
  document.forms[0].E01NEWCKN.focus();
  document.forms[0].E01NEWCKN.select();
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
</form>
</body>
</html>
