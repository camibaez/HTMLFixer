<html>
<head>
<title>Customer Position</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifPos" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

  
<SCRIPT Language="Javascript">

function PrintPreviewPDF() {
 <% 
  //iniPos = cifPos.getFirstRec() - 1;
  //out.println("var pos = " + iniPos + ";"); 
%>

  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=500&Pos=' + 1,600,500,4);
  
}

  function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert("Please enter an account number to continue.");	   
     }

  }

	 builtNewMenu(ecif10_i_opt);

function init() { 
   MM_preloadImages('<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif');
}

window.onload = function() {init(); MoveMenu(); }

</SCRIPT>


</head>

<BODY>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Customer Position<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_position.jsp,ECIF010"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<%
	if ( cifPos.getNoResult() ) {
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

   <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/INQUIRY.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="34%">
  			<a href="javascript:goAction(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/AVERAGE.gif" ></a>
      </TD>
    </TR>
  </TABLE>
        
<p>
<table class="tableinfo">
  <tr > 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             <td nowrap width="10%" align="left">  
         			<b><%= userPO.getHeader2()%></b>
             </td>
             
          <td nowrap width="10%" align="right"> Customer : </td>
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
  <TABLE class="tableinfo" NOWRAP>
  <TR><TD NOWRAP>
   <TABLE id="headTable1" NOWRAP>
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" NOWRAP></TH>
      <TH ALIGN=CENTER colspan="4" NOWRAP>Account</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>CCY</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Opening/<br>Maturity</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Principal</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Interest</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Others</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Total</TH>
    </TR>
    <TR id="trdark">  
      <TH ALIGN=CENTER NOWRAP>Number</TH>
      <TH ALIGN=CENTER NOWRAP>Type</TH>
      <TH ALIGN=CENTER NOWRAP>Description</TH>
      <TH ALIGN=CENTER NOWRAP>Rate</TH>
    </TR>
    </TABLE>
  
  <div id="dataDiv1" class="scbarcolor" style="padding:0" NOWRAP>
      <table id="dataTable1" NOWRAP>
    <%
                cifPos.initRow();
                int i=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("1")) {
                    		out.println(cifPos.getRecord());
                    i++;
                    }
                }
      //          if ( i > 6 ) {
      %>
             <% //       		 <SCRIPT Language="Javascript">
   				//				 dataDiv1.style.height="120"; 
   			//					 dataDiv1.style.overflowY="scroll";
   			//				</SCRIPT>	 %>
  		<%	 
            //    }
    %> 
  </table>
  </div>
  
  </TD>  
</TR>	
</TABLE>

  
<h4>Liabilities (Converted to Base Currency)</h4>
  <TABLE class="tableinfo">
  <TR><TD nowrap>
  
  <TABLE id="headTable2"  nowrap>
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" nowrap></TH>
      <TH ALIGN=CENTER colspan="4" nowrap>Account</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>CCY</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Opening/<br>Maturity</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Principal</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Interest</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Others</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Total</TH>
    </TR>
    <TR id="trdark"> 
     <TH ALIGN=CENTER nowrap>Number</TH>
     <TH ALIGN=CENTER nowrap>Type</TH>
     <TH ALIGN=CENTER nowrap>Description</TH>
     <TH ALIGN=CENTER nowrap>Rate</TH>
    </TR>
    </TABLE>
    
   <div id="dataDiv2" class="scbarcolor" style="padding:0" nowrap>
    <table id="dataTable2" nowrap>
    <%
                cifPos.initRow();
                int j=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("2")) {
                    		out.println(cifPos.getRecord());
                   j++;
                    }
                }
              //   if ( j > 6 ) {
      %>
                <% //    		 <SCRIPT Language="Javascript">
   					//			 dataDiv2.style.height="120"; 
   					//			 dataDiv2.style.overflowY="scroll";
   					//		</SCRIPT>	 %>
  			<%	 
              //        }   
    %> 
  </table>
    </div>
    </TD>
    </TR>	
  </TABLE>

<h4>Assets Under Management (Converted to Base Currency)</h4>
  <TABLE class="tableinfo" NOWRAP>
  <TR><TD NOWRAP>
   <TABLE id="headTable3" NOWRAP>
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" NOWRAP></TH>
      <TH ALIGN=CENTER colspan="4" NOWRAP>Instrument</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>CCY</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Opening<br>Date</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Face Value</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Interest</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Market Price</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Valuation Amt.</TH>
    </TR>
    <TR id="trdark">  
      <TH ALIGN=CENTER NOWRAP>Number</TH>
      <TH ALIGN=CENTER NOWRAP>Type</TH>
      <TH ALIGN=CENTER NOWRAP>Description</TH>
      <TH ALIGN=CENTER NOWRAP>Client Price</TH>
    </TR>
    </TABLE>
  
  <div id="dataDiv3" class="scbarcolor" style="padding:0" NOWRAP>
      <table id="dataTable3" NOWRAP>
    <%
                cifPos.initRow();
                int k=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("3")) {
                    		out.println(cifPos.getRecord());
                    k++;
                    }
                }
      //          if ( i > 6 ) {
      %>
             <% //       		 <SCRIPT Language="Javascript">
   				//				 dataDiv1.style.height="120"; 
   			//					 dataDiv1.style.overflowY="scroll";
   			//				</SCRIPT>	 %>
  		<%	 
            //    }
    %> 
  </table>
  </div>
  
  </TD>  
</TR>	
</TABLE>

 <SCRIPT language="javascript">
   function tableresize() {
     adjustDifTables(headTable1,dataTable1,dataDiv1,1,1);
     adjustDifTables(headTable2,dataTable2,dataDiv2,1,1);
     adjustDifTables(headTable3,dataTable3,dataDiv3,1,1);
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
            <div align="right"><b>Liabilities : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader3() %></td>
          <td width="16%"> 
            <div align="right"><b>Assets : </b></div>
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

<div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Print"   OnClick="PrintPreviewPDF();">
  </div>


<%
  }
%>

  </form>
</body>
</html>
