<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Portfolio Management Module</title>
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
<body nowrap>
<% 
 
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">Portfolio Management Module( Second View)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFE0120P" >
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
                <input type="text" name="E01NEWMD12" size="4" maxlength="2" value="01" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"> Branch :</div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="left"> 
                <input type="text" name="E01NEWMD122" size="6" maxlength="2" value="000" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right">Currency :</div>
            </td>
            <td colspan="4" nowrap> 
              <div align="left"> 
                <input type="text" name="E01NEWMD1222" size="6" maxlength="2" value="USD" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right">General Ledger Account :</div>
            </td>
            <td  width="30%"> 
              <div align="left"> 
                <input type="text" name="E01NEWMD12222" size="16" maxlength="2" value="200040800001" onKeyPress="enterInteger()">
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right">Account :</div>
            </td>
            <td  width="16%"> 
              <div align="left"> 
                <input type="text" name="E01NEWMD122222" size="11" maxlength="2" value="1286407" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Customer Portfolio Inquiry</h4>
  <table  class="tableinfo" width="523" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"></div>
            </td>
            <td nowrap width="32%" > 
              <div align="center"><b>Stocks Symbol </b></div>
            </td>
            <td nowrap width="9%" ><b>Product</b></td>
            <td nowrap width="10%" > 
              <div align="center"><b>Quantity</b></div>
            </td>
            <td nowrap width="13%" > 
              <div align="center"><b>Price at <br>
                Purchase </b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"><b>Gain <br>
                (Loss)</b></div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"><b>Current<br>
                Market Value</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">100.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">300.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">-5,000.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">25,000.00</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">-50.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">350.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">5,000.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">12,500.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2" height="22"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" height="22" > 
              <div align="left">BA</div>
            </td>
            <td nowrap width="9%" height="22" > 
              <div align="center">BA</div>
            </td>
            <td nowrap width="10%" height="22" > 
              <div align="right">50.00</div>
            </td>
            <td nowrap width="13%" height="22" > 
              <div align="right">50.00</div>
            </td>
            <td nowrap width="10%" height="22" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" height="22" > 
              <div align="right">2,500.00</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">230.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">428.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">40,940.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">57,500.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">BA</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">BA</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">100.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">150.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">15,000.00</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">15.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">1500.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">18,750.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">3,750.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">75.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">30.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">16,500.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">18,750.00</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">BA</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">BA</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">100.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">100.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">10,000.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">BA</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">BA</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">10.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">1000.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">10,000.00</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">-5375.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">10.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">1,290,000.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">1,343,750.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left">USDRESERVEFUND</div>
            </td>
            <td nowrap width="9%" > 
              <div align="center">USFR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">20.00</div>
            </td>
            <td nowrap width="13%" > 
              <div align="right">155.00</div>
            </td>
            <td nowrap width="10%" > 
              <div align="right">1,900.00</div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">5,000.00</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="8">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="3"> 
              <div align="right"><b> Total Investment</b></div>
            </td>
            <td nowrap >&nbsp;</td>
            <td nowrap > 
              <div align="right"><font color=red><b>-4,725.00</b></font></div>
            </td>
            <td nowrap > 
              <div align="right"><b>4,073.00</b></div>
            </td>
            <td nowrap > 
              <div align="right"><b>1,368,090.00</b></div>
            </td>
            <td nowrap width="22%" > 
              <div align="right"><b>1,503,750.00</b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
<p></p>
  <BR>
  </form>
</body>
</html>
