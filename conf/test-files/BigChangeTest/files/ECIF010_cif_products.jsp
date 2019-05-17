<html>
<head>
<title>Managerial Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifProd" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<body>

<SCRIPT> initMenu();  </SCRIPT>
<h3 align="center">Managerial Inquiry <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_products.jsp,ECIF010"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="8">
<%
	if ( cifProd.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your criteria 
          </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
<p>
<table class="tableinfo">
  <tr > 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             <td nowrap width="10%" align="left">  
         			<b><% if (  userPO.getHeader2().trim().equalsIgnoreCase("LISTA NEGRA") ) { %>
   										<img src="<%=request.getContextPath()%>/images/e/blacklist.gif" align="left" >
                         <% } %></b>
             </td>
             
            <td nowrap width="10%" align="right"> Customer: </td>
             <td nowrap width="12%" align="left">
         			<%= userPO.getCusNum()%>
             </td>
             
            <td nowrap width="6%" align="right">Name :</td>
             <td nowrap width="14%" align="left">
         			<%= userPO.getHeader1()%>
             </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<h4>Assets (Converted to Base Currency)</h4>
  <TABLE class="tableinfo" NOWRAP ALIGN=CENTER>
  <TR><TD NOWRAP>
   <TABLE id="headTable1" NOWRAP>
    <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>Description</TH>
      <TH ALIGN=CENTER NOWRAP>Product</TH>
      <TH ALIGN=CENTER NOWRAP>Bank</TH>
      <TH ALIGN=CENTER NOWRAP>CCY</TH>
      <TH ALIGN=CENTER NOWRAP>N/T</TH>
      <TH ALIGN=CENTER NOWRAP>Principal</TH>
      <TH ALIGN=CENTER NOWRAP>Interest</TH>
      <TH ALIGN=CENTER NOWRAP>Others</TH>
      <TH ALIGN=CENTER NOWRAP>Total</TH>
    </TR>
    </TABLE>
  
  <div id="dataDiv1" class="scbarcolor" style="padding:0" NOWRAP>
      <table id="dataTable1" NOWRAP>
    <%
                cifProd.initRow();
                int i=0;
                while (cifProd.getNextRow()) {
                    if (cifProd.getFlag().equals("1")) {
                    		out.println(cifProd.getRecord());              		
   							i++;
                    }
                }
                if ( i > 6 ) {
      %>
                    		 <SCRIPT Language="Javascript">
   								 dataDiv1.style.height="120"; 
   								 dataDiv1.style.overflowY="scroll";
   							</SCRIPT>	 
  			<%	 
                          }
                out.println(userPO.getHeader6());
    %> 
    </table>
  </div>
  
  </TD>  
</TR>	
</TABLE>

  <h4>Liabilities (Converted to Base Currency)</h4>
  <TABLE class="tableinfo" ALIGN=CENTER>
  <TR><TD nowrap>
  
  <TABLE id="headTable2"  nowrap>
    <TR id="trdark">   
      <TH ALIGN=CENTER nowrap>Description</TH>
      <TH ALIGN=CENTER nowrap>Product</TH>
      <TH ALIGN=CENTER nowrap>Bank</TH>
      <TH ALIGN=CENTER nowrap>CCY</TH>
      <TH ALIGN=CENTER nowrap>N/T</TH>
      <TH ALIGN=CENTER nowrap>Principal</TH>
      <TH ALIGN=CENTER nowrap>Interest</TH>
      <TH ALIGN=CENTER nowrap>Others</TH>
      <TH ALIGN=CENTER nowrap>Total</TH>
    </TR>
    </TABLE>
    
   <div id="dataDiv2" class="scbarcolor" style="padding:0" nowrap>
    <table id="dataTable2" nowrap>
    <%
                cifProd.initRow();
                int j=0;
                while (cifProd.getNextRow()) {
                    if (cifProd.getFlag().equals("2")) {
                    		out.println(cifProd.getRecord());
                    		j++;
                    }
                }
                 if ( j > 6 ) {
      %>
                    		 <SCRIPT Language="Javascript">
   								 dataDiv2.style.height="120"; 
   								 dataDiv2.style.overflowY="scroll";
   							</SCRIPT>	 
  			<%	 
                          }          
                out.println(userPO.getHeader7());
    %> 
    </table>
    </div>
    </TD>
    </TR>	
  </TABLE>

  <SCRIPT language="javascript">
   function tableresize() {
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,false);
     adjustEquTables(headTable2,dataTable2,dataDiv2,0,false);
       }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>


  <h4>Totals (In Base Currency)</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="trclear"> 
          <td width="16%"> 
              <div align="right"><b>Assets : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader3() %></td>
          <td width="16%"> 
              <div align="right"><b>Liabilities : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader4() %></td>
          <td width="20%"> 
              <div align="right"><b>Net Position : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader5() %></td>
        </tr>
      </table>
      </td>
    </tr>
  </table>

<%
  }
%>

  </form>
</body>
</html>
