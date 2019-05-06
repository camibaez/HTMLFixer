<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>>Budget master File Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="budget" class="datapro.eibs.beans.EGL034501Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

<H3 align="center">Budget Master File Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="budget_master_enter, EGL0345"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0345">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>

  <h4>Operation Type</h4>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr>
      <td >
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="E01OPETYP" value="0002" checked > Maintenance
            </td>
            <td width="60%" nowrap>
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="E01OPETYP" value="0001" > New
            </td>
            <td width="60%" nowrap>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Selection</h4>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr>
      <td >
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="H01FLGWK3" value="Y" <%if (!budget.getH01FLGWK3().equals("N")) out.print("checked");%> > Current Year Budget
            </td>
            <td width="60%" nowrap>
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="H01FLGWK3" value="N" <%if (budget.getH01FLGWK3().equals("N")) out.print("checked");%>> Next Year Budget
            </td>
            <td width="60%" nowrap>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Enter Information</h4>
   <table class="tableinfo"  cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="trdark">
      <td valign="middle" align="center" width="49%">
        <div align="right">Bank : </div>
      </td>
      <td valign="middle" align="center" width="51%">
        <div align="left">
          <input type="text" name="E01BUMBNK"  size="3" maxlength="2" value="<%= budget.getE01BUMBNK().trim()%>" onkeypress="enterInteger()" >
        </div>
      </td>
    </tr>
    <tr id="trclear">
      <td valign="middle" align="center" width="49%">
        <div align="right">Branch : </div>
      </td>
      <td valign="middle" align="center" width="51%">
        <div align="left">
          <input type="text" name="E01BUMBRN"  size="5" maxlength="4" value="<%= budget.getE01BUMBRN().trim()%>" onkeypress="enterInteger()" >
          <a href="javascript:GetBranch('E01BUMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
        </div>
      </td>
    </tr>
    <tr id="trdark">
      <td valign="middle" align="center" width="49%">
        <div align="right">Currency : </div>
      </td>
      <td valign="middle" align="center" width="51%">
        <div align="left">
          <input type="text" name="E01BUMCCY"  size="4" maxlength="3" value="<%= budget.getE01BUMCCY().trim()%>"  >
          <a href="javascript:GetCurrency('E01BUMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
        </div>
      </td>
    </tr>
    <tr id="trclear">
      <td valign="middle" align="center" width="49%">
        <div align="right">Budget Account : </div>
      </td>
      <td valign="middle" align="center" width="51%">
        <div align="left">
          <input type="text" name="E01BUMNUM"  size="15" maxlength="13" value="<%= budget.getE01BUMNUM().trim()%>"  >
          <a href="javascript:GetBudget('E01BUMNUM',document.forms[0].E01BUMBNK.value,document.forms[0].E01BUMCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
        </div>
      </td>
    </tr>
     <tr id="trdark">
      <td valign="middle" align="center" width="49%">
        <div align="right">Cost Center : </div>
      </td>
      <td valign="middle" align="center" width="51%">
        <div align="left">
          <input type="text" name="E01BUMCCN"  size="10" maxlength="9" value="<%= budget.getE01BUMCCN().trim()%>" onkeypress="enterInteger()" >
          <a href="javascript:GetCostCenter('E01BUMCCN',document.forms[0].E01BUMBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
        </div>
      </td>
    </tr>
  </table>
 <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </p>

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
</form>
</body>
</html>
