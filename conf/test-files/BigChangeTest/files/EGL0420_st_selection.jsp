<html>
<head>
<title>General Ledger Account Statement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<h3 align="center"> General Ledger Transactions Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="st_selection.jsp,EGL0420"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" height="31"> 
              <div align="right"><b>Bank Code :</b></div>
            </td>
            <td nowrap width="32%" height="31"> 
              <input type="text" name="E01TRABNK" size="2" maxlength="2" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right"><b>Branch Number :</b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRABRN" size="3" maxlength="3" onkeypress="enterInteger()">
              <a href="javascript:GetBranch('E01TRABRN',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRACCY" size="3" maxlength="3">
              <a href="javascript:GetCurrency('E01TRACCY',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>General Ledger Account :</b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRAGLN" size="16" maxlength="12" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01TRAGLN',document.forms[0].E01TRABNK.value,document.forms[0].E01TRACCY.value,'')"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  > 
              </a> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Select Transaction By :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <input type="radio" name="E01HISCYC" value="M" checked>
              <b>This Cycle</b></td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="32%"> 
              <input type="radio" name="E01HISCYC" value="H">
              <b>Historic</b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Date Type:</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <input type="radio" value="B" name="E01VALBTH" checked>
              <b> Process Date</b></td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="32%"> 
              <input type="radio" value="V" name="E01VALBTH" >
              <b>Value Date</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Select Date From :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01FRDTE1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01FRDTE2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01FRDTE3" size="2" maxlength="2" onkeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01FRDTE1,document.forms[0].E01FRDTE2,document.forms[0].E01FRDTE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Up To :</b></div>
            </td>
            <td nowrap width="32%"> 
              <div align="left"> 
                <input type="text" name="E01TODTE1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01TODTE2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01TODTE3" size="2" maxlength="2" onkeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01TODTE1,document.forms[0].E01TODTE2,document.forms[0].E01TODTE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Select Reference From :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01FRREFN" size="9" maxlength="9" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Up To :</b></div>
            </td>
            <td nowrap width="32%"> 
              <div align="left"> 
                <input type="text" name="E01TOREFN" size="9" maxlength="9" onkeypress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" height="26"> 
              <div align="right"><b>Select Amount From :</b></div>
            </td>
            <td nowrap width="3%" height="26">&nbsp;</td>
            <td nowrap width="23%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01FRAMNT" size="15" maxlength="13" onkeypress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="10%" height="26"> 
              <div align="right"><b>Up To :</b></div>
            </td>
            <td nowrap width="32%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01TOAMNT" size="15" maxlength="13" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  </form>
</body>
</html>
