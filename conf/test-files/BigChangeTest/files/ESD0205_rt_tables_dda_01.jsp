<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Services Charges</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "charges" class= "datapro.eibs.beans.ESD020502Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
 
</head>
<body bgcolor="#FFFFFF">
<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%> 
 
<h3 align="center">Demand Deposits<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_tables_dda_01, ESD0205" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0205">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
  <h4>Basic Information</h4>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Table Number :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02RTETAR" size="3" maxlength="2" value="<%= charges.getE02RTETAR()%>" readonly>
                <input type="text" name="E02RTEDSC" size="35" maxlength="35" value="<%= charges.getE02RTEDSC()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right">Product :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02RTEATY" size="5" maxlength="4" value="<%= charges.getE02RTEATY()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
          	<!--
            <td nowrap width="22%"> 
              <div align="right">Commission Currency :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02RTEFCY" size="4" maxlength="3" value="<%= charges.getE02RTEFCY()%>">
              <a href="javascript:GetCurrency('E02RTEFCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              * </td>
                -->
            <td nowrap colspan="3" width="29%"> 
              <div align="right">Balance Limit :</div>
            </td>
            <td nowrap width="31%"> 
              <input type="text" name="E02RTEMBM" size="10" maxlength="9" value="<%= charges.getE02RTEMBM()%>">
            </td>
          </tr>
          <%if(!charges.getE02RTECUN().equals("0")){%>
          <%}%>
        </table>
        </td>
      </tr>


</table>
  <h4>Service Charges</h4>
 
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right"> Include Checks Image Fee:</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTESTC" size="10" maxlength="9" value="<%= charges.getE02RTESTC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right"> Free Incoming Wires Tranfer:</div>
            </td>
            <td nowrap width="31%"> 
              <div align="left"> 
                <input type="text" name="E02RTECAB" size="15" maxlength="15" value="<%= charges.getE02RTECAB()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" height="34"> 
              <div align="right">Fees Below Minimum Balance :</div>
            </td>
            <td nowrap width="18%" height="34"> 
              <div align="left"> 
                <input type="text" name="E02RTECH1" size="10" maxlength="9" value="<%= charges.getE02RTECH1()%>">
              </div>
            </td>
            <td nowrap width="29%" height="34"> 
              <div align="right">Minimum Gross Balance :</div>
            </td>
            <td nowrap width="31%" height="34" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL1" size="15" maxlength="15" value="<%= charges.getE02RTEBL1()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Fees Below Minimum Balance :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTECH2" size="10" maxlength="9" value="<%= charges.getE02RTECH2()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Minimum Net Balance:</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL2" size="15" maxlength="15" value="<%= charges.getE02RTEBL2()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Fees Below Minimum Average :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECH3" size="10" maxlength="9" value="<%= charges.getE02RTECH3()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Minimum Gross Average :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL3" size="15" maxlength="15" value="<%= charges.getE02RTEBL3()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Fees Below Minimum Average :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECH4" size="10" maxlength="9" value="<%= charges.getE02RTECH4()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Minimum Net Average :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL4" size="15" maxlength="15" value="<%= charges.getE02RTEBL4()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" colspan="4"> 
              <div align="center">Minimun Requirements to Avoid Monthly Service Charges</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">(1) Linked Balances:</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECMB" size="10" maxlength="9" value="<%= charges.getE02RTECMB()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">(2) Combined Balances :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTERBW" size="10" maxlength="9" value="<%= charges.getE02RTERBW()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">(3) CD's Balances :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMAK" size="10" maxlength="9" value="<%= charges.getE02RTEMAK()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">(4) HELOC Balances :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTECAW" size="10" maxlength="9" value="<%= charges.getE02RTECAW()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">(5)Mortgage Balances :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMBM" size="10" maxlength="9" value="<%= charges.getE02RTEMBM()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">(6) Waive if Direct Deposit :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
	              <input type="radio" name="E02RTECCF" value="Y" <%if(charges.getE02RTECCF().equals("Y")) out.print("checked");%>>Yes 
	              <input type="radio" name="E02RTECCF" value="N" <%if(charges.getE02RTECCF().equals("N")) out.print("checked");%>>No 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">(7) Money Market Balance :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMOA" size="10" maxlength="9" value="<%= charges.getE02RTEMOA()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
              </div>
            </td>
          </tr>       
          <tr id="trclear"> 
            <td nowrap width="22%" colspan="4"> 
              <div align="center">&nbsp;</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Fees for Extra Checks :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMKC" size="10" maxlength="9" value="<%= charges.getE02RTEMKC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Number of Free Checks :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMKK" size="4" maxlength="3" value="<%= charges.getE02RTEMKK()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Inactive Accounts Fees :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEICH" size="10" maxlength="9" value="<%= charges.getE02RTEICH()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Number of Days for Inactive :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEIDL" size="5" maxlength="4" value="<%= charges.getE02RTEIDL()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Dormant Accounts Fees :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDCH" size="10" maxlength="9" value="<%= charges.getE02RTEDCH()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Number of Days for Dormant :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDDL" size="5" maxlength="4" value="<%= charges.getE02RTEDDL()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Maximum Fees Non Local Check :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCX" size="10" maxlength="9" value="<%= charges.getE02RTENCX()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Non-Local Checks Fee Percentage :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCP" size="4" maxlength="3" value="<%= charges.getE02RTENCP()%>">
                %</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Minimum Fees Non Local Check :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCM" size="10" maxlength="9" value="<%= charges.getE02RTENCM()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Annual Service Fee :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEYRC" size="15" maxlength="15" value="<%= charges.getE02RTEYRC()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Approval Fees :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENSC" size="10" maxlength="9" value="<%= charges.getE02RTENSC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Uncollect Approval Fees :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEUNC" size="10" maxlength="9" value="<%= charges.getE02RTEUNC()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Account Opening Fees :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEOPC" size="10" maxlength="9" value="<%= charges.getE02RTEOPC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Checks Deposited Fees :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEPDC" size="10" maxlength="9" value="<%= charges.getE02RTEPDC()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Stop Payments Fees :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESPC" size="10" maxlength="9" value="<%= charges.getE02RTESPC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Hold Mail Service Fees :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEHCH" size="10" maxlength="9" value="<%= charges.getE02RTEHCH()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Confirmation Hold Days :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENDH" size="3" maxlength="2" value="<%= charges.getE02RTENDH()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Confirmation Limit Balance :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMAC" size="10" maxlength="9" value="<%= charges.getE02RTEMAC()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Minimum Charges :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEOMC" size="10" maxlength="9" value="<%= charges.getE02RTEOMC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Uncollect Days Loc/No-Local :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEWLC" size="2" maxlength="1" value="<%= charges.getE02RTEWLC()%>">
                / 
                <input type="text" name="E02RTEWNL" size="2" maxlength="1" value="<%= charges.getE02RTEWNL()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Number of Credit Units :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESCU" size="6" maxlength="5" value="<%= charges.getE02RTESCU()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cancellation Minimum Days :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTENDC" size="4" maxlength="3" value="<%= charges.getE02RTENDC()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right"> Credit Units Amount :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESCA" size="6" maxlength="5" value="<%= charges.getE02RTESCA()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Bal/Type Used for Crd/Units :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <select name="E02RTEBUS">
                  <option value=" " <% if (!(charges.getE02RTEBUS().equals("NT") ||charges.getE02RTEBUS().equals("GR")||charges.getE02RTEBUS().equals("AN")||charges.getE02RTEBUS().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBUS().equals("NT")) { out.print("selected"); }%>>Net Balance 
                  </option>
                  <option value="GR" <%if (charges.getE02RTEBUS().equals("GR")) { out.print("selected"); }%>> Gross Balance 
                  </option>
                  <option value="AN" <%if (charges.getE02RTEBUS().equals("AN")) { out.print("selected"); }%>>Net Average 
                  </option>
                  <option value="AG" <%if (charges.getE02RTEBUS().equals("AG")) { out.print("selected"); }%>>Gross Average 
                  </option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Months to Keep History :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEHIS" size="3" maxlength="2" value="<%= charges.getE02RTEHIS()%>">
              </div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
  <h4>Interest Rates</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap colspan="4"> 
              <div align="center"><b>Assets</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Rate 1 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR1" size="10" maxlength="9" value="<%= charges.getE02RTEOR1()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Days Limit 1 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO1" size="3" maxlength="2" value="<%= charges.getE02RTEDO1()%>">
              </div>
            </td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Rate 2 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR2" size="10" maxlength="9" value="<%= charges.getE02RTEOR2()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Days Limit 2 :</div>
            </td>
            <td nowrap width="31%"> 
              <div align="left"> 
                <input type="text" name="E02RTEDO2" size="3" maxlength="2" value="<%= charges.getE02RTEDO2()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Rate 3 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR3" size="10" maxlength="9" value="<%= charges.getE02RTEOR3()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Days Limit 3 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO3" size="3" maxlength="2" value="<%= charges.getE02RTEDO3()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Overdraft Rate 4 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR4" size="10" maxlength="9" value="<%= charges.getE02RTEOR4()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Days Limit 4 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO4" size="3" maxlength="2" value="<%= charges.getE02RTEDO4()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02RTEFTA" size="3" maxlength="2" value="<%= charges.getE02RTEFTA()%>">
                <a href="javascript:GetFloating('E02RTEFTA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Tabla de Tasas Flotantes" align="absmiddle" border="0" ></a> 
                <select name="E02RTEFYA">
                  <option value=" " <% if (!(charges.getE02RTEFYA().equals("FP") ||charges.getE02RTEFYA().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYA().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYA().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor: 
                <input type="text" name="E02RTEFCA" size="5" maxlength="5" value="<%= charges.getE02RTEFCA()%>">
                Operation : 
                <select name="E02RTEFFA">
                  <option value=" " <% if (!(charges.getE02RTEFFA().equals("A") ||charges.getE02RTEFFA().equals("S")||charges.getE02RTEFFA().equals("M"))) out.print("selected"); %>></option>
                  <option value="A" <%if (charges.getE02RTEFFA().equals("A")) { out.print("selected"); }%>>Add to Base Rate</option>
                  <option value="S" <%if (charges.getE02RTEFFA().equals("S")) { out.print("selected"); }%>>Substract from Base Rate</option>
                  <option value="M" <%if (charges.getE02RTEFFA().equals("M")) { out.print("selected"); }%>>Multiply by Base Rate</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4"> 
              <div align="right"></div>
              <div align="left"></div>
              <div align="right"></div>
              <div align="center"><b>Liabilities</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Interest Rate Investment (24 Hours) :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECIR" size="10" maxlength="9" value="<%= charges.getE02RTECIR()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Periodo Base :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEABA" size="4" maxlength="3" value="<%= charges.getE02RTEABA()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02RTEFTL" size="3" maxlength="2" value="<%= charges.getE02RTEFTL()%>">
                <a href="javascript:GetFloating('E02RTEFTL')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Tabla de Tasas Flotantes" align="absmiddle" border="0" ></a> 
                <select name="E02RTEFYL">
                  <option value=" " <% if (!(charges.getE02RTEFYL().equals("FP") ||charges.getE02RTEFYL().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYL().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYL().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor : 
                <input type="text" name="E02RTEFCL" size="5" maxlength="5" value="<%= charges.getE02RTEFCL()%>">
                Operation : 
                <select name="E02RTEFFL">
                  <option value=" " <% if (!(charges.getE02RTEFFL().equals("A") ||charges.getE02RTEFFL().equals("S")||charges.getE02RTEFFL().equals("M"))) out.print("selected"); %>></option>
                  <option value="A" <%if (charges.getE02RTEFFL().equals("A")) { out.print("selected"); }%>>Add to Base Rate</option>
                  <option value="S" <%if (charges.getE02RTEFFL().equals("S")) { out.print("selected"); }%>>Substract from Base Rate</option>
                  <option value="M" <%if (charges.getE02RTEFFL().equals("M")) { out.print("selected"); }%>>Multiply by Base Rate</option>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
