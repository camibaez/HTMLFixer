<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Clean Collections Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id="collBasic" class="datapro.eibs.beans.EDC010001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(coll_i_opt);

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">
<%@ page import = "datapro.eibs.master.Util" %>
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 
<H3 align="center">Clean Collections Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="coll_simp_inq_basic,EDC0100"></h3>
<hr size="4">
<form method="post">
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
  <H4>Basic Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Check Amount :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text"  name="E01DCMOAM" readonly size="15" maxlength="13" value="<%= Util.formatCCY(collBasic.getE01DCMOAM().trim())%>">
            </td>
            <td nowrap width="27%"> 
              <div align="right">Issue Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DCMID1" readonly size="4" maxlength="2" value="<%= collBasic.getE01DCMID1().trim()%>">
              <input type="text" name="E01DCMID2" readonly size="4" maxlength="2" value="<%= collBasic.getE01DCMID2().trim()%>">
              <input type="text" name="E01DCMID3" readonly size="4" maxlength="2" value="<%= collBasic.getE01DCMID3().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Check Number :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text"  name="E01DCMCKN" readonly size="10" maxlength="9" value="<%= collBasic.getE01DCMCKN().trim()%>">
            </td>
            <td nowrap width="27%"> 
              <div align="right">Collection Status :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DCMSTS" size="30" 
				  value="<% if (collBasic.getE01DCMSTS().equals("1")) out.print("Awaiting Acknowledgement");
							else if (collBasic.getE01DCMSTS().equals("2")) out.print("Awaiting Acceptance");
							else if (collBasic.getE01DCMSTS().equals("3")) out.print("Awaiting Payment");
							else if (collBasic.getE01DCMSTS().equals("4")) out.print("Awaiting Proceeds");
							else if (collBasic.getE01DCMSTS().equals("5")) out.print("Protested");
							else if (collBasic.getE01DCMSTS().equals("6")) out.print("Closed Unpaid");
							else if (collBasic.getE01DCMSTS().equals("7")) out.print("Closed Partially Paid");
							else if (collBasic.getE01DCMSTS().equals("8")) out.print("Closed Fully Paid");%>"
				readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Foreign Currency Code :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text"  name="E01DCMFCY" readonly size="4" maxlength="3" value="<%= collBasic.getE01DCMFCY().trim()%>">
            </td>
            <td nowrap width="27%" height="23"> 
              <div align="right">Foreign Exchange Rate :</div>
            </td>
            <td nowrap width="27%" height="23"> 
              <input type="text" name="E01DCMOFX" readonly size="13" maxlength="11" value="<%= collBasic.getE01DCMOFX().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Advise Non-Payment by :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMADF" size="20" 
				  value="<% if (collBasic.getE01DCMADF().equals("T")) out.print("Telex");
							else if (collBasic.getE01DCMADF().equals("S")) out.print("Swift");
							else if (collBasic.getE01DCMADF().equals("A")) out.print("Airmail");
							else if (collBasic.getE01DCMADF().equals("C")) out.print("Courier");
							else out.print("Fax");%>" 
				readonly>
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Advise Payment by :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMAPF" size="20" 
				  value="<% if (collBasic.getE01DCMAPF().equals("T")) out.print("Telex");
							else if (collBasic.getE01DCMAPF().equals("S")) out.print("Swift");
							else if (collBasic.getE01DCMAPF().equals("A")) out.print("Airmail");
							else if (collBasic.getE01DCMAPF().equals("C")) out.print("Courier");
							else out.print("Fax");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Collect Our Charges from :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMOCF" size="30" 
				  value="<% if (collBasic.getE01DCMOCF().equals("P")) out.print("Principal (In favor of..)");
							else if (collBasic.getE01DCMOCF().equals("D")) out.print("Drawer of Check");
							else if (collBasic.getE01DCMOCF().equals("N")) out.print("No Charges");%>
				readonly>
            </td>
            <td nowrap width="27%" height="19">
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Collect Your Charges from : </div>
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="left"> 
                <input type="text" name="E01DCMOBF2" size="30" 
				  value="<% if (collBasic.getE01DCMOBF().equals("P")) out.print("Principal (In favor of..)");
							else if (collBasic.getE01DCMOBF().equals("D")) out.print("Drawer of Check");
							else if (collBasic.getE01DCMOBF().equals("N")) out.print("No Charges");%>
				readonly>
            </td>
            <td nowrap width="27%" height="19">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Settlement Via :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMADF2" size="25" 
				  value="<% if (collBasic.getE01DCMSRF().equals("T")) out.print("Telex");
							else if (collBasic.getE01DCMSRF().equals("S")) out.print("Swift");
							else if (collBasic.getE01DCMSRF().equals("F")) out.print("Fed Wire");
							else if (collBasic.getE01DCMSRF().equals("C")) out.print("Official Check");
							else if (collBasic.getE01DCMSRF().equals("D")) out.print("DDA Account");
							else out.print("General Ledger");%>" 
				readonly>
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMSPF" size="25" 
				  value="<% if (collBasic.getE01DCMSPF().equals("T")) out.print("Telex");
							else if (collBasic.getE01DCMSPF().equals("S")) out.print("Swift");
							else if (collBasic.getE01DCMSPF().equals("F")) out.print("Fed Wire");
							else if (collBasic.getE01DCMSPF().equals("C")) out.print("Official Check");
							else if (collBasic.getE01DCMSPF().equals("D")) out.print("DDA Account");
							else out.print("General Ledger");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Settlement Account :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMSRA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMSRA().trim()%>">
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMSPA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMSPA().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Ours Commissions :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMCOM" readonly size="13" maxlength="11" value="<%= collBasic.getE01DCMCOM().trim()%>">
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Remitting Bank Charges : </div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text"  name="E01DCMCCH" readonly size="12" maxlength="11" value="<%= collBasic.getE01DCMCCH().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Tariff of Charges :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMTAR" readonly size="3" maxlength="2" value="<%= collBasic.getE01DCMTAR().trim()%>">
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Account Type :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMSTY" readonly size="2" maxlength="1" value="<%= collBasic.getE01DCMSTY().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" name="E01DCMBNK" readonly size="3" maxlength="2" value="<%= collBasic.getE01DCMBNK().trim()%>">
              / 
              <input type="text" name="E01DCMBRN" readonly size="4" maxlength="3" value="<%= collBasic.getE01DCMBRN().trim()%>">
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMGLN" readonly size="17" maxlength="16" value="<%= collBasic.getE01DCMGLN().trim()%>">
            </td>
          </tr>
        </table>
      </td>
      <td nowrap>&nbsp;</td>
    </tr>
  </table>
  <H4>Aditional Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"><b>Drawer Name</b></div>
            </td>
            <td nowrap width="12%">&nbsp; </td>
            <td nowrap colspan="2"> 
              <div align="center"><b>Payee Name</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDR1" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDR1().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp; </td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMRB1" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMRB1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDR2" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDR2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMRB2" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMRB2().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDR3" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDR3().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMRB3" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMRB3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDR4" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDR4().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMRB4" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMRB4().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="left">Customer / Account No. :</div>
            </td>
            <td nowrap width="11%"> 
              <input type="text" name="E01DCMDRA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMDRA().trim()%>">
            </td>
            <td nowrap width="12%"> 
              <div align="left"> </div>
            </td>
            <td nowrap width="36%"> 
              <div align="left">Customer / Account No. :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DCMRBA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMRBA().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%">Reference :</td>
            <td nowrap width="11%"> 
              <input type="text" name="E01DCMDRF" readonly size="17" maxlength="16" value="<%= collBasic.getE01DCMDRF().trim()%>">
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap>Reference :</td>
            <td nowrap> 
              <input type="text" name="E01DCMRRF" readonly size="17" maxlength="16" value="<%= collBasic.getE01DCMRRF().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="center"> <b>Presenting Bank </b></div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"><b>Payor Name </b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMCL1" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMCL1().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDW1" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDW1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMCL2" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMCL2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDW2" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDW2().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMCL3" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMCL3().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDW3" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDW3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMCL4" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMCL4().trim()%>">
              </div>
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap colspan="2"> 
              <div align="center"> 
                <input type="text" name="E01DCMDW4" readonly size="40" maxlength="35" value="<%= collBasic.getE01DCMDW4().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%">Customer / Account No. :</td>
            <td nowrap width="11%"> 
              <input type="text" name="E01DCMCLA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMCLA().trim()%>">
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap width="36%">Customer / Account No. :</td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DCMDWA" readonly size="13" maxlength="12" value="<%= collBasic.getE01DCMDWA().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%">Reference :</td>
            <td nowrap width="11%"> 
              <input type="text" name="E01DCMCRF" readonly size="17" maxlength="16" value="<%= collBasic.getE01DCMCRF().trim()%>">
            </td>
            <td nowrap width="12%">&nbsp;</td>
            <td nowrap>Sub - Account :</td>
            <td nowrap>
              <input type="text" name="E01DCMDWS" readonly size="7" maxlength="5" value="<%= collBasic.getE01DCMDWS().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
