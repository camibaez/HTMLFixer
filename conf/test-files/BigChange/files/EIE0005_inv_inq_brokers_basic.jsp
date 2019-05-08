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
  <h3>Brokers Inquiry <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_brokers_basic.jsp,EIE0005"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0005" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN"  value="2" >
    <input type="hidden" name="E01FEBTYP"  value="2" >
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
              <input type="text" readonly  name="E01FEBNUM" size="5" maxlength="3" value="<%= invBrok.getE01FEBNUM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">ID Code :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBBID" size="17" maxlength="15" value="<%= invBrok.getE01FEBBID()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM1" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM1()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Short Name :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBSNM" size="20" maxlength="15" value="<%= invBrok.getE01FEBSNM()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM2" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM2()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">City :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBCTY" size="20" maxlength="15" value="<%= invBrok.getE01FEBCTY()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM3" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM3()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">State :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBSTE" size="4" maxlength="2" value="<%= invBrok.getE01FEBSTE()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM4" size="35" maxlength="30" value="<%= invBrok.getE01FEBNM4()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBCTR" size="4" maxlength="3" value="<%= invBrok.getE01FEBCTR()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">P. O Box :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBZPC" size="20" maxlength="15" value="<%= invBrok.getE01FEBZPC()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBZIP" size="20" maxlength="15" value="<%= invBrok.getE01FEBZIP()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Phone Number 1 :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBPH1" size="20" maxlength="15" value="<%= invBrok.getE01FEBPH1()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Phone Number 2 :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBPH2" size="20" maxlength="15" value="<%= invBrok.getE01FEBPH2()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Fax Number :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" readonly  name="E01FEBFA1" size="20" maxlength="15" value="<%= invBrok.getE01FEBFA1()%>">
            </td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="33%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">eMail Address 1 :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBIA1" size="40" maxlength="40" value="<%= invBrok.getE01FEBIA1()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">eMail Address 2 :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBIA2" size="40" maxlength="40" value="<%= invBrok.getE01FEBIA2()%>">
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
              <input type="text" name="E01FEBWTH" size="16" 
				  value="<% if (invBrok.getE01FEBWTH().equals("W")) out.print("Withholding");
							else if (invBrok.getE01FEBWTH().equals("F")) out.print("Form 1099");
							else if (invBrok.getE01FEBWTH().equals("B")) out.print("Both");
							else out.print("None");%>" 
				readonly>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01FEBPVI" size="25" 
				  value="<% if (invBrok.getE01FEBPVI().equals("A")) out.print("Retail Account");
							else if (invBrok.getE01FEBPVI().equals("G")) out.print("General Ledger");
							else if (invBrok.getE01FEBPVI().equals("F")) out.print("Fed Transfer");
						    else if (invBrok.getE01FEBPVI().equals("T")) out.print("Telex Transfer");
							else if (invBrok.getE01FEBPVI().equals("1")) out.print("Swift MT-100");
							else if (invBrok.getE01FEBPVI().equals("2")) out.print("Swift MT-200");
							else out.print("None");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01FEBCBK" size="2" maxlength="2" value="<%= invBrok.getE01FEBCBK()%>">
                <input type="text" readonly  name="E01FEBCBR" size="3" maxlength="3"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')" value="<%= invBrok.getE01FEBCBR()%>">
                <input type="text" readonly  name="E01FEBCCY" size="3" maxlength="3" value="<%= invBrok.getE01FEBCCY()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">
                <input type="text" readonly  name="E01FEBCGL" size="15" maxlength="13" value="<%= invBrok.getE01FEBCGL()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01FEBCBK.value,document.forms[0].E01FEBCCY.value,'','','')" >
                <input type="text" readonly  name="E01FEBCAC" size="13" maxlength="12" value="<%= invBrok.getE01FEBCAC().trim()%>"
			oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','RT')"  onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01FEBCCN" size="7" maxlength="6"  value="<%= invBrok.getE01FEBCCN().trim()%>"
			oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Flat Fee Amount :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01FEBFFA" size="13" maxlength="11" value="<%= invBrok.getE01FEBFFA()%>">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Flat Fee Rate :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01FEBPRC" size="13" maxlength="11" value="<%= invBrok.getE01FEBPRC()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Fee Calculation Type :</div>
            </td>
            <td nowrap width="34%" >
              <input type="hidden" name="E01FEBFCT" value="<%= invBrok.getE01FEBFCT()%>">
              <input type="radio" name="CE01FEBFCT" value="F" onClick="document.forms[0].E01FEBFCT.value='F'"
			  <%if(invBrok.getE01FEBFCT().equals("F")) out.print("checked");%> disabled>
              Flat Fee 
              <input type="radio" name="CE01FEBFCT" value="P" onClick="document.forms[0].E01FEBFCT.value='P'"
			  <%if(invBrok.getE01FEBFCT().equals("P")) out.print("checked");%> disabled>
              Percentage </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Amount Paid YTD :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01FEBPYT" size="16" maxlength="15" value="<%= invBrok.getE01FEBPYT()%>" 
			onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Amount Withheld YTD :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01FEBWYT" size="16" maxlength="15" value="<%= invBrok.getE01FEBWYT()%>" 
			onKeyPress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
