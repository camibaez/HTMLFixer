<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>FX Reversal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

 <jsp:useBean id= "lnRever" class= "datapro.eibs.beans.JBObjList"  scope="session" /> 
<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EFE004001Message"  scope="session" />
 
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "msgUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

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
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%> 



<h3 align="center">Treasury Reversal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="f_list_rever.jsp,EFE0040"> 
</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0040" onsubmit="return(checkTotals())">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">


<%
	if ( lnRever.getNoResult() ) {

%> 

  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center">           
          <p>&nbsp;</p>
          <p><b>There is no transactions for this FX</b></p>
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else {
 	lnRever.initRow();
    lnRever.setCurrentRow(0);
  	datapro.eibs.beans.EFE004001Message msgLoan = (datapro.eibs.beans.EFE004001Message) lnRever.getRecord();
  	    	
%> 
 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="SCRDEABNK" value="<%= userPO.getHeader6().trim()%>""> 
 
 
 <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr id=trdark>
    
         <td align=right nowrap>Deals Number :</td>
         <td><input size="10" type="text" name="E01FEMACC"  value="<%= userPO.getIdentifier()%>"></td>
         <td align=right nowrap>Batch :</td>
	     <td>
	        <input size="6" type="text" name="E01TRABTH" maxlength="5" value="<%=userPO.getHeader1()%>" readonly>
		  </td>
		  <td align=right nowrap>SRC:</td>
		  <td>
	        <input size="3" type="text" name="E01TRAINP" maxlength="3" value="<%=userPO.getHeader15()%>" readonly>
		  </td>
    </tr>
    <tr id=trdark>
	   
    	    <td align=right nowrap>Acc.Ref. :</td>
         <td>
         	<input size="6" type="text" name="E01TRAACR" readonly value="<%= userPO.getHeader2()%>">
         </td>
	        <td align=right nowrap>Batch Date :</td>
         <td>
            <input size="2" type="text" name="E01TRABDM" maxlength="2" value="<%=userPO.getHeader3()%>" readonly>
            <INPUT size="2" type="text" name="E01TRABDD" maxlength="2" value="<%=userPO.getHeader4()%>" readonly>
            <INPUT size="2" type="text" name="E01TRABDY" maxlength="2" value="<%=userPO.getHeader5()%>" readonly>
         </td>
    </tr>
    
    
    
    
        
  </table>
  </td>
  </tr>
 </table>
   
 
  <BR>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR> 
   <TD NOWRAP >
        <TABLE id="headTable" width="100%">
          <TR id="trdark"> 
            <Td ALIGN=CENTER NOWRAP>Bank</Td>
            <Td ALIGN=CENTER NOWRAP>Branch</Td>
            <Td ALIGN=CENTER NOWRAP>CCY</Td>
            <Td ALIGN=CENTER NOWRAP>G/L</Td>
            <Td ALIGN=CENTER NOWRAP>Account</Td>
 
            <Td ALIGN=CENTER NOWRAP>TC</Td>
            <Td ALIGN=CENTER NOWRAP>Description</Td>
            <Td ALIGN=CENTER NOWRAP>Amount</Td>
            <Td ALIGN=CENTER NOWRAP>D/C</Td>
          </TR>
   <%
         
         lnRever.initRow();
         java.math.BigDecimal totDebit = new java.math.BigDecimal("0.00");
         java.math.BigDecimal totCredit = new java.math.BigDecimal("0.00");
         
         while (lnRever.getNextRow()) { 
            msgLoan = (datapro.eibs.beans.EFE004001Message) lnRever.getRecord();                   
     %>  
            <TR id="trclear"> 
              <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRABNK() %></td>
              <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRABRN() %></td>            	
         	  <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRACCY() %></td>
         	  <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRAGLN() %></td>
         	  <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRAACC() %></td>
 
              <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRACDE() %></td>            	
         	  <td NOWRAP><%=msgLoan.getE01TRANAR() %></td>
         	  <td ALIGN=RIGHT NOWRAP><%= Util.fcolorCCY(msgLoan.getE01TRAAMT()) %></td>
         	  <td ALIGN=CENTER NOWRAP><%=msgLoan.getE01TRADCC() %></td>
    		</TR>    		 
      <%
            if (msgLoan.getE01TRADCC().equals("D")) totDebit=totDebit.add(msgLoan.getBigDecimalE01TRAAMT());
            else totCredit = totCredit.add(msgLoan.getBigDecimalE01TRAAMT());  
         }        
    %> 
             				
		</TABLE>
	</TD>
  </TR>	
</TABLE>
  <h4>Totals</h4>
<TABLE class="tableinfo">
 <TR> 
   <TD NOWRAP >
        <TABLE width="100%">
          <TR id="trdark"> 
            <Td ALIGN=CENTER NOWRAP>Total Trans : <%= lnRever.getLastRec() + 1 %></Td>
            <Td ALIGN=CENTER NOWRAP>Debits : <b><%=Util.fcolorCCY(totDebit.toString())%></b> 
              <input id="TOTDEB" type=hidden value="<%=totDebit.toString()%>"></Td>
            <Td ALIGN=CENTER NOWRAP>Credits : <b><%=Util.fcolorCCY(totCredit.toString())%></b> 
              <input id="TOTCRD" type=hidden value="<%=totCredit.toString()%>"></Td>
          </TR>
        </TABLE>
	</TD>
  </TR>	
</TABLE>  
    
 
	<p align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
    </p>

  <%
  }
%> 
</FORM>
 
</BODY>
</HTML>
