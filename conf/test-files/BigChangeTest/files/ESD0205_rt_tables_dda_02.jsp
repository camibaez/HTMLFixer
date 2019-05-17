<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Charges</title>
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
 
<h3 align="center">Money Market Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_tables_dda_02, ESD0205" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0205">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
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
          <!--
          <tr id="teclear"> 
          
            <td nowrap width="22%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02RTEFCY" size="4" maxlength="3" value="<%= charges.getE02RTEFCY()%>">
              <a href="javascript:GetCurrency('E02RTEFCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
            <td nowrap width="29%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="31%">&nbsp; </td>
          </tr>
		   -->             
        </table>
      </td>
    </tr>
  </table>
  <h4>Service Charges</h4>
 
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right"> Include Checks Image Fee:</DIV>
            </TD><TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTESTC" size="10" maxlength="9" value="<%= charges.getE02RTESTC()%>">
              </DIV>
            </TD><TD nowrap width="29%"> 
              <DIV align="right"> Free Incoming Wires Tranfer:</DIV>
            </TD><TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTECAB" size="15" maxlength="15" value="<%= charges.getE02RTECAB()%>">
              </DIV>
            </TD>
            
            
            
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%" height="34"> 
              <DIV align="right">Minimum Balance Charges 1 :</DIV>
            </TD>
            <TD nowrap width="18%" height="34"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMMC" size="10" maxlength="9" value="<%= charges.getE02RTEMMC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%" height="34"> 
              <DIV align="right">Balance Limit :</DIV>
            </TD>
            <TD nowrap width="31%" height="34"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMBR" size="10" maxlength="9" value="<%= charges.getE02RTEMBR()%>">
                <SELECT name="E02RTEBT2">
                  <OPTION value=" " <% if (!(charges.getE02RTEBT2().equals("NT") || charges.getE02RTEBT2().equals("GR") || charges.getE02RTEBT2().equals("AN") || charges.getE02RTEBT2().equals("AG") || charges.getE02RTEBT2().equals("RG") || charges.getE02RTEBT2().equals("RN") || charges.getE02RTEBT2().equals("MG") || charges.getE02RTEBT2().equals("YR"))) out.print("selected"); %>></OPTION>
                  <OPTION value="NT" <%if (charges.getE02RTEBT2().equals("NT")) { out.print("selected"); }%>>Net Balance</OPTION>
                  <OPTION value="GR" <%if (charges.getE02RTEBT2().equals("GR")) { out.print("selected"); }%>>Gross Balance</OPTION>
                  <OPTION value="AN" <%if (charges.getE02RTEBT2().equals("AN")) { out.print("selected"); }%>>Net Average</OPTION>
                  <OPTION value="AG" <%if (charges.getE02RTEBT2().equals("AG")) { out.print("selected"); }%>>Gross Average</OPTION>
                  <OPTION value="RG" <%if (charges.getE02RTEBT2().equals("RG")) { out.print("selected"); }%>>Reverse Gross</OPTION>
                  <OPTION value="RN" <%if (charges.getE02RTEBT2().equals("RN")) { out.print("selected"); }%>>Reverse Net</OPTION>
                  <OPTION value="MG" <%if (charges.getE02RTEBT2().equals("MG")) { out.print("selected"); }%>>Minimum Gross</OPTION>
                  <OPTION value="YR" <%if (charges.getE02RTEBT2().equals("YR")) { out.print("selected"); }%>>Year Computation</OPTION>
                </SELECT>
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Minimum Balance Charges 2 :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTECH3" size="10" maxlength="9" value="<%= charges.getE02RTECH3()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Balance Limit :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEBL3" size="10" maxlength="9" value="<%= charges.getE02RTEBL3()%>">
                <SELECT name="E02RTEBUS">
                  <OPTION value=" " <% if (!(charges.getE02RTEBUS().equals("NT") || charges.getE02RTEBUS().equals("GR") || charges.getE02RTEBUS().equals("AN") || charges.getE02RTEBUS().equals("AG") || charges.getE02RTEBUS().equals("RG") || charges.getE02RTEBUS().equals("RN") || charges.getE02RTEBUS().equals("MG") || charges.getE02RTEBUS().equals("YR"))) out.print("selected"); %>></OPTION>
                  <OPTION value="NT" <%if (charges.getE02RTEBUS().equals("NT")) { out.print("selected"); }%>>Net Balance</OPTION>
                  <OPTION value="GR" <%if (charges.getE02RTEBUS().equals("GR")) { out.print("selected"); }%>>Gross Balance</OPTION>
                  <OPTION value="AN" <%if (charges.getE02RTEBUS().equals("AN")) { out.print("selected"); }%>>Net Average</OPTION>
                  <OPTION value="AG" <%if (charges.getE02RTEBUS().equals("AG")) { out.print("selected"); }%>>Gross Average</OPTION>
                  <OPTION value="RG" <%if (charges.getE02RTEBUS().equals("RG")) { out.print("selected"); }%>>Reverse Gross</OPTION>
                  <OPTION value="RN" <%if (charges.getE02RTEBUS().equals("RN")) { out.print("selected"); }%>>Reverse Net</OPTION>
                  <OPTION value="MG" <%if (charges.getE02RTEBUS().equals("MG")) { out.print("selected"); }%>>Minimum Gross</OPTION>
                  <OPTION value="YR" <%if (charges.getE02RTEBUS().equals("YR")) { out.print("selected"); }%>>Year Computation</OPTION>
                </SELECT>
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Fees for Extra Checks :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMKC" size="10" maxlength="9" value="<%= charges.getE02RTEMKC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Number of Free Checks :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMKK" size="4" maxlength="3" value="<%= charges.getE02RTEMKK()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Fees for Extra Debits :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMCD" size="10" maxlength="9" value="<%= charges.getE02RTEMCD()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Number of Free Debits :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMDA" size="4" maxlength="3" value="<%= charges.getE02RTEMDA()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Fees for Extra Deposits :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMDC" size="10" maxlength="9" value="<%= charges.getE02RTEMDC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Number of Free Deposits :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMKD" size="4" maxlength="3" value="<%= charges.getE02RTEMKD()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Fees for Inactive Accounts :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEICH" size="10" maxlength="9" value="<%= charges.getE02RTEICH()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Number of Days for Inactive :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEIDL" size="5" maxlength="4" value="<%= charges.getE02RTEIDL()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Fees for Dormant Accounts :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEDCH" size="10" maxlength="9" value="<%= charges.getE02RTEDCH()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Number of Days for Dormants :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEDDL" size="5" maxlength="4" value="<%= charges.getE02RTEDDL()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Maximum Fees Non-Local Cks :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTENCX" size="10" maxlength="9" value="<%= charges.getE02RTENCX()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Non-Local Checks Commission :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTENCP" size="4" maxlength="3" value="<%= charges.getE02RTENCP()%>">
                %</DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Minimum Fees Non-Local Cks :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTENCM" size="10" maxlength="9" value="<%= charges.getE02RTENCM()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Annual Service Fee :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEYRC" size="10" maxlength="9" value="<%= charges.getE02RTEYRC()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Opening Account Fees :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEOPC" size="10" maxlength="9" value="<%= charges.getE02RTEOPC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Hold Mail Fees :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEHCH" size="10" maxlength="9" value="<%= charges.getE02RTEHCH()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%" height="33"> 
              <DIV align="right">Overdraft Approval Fees :</DIV>
            </TD>
            <TD nowrap width="18%" height="33"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTENSC" size="10" maxlength="9" value="<%= charges.getE02RTENSC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%" height="33"> 
              <DIV align="right">Uncollected Approval Fees :</DIV>
            </TD>
            <TD nowrap width="31%" height="33"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEUNC" size="10" maxlength="9" value="<%= charges.getE02RTEUNC()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Stop Payment Fees :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTESPC" size="10" maxlength="9" value="<%= charges.getE02RTESPC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Minimum Openig Balance :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMOA" size="10" maxlength="9" value="<%= charges.getE02RTEMOA()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Overdraft Minimum Charges :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEOMC" size="10" maxlength="9" value="<%= charges.getE02RTEOMC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Uncollect Days Local/Non-Lc :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left">
                <INPUT type="text" name="E02RTEWLC" size="2" maxlength="1" value="<%= charges.getE02RTEWLC()%>">
                / 
                <INPUT type="text" name="E02RTEWNL" size="2" maxlength="1" value="<%= charges.getE02RTEWNL()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Maximum Amount Confirmation :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMAC" size="10" maxlength="9" value="<%= charges.getE02RTEMAC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Confirmation Number of Days :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left">
                <INPUT type="text" name="E02RTENDH" size="3" maxlength="2" value="<%= charges.getE02RTENDH()%>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="22%"> 
              Minimum Cancellation Days :
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTENDC" size="6" maxlength="5" value="<%= charges.getE02RTENDC()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
              <DIV align="right">Months to Keep History :</DIV>
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left">
                <INPUT type="text" name="E02RTEHIS" size="3" maxlength="2" value="<%= charges.getE02RTEHIS()%>">
              </DIV>
            </TD>
          </TR>
		  <TR id="trdark"> 
            <TD nowrap width="22%"> 
              <DIV align="right">Minimum Check Amount :</DIV>
            </TD>
            <TD nowrap width="18%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E02RTEMAK" size="10" maxlength="9" value="<%= charges.getE02RTEMAK()%>">
              </DIV>
            </TD>
            <TD nowrap width="29%"> 
            </TD>
            <TD nowrap width="31%"> 
              <DIV align="left"> 
              </DIV>
            </TD>
          </TR>
        </TBODY></TABLE>
        </td>
      </tr>
    </table>
    
  <h4>Interest Rates</h4>
  <h4>Liabilities</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap width="6%"> 
              <div align="center"><b>Limit</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"><b>Balance</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"><b>Rate</b></div>
            </td>
            <td nowrap width="11%" > 
              <div align="center"><b>Limit</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"><b>Balance</b></div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"><b>Rate</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(1)</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMKL" size="10" maxlength="9" value="<%= charges.getE02RTEMKL()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMKR" size="10" maxlength="9" value="<%= charges.getE02RTEMKR()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(2)</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMB1" size="10" maxlength="9" value="<%= charges.getE02RTEMB1()%>">
              </div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMR1" size="10" maxlength="9" value="<%= charges.getE02RTEMR1()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(3)</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMB2" size="10" maxlength="9" value="<%= charges.getE02RTEMB2()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMR2" size="10" maxlength="9" value="<%= charges.getE02RTEMR2()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(4)</b></div>
            </td>
            <td nowrap width="14%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMB3" size="10" maxlength="9" value="<%= charges.getE02RTEMB3()%>">
              </div>
            </td>
            <td nowrap width="27%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMR3" size="10" maxlength="9" value="<%= charges.getE02RTEMR3()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(5)</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMB4" size="10" maxlength="9" value="<%= charges.getE02RTEMB4()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMR4" size="10" maxlength="9" value="<%= charges.getE02RTEMR4()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(6)</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMB5" size="10" maxlength="9" value="<%= charges.getE02RTEMB5()%>">
              </div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMR5" size="10" maxlength="9" value="<%= charges.getE02RTEMR5()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(7)</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMB6" size="10" maxlength="9" value="<%= charges.getE02RTEMB6()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMR6" size="10" maxlength="9" value="<%= charges.getE02RTEMR6()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(8)</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMB7" size="10" maxlength="9" value="<%= charges.getE02RTEMB7()%>">
              </div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMR7" size="10" maxlength="9" value="<%= charges.getE02RTEMR7()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(9)</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMB8" size="10" maxlength="9" value="<%= charges.getE02RTEMB8()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMR8" size="10" maxlength="9" value="<%= charges.getE02RTEMR8()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(10)</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMB9" size="10" maxlength="9" value="<%= charges.getE02RTEMB9()%>">
              </div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMR9" size="10" maxlength="9" value="<%= charges.getE02RTEMR9()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="6%"> 
              <div align="center"><b>(11)</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMBX" size="10" maxlength="9" value="<%= charges.getE02RTEMBX()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E02RTEMRX" size="10" maxlength="9" value="<%= charges.getE02RTEMRX()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(12)</b></div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMBY" size="10" maxlength="9" value="<%= charges.getE02RTEMBY()%>">
              </div>
            </td>
            <td nowrap width="27%" > 
              <div align="center"> 
                <input type="text" name="E02RTEMRY" size="10" maxlength="9" value="<%= charges.getE02RTEMRY()%>">
              </div>
            </td>
          </tr>
        </table>
  </table>
<br>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">Balance Type :</div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <select name="E02RTEBTY">
                  <option value=" " <% if (!(charges.getE02RTEBTY().equals("NT") ||charges.getE02RTEBTY().equals("GR")||charges.getE02RTEBTY().equals("AN")||charges.getE02RTEBTY().equals("AG")||charges.getE02RTEBTY().equals("MG")
				||charges.getE02RTEBTY().equals("MN")||charges.getE02RTEBTY().equals("RG")||charges.getE02RTEBTY().equals("RN"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBTY().equals("NT")) { out.print("selected"); }%>>Net Balance 
                  </option>
                  <option value="GR" <%if (charges.getE02RTEBTY().equals("GR")) { out.print("selected"); }%>>Gross Balance 
                  </option>
                  <option value="AN" <%if (charges.getE02RTEBTY().equals("AN")) { out.print("selected"); }%>>Average Net Balance 
                  </option>
                  <option value="AG" <%if (charges.getE02RTEBTY().equals("AG")) { out.print("selected"); }%>>Average Gross Balance
                  </option>
                  <option value="MG" <%if (charges.getE02RTEBTY().equals("MG")) { out.print("selected"); }%>>Minimum Gross Balance
                  </option>
                  <option value="MN" <%if (charges.getE02RTEBTY().equals("MN")) { out.print("selected"); }%>>Minimum Net Balance
                  </option>
                  <option value="RG" <%if (charges.getE02RTEBTY().equals("RG")) { out.print("selected"); }%>>Recalc/Average Gross Balance 
                  </option>
                  <option value="RN" <%if (charges.getE02RTEBTY().equals("RN")) { out.print("selected"); }%>>Recalc/Average Net Balance 
                  </option>

                </select>

              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right">Interest Calc : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E02RTECAM" size="2" maxlength="1" value="<%= charges.getE02RTECAM()%>">
              <a href="javascript:GetCode('E02RTECAM','STATIC_rt_tables_calc_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">Base : </div>
            </td>
            <td nowrap width="9%"> 
              <div align="left">
                <input type="text" name="E02RTEABA" size="4" maxlength="3" value="<%= charges.getE02RTEABA()%>">
              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right">Reversal Interest :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="text" name="E02RTEOMP" size="4" maxlength="3" value="<%= charges.getE02RTEOMP()%>">
                <a href="javascript:GetCode('E02RTEOMP','STATIC_rt_tables_rever_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              
            </td>
            <td nowrap width="9%"> 
              <div align="left">
                
              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right">Reversal Bal. Lim. :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="text" name="E02RTECH1" size="17" maxlength="16" value="<%= charges.getE02RTECH1()%>">                
            </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"> </div>
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
            </td>
          </tr>
        </table>
  </table>


  
  <h4>Assets</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">Overdraft Rate Base :</div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR1" size="10" maxlength="9" value="<%= charges.getE02RTEOR1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap width="23%">&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap colspan="4"> 
              <div align="left"> 
                <input type="text" name="E02RTEFTA" size="3" maxlength="2" value="<%= charges.getE02RTEFTA()%>">
                <a href="javascript:GetFloating('E02RTEFTA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Tabla de Tasas Flotantes" align="absmiddle" border="0" ></a> 
                <select name="E02RTEFYA">
                  <option value=" " <% if (!(charges.getE02RTEFYA().equals("FP") ||charges.getE02RTEFYA().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYA().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYA().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor : 
                <input type="text" name="E02RTEFCA" size="5" maxlength="5" value="<%= charges.getE02RTEFCA()%>">
                Operation : 
                <select name="E02RTEFFA">
                  <option value=" " <% if (!(charges.getE02RTEFFA().equals("A") ||charges.getE02RTEFFA().equals("S")||charges.getE02RTEFFA().equals("M"))) out.print("selected"); %>></option>
                  <option value="A" <%if (charges.getE02RTEFFA().equals("A")) { out.print("selected"); }%>>Add to Base Rate
                  </option>
                  <option value="S" <%if (charges.getE02RTEFFA().equals("S")) { out.print("selected"); }%>>Substract from Base Rate</option>
                  <option value="M" <%if (charges.getE02RTEFFA().equals("M")) { out.print("selected"); }%>>Multiply by Base Rate
                  </option>
                </select>
              </div>
              </td>
          </tr>
        </table>
      </td>
    </tr>

  </table>
  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
