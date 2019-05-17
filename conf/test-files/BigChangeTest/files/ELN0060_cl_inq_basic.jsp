<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "clBasic" class= "datapro.eibs.beans.ELN006002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_i_opt);
   
</SCRIPT>

<body>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Line of Credit Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_inq_basic.jsp, ELN0060"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="32">
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
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Line Type : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getCreditLineType().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Line Number :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getCreditLineNum().trim()%>" >
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
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4></h4>
    <table class="tableinfo">
      <tr > 
        <td >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right"> Bank/Branch :</div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNEBNK" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNEBNK().trim()%>">
                <input type="text" name="E02LNEBRN" readonly  size="5" maxlength="3" value="<%= clBasic.getE02LNEBRN().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right">General Ledger :</div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNEGLN" readonly  size="18" maxlength="16" value="<%= clBasic.getE02LNEGLN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right">Debit Account :</div>
            </td>
            <td width=37% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEBDA" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNEBDA().trim()%>">
                <input type="text" name="E02LNEDAB" readonly  size="5" maxlength="3" value="<%= clBasic.getE02LNEDAB().trim()%>">
                <input type="text" name="E02LNECDA" readonly  size="5" maxlength="3" value="<%= clBasic.getE02LNECDA().trim()%>">
                <input type="text" name="E02LNEADN" readonly  size="18" maxlength="16" value="<%= clBasic.getE02LNEADN().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Opening Date :</div>
            </td>
            <td width=20% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEOP1" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEOP1().trim()%>">
                <input type="text" name="E02LNEOP2" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEOP2().trim()%>">
                <input type="text" name="E02LNEOP3" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEOP3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Fee Type :</div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNEFET" readonly  size="30" maxlength="30" 
				  value="<% if (clBasic.getE02LNEFET().equals("00")) out.print("No Fees");
							else if (clBasic.getE02LNEFET().equals("01")) out.print("Fees for Unused Balances");
							else if (clBasic.getE02LNEFET().equals("02")) out.print("Fees for Used Balances");
							else if (clBasic.getE02LNEFET().equals("03")) out.print("Fees for Unused Averages Balances");
							else if (clBasic.getE02LNEFET().equals("04")) out.print("Fees for Used Averages Balances");
							else if (clBasic.getE02LNEFET().equals("05")) out.print("Fees for Total Amount of the Line");
							else out.print("");%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Maturity Date :</div>
            </td>
            <td width=20% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEMT1" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEMT1().trim()%>">
                <input type="text" name="E02LNEMT2" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEMT2().trim()%>">
                <input type="text" name="E02LNEMT3" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEMT3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right">Authorization Type :</div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNEATY" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNEATY().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Authorization Date :</div>
            </td>
            <td width=20% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEAU1" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEAU1().trim()%>">
                <input type="text" name="E02LNEAU2" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEAU2().trim()%>">
                <input type="text" name="E02LNEAU3" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNEAU3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Charge Frequency :</div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNEPRD" readonly  size="20" maxlength="20" 
				  value="<% if (clBasic.getE02LNEPRD().equals("M")) out.print("Monthly");
							else if (clBasic.getE02LNEPRD().equals("Q")) out.print("Quaterly");
							else if (clBasic.getE02LNEPRD().equals("S")) out.print("Semi - Annually");
							else if (clBasic.getE02LNEPRD().equals("R")) out.print("Rollover");
							else out.print("");%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Next Charge Date :</div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNECH1" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNECH1().trim()%>">
                <input type="text" name="E02LNECH2" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNECH2().trim()%>">
                <input type="text" name="E02LNECH3" readonly  size="2" maxlength="2" value="<%= clBasic.getE02LNECH3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right">Daily Base :</div>
            </td>
            <td width=37%> 
              <div align="left" nowrap> 
                <input type="text" name="E02LNEYBS" readonly  size="11" maxlength="9" value="<%= clBasic.getE02LNEYBS().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Base Charge Rate :</div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNEBSR" readonly  size="11" maxlength="9" value="<%= clBasic.getE02LNEBSR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Category of the Line :</div>
            </td>
            <td width="37%"> 
              <div align="left"> 
                <input type="text" name="E02LNECAT" readonly  size="35" maxlength="35" 
				  value="<% if (clBasic.getE02LNECAT().equals("A")) out.print("Authorized / Active");
							else if (clBasic.getE02LNECAT().equals("G")) out.print("Collateral Required");
							else if (clBasic.getE02LNECAT().equals("I")) out.print("Non Processed / Inactive");
							else if (clBasic.getE02LNECAT().equals("S")) out.print("Supervised");
							else if (clBasic.getE02LNECAT().equals("N")) out.print("Non Revolving Line");
							else if (clBasic.getE02LNECAT().equals("R")) out.print("Renewal Line");
							else if (clBasic.getE02LNECAT().equals("C")) out.print("Line Control");
							else out.print("");%>">
              </div>
            </td>
            <td width="17%"> 
              <div align="right">Cost Center :</div>
            </td>
            <td width="20%"> 
              <input type="text" name="E02LNECCS" readonly  size="11" maxlength="9" value="<%= clBasic.getE02LNECCS().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right">Customer/Line of Control : </div>
            </td>
            <td colspan="3" nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNECCU" readonly  size="9" maxlength="9" value="<%= clBasic.getE02LNECCU().trim()%>">
                <input type="text" name="E02LNECLN" readonly  size="4" maxlength="4" value="<%= clBasic.getE02LNECLN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Customer/Related Line :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02LNECGM" readonly  size="9" maxlength="9" value="<%= clBasic.getE02LNECGM().trim()%>">
              <input type="text" name="E02LNELGM" readonly  size="4" maxlength="4" value="<%= clBasic.getE02LNELGM().trim()%>">
            </td>
            <td nowrap>
              <div align="right">Committed : </div>
            </td>
            <td nowrap>
              <input type="text" name="E02LNECOU" readonly  size="6" maxlength="6" 
				  value="<% if (clBasic.getE02LNECOU().equals("C")) out.print("Yes");
							else if (clBasic.getE02LNECOU().equals("U")) out.print("No");
							else out.print("");%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right">Terms : </div>
            </td>
            <td nowrap width="37%"> 
              <input type="text" name="E02LNETER" readonly  size="5" maxlength="3" value="<%= clBasic.getE02LNETER().trim()%>">
              <input type="text" name="E02LNETRC" readonly  size="10" maxlength="10" 
				  value="<% if (clBasic.getE02LNETRC().equals("M")) out.print("Month(s)");
							else if (clBasic.getE02LNETRC().equals("D")) out.print("Day(s)");
							else if (clBasic.getE02LNETRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>">
            </td>
            <td nowrap width="17%"> 
              <div align="right">Credit Card Number :</div>
            </td>
            <td nowrap width="20%">
              <input type="text" name="E02LNETJT" readonly  size="16" maxlength="16" value="<%= clBasic.getE02LNETJT().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Days and Grace Rates: </div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEMXT" readonly  size="5" maxlength="3" value="<%= clBasic.getE02LNEMXT().trim()%>">
                <input type="text" name="E02LNEMRT" readonly  size="11" maxlength="9" value="<%= clBasic.getE02LNEMRT().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02LNEUC1" readonly  size="3" maxlength="1" value="<%= clBasic.getE02LNEUC1().trim()%>">
              <input type="text" name="E02LNEDC1" readonly  size="35" maxlength="30" value="<%= clBasic.getE02LNEDC1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right"> Floating Rate Type Code : </div>
            </td>
            <td width=37% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEFTB" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNEFTB().trim()%>">
                <input type="text" name="E02LNEFTY" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNEFTY().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> Base Rate /Spread : </div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNEORT" readonly  size="11" maxlength="9" value="<%= clBasic.getE02LNEORT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right">Customer Credit Level : </div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNECRR" readonly  size="3" maxlength="1" value="<%= clBasic.getE02LNECRR().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right">Tax Code : </div>
            </td>
            <td width=20% nowrap> 
              <div align="left"> 
                <input type="text" name="E02LNEIVA" readonly  size="3" maxlength="1" value="<%= clBasic.getE02LNEIVA().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=26%> 
              <div align="right"> Line Terms :</div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNETRM" readonly  size="25" maxlength="25" 
				  value="<% if (clBasic.getE02LNETRM().equals("L")) out.print("Long Term");
							else if (clBasic.getE02LNETRM().equals("S")) out.print("Short Term");
							else if (clBasic.getE02LNETRM().equals("T")) out.print("Correspondent");
							else out.print("");%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> LC Tariff Table :</div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNETLC" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNETLC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=26%> 
              <div align="right"> Loans Tariff Table : </div>
            </td>
            <td width=37%> 
              <div align="left"> 
                <input type="text" name="E02LNETLN" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNETLN().trim()%>">
              </div>
            </td>
            <td width=17%> 
              <div align="right"> DDA Tariff Table : </div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <input type="text" name="E02LNETRT" readonly  size="4" maxlength="2" value="<%= clBasic.getE02LNETRT().trim()%>">
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

