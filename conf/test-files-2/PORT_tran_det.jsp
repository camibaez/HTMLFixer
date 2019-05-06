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

<h3 align="center">Order Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_maint.jsp,EDL0130"></h3>
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
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="21%" height="15" nowrap> 
              <div align="right">Bank Code :</div>
            </td>
            <td  width="30%" height="15"> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD12" size="4" maxlength="2" value="01" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"> Branch :</div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD122" size="6" maxlength="2" value="000" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right">Currency :</div>
            </td>
            <td colspan="4" nowrap> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD1222" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">General Ledger Account :</div>
            </td>
            <td  width="30%"> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD12222" size="16" maxlength="2" value="200040800001" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Account :</div>
            </td>
            <td  width="16%"> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD122222" size="11" maxlength="2" value="1286407" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">Portfolio Number :</div>
            </td>
            <td  width="30%"> 
              <div align="left">
                <input type="text" readonly name="E01NEWMD1222222" size="11" maxlength="2" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Order ID Number :</div>
            </td>
            <td  width="16%"> 
              <input type="text" readonly name="E01NEWMD1222223" size="15" maxlength="2" value="000000005" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Confirmation :</div>
            </td>
            <td  width="30%"> 
              <div align="left"> 
                <input type="text" readonly name="E01NEWMD12222222" size="8" maxlength="2" onKeyPress="enterInteger()" value="00006">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Transaction :</div>
            </td>
            <td  width="16%"> 
              <input type="text" readonly name="E01NEWMD12222223" size="7" maxlength="2" onKeyPress="enterInteger()" value="00006">
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right">Transaction Status :</div>
            </td>
            <td  width="30%"> 
              <div align="left">
                 
                  <input type="text" readonly name="E01NEWMD12222224" size="15" maxlength="2" onKeyPress="enterInteger()" value="CONFIRMED">
               
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Transaction Code :</div>
            </td>
            <td  width="16%"> 
              <input type="text" readonly name="E01NEWMD12222225" size="6" maxlength="2" onKeyPress="enterInteger()" value="BU">
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">Order Type :</div>
            </td>
            <td  width="30%"> 
              <div align="left">
                <input type="text" readonly name="E01NEWMD12222226" size="11" maxlength="2" onKeyPress="enterInteger()" value="SELL">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Order Qualifiers :</div>
            </td>
            <td  width="16%">
              <input type="text" readonly name="E01NEWMD12222227" size="13" maxlength="2" onKeyPress="enterInteger()" value="FILLORKILL">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Description of Operations</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Instrument Type :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD122222262" size="33" maxlength="2" onKeyPress="enterInteger()" value="US DOLLAR RESERVE FUND">
            </td>
            <td nowrap > 
              <div align="right">Market :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD122222263" size="15" maxlength="2" onKeyPress="enterInteger()" value="SECONDARY">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Issuer :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD1222222622" size="33" maxlength="2" onKeyPress="enterInteger()" value="MERRYL LYNCH INVESTMENT">
            </td>
            <td nowrap > 
              <div align="right">ISIN Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD1222222623" size="18" maxlength="2" onKeyPress="enterInteger()" value="USDRFFX -- 001">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Liquidation Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD1" size="2" maxlength="2" value="28" onkeypress="enterInteger()">
              <input type="text" readonly name="E01DEARD2" size="2" maxlength="2" value="02" onkeypress="enterInteger()">
              <input type="text" readonly name="E01DEARD3" size="5" maxlength="2" value="2002" onkeypress="enterInteger()">
            </td>
            <td nowrap > 
              <div align="right">Market Value :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARTE" size="12" maxlength="9" value="25,000.00" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Operation :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAWHF" size="7" maxlength="1" value="TODAY">
            </td>
            <td nowrap > 
              <div align="right"> Price :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAREF" size="12" maxlength="12" value="250.00">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Quantity :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAICT" size="8" maxlength="1" value="100.00">
            </td>
            <td nowrap > 
              <div align="right"> Symbol :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAEXR" size="25" maxlength="11" value="USDRESERVEFUND" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Purchase Value :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAMLA" size="15" maxlength="1" value="30,000.00" onkeypress="enterInteger()">
            </td>
            <td nowrap > 
              <div align="right">Lst. Div. Pay. Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD12" size="2" maxlength="2" value="00" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01DEARD22" size="2" maxlength="2" value="00" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01DEARD32" size="5" maxlength="2" value="0000" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Purchase Price :</div>
            </td>
            <td nowrap >
              <input type="text" readonly name="E01DEACCN" size="15" maxlength="6" value="300.00" onkeypress="enterInteger()">
            </td>
            <td nowrap >
              <div align="right">Dividends Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD122222264" size="11" maxlength="2" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Collateral Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAMLA2" size="15" maxlength="1" value="0.00" onKeyPress="enterInteger()">
            </td>
            <td nowrap > 
              <div align="right">Collateral Date :</div>
            </td>
            <td nowrap >
              <input type="text" readonly name="E01DEARD122" size="2" maxlength="2" value="00" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01DEARD222" size="2" maxlength="2" value="00" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01DEARD322" size="5" maxlength="2" value="0000" onKeyPress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Liquidation of Operations</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Purchase Agent :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD132" size="5" maxlength="2" value="001" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01NEWMD1222222624" size="45" maxlength="2" onKeyPress="enterInteger()" value="MERRYL LYNCH ASSETS MANAGEMENT ">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Sales Agent :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD1322" size="5" maxlength="2" onKeyPress="enterInteger()">
              <input type="text" readonly name="E01NEWMD12222226242" size="45" maxlength="2" onKeyPress="enterInteger()" value=" ">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Purchase Commission :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD13" size="12" maxlength="2" value="250.00" onKeyPress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Sales Commission :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARD133" size="12" maxlength="2" onKeyPress="enterInteger()" value="0.00">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Commission Charged :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEARTE2" size="12" maxlength="9" value="300.00" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Commission Paid :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01DEAREF2" size="12" maxlength="12" value="0.00">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
