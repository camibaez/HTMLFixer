<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invBrok" class="datapro.eibs.beans.EIE000501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
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
<div align="center">
  <h3>Agents of Custody Management <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_brokers_basic.jsp,EIE0005">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0005" >
  <h4>Basic Information
    <input type="hidden" name="SCREEN"  value="6" >
    <input type="hidden" name="E01FEBTYP"  value="3" >
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
              <input type="text" name="E01FEBNUM" size="5" maxlength="3" value="<%= invBrok.getE01FEBNUM()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">ID Code:</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBBID" size="17" maxlength="15" value="<%= invBrok.getE01FEBBID()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Name :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBNM1" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM1()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">Short Name :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBSNM" size="20" maxlength="15" value="<%= invBrok.getE01FEBSNM()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Address :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBNM2" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM2()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">City :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBCTY" size="20" maxlength="15" value="<%= invBrok.getE01FEBCTY()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBNM3" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM3()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">State :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBSTE" size="4" maxlength="2" value="<%= invBrok.getE01FEBSTE()%>">
              <a href="javascript:GetCodeCNOFC('E01FEBSTE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right"></div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBNM4" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM4()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">Country :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBCTR" size="4" maxlength="3" value="<%= invBrok.getE01FEBCTR()%>">
              <a href="javascript:GetCodeCNOFC('E01FEBCTR','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">P. O Box :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBZPC" size="20" maxlength="15" value="<%= invBrok.getE01FEBZPC()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBZIP" size="20" maxlength="15" value="<%= invBrok.getE01FEBZIP()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Phone Number 1 :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBPH1" size="20" maxlength="15" value="<%= invBrok.getE01FEBPH1()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">Phone Number 2 :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBPH2" size="20" maxlength="15" value="<%= invBrok.getE01FEBPH2()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Fax Number :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBFA1" size="20" maxlength="15" value="<%= invBrok.getE01FEBFA1()%>">
            </td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="33%" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">eMail Address 1 :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01FEBIA1" size="40" maxlength="40" value="<%= invBrok.getE01FEBIA1()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">eMail Address 2 :</div>
            </td>
            <td nowrap width="33%" >
              <input type="text" name="E01FEBIA2" size="40" maxlength="40" value="<%= invBrok.getE01FEBIA2()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table  class="tableinfo" width="546">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Withholding :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01FEBWTH" size="3" maxlength="1" value="<%= invBrok.getE01FEBWTH()%>">
              <a href="javascript:GetCode('E01FEBWTH','STATIC_inv_with.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            </td>
            <td nowrap width="34%" >
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" name="E01FEBPVI" size="3" maxlength="1" value="<%= invBrok.getE01FEBPVI()%>">
              <a href="javascript:GetCode('E01FEBPVI','STATIC_inv_payment_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E01FEBCBK" size="2" maxlength="2" value="<%= invBrok.getE01FEBCBK()%>">
                <input type="text" name="E01FEBCBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')" value="<%= invBrok.getE01FEBCBR()%>">
                <input type="text" name="E01FEBCCY" size="3" maxlength="3" value="<%= invBrok.getE01FEBCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">
                <input type="text" name="E01FEBCGL" size="15" maxlength="13" value="<%= invBrok.getE01FEBCGL()%>"
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01FEBCBK.value,document.forms[0].E01FEBCCY.value,'','','')" >
                <input type="text" name="E01FEBCAC" size="13" maxlength="12" value="<%= invBrok.getE01FEBCAC().trim()%>"
			oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','RT')"  onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap >
              <div align="right">Collection Before of :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01FEBDAC" size="5" maxlength="3"  value="<%= invBrok.getE01FEBDAC().trim()%>"
			oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">
              Days </td>
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
  <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2">
  </font></font></font></font></font><BR>
  </form>
</body>
</html>
