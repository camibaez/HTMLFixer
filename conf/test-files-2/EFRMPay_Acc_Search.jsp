
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>


<jsp:useBean id="payment" class="datapro.eibs.beans.EFRMPAY000Message" 	scope="session"></jsp:useBean>
<jsp:useBean id="paymentList" class="datapro.eibs.beans.JBObjList" 	scope="request"></jsp:useBean>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "formList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>

	
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<TITLE>EFRMPay_Acc_Search.jsp</TITLE>

<script language="JavaScript">

  function search(command,e02prpnum,target){
    document.getElementById('command').value=command;
    if (e02prpnum != null && e02prpnum != '0')
      document.getElementById('E02PRPNUM').value=e02prpnum;
    if (target != null)  
      document.forms[0].target=target;
    document.forms[0].submit();
  }

</script>

</HEAD>
<BODY>
<% 
 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> 
<SCRIPT Language="Javascript">
      showErrors();
</SCRIPT>
 <%
 }
%>

<H3 align="center">Payment eIBSForms Printing<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="Acc_Search.jsp, EFRMPay"></H3>



<P><BR>
<BR>
</P>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRMPay" >
<input type="hidden" id="command" name="command" value="SEARCH_PAYMENT_REF" />

<CENTER><TABLE border="1" width="60%">
	<TBODY>
		<TR>
			<TD align="right">Client Debit Account: </TD>
			<TD>
			<INPUT type="text" id="E02PRPDAC" name="E02PRPDAC" size="20" value="<%=payment.getE02PRPDAC()%>">
			<A	href="javascript:GetAccount('E02PRPDAC','','','')"><IMG
				src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
				align="absbottom" border="0"></A>
				</TD>
		</TR>
		<TR>
			<TD align="right">Payment Number: </TD>
			<TD><INPUT type="text" id="E02PRPNUM" name="E02PRPNUM" size="20" value="<%=payment.getE02PRPNUM() %>"></TD>
		</TR>
		<TR>
			<TD align="right">Print Format: </TD>
			<TD>
			  <select id="PRINT_FORMAT" name="PRINT_FORMAT">
			  <%
			    formList.initRow();               
                while (formList.getNextRow()) {
                  datapro.eibs.beans.EFRM00001Message form = (datapro.eibs.beans.EFRM00001Message) formList.getRecord();
               %> 
				<option value="<%=form.getE01APFPTH()%>"><%=form.getE01APFDSC()%> </option>
				
			 <%}%>	
			</select>
			</TD>
		</TR>
		<TR>
			<TD colspan="2" align="right">
			    <INPUT type="button" name="searchButton" value="Search" onclick="search('SEARCH_PAYMENT_REF','0','main');">
			</TD>
		</TR>
	</TBODY>
</TABLE></CENTER>
</form>
  
   <% if (!paymentList.getNoResult()){
      datapro.eibs.beans.EFRMPAY000Message pay=null; 
   %>         
      
       <%
         if(paymentList.getLastRec() > 0){
          paymentList.initRow();
       %>
        <TABLE class="tableinfo" align="center" style="width:95%">
         <TR id="trdark"> 
           <TH ALIGN=CENTER  nowrap width="15%">REF</TH>
            <TH ALIGN=CENTER  nowrap width="20%">Credit Account</TH>
            <TH ALIGN=CENTER  nowrap width="20%">Amount</TH>
            <TH ALIGN=CENTER  nowrap width="10%">Curency</TH>
            <TH ALIGN=CENTER  nowrap width="10%">Frequency</TH>
            <TH ALIGN=CENTER  nowrap width="10%">Status</TH>
         </TR>
       <%                  
          while (paymentList.getNextRow()) {
               pay = (datapro.eibs.beans.EFRMPAY000Message) paymentList.getRecord();
       %> 
          <tr>
             <td NOWRAP>
              <a href="javascript:search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF')"><%=pay.getE02PRPNUM()%></a>
             </td>
             <td NOWRAP>
              <a href="javascript:search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF')"><%=pay.getE02PRPCAC()%></a>
             </td>
             <td NOWRAP>
              <a href="javascript:search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF')"><%=pay.getE02PRPAMT()%></a>
             </td>
             <td NOWRAP>
              <a href="javascript:search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF')"><%=pay.getE02PRPTCY()%></a>
             </td>
             <td NOWRAP>
              <a href="javascript:search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF')">
              
                <% if(pay.getE02PRPFRQ().equals("D")) out.print("Diario");
                   else if(pay.getE02PRPFRQ().equals("W")) out.print("Semanal");
                   else if(pay.getE02PRPFRQ().equals("M")) out.print("Mensual");
                   else if(pay.getE02PRPFRQ().equals("V")) out.print("Variable");
                   else if(pay.getE02PRPFRQ().equals("2")) out.print("Cada 2 Meses");
                   else if(pay.getE02PRPFRQ().equals("3")) out.print("Cada 3 Meses");
                %>
              
              </a>
             </td>
            <td NOWRAP >
			 <% if(pay.getE02PRPFL1().equals("A")) out.print("Autorizado");
                else out.print("Pendiente Autorización"); %>
		    </td>
          </tr>
       <% } %>
        </TABLE> 
     <% }
        if (paymentList.getLastRec() == 0){
          paymentList.initRow();
          paymentList.getNextRow();
          pay = (datapro.eibs.beans.EFRMPAY000Message) paymentList.getRecord();
      %>
       
        <script language="JavaScript">
          search('SHOW_SELECTED_FORM','<%=pay.getE02PRPNUM()%>','Warrant PDF');
        </script>
     <%
        }   
      } %>      
   
        
 
</BODY>
</HTML>

