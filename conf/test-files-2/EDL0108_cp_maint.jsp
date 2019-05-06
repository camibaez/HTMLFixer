<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Securities & Investments Sales/Purchase Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cpMant" class="datapro.eibs.beans.EDL010801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  //out.println("<SCRIPT> initMenu(); </SCRIPT>");
  
 String sTitle = "";
 if (cpMant.getE01DLIOPT().equals("0"))
 	sTitle = "Additional Purchase";
 else if (cpMant.getE01DLIOPT().equals("1"))
 	sTitle = "Sale outright";	
 else if (cpMant.getE01DLIOPT().equals("2"))
 	sTitle = "Re-Sale";	
 else if (cpMant.getE01DLIOPT().equals("3"))
 	sTitle = "Re-purchase";	
 else if (cpMant.getE01DLIOPT().equals("4"))
 	sTitle = "Release";	

%>

<h3 align="center"><%=sTitle%> Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_maint.jsp,EDL0108"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0108" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DLIOPT" VALUE="<%= cpMant.getE01DLIOPT().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="15" maxlength="13" value="<%= cpMant.getE01DEAACC().trim()%>" readonly>
               </div>
            </td>
		  </tr>
          <tr id="trdark">            
            <td nowrap width="20%" > 
              <div align="right"><b>Counterparty :</b> </div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <input type="text" name="E01DLICUS" size="11" maxlength="10" value="<%= cpMant.getE01DLICUS().trim()%>" readonly>
                <input type="text" name="E01DLINAM" size="50" maxlength="45" value="<%= cpMant.getE01DLINAM().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="11" maxlength="10" value="<%= cpMant.getE01DEACUN().trim()%>" readonly>
                <input type="text" name="E01CUSNA1" size="50" maxlength="45" value="<%= cpMant.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DLITD1" size="2" maxlength="2" value="<%= cpMant.getE01DLITD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLITD2" size="2" maxlength="2" value="<%= cpMant.getE01DLITD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLITD3" size="2" maxlength="2" value="<%= cpMant.getE01DLITD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLITD1,document.forms[0].E01DLITD2,document.forms[0].E01DLITD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DLISD1" size="2" maxlength="2" value="<%= cpMant.getE01DLISD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLISD2" size="2" maxlength="2" value="<%= cpMant.getE01DLISD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLISD3" size="2" maxlength="2" value="<%= cpMant.getE01DLISD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLISD1,document.forms[0].E01DLISD2,document.forms[0].E01DLISD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Face Amount :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01DLIFCV" size="15" maxlength="13" value="<%= cpMant.getE01DLIFCV().trim()%>" onkeypress="enterDecimal()">
               <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Sale/Purchase Price :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" name="E01DLIPRC" size="15" maxlength="13" value="<%= cpMant.getE01DLIPRC().trim()%>" onkeypress="enterSignDecimal()">
               <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Interest Accrued :</div>
            </td>
            <td nowrap width="23%" height="37"> 
				<input type="text" name="E01DLIINT" size="15" maxlength="13" value="<%= cpMant.getE01DLIINT().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
            <td nowrap width="25%" height="37"> 
              <div align="right">Total Sale/Purchase :</div>
            </td>
            <td nowrap width="27%" height="37">
              <input type="text" name="E01DLIBAP" size="15" maxlength="13" value="<%= cpMant.getE01DLIBAP().trim()%>" onkeypress="enterDecimal()">
                        
            </td>
          </tr>
          <tr id="trdark"> 
				<TD nowrap width="25%" height="37">
				 <div align="right">Negotiated By :</div>
            	</td>
            	<td nowrap width="23%" height="37"> 
					<input type="text" name="E01DL1OFI" size="3" maxlength="3" value="<%= cpMant.getE01DL1OFI().trim()%>" onkeypress="enterDecimal()"> 
            		<INPUT type="text" name="D01DL1OFI" size="35" maxlength="35" value="<%= cpMant.getD01DL1OFI().trim()%>" readonly>
            		<A 
					href="javascript:GetCodeDescCNOFC('E01DL1OFI','D01DL1OFI','15')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="bottom" border="0"></A> 
              		<IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="bottom" border="0">
				</td>
            <td nowrap width="25%" height="37"> 
				 <div align="right">Total Proceeds :</div>
            </td>
            <td nowrap width="27%" height="37">
           		<INPUT type="text" name="E01DLINET" size="15" maxlength="13" value="<%= cpMant.getE01DLINET().trim()%>" readonly>
            </td>
		  </TR>
          <tr id="trclear"> 
            <td nowrap width="100%" height="37" colspan="4"> 
            	<DIV align="center" style="cursor: hand" onclick="CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=11',600,600,2);"><A><B>Recap Inquiry</B></A></DIV>
            </td>
		  </TR>
		</table>
      </td>
    </tr>
  </table>  
  <h4> Repayment Account</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01DLIOBN" size="2" maxlength="2" value="<%= cpMant.getE01DLIOBN().trim()%>" onkeypress="enterInteger()">           
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Branch :</div>
            </td>
            <td nowrap width="27%"> 
				<input type="text" name="E01DLIOBR" size="3" maxlength="3"value="<%= cpMant.getE01DLIOBR().trim()%>" >
				<a href="javascript:GetBranch('E01DLIOBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01DLIOCY" size="3" maxlength="3" value="<%= cpMant.getE01DLIOCY().trim()%>" >
				<a href="javascript:GetCurrency('E01DLIOCY', '')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"  ></a>				
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Account :</div>
            </td>
            <td nowrap width="27%"> 
				<input type="text" name="E01DLIOAC" size="15" maxlength="13" value="<%= cpMant.getE01DLIOAC().trim()%>" onkeypress="enterInteger()">
              	<a href="javascript:GetLedger('E01DLIOAC',document.forms[0].E01DLIOBN.value,document.forms[0].E01DLIOCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a> 
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>    
	<% 
		if (error.getERWRNG().equals("Y")) { 
			error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Accept with Warnings</h4>
	<% 
		} 
	%>       
 
   <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </div>
  </form>
</body>
</html>
