<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Checks Print</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "ledList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtNewMenu(of_p1_opt);

</SCRIPT>


</head>


<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<H3 align="center">Official Checks Print<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="of_chk_print, EOF0115"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150">
  <div align="center">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  </div>
  <table cellspacing=0 cellpadding=2 border="0" bordercolor="#000000" align="center">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="600px" height="250px" border="0" background="<%=request.getContextPath()%>/images/e/dat_check.gif">
          <tr> 
            <td nowrap rowspan="3" colspan="2" align="center" valign="middle"> 
              <div align="center"></div>
              <div align="right"></div>
            </td>
            <td nowrap width="43%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><i><b>Check 
                No. :</b></i></font></div>
            </td>
            <td nowrap width="32%"><%= userPO.getIdentifier().trim()%> </td>
          </tr>
          <tr > 
            <td nowrap width="43%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Date 
                :</i></b></font></div>
            </td>
            <td nowrap width="32%"> <%= Util.formatDateFull(userPO.getHeader21().trim(),userPO.getHeader22().trim(),userPO.getHeader5().trim(),userPO.getHeader6().trim(),userPO.getHeader7().trim())%> 
            </td>
          </tr>
          <tr > 
            <td nowrap height="23" width="43%"> 
              <div align="right"><font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Amount 
                :</i></b></font></div>
            </td>
            <td nowrap height="23" width="32%"> $<%= Util.addLeftChar('*',15,Util.fcolorCCY(userPO.getHeader8().trim()))%> 
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
            <td nowrap width="32%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="23%">&nbsp;</td>
            <td nowrap colspan="2"><%= userPO.getHeader14().trim()%> </td>
            <td nowrap width="32%"> 
              <div align="center"><font face="Times New Roman, Times, serif" size="2"><b><i>MP</i></b></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"></div>
  <p></p>
  <h4>Accounting </h4>
  <table class="tableinfo">
    <tr id=trdark> 
      <th align=CENTER width="18" nowrap>BN</th>
      <th align=CENTER width="28" nowrap>BRN</th>
      <th align=CENTER width="29" nowrap>Curr</th>
      <th align=CENTER width="85" nowrap>
        <div align="center">Gen. Ledger</div>
      </th>
      <th align=CENTER width="71" nowrap> 
        <div align="left">Reference</div>
      </th>
      <th align=CENTER width="59" nowrap> 
        <div align="center">Cost / C</div>
      </th>
      <th align=CENTER width="25" nowrap> 
        <div align="center">TC</div>
      </th>
      <th align=CENTER width="89" nowrap>Debit</th>
      <th align=CENTER width="98" nowrap>Credit </th>
      <th align=CENTER width="264" nowrap>Description</th>
    </tr>
    <%
                ledList.initRow();
                while (ledList.getNextRow()) {
                    if (ledList.getFlag().equals("")) {
                    		out.println(ledList.getRecord());
                    }
                }
              %> 
  </table>
  <BR>
</form>
</body>
</html>
