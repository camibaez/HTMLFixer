<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
       
      builtNewMenu(inst_app_opt);
 
   </SCRIPT>
</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<div align="center"> 
  <h3>Instruments Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_app_inst_basic.jsp,EIE0050"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN2"  value="2" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Code / Description :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISIIIC" size="5" maxlength="3" value="<%= invInst.getE01ISIIIC()%>" <% if (invInst.getF01ISIIIC().equals("Y")) out.print("id=\"txtchanged\""); %>>
              / 
              <INPUT type="text" readonly name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>" <% if (invInst.getF01ISIDSC().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Internal Status :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISISTS" size="35" maxlength="25" <% if (invInst.getF01ISISTS().equals("Y")) out.print("id=\"txtchanged\""); %> value='<% if (invInst.getE01ISISTS().equals("P")) out.print("Pending");
							else if (invInst.getE01ISISTS().equals("A")) out.print("Active");
							else if (invInst.getE01ISISTS().equals("I")) out.print("Inactive)");
							else out.print("");%>'>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Instrument Currency :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISICCY" size="5" maxlength="3" value="<%= invInst.getE01ISICCY()%>" <% if (invInst.getF01ISICCY().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Bloomberg Currency :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISIBCY" size="5" maxlength="3" value="<%= invInst.getE01ISIBCY()%>" <% if (invInst.getF01ISIBCY().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Instrument Type :</DIV>
            </TD>
            <TD nowrap width="36%">
              <INPUT type="text" readonly name="E01ISIPTY1" size="35" maxlength="25" <% if (invInst.getF01ISIPTY().equals("Y")) out.print("id=\"txtchanged\""); %> value='<% if (invInst.getE01ISIPTY().equals("BND")) out.print("Bonds");
							else if (invInst.getE01ISIPTY().equals("EQT")) out.print("Equity");
							else if (invInst.getE01ISIPTY().equals("MUT")) out.print("Mutual Funds)");
							else if (invInst.getE01ISIPTY().equals("PFS")) out.print("Preferred Stocks)");
							else if (invInst.getE01ISIPTY().equals("ACD")) out.print("Commodities)");
							else out.print("");%>'>
              <INPUT type="hidden" name="E01ISIPTY" value="<%= invInst.getE01ISIPTY()%>">
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Symbol :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISISYM" size="20" maxlength="15" value="<%= invInst.getE01ISISYM()%>" <% if (invInst.getF01ISISYM().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Issuer Name :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISIENM" size="50" maxlength="45" value="<%= invInst.getE01ISIENM()%>" <% if (invInst.getF01ISIENM().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">ISIN Number / Serie :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISINUM" size="16" maxlength="12" value="<%= invInst.getE01ISINUM()%>" <% if (invInst.getF01ISINUM().equals("Y")) out.print("id=\"txtchanged\""); %>>
              / 
              <INPUT type="text" readonly name="E01ISISER" size="16" maxlength="12" value="<%= invInst.getE01ISISER()%>" <% if (invInst.getF01ISISER().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Mark as Complex :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISIPRE" size="5" maxlength="3" value='<% if (invInst.getE01ISIPRE().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIPRE().equals("N")) out.print(" NO");
							else out.print("");%>' <% if (invInst.getF01ISIPRE().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Common Code / CUSIP :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISIFL4" size="16" maxlength="15" value="<%= invInst.getE01ISIFL4()%>"> 
              <INPUT type="text" readonly name="E01ISICUS" size="12" maxlength="12" value="<%= invInst.getE01ISICUS()%>" <% if (invInst.getF01ISICUS().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="17%"> 
              <DIV align="right">IBS Country Code :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISICTC" size="5" maxlength="3" value="<%= invInst.getE01ISICTC()%>">
              <% if (invInst.getF01ISICTC().equals("Y")) out.print("id=\"txtchanged\""); %></TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Country Name :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISICTR" size="30" maxlength="30" value="<%= invInst.getE01ISICTR()%>" <% if (invInst.getF01ISICTR().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Bloomberg Country Code :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISICTB" size="5" maxlength="4" value="<%= invInst.getE01ISICTB()%>" <% if (invInst.getF01ISICTB().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Update Mode :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <DIV align="left"> 
                <INPUT type="text" readonly name="E01ISIMOD" size="15" maxlength="13" <% if (invInst.getF01ISIMOD().equals("Y")) out.print("id=\"txtchanged\""); %> value='<% if (invInst.getE01ISIMOD().equals("M")) out.print("Manual");
							else if (invInst.getE01ISIMOD().equals("B")) out.print("Bloomberg");
							else out.print("");%>'>
                </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Rating Standard &amp; Poor's:</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISIRSP" size="25" maxlength="23" value="<%= invInst.getE01ISIRSP()%>" <% if (invInst.getF01ISIRSP().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Rating Moody's :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <DIV align="left"> 
                <INPUT type="text" readonly name="E01ISIRMD" size="25" maxlength="23" value="<%= invInst.getE01ISIRMD()%>" <% if (invInst.getF01ISIRMD().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Range Note :</DIV>
            </TD>
            <TD nowrap> 
              <INPUT type="text" readonly name="E01ISIRGN" size="45" maxlength="45" value="<%= invInst.getE01ISIRGN()%>" <% if (invInst.getF01ISIRGN().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap> 
              <DIV align="right">Price in Percent :</DIV>
            </TD>
            <TD nowrap> 
              <INPUT type="text" readonly name="E01ISIPER " size="5" maxlength="3" <% if (invInst.getF01ISIPER().equals("Y")) out.print("id=\"txtchanged\""); %> value='<% if (invInst.getE01ISIPER().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIPER().equals("N")) out.print(" NO");
							else out.print("");%>'>
              </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Issued Date :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISISD1" size="3" maxlength="2" value="<%= invInst.getE01ISISD1()%>">
              <INPUT type="text" readonly name="E01ISISD2" size="3" maxlength="2" value="<%= invInst.getE01ISISD2()%>">
              <INPUT type="text" readonly name="E01ISISD3" size="3" maxlength="2" value="<%= invInst.getE01ISISD3()%>">
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Instrument Market Status :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISIMKS" size="15" maxlength="10" value="<%= invInst.getE01ISIMKS()%>" <% if (invInst.getF01ISIMKS().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="17%"> 
              <DIV align="right">Calculation Type :</DIV>
            </TD>
            <TD nowrap width="36%"> 
              <INPUT type="text" readonly name="E01ISICTP" size="7" maxlength="6" value="<%= invInst.getE01ISICTP()%>" <% if (invInst.getF01ISICTP().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="14%"> 
              <DIV align="right">Calculation Type Description :</DIV>
            </TD>
            <TD nowrap width="33%"> 
              <INPUT type="text" readonly name="E01ISICTD" size="35" maxlength="35" value="<%= invInst.getE01ISICTD()%>" <% if (invInst.getF01ISICTD().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="34%"> 
              <DIV align="right">Yield to Maturity :</DIV>
            </TD>
            <TD nowrap width="34%"> 
              <INPUT type="text" readonly name="E01ISIYLD" size="11" maxlength="9" value="<%= invInst.getE01ISIYLD()%>" <% if (invInst.getF01ISIYLD().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="34%"> 
              <DIV align="right">Yield to Call :</DIV>
            </TD>
            <TD nowrap width="66%"> 
              <INPUT type="text" readonly name="E01ISIYTC" size="11" maxlength="9" value="<%= invInst.getE01ISIYTC()%>" <% if (invInst.getF01ISIYTC().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="34%"> 
              <DIV align="right">Industrial Group :</DIV>
            </TD>
            <TD nowrap width="34%"> 
              <INPUT type="text" readonly name="E01ISIIGR" size="35" maxlength="30" value="<%= invInst.getE01ISIIGR()%>" <% if (invInst.getF01ISIIGR().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="34%">
              <DIV align="right">Defaulted :</DIV>
            </TD>
            <TD nowrap width="66%">
              <INPUT type="text" readonly name="E01ISIFL0" size="5" maxlength="3" value='<% if (invInst.getE01ISIFL0().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIFL0().equals("N")) out.print(" NO");
							else out.print("");%>' <% if (invInst.getF01ISIFL0().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="34%"> 
              <DIV align="right">Zero Coupon :</DIV>
            </TD>
            <TD nowrap width="34%"> 
              <INPUT type="text" readonly name="E01ISIFL1" size="5" maxlength="3" value='<% if (invInst.getE01ISIFL1().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIFL1().equals("N")) out.print(" NO");
							else out.print("");%>' <% if (invInst.getF01ISIFL1().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </TD>
            <TD nowrap width="34%">
               <DIV align="right">Accepted for Trade in Europe :</DIV>
            </TD>
            <TD nowrap width="66%">
            	<INPUT type="text" readonly name="E01ISIF61" size="2" maxlength="1" value='<% if (invInst.getE01ISIF61().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIF61().equals("N")) out.print(" NO");
							else out.print("");%>' <% if (invInst.getF01ISIF61().equals("Y")) out.print("id=\"txtchanged\""); %>>
           </TD>
           </TR>
		   <TR id="trclear">
			<TD nowrap width="17%"> 
              <DIV align="right">Unit of measurement:</DIV>
            </TD>
            <TD nowrap width="34%">
            <INPUT type="text" name="E01ISIF67" size="6" maxlength="6" value="<%= invInst.getE01ISIF67()%>" readonly>
            </TD>
            
            <td nowrap width="14%" > 
              <div align="right">Pool Factor :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIFL8" size="11" maxlength="11" value="<%= invInst.getE01ISIFL8()%>">
              </div>
            </td>
					 			
		   </TR>
		  </TBODY>
		  </TABLE>
      </td>
    </tr>
  </table>
  
  <h4>Fiscal Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">US Security IRS :</div>
            </td>
            <td nowrap width="36%" >
                 <INPUT type="text" readonly name="E01ISIFL3" size="5" maxlength="3"
					value='<% if (invInst.getE01ISIFL3().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIFL3().equals("N")) out.print(" NO");
							else out.print("");%>'
				<% if (invInst.getF01ISIFL3().equals("Y")) out.print("id=\"txtchanged\""); %>>
			</td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate at Source :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIFL7" size="11" maxlength="11" value="<%= invInst.getE01ISIFL7()%>"
				<% if (invInst.getF01ISIFL7().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Income Code :</div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" readonly  name="D01INCOME" size="50" maxlength="50" value="<%= invInst.getD01INCOME()%>"
				<% if (invInst.getF01ISIFL5().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
  
  
  <% if(invInst.getE01ISIPTY().equals("BND")|| invInst.getE01ISIPTY().equals("PFS")) { %> 
  <h4>Additional Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIMA1" size="3" maxlength="2" value="<%= invInst.getE01ISIMA1()%>"
			  <% if (invInst.getF01ISIMA1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIMA2" size="3" maxlength="2" value="<%= invInst.getE01ISIMA2()%>"
			  <% if (invInst.getF01ISIMA2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIMA3" size="3" maxlength="2" value="<%= invInst.getE01ISIMA3()%>"
			  <% if (invInst.getF01ISIMA3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIRTE" size="11" maxlength="11" value="<%= invInst.getE01ISIRTE()%>"
				<% if (invInst.getF01ISIRTE().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap > 
              <div align="right">Accrual Type :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ISIATY" size="35" maxlength="25" 
				<% if (invInst.getF01ISIATY().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invInst.getE01ISIATY().equals("1")) out.print("Actual/Actual");
							else if (invInst.getE01ISIATY().equals("2")) out.print("Actual/365");
							else if (invInst.getE01ISIATY().equals("3")) out.print("Actual/365(366 Leap Year)");
							else if (invInst.getE01ISIATY().equals("4")) out.print("Actual/360");
							else if (invInst.getE01ISIATY().equals("5")) out.print("30/360");
							else if (invInst.getE01ISIATY().equals("6")) out.print("30E/360");
							else if (invInst.getE01ISIATY().equals("7")) out.print("22/252"); 
							else out.print("");%>" >
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Calculation Base :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIBAS" size="5" maxlength="3" value="<%= invInst.getE01ISIBAS()%>"
			  <% if (invInst.getF01ISIBAS().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Calculation Days :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIICT" size="35" maxlength="25" 
				<% if (invInst.getF01ISIICT().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invInst.getE01ISIICT().equals("1")) out.print("Calendar Days");
							else if (invInst.getE01ISIICT().equals("2")) out.print("Commercial Days");
							else out.print("");%>" >
              
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Floating Rate Table :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIFTB" size="2" maxlength="2" value="<%= invInst.getE01ISIFTB().trim()%>"
			   <% if (invInst.getF01ISIFTB().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIFTY" size="15" maxlength="15" 
				<% if (invInst.getF01ISIFTY().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invInst.getE01ISIFTY().equals("FP")) out.print("Primary");
							else if (invInst.getE01ISIFTY().equals("FS")) out.print("Secondary");
							else out.print("");%>" >
              
            </td>
            <td nowrap width="34%" > 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIFRT" size="11" maxlength="11" value="<%= invInst.getE01ISIFRT()%>"
			  <% if (invInst.getF01ISIFRT().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Days / Date T + N :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIDTN" size="11" maxlength="11" value="<%= invInst.getE01ISIDTN()%>"
			  <% if (invInst.getF01ISIDTN().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIPFV" size="4" maxlength="4" value="<%= invInst.getE01ISIPFV().trim()%>" onKeyPress="enterInteger()"
				<% if (invInst.getF01ISIPFV().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIPFC" size="20" maxlength="15" 
				<% if (invInst.getF01ISIPFC().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invInst.getE01ISIPFC().equals("D")) out.print("Days(s)");
							else if (invInst.getE01ISIPFC().equals("M")) out.print("Month(s)");
							else if (invInst.getE01ISIPFC().equals("Q")) out.print("Quarter");
						    else if (invInst.getE01ISIPFC().equals("S")) out.print("Semiaunually");
							else if (invInst.getE01ISIPFC().equals("Y")) out.print("Anually");
							else out.print("");%>" >
              
            </td>
          </tr>
		  <tr id="trclear">
    		<td nowrap>
    			<div align="right">
    				Calculation Method :
	    		</div>
    		</td>
    		<td nowrap colspan="3">
              <input type="text" readonly  name="E01ISIF68" size="31" maxlength="30" 
				<% if (invInst.getF01ISIF68().equals("Y")) out.print("id=\"txtchanged\""); %>
				value="<% if (invInst.getE01ISIF68().equals("N")) out.print("None");
							else if (invInst.getE01ISIF68().equals("1")) out.print("Semi-Annual Basis");
							else out.print("");%>" >    		
			</td>
    	</tr>         
          
        </table>
      </td>
    </tr>
  </table>
  <%
     
    }
  %> 
  <h4>Dates</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Last Interest Payment Date :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIIN1" size="3" maxlength="2" value="<%= invInst.getE01ISIIN1()%>"
				<% if (invInst.getF01ISIIN1().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISIIN2" size="3" maxlength="2" value="<%= invInst.getE01ISIIN2()%>"
				<% if (invInst.getF01ISIIN2().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISIIN3" size="3" maxlength="2" value="<%= invInst.getE01ISIIN3()%>"
				<% if (invInst.getF01ISIIN3().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap width="41%" > 
              <div align="right">Next Interest Payment Date :</div>
            </td>
            <td nowrap width="19%" > 
              <div align="left"> 
              	<input type="text" readonly  name="E01ISINI1" size="3" maxlength="2" value="<%= invInst.getE01ISINI1()%>"
			  <% if (invInst.getF01ISINI1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISINI2" size="3" maxlength="2" value="<%= invInst.getE01ISINI2()%>"
			  <% if (invInst.getF01ISINI2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISINI3" size="3" maxlength="2" value="<%= invInst.getE01ISINI3()%>"
			  <% if (invInst.getF01ISINI3().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">Last Dividends Payment Date :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIDI1" size="3" maxlength="2" value="<%= invInst.getE01ISIDI1()%>"
				<% if (invInst.getF01ISIDI1().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISIDI2" size="3" maxlength="2" value="<%= invInst.getE01ISIDI2()%>"
				<% if (invInst.getF01ISIDI2().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISIDI3" size="3" maxlength="2" value="<%= invInst.getE01ISIDI3()%>"
				<% if (invInst.getF01ISIDI3().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap width="41%" > 
              <div align="right">Next Dividends Payment Date :</div>
            </td>
            <td nowrap width="19%" > 
              <div align="left">
              	<input type="text" readonly  name="E01ISIND1" size="3" maxlength="2" value="<%= invInst.getE01ISIND1()%>"
			    <% if (invInst.getF01ISIND1().equals("Y")) out.print("id=\"txtchanged\""); %>>		
                <input type="text" readonly  name="E01ISIND2" size="3" maxlength="2" value="<%= invInst.getE01ISIND2()%>"
			    <% if (invInst.getF01ISIND2().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISIND3" size="3" maxlength="2" value="<%= invInst.getE01ISIND3()%>"
			    <% if (invInst.getF01ISIND3().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Last Capital Payment Date :</div>
            </td>
            <td nowrap width="18%" > 
              	<input type="text" readonly  name="E01ISICA1" size="3" maxlength="2" value="<%= invInst.getE01ISICA1()%>"
				<% if (invInst.getF01ISICA1().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISICA2" size="3" maxlength="2" value="<%= invInst.getE01ISICA2()%>"
				<% if (invInst.getF01ISICA2().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISICA3" size="3" maxlength="2" value="<%= invInst.getE01ISICA3()%>"
				<% if (invInst.getF01ISICA3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="41%" > 
              <div align="right">Next Capital Payment Date :</div>
            </td>
            <td nowrap width="19%" > 
              	<input type="text" readonly  name="E01ISINC1" size="3" maxlength="2" value="<%= invInst.getE01ISINC1()%>"
				<% if (invInst.getF01ISINC1().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISINC2" size="3" maxlength="2" value="<%= invInst.getE01ISINC2()%>"
				<% if (invInst.getF01ISINC2().equals("Y")) out.print("id=\"txtchanged\""); %>>
                <input type="text" readonly  name="E01ISINC3" size="3" maxlength="2" value="<%= invInst.getE01ISINC3()%>"
				<% if (invInst.getF01ISINC3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">First Accrual Date :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIFA1" size="3" maxlength="2" value="<%= invInst.getE01ISIFA1()%>"
			 	<% if (invInst.getF01ISIFA1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISIFA2" size="3" maxlength="2" value="<%= invInst.getE01ISIFA2()%>"
			  	<% if (invInst.getF01ISIFA2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISIFA3" size="3" maxlength="2" value="<%= invInst.getE01ISIFA3()%>"
			  	<% if (invInst.getF01ISIFA3().equals("Y")) out.print("id=\"txtchanged\""); %>>
              </div>
            </td>
            <td nowrap width="41%" > 
              <div align="right"> Next Call Date :</div>
            </td>
            <td nowrap width="19%" > 
              	<input type="text" readonly  name="E01ISICL1" size="3" maxlength="2" value="<%= 	invInst.getE01ISICL1()%>"
				<% if (invInst.getF01ISICL1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISICL2" size="3" maxlength="2" value="<%= invInst.getE01ISICL2()%>"
				<% if (invInst.getF01ISICL2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISICL3" size="3" maxlength="2" value="<%= invInst.getE01ISICL3()%>"
				<% if (invInst.getF01ISICL3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">First Coupon Date :</div>
            </td>
            <td nowrap width="18%" > 
              <input type="text" readonly  name="E01ISIFI1" size="3" maxlength="2" value="<%= invInst.getE01ISIFI1()%>"
			  <% if (invInst.getF01ISIFI1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIFI2" size="3" maxlength="2" value="<%= invInst.getE01ISIFI2()%>"
			  <% if (invInst.getF01ISIFI2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIFI3" size="3" maxlength="2" value="<%= invInst.getE01ISIFI3()%>"
			  <% if (invInst.getF01ISIFI3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="41%" ><div align="right">Next Put Date :</div>
            </td>
            <td nowrap width="19%" > 
              	<input type="text" readonly  name="E01ISIPU1" size="3" maxlength="2" value="<%= invInst.getE01ISIPU1()%>"
				<% if (invInst.getF01ISIPU1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISIPU2" size="3" maxlength="2" value="<%= invInst.getE01ISIPU2()%>"
				<% if (invInst.getF01ISIPU2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISIPU3" size="3" maxlength="2" value="<%= invInst.getE01ISIPU3()%>"
				<% if (invInst.getF01ISIPU3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">First Settlement Date :</div>
            </td>
            <td nowrap width="18%" > 
           	   	<input type="text" readonly  name="E01ISIFS1" size="3" maxlength="2" value="<%= invInst.getE01ISIFS1()%>"
			   	<% if (invInst.getF01ISIFS1().equals("Y")) out.print("id=\"txtchanged\""); %>>
             	<input type="text" readonly  name="E01ISIFS2" size="3" maxlength="2" value="<%= invInst.getE01ISIFS2()%>"
			   	<% if (invInst.getF01ISIFS2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              	<input type="text" readonly  name="E01ISIFS3" size="3" maxlength="2" value="<%= invInst.getE01ISIFS3()%>"
			   	<% if (invInst.getF01ISIFS3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="41%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="19%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <h4>Issue Size</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Amount Issued :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIAMT" size="22" maxlength="21" value="<%= invInst.getE01ISIAMT()%>" 
			   <% if (invInst.getF01ISIAMT().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Issued Price :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIIPR" size="22" maxlength="21" value="<%= invInst.getE01ISIIPR()%>" 
				<% if (invInst.getF01ISIIPR().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Minimum Piece Amount :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIMIA" size="22" maxlength="21" value="<%= invInst.getE01ISIMIA()%>" 
			  <% if (invInst.getF01ISIMIA().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Maturity Price :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIMPR" size="22" maxlength="21" value="<%= invInst.getE01ISIMPR()%>" 
			  <% if (invInst.getF01ISIMPR().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Increment Amount :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIINA" size="22" maxlength="21" value="<%= invInst.getE01ISIINA()%>"
			 <% if (invInst.getF01ISIINA().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Monthly Average Price :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIMAP" size="22" maxlength="21" value="<%= invInst.getE01ISIMAP()%>" 
			   <% if (invInst.getF01ISIMAP().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Par. Amount :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIPAR" size="22" maxlength="21" value="<%= invInst.getE01ISIPAR()%>" 
			 <% if (invInst.getF01ISIPAR().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Audit  Information</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Last User Update Date :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIUP1" size="3" maxlength="2" value="<%= invInst.getE01ISIUP1()%>" 
			   <% if (invInst.getF01ISIUP1().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIUP2" size="3" maxlength="2" value="<%= invInst.getE01ISIUP2()%>" 
				<% if (invInst.getF01ISIUP2().equals("Y")) out.print("id=\"txtchanged\""); %>>
              <input type="text" readonly  name="E01ISIUP3" size="3" maxlength="2" value="<%= invInst.getE01ISIUP3()%>" 
				<% if (invInst.getF01ISIUP3().equals("Y")) out.print("id=\"txtchanged\""); %>>
            </td>
            <td nowrap width="34%" > 
              <div align="right">User Profile:</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01ISIUSR" size="11" maxlength="10" value="<%= invInst.getE01ISIUSR()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Last Bloomberg Update Date :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIBL1" size="3" maxlength="2" value="<%= invInst.getE01ISIBL1()%>">
              <input type="text" readonly  name="E01ISIBL2" size="3" maxlength="2" value="<%= invInst.getE01ISIBL2()%>">
              <input type="text" readonly  name="E01ISIBL3" size="3" maxlength="2" value="<%= invInst.getE01ISIBL3()%>">
            </td>
            <td nowrap width="34%" ><div align="right">Process Status :</div>
            </td>
            <td nowrap width="66%" >
            	<% if(invInst.getE01ISIMOD().equals("M")) { out.print("N/A");}
            		else if(invInst.getE01ISIUST().equals("0")) { out.print("OK");}
					else if(invInst.getE01ISIUST().equals("1")) { out.print("error-Not Included in Request File");}
				 	else out.print(" ");
				 %>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
