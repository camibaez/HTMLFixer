<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="pymInst" class="datapro.eibs.beans.ESD001501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body>


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


<h3 align="center">Automatic Cash Dispenser Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bank_instructions.jsp,ESD0005"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0015">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  </p>
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="50%">
              <div align="right">IP Address :</div>
            </td>
            <td nowrap width="50%">
              <div align="left">
                <input type="text" name="E01MID" size="17" maxlength="17" value="<%= pymInst.getE01MID()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%">
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="50%">
              <div align="left">
                <input type="text" name="E01BNK" size="3" maxlength="2" value="<%= pymInst.getE01BNK()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%" >
              <div align="right">Branch :</div>
            </td>
            <td nowrap width="50%" >
              <div align="left">
                <input type="text" name="E01BRN" size="3" maxlength="3" value="<%= pymInst.getE01BRN().trim()%>">
                <a href="javascript:GetBranch('E01BRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%" >
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="50%" >
              <div align="left">
                <input type="text" name="E01CCY" size="4" maxlength="3" value="<%= pymInst.getE01CCY().trim()%>" >
                <a href="javascript:GetCurrency('E01CCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%" >
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap width="50%" >
              <div align="left">
                <input type="text" name="E01GLN" size="16" maxlength="16" value="<%= pymInst.getE01GLN().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:GetLedger('E01GLN',document.forms[0].E01BNK.value,document.forms[0].E01CCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%" >
              <div align="right">Description :</div>
            </td>
            <td nowrap width="50%" >
              <div align="left">
                <input type="text" name="E01DSC" size="35" maxlength="35" value="<%= pymInst.getE01DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%" >
              <div align="right">Begining Balance :</div>
            </td>
            <td nowrap width="50%" >
              <input type="text" name="E01BBL" size="16" maxlength="16" value="<%= pymInst.getE01BBL().trim()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>

<table width="100%">
      <tr>
        <td width="50%">
          <p align="center">
          <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
          </p>
        </td>
      </tr>
    </table>



</form>


</body>
</html>
