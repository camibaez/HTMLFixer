<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Accounting</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="gl" class="datapro.eibs.beans.ECON00001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%> 
<h3 align="center"> Accounts to be Eliminated from the Consolidated Statements 
  - Maintenance</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSECON00" >
  <h4>
<input type="hidden" name="SCREEN" value="400">
  </h4>
  <table class="tableinfo">
    <tr id="trdark"> 
      <td nowrap > 
        <div align="right">Sequence :</div>
      </td>
      <td nowrap colspan="2" > 
        <div align="left"> 
          <input type="text" name="E01CONSEQ" size="5" maxlength="4" value="<%= gl.getE01CONSEQ()%>" readonly>
        </div>
      </td>
    </tr>
  </table>
  <h4>General Ledger</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Bank :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01CONBNK" size="2" maxlength="2" value="<%= gl.getE01CONBNK()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01CONCCY" size="3" maxlength="3" value="<%= gl.getE01CONCCY()%>"
                readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"> 
                <input type="text" name="E01CONGLN" size="15" maxlength="13" value="<%= gl.getE01CONGLN()%>" 
				readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Ledger to Eliminate</h4>
  <table class="tableinfo">
    <tr id="trdark"> 
      <td nowrap > 
        <div align="right">Bank :</div>
      </td>
      <td nowrap colspan="2" > 
        <input type="text" name="E01CONEBK" size="2" maxlength="2" value="<%= gl.getE01CONEBK()%>">
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="right">Currency :</div>
      </td>
      <td nowrap colspan="2" > 
        <input type="text" name="E01CONECY" size="3" maxlength="3" value="<%= gl.getE01CONECY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01CONEBK.value,'','','','')">
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap > 
        <div align="right">General Ledger :</div>
      </td>
      <td nowrap colspan="2" > 
        <div align="left"> 
          <input type="text" name="E01CONEGL" size="15" maxlength="13" value="<%= gl.getE01CONEGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CONEBK.value,document.forms[0].E01CONECY.value,'','','')"  >
        </div>
      </td>
    </tr>
  </table>
  
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
  <p><BR>
  </p>
</form>
</body>
</html>
