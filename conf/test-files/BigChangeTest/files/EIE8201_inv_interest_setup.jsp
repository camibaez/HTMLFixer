<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE820101Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
 if (userPO.getPurpose().equals("M") ) {
%>

   <SCRIPT Language="Javascript">
       
      builtNewMenu(inst_basic_opt);
 	  initMenu();
   </SCRIPT>

<%
}
%>
 

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 
%>

<div align="center"> 
  <h3>Instruments - Interest Se<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_interest_setup.jsp, EIE8201">t 
  Up Process</h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE8201" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN"  value="200" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Number :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIIIC" size="10" maxlength="9" value="<%= invInst.getE01ISIIIC()%>" >
              / 
              <input type="text" name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>">
              <a href="javascript:GetInstrumentParams('E01ISIIIC','E01ISIDSC','','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Last Coupon Payment Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISLCP1" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= invInst.getE01ISLCP1()%>">
              <input type="text" name="E01ISLCP2" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= invInst.getE01ISLCP2()%>">
              <input type="text" name="E01ISLCP3" size="2" maxlength="2" onkeypress="enterInteger()" value="<%= invInst.getE01ISLCP3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISLCP1,document.forms[0].E01ISLCP2,document.forms[0].E01ISLCP3)">
              <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap width="14%" > 
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">New Interest Rate :</div>
            </td>
            <td nowrap width="36%" > 
            <INPUT type="text" name="E01ISNIRT" size="10" maxlength="9"	value="<%= invInst.getE01ISNIRT()%>" onkeypress="enterSignDecimal()" >
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
            </td>
            <td nowrap width="14%" ></td>
            <td nowrap width="33%" ></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="36%" > 
            Based on last coupon payment date, the system will automatically<BR>
				recalculate, during the END OF DAY/MONTH process, the Accrued   <BR>
				Interest for all clients holding the above instrument.          </td>
            <td nowrap width="14%" ></td>
            <td nowrap width="33%" ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4></h4> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
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
