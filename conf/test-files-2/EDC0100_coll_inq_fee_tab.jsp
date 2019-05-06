<html>
<head>
<title>Fee Tables Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="colProdInq" class="datapro.eibs.beans.ESD0715DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(coll_i_opt);

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("       showErrors()");
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center"> Charges Tables Structure <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="coll_inq_fee_tab, EDC0100"></h3>
<hr size="4">

<form>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Product Clasification</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Bank / Product: </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly  name="E01SELBNK" size="3" maxlength="2" value="<%= colProdInq.getE01SELBNK().trim()%>">
              <input type="text" readonly  name="E01SELTYP" size="3" maxlength="2" value="<%= colProdInq.getE01SELTYP().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Table Number :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly  name="E01SELTLN" size="6" maxlength="4" value="<%= colProdInq.getE01SELTLN().trim()%>">
              <input type="text" readonly  name="E101RLCDSC" size="65" maxlength="63" value="<%= colProdInq.getE01RCODSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Charges</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"><b>Concept</b></div>
            </td>
            <td width="7%"> 
              <div align="center"><b><b>Amount</b></b></div>
            </td>
            <td width="8%"> 
              <div align="center"><b><b>Rate</b></b></div>
            </td>
            <td width="7%"> 
              <div align="center"><b><b>Period</b></b></div>
            </td>
            <td width="11%"> 
              <div align="center"><b><b>Minimum</b></b></div>
            </td>
            <td width="10%"> 
              <div align="center"><b><b>Maximum</b></b></div>
            </td>
            <td width="9%"> 
              <div align="center"><b><b>I.V.A.</b></b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Clean Items :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOCRT" size="4" maxlength="3" value="<%= colProdInq.getE01RCOCRT().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOCCP" size="4" maxlength="3" value="<%= colProdInq.getE01RCOCCP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOCMF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOCMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOCMX" size="10" maxlength="9" value="<%= colProdInq.getE01RCOCMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI01" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI01()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Documentary :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCODRT" size="4" maxlength="3" value="<%= colProdInq.getE01RCODRT().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCODCP" size="4" maxlength="3" value="<%= colProdInq.getE01RCODCP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCODMF" size="10" maxlength="9" value="<%= colProdInq.getE01RCODMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCODMX" size="10" maxlength="9" value="<%= colProdInq.getE01RCODMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI02" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI02()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Direct :</div>
            </td>
            <td width="7%">&nbsp; </td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCORRT" size="4" maxlength="3" value="<%= colProdInq.getE01RCORRT().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCORCP" size="4" maxlength="3" value="<%= colProdInq.getE01RCORCP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCORMF" size="10" maxlength="9" value="<%= colProdInq.getE01RCORMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCORMX" size="10" maxlength="9" value="<%= colProdInq.getE01RCORMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Extension of Validity :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOEBR" size="4" maxlength="3" value="<%= colProdInq.getE01RCOEBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCORCP" size="4" maxlength="3" value="<%= colProdInq.getE01RCORCP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOEMF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOEMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOEMX" size="10" maxlength="9" value="<%= colProdInq.getE01RCOEMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI04" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI04()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Payments :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOPPM" size="10" maxlength="9" value="<%= colProdInq.getE01RCOPPM().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%"> 
              <div align="center"> </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI05" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI05()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"> Protest :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOPRT" size="10" maxlength="9" value="<%= colProdInq.getE01RCOPRT().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI06" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI06()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Second Tracer :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOTR1" size="10" maxlength="9" value="<%= colProdInq.getE01RCOTR1().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI07" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI07()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Additional Tracer :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOTR2" size="10" maxlength="9" value="<%= colProdInq.getE01RCOTR2().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right"> Unpaid Items :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOUNP" size="10" maxlength="9" value="<%= colProdInq.getE01RCOUNP().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI08" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI08()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Amendments :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOAMF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOAMF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"> </div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI09" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI09()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Advise of Payment :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOADP" size="10" maxlength="9" value="<%= colProdInq.getE01RCOADP().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI10" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI10()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Endorsement Ship/Doc :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOESD" size="10" maxlength="9" value="<%= colProdInq.getE01RCOESD().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI11" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI11()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Indemnity Letters :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOLIF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOLIF().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOLIP" size="4" maxlength="3" value="<%= colProdInq.getE01RCOLIP().trim()%>">
              </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI12" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI12()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Past Due Items :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOPDA" size="10" maxlength="9" value="<%= colProdInq.getE01RCOPDA().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOPDP" size="4" maxlength="3" value="<%= colProdInq.getE01RCOPDP().trim()%>">
              </div>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="10%"> 
              <div align="center"> </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI13" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI13()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Wire Transfer :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOWTF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOWTF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI14" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI14()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Postage - Regular :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOPST" size="10" maxlength="9" value="<%= colProdInq.getE01RCOPST().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI15" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI15()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Postage - Certified :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOPTC" size="10" maxlength="9" value="<%= colProdInq.getE01RCOPTC().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Courier - Local :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOCOD" size="10" maxlength="9" value="<%= colProdInq.getE01RCOCOD().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI16" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI16()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Courier - Foreign :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOCOF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOCOF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Fax - Local :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOFXD" size="10" maxlength="9" value="<%= colProdInq.getE01RCOFXD().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI17" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI17()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right"> Fax - Foreign :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOFXF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOFXF().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Telex - Long Message :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOLTX" size="10" maxlength="9" value="<%= colProdInq.getE01RCOLTX().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI18" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI18()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Telex - Short Message :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOSTX" size="10" maxlength="9" value="<%= colProdInq.getE01RCOSTX().trim()%>">
            </td>
            <td width="8%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="9%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Swift Message :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RCOSWF" size="10" maxlength="9" value="<%= colProdInq.getE01RCOSWF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOI19" maxlength="1" size="2" value="<%= colProdInq.getE01RCOI19()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Ledger</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"><b>Concept</b></div>
            </td>
            <td width="18%"> 
              <div align="center"><b><b>General Ledger</b></b></div>
            </td>
            <td width="34%"> 
              <div align="center"><b><b>Description</b></b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Clean Items :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGCC" value="<%= colProdInq.getE01RCOGCC().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGIS" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGCC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Documentary :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGCD" value="<%= colProdInq.getE01RCOGDC().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAD" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGDC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Direct :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGRD" value="<%= colProdInq.getE01RCOGRD().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCO" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGRD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Extension of Validity :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGEV" value="<%= colProdInq.getE01RCOGEV().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGEV" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGEV().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Payments :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGPP" value="<%= colProdInq.getE01RCOGPP().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAM" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGPP().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Protest :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGPR" value="<%= colProdInq.getE01RCOGPR().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAA" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGPR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Tracers :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGTR" value="<%= colProdInq.getE01RCOGTR().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGDI" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGTR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Unpaid Items :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGUI" value="<%= colProdInq.getE01RCOGUI().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGPM" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGUI().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Amendments :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGAM" value="<%= colProdInq.getE01RCOGAM().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAC" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGAM().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Advise of Payment :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGAP" value="<%= colProdInq.getE01RCOGAP().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGDP" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGAP().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Endorsement Ship/Doc. :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGED" value="<%= colProdInq.getE01RCOGED().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGNE" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGED().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Indemnity Letters :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGLI" value="<%= colProdInq.getE01RCOGLI().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAS" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGLI().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Past Due Items :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGPD" value="<%= colProdInq.getE01RCOGPD().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTR" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGPD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Wire Transfer :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGWT" value="<%= colProdInq.getE01RCOGWT().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGPO" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGWT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Postage :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGPO" value="<%= colProdInq.getE01RCOGPO().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCR" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGPO().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"> Courier :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGCR" value="<%= colProdInq.getE01RCOGCR().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCA" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGCR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Fax(es) :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGFX" value="<%= colProdInq.getE01RCOGFX().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGWT" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGFX().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Telex :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGTX" value="<%= colProdInq.getE01RCOGTX().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTF" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGTX().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right"> Swift Messages :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RCOGSW" value="<%= colProdInq.getE01RCOGSW().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTM" size="37" maxlength="35" value="<%= colProdInq.getE01DSCGSW().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
