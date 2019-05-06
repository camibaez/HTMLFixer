<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Stock Bonds Transaction Details</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	builtNewMenu(test_opt);
</SCRIPT>

</head>

<body>
<% 
 
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center"> Application of Purchase / Sales Orders<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_maint.jsp,EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="6%" > 
              <div align="left"> 642</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> Datapro, Inc </div>
            </td>
            <td nowrap width="13%" > 
              <div align="right"><b>Date :</b></div>
            </td>
            <td nowrap width="23%" >04/24/02 </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table class="tableinfo" >
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="21%" height="15" nowrap> 
              <div align="right">Bank Code :</div>
            </td>
            <td  width="30%" height="15"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD12" size="4" maxlength="2" value="01" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"> Branch :</div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD122" size="6" maxlength="2" value="000" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD1222" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
              </div>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap> 
              <div align="right">General Ledger Account :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly  name="E01NEWMD12222" size="16" maxlength="2" value="200040800001" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Face Value :</div>
            </td>
            <td  width="30%"> 
              <div align="left">
                <input type="text" readonly  name="E01NEWMD12225" size="15" maxlength="2" value="30,000.00" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Account :</div>
            </td>
            <td  width="16%"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD122222" size="11" maxlength="2" value="1286407" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">Application Number :</div>
            </td>
            <td colspan="4"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD1222222" size="3" maxlength="2" onKeyPress="enterInteger()" value="01">
                <input type="text" readonly  name="E01NEWMD12223" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01NEWMD12224" size="16" maxlength="2" value="810100300000" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Document Number :</div>
            </td>
            <td colspan="4"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD12222222" size="6" maxlength="2" onKeyPress="enterInteger()" value="USRF">
                <input type="text" readonly  name="E01NEWMD122222242" size="30" maxlength="2" onKeyPress="enterInteger()" value="US DOLLAR RESERVE FU">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">Transaction Number :</div>
            </td>
            <td colspan="4"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD12222224" size="5" maxlength="2" onKeyPress="enterInteger()" value="COM">
                <input type="text" readonly  name="E01NEWMD1222222422" size="15" maxlength="2" onKeyPress="enterInteger()" value="PURCHASE">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Broker :</div>
            </td>
            <td colspan="4"> 
              <div align="left"> 
                <input type="text" readonly  name="E01NEWMD12222226" size="4" maxlength="2" onKeyPress="enterInteger()" value="001">
                <input type="text" readonly  name="E01NEWMD1222222423" size="45" maxlength="2" onKeyPress="enterInteger()" value="MERRIL LYNCH ASSETS MANAGEMENT">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">ISIN Number :</div>
            </td>
            <td  width="30%"> 
              <input type="text" readonly  name="E01NEWMD122222262" size="9" maxlength="2" onKeyPress="enterInteger()" value="USDRFFX">
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Serial :</div>
            </td>
            <td  width="16%"> 
              <input type="text" readonly  name="E01NEWMD1222222622" size="5" maxlength="2" onKeyPress="enterInteger()" value="0001">
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Issuer :</div>
            </td>
            <td colspan="4"> 
              <input type="text" readonly  name="E01NEWMD122222263" size="5" maxlength="2" onKeyPress="enterInteger()" value="MLIM">
              <input type="text" readonly  name="E01NEWMD12222224232" size="45" maxlength="2" onKeyPress="enterInteger()" value="MERRIL LYNCH ASSETS MANAGEMENT">
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">Settlement Date :</div>
            </td>
            <td  width="30%">
              <input type="text" readonly  name="E01NEWMD12226" size="3" maxlength="2" value="28" onKeyPress="enterInteger()">
              <input type="text" readonly  name="E01NEWMD122262" size="3" maxlength="2" value="02" onKeyPress="enterInteger()">
              <input type="text" readonly  name="E01NEWMD1222622" size="5" maxlength="2" value="2002" onKeyPress="enterInteger()">
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Quantity :</div>
            </td>
            <td  width="16%">
              <input type="text" readonly  name="E01NEWMD12226222" size="8" maxlength="2" value="100.00" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Purchase Maximum Price :</div>
            </td>
            <td  width="30%">
              <input type="text" readonly  name="E01NEWMD122262222" size="8" maxlength="2" value="300.00" onKeyPress="enterInteger()">
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Purchase Minimum Price :</div>
            </td>
            <td  width="16%">
              <input type="text" readonly  name="E01NEWMD1222622222" size="8" maxlength="2" value="300.00" onKeyPress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Customer Payments Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <h5>Payment Form</h5>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Dividend :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="radiobutton" value="radiobutton" disabled>
              Yes 
              <input type="radio" name="radiobutton" value="radiobutton" checked disabled>
              No </td>
            <td nowrap > 
              <div align="right">Interest :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="radiobutton" value="radiobutton" disabled>
              Yes 
              <input type="radio" name="radiobutton" value="radiobutton" checked disabled>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Capital :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="radiobutton" value="radiobutton" disabled>
              Yes 
              <input type="radio" name="radiobutton" value="radiobutton" checked disabled>
              No </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Payment Type</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DEAREF" size="3" maxlength="12" value="1">
            </td>
            <td nowrap > 
              <div align="right">Investement Group :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DEARD14" size="2" maxlength="2" value="2" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" readonly  name="E01NEWMD12222223" size="3" maxlength="2" onKeyPress="enterInteger()" value="01">
              <input type="text" readonly  name="E01NEWMD122232" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
              <input type="text" readonly  name="E01NEWMD122242" size="16" maxlength="2" value="200040800001" onKeyPress="enterInteger()">
              <input type="text" readonly  name="E01NEWMD1222422" size="13" maxlength="2" value="100100003" onKeyPress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Purchase / Sales Cancellation Information</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Cancellation Form :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DEAREF22" size="25" maxlength="12" value="Retail Account">
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Cancellation Account :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" readonly  name="E01NEWMD122222232" size="3" maxlength="2" onKeyPress="enterInteger()" value="01">
                <input type="text" readonly  name="E01NEWMD1222322" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01NEWMD1222423" size="16" maxlength="2" value="200040800001" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01NEWMD12224222" size="13" maxlength="2" value="100100003" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Loan Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DEAREF2" size="12" maxlength="12" value="2,900.00">
            </td>
            <td nowrap > 
              <div align="right">Loan Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DEARD142" size="15" maxlength="2" value="5000269" onKeyPress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
  </form>
</body>
</html>
