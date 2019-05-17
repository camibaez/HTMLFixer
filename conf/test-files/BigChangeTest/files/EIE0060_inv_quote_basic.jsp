<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE006001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<%
 if (userPO.getPurpose().equals("M") ) {
%>

   <SCRIPT Language="Javascript">
       
      builtNewMenu(inst_basic_opt);
 
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

 out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>
<div align="center"> 
  <h3>Quotes Detail <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_quote_basic.jsp,EIE0060"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0060" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN"  value="2" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Code :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01QUOIIC"  value="<%= invInst.getE01QUOIIC()%>" >
              <%= invInst.getE01QUOIIC()%> - <%= invInst.getD01ISIDSC()%> </td>
            <td nowrap width="14%" > 
              <div align="right">Symbol :</div>
            </td>
            <td nowrap width="33%" > <%= invInst.getD01ISISYM()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Type :</div>
            </td>
            <td nowrap width="36%" ><%= invInst.getD01ISIPTY()%> </td>
            <td nowrap width="14%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="33%" ><%= invInst.getD01ISICCY()%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01QUOTE1" size="3" maxlength="2" value="<%= invInst.getE01QUOTE1()%>">
              <input type="text" name="E01QUOTE2" size="3" maxlength="2" value="<%= invInst.getE01QUOTE2()%>">
              <input type="text" name="E01QUOTE3" size="3" maxlength="2" value="<%= invInst.getE01QUOTE3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01QUOTE1,document.forms[0].E01QUOTE2,document.forms[0].E01QUOTE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Time :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01QUOTET" size="15" maxlength="12" value="<%= invInst.getE01QUOTET()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Prices </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Open Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOOPP" size="15" maxlength="13" value="<%= invInst.getE01QUOOPP()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">BID Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" name="E01QUOBID" size="15" maxlength="13" value="<%= invInst.getE01QUOBID()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Ask Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOASK" size="15" maxlength="13" value="<%= invInst.getE01QUOASK()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">MID Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" name="E01QUOMID" size="15" maxlength="13" value="<%= invInst.getE01QUOMID()%>" 
				onKeyPress="enterDecimal()">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Prior Close BID Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" name="E01QUOBIP" size="15" maxlength="13" value="<%= invInst.getE01QUOBIP()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Prior Close Ask Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOASP" size="15" maxlength="13" value="<%= invInst.getE01QUOASP()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Prior Close MID Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOMIP" size="15" maxlength="13" value="<%= invInst.getE01QUOMIP()%>" 
				onKeyPress="enterDecimal()">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">52 Weeks High Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOHIP" size="15" maxlength="13" value="<%= invInst.getE01QUOHIP()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">52 Low High Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOLOP" size="15" maxlength="13" value="<%= invInst.getE01QUOLOP()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Last Trade Price :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="E01QUOTPX" size="15" maxlength="13" value="<%= invInst.getE01QUOTPX()%>" 
				onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
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
