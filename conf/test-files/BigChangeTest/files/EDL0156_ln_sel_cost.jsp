<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>TABLAS DE ESTRUCTURAS DE PRESTAMOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(opt) {

	if (opt == 'M') { 
		var row = document.forms[0].Row.value;   
    	page = "<%=request.getContextPath()%>/pages/e/EDL0156_ln_cost_maint.jsp?ROW=" + row;
    	CenterNamedWindow(page,'Information',500,330,2);
	} else {
    	page = "<%=request.getContextPath()%>/pages/e/EDL0156_ln_cost_new.jsp";
    	CenterNamedWindow(page,'Information',500,330,2);
	}
}

function setParameters(bank,product,row) {
    document.forms[0].Bank.value = bank;
    document.forms[0].Product.value = product;
    document.forms[0].Row.value = row;
}

function cancelBub(){
  event.cancelBubble = true;
}

</script>  

</head>

<body>
<h3 align="center">Loan Cost FASB 91<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_sel_cost.jsp, EDL0156"></h3>
<hr size="4">
<form name="form1" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0156" >
  <input type=hidden name="SCREEN" value="2">
  <input type=hidden name="opt" value="1">
  <input type=hidden name="totalRow" value="0">
  <input type=hidden name="Row" value="0">
  <input type=hidden name="Bank" value="<%=userPO.getBank()%>">
  <input type=hidden name="Product" value="<%=userPO.getProdCode()%>">

  <%if ( lnList.getNoResult() ) {%>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center"><a href="javascript:goAction('N')"><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
           </tr>
         </table>
	  </div>

	  </TD>
	</TR>
    </TABLE>
  <%} else { 
	  if ( !error.getERRNUM().equals("0")  ) {
	     error.setERRNUM("0");
	     out.println("<SCRIPT Language=\"Javascript\">");
	     out.println("       showErrors()");
	     out.println("</SCRIPT>");
	     }
  %> 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('N')"><b>New</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('M')"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="5%"> 
              <div align="center">Bank</div>
            </th>
            <th align=CENTER nowrap width="25%" colspan="2"> 
              <div align="center">Product</div>
            </th>
            <th align=CENTER nowrap width="25%" colspan="2">
              <div align="center">G/L Debit</div>
            </th>
            <th align=CENTER nowrap width="25%" colspan="2">
              <div align="center">G/L Credit</div>
            </th>
            <th align=CENTER nowrap width="15%">
              <div align="center">Amount</div>
            </th>
          </tr>
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Code</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Name</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Account</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Name</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Account</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Name</div>
            </th>
            <th align=CENTER nowrap width="15%">&nbsp;</th>
          </tr>
     	  <%
            lnList.initRow(); 
            String chk = "checked"; 
            while (lnList.getNextRow()) {
               datapro.eibs.beans.EDL015601Message msgLn = (datapro.eibs.beans.EDL015601Message) lnList.getRecord();
     	  %>               
          <tr>
			<td NOWRAP width="5%"><input type="radio" name="ACCNUM" value="<%= lnList.getCurrentRow()%>" <%=chk%> onClick="setParameters('<%=msgLn.getE01DLEBNK()%>','<%=msgLn.getE01DLEPRO()%>',this.value)"></td>
			<td NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgLn.getE01DLEBNK())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01DLEPRO())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01PRONME())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01DLEGLD())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01GLDDSC())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01DLEGLC())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01GLCDSC())%></td>
			<td NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgLn.getE01DLECAM())%></td>
		  </tr>    		
	      <%chk = "";}%>    
        </table>
    </table>
  <%}%>
</form>
</body>
</html>
