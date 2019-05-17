<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Investments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invParameters" class="datapro.eibs.beans.EIE001501Message"  scope="session" />

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
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<div align="center"> 
  <h3>Investment Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_parameters,EIE0015"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0015" >
  <h4>
    <input type="hidden" name="SCREEN"  value="2" >
  </h4>
  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap height="236"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="51%"> 
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="49%"> 
              <input type="text" name="E01IVSBNK" size="3" maxlength="3" value="<%= invParameters.getE01IVSBNK()%>" readonly>
              <input type="text" name="E01BNKDSC" size="35" maxlength="30" value="<%= invParameters.getE01BNKDSC()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="51%"> 
              <div align="right">Bookeeping Method :</div>
            </td>
            <td nowrap width="49%"> 
              <select name="E01IVSBKM" disabled>
                <option value="1" <%if (invParameters.getE01IVSBKM().equals("1")) { out.print("selected"); }%>>FIFO</option>
                <option value="2" <%if (invParameters.getE01IVSBKM().equals("2")) {  out.print("selected"); }%>>LIFO</option>
                <option value="3" <%if (invParameters.getE01IVSBKM().equals("3")) {  out.print("selected"); }%>>AVERAGE 
                COST</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="51%"> 
              <div align="right">Days in Advance to Send Swift Msg to Brokers :</div>
            </td>
            <td nowrap width="49%"> 
				<input type="text" name="E01IVSDYM" size="4" maxlength="3" value="<%= invParameters.getE01IVSDYM()%>">            
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="51%"> 
              <div align="right">Days in Advance to Cancel Pending Orders :</div>
            </td>
            <td nowrap width="49%"> 
              <input type="text" name="E01IVSDYS" size="4" maxlength="3" value="<%= invParameters.getE01IVSDYS()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="51%"> 
              <div align="right">Default Statement Currency :</div>
            </td>
            <td nowrap width="49%"> 
              <div align="left"> 
                <select name="E01IVSDCY" disabled>
                  <option value="B" <%if (invParameters.getE01IVSDCY().equals("B")) { out.print("selected"); }%>>Base 
                  Currency</option>
                  <option value="I" <%if (invParameters.getE01IVSDCY().equals("I")) {  out.print("selected"); }%>>Instrument 
                  Currency</option>
                  <option value="P" <%if (invParameters.getE01IVSDCY().equals("P")) {  out.print("selected"); }%>>Portfolio 
                  Currency</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="51%"> 
              <div align="right">Custody Fee Table :</div>
            </td>
            <td nowrap width="49%"> 
              <div align="left"> 
                <input type="text" name="E01IVSCUT" size="4" maxlength="2" value="<%= invParameters.getE01IVSCUT()%>">
                <a href="javascript:GetCommCustodyTable('E01IVSCUT','CST','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="51%"> 
              <div align="right">Custody Fee Period :</div>
            </td>
            <td nowrap width="49%"> 
              <div align="left"> 
                <input type="text" name="E01IVSCFV" size="4" maxlength="3" value="<%= invParameters.getE01IVSCFV()%>">
                <select name="E01IVSCFC">
                  <option value="D" <%if (invParameters.getE01IVSCFC().equals("D")) { out.print("selected"); }%>>Day(s)</option>
                  <option value="M" <%if (invParameters.getE01IVSCFC().equals("M")) {  out.print("selected"); }%>>Month(s)</option>
                  <option value="Y" <%if (invParameters.getE01IVSCFC().equals("Y")) {  out.print("selected"); }%>>Year(s)</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="51%"> 
              <div align="right">Customer Price Margin :</div>
            </td>
            <td nowrap width="49%"> 
              <input type="text" name="E01IVSMRG" size="17" maxlength="15" value="<%= invParameters.getE01IVSMRG()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="51%"> 
              <div align="right">Maximum Market Value Percentage :</div>
            </td>
            <td nowrap width="49%"> 
              <div align="left"> 
                <input type="text" name="E01IVSFL7" size="17" maxlength="15" value="<%= invParameters.getE01IVSFL7()%>">
                (Only for Pledge of Shares)</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="51%">
              <div align="right">Accounting Method for Variable Income :</div>
            </td>
            <td nowrap width="49%">
              <input type="hidden" name="E01IVSFL0" value="<%= invParameters.getE01IVSFL0()%>">
              <input type="radio" name="CE01IVSFL0" value="1" onClick="document.forms[0].E01IVSFL0.value='1'"
			  <%if(invParameters.getE01IVSFL0().equals("1")) out.print("checked");%>>
              Quantity 
              <input type="radio" name="CE01IVSFL0" value="2" onClick="document.forms[0].E01IVSFL0.value='2'"
			  <%if(invParameters.getE01IVSFL0().equals("2")) out.print("checked");%>>
              Market Value</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="51%">
              <div align="right">Trade Ticket Approval Type :</div>
            </td>
            <td nowrap width="49%">
              <input type="hidden" name="E01IVSFL1" value="<%= invParameters.getE01IVSFL1()%>">
              <input type="radio" name="CE01IVSFL1" value="1" onClick="document.forms[0].E01IVSFL1.value='1'"
			  <%if(invParameters.getE01IVSFL1().equals("1")) out.print("checked");%>>
              One Approval 
              Step<BR>
				<input type="radio" name="CE01IVSFL1" value="2" onClick="document.forms[0].E01IVSFL1.value='2'"
			  <%if(invParameters.getE01IVSFL1().equals("2")) out.print("checked");%>>
              Two Approval Steps (Wait for Broker Confirmation)</td>
          </tr>    
          <tr id="trclear">
            <td nowrap width="51%">
              <div align="right">Days in Advance for Next Events Report :</div>
            </td>
            <td nowrap width="49%">
              <INPUT type="text" name="E01IVSFL8" size="4" maxlength="3" value="<%= invParameters.getE01IVSFL8()%>">
            </td>
          </tr>     
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="55%" > 
              <div align="right">Holding Funds Before Approval :</div>
            </td>
            <td nowrap width="45%" > 
              <div align="left">
                <input type="hidden" name="E01IVSHLD" value="<%= invParameters.getE01IVSHLD()%>">
                <input type="radio" name="CE01IVSHLD" value="Y" onClick="document.forms[0].E01IVSHLD.value='Y'"
			  <%if(invParameters.getE01IVSHLD().equals("Y")) out.print("checked");%>>
                Yes 
                <input type="radio" name="CE01IVSHLD" value="N" onClick="document.forms[0].E01IVSHLD.value='N'"
			  <%if(invParameters.getE01IVSHLD().equals("N")) out.print("checked");%>>
                No </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="55%" > 
              <div align="right">Allow Update Exchange Rate :</div>
            </td>
            <td nowrap width="45%" > 
              <div align="left">
                <input type="hidden" name="E01IVSUPX" value="<%= invParameters.getE01IVSUPX()%>">
                <input type="radio" name="CE01IVSUPX" value="Y" onClick="document.forms[0].E01IVSUPX.value='Y'"
			  <%if(invParameters.getE01IVSUPX().equals("Y")) out.print("checked");%>>
                Yes 
                <input type="radio" name="CE01IVSUPX" value="N" onClick="document.forms[0].E01IVSUPX.value='N'"
			  <%if(invParameters.getE01IVSUPX().equals("N")) out.print("checked");%>>
                No </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="55%" > 
              <div align="right">Include Future Transactions on Customer Statements 
                :</div>
            </td>
            <td nowrap width="45%" > 
              <div align="left">
                <input type="hidden" name="E01IVSFUT" value="<%= invParameters.getE01IVSFUT()%>">
                <input type="radio" name="CE01IVSFUT" value="Y" onClick="document.forms[0].E01IVSFUT.value='Y'"
			  <%if(invParameters.getE01IVSFUT().equals("Y")) out.print("checked");%> >
                Yes 
                <input type="radio" name="CE01IVSFUT" value="N" onClick="document.forms[0].E01IVSFUT.value='N'"
			  <%if(invParameters.getE01IVSFUT().equals("N")) out.print("checked");%> >
                No </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="55%" > 
              <div align="right"> Allow to Reverse Processed Orders :</div>
            </td>
            <td nowrap width="45%" > 
              <div align="left">
                <input type="hidden" name="E01IVSREV" value="<%= invParameters.getE01IVSREV()%>">
                <input type="radio" name="CE01IVSREV" value="Y" onClick="document.forms[0].E01IVSFUT.value='Y'"
			  <%if(invParameters.getE01IVSFUT().equals("Y")) out.print("checked");%> disabled>
                Yes 
                <input type="radio" name="CE01IVSREV" value="N" onClick="document.forms[0].E01IVSFUT.value='N'"
			  <%if(invParameters.getE01IVSFUT().equals("N")) out.print("checked");%> disabled>
                No </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="55%" > 
              <div align="right"> Bank's Accounting Entries for Purchases/Sales :</div>
            </td>
            <td nowrap width="45%" > 
              <div align="left">
                <input type="hidden" name="E01IVSFL2" value="<%= invParameters.getE01IVSFL2()%>">
                <input type="radio" name="CE01IVSFL2" onClick="document.forms[0].E01IVSFL2.value='Y'"
			  <%if(invParameters.getE01IVSFL2().equals("Y")) out.print("checked");%> value="Y">
                Yes 
                <input type="radio" name="CE01IVSFL2" onClick="document.forms[0].E01IVSFL2.value='N'"
                <%if(invParameters.getE01IVSFL2().equals("N")) out.print("checked");%> value="N">  No </div>
            </td>
          </tr>
          
         <tr id="trclear">			
			<td nowrap width="30%">
				<div align="right">Dividends Payable Account :</div>
			</td>
        	<td nowrap width="25%">
 				<input type="text" name="E01IVSFL4" size="15" maxlength="12" value="<%=invParameters.getE01IVSFL4().trim()%>" onKeyPress="enterInteger()">        
 				<a href="javascript:GetLedger('E01IVSFL4',document.forms[0].E01IVSBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
 			</td>
		</tr>		
          
        <tr id="trclear">
            <td nowrap width="51%">
              <div align="right">Maximum Days to Check Custodian Change :</div>
            </td>
            <td nowrap width="49%">
              <INPUT type="text" name="E01IVSFL9" size="4" maxlength="3" value="<%= invParameters.getE01IVSFL9()%>">
            </td>
          </tr>       
          
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>

