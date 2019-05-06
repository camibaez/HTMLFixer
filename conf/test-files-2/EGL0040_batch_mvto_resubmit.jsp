 <html>
<head>
<title>Batch Resubmit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EGL0040Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

	document.forms[0].opt.value = op; 
	document.forms[0].submit();
  
}

 

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Batch Resubmit<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="batch_mvto_resubmit.jsp, EGL0040"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0040" >
  <input type=HIDDEN name="SCREEN" value="500">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
 
  <%
	if ( EGL0040Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 



 <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr id=trdark>
    
            
         <td nowrap width=25% align="right">Batch Number :</td>
	     <td>
	        <input size="5" type="text" name="ETRABTH" maxlength="4" value="<%=userPO.getHeader1()%>" readonly>
		  </td>
		  <td nowrap width=25% align="right">Reference :</td>
         <td>
         	<input size="9" type="text" name="ETRAACR" readonly value="<%= userPO.getHeader2()%>">
         </td>        
         <td nowrap width=25% align="right" > Batch Date : </td>
	      <td nowrap width=40% align="left"  > 
 
            <input size="2" type="text" name="ETRABDM" maxlength="2" value="<%=userPO.getHeader3()%>" readonly>
            <INPUT size="2" type="text" name="ETRABDD" maxlength="2" value="<%=userPO.getHeader4()%>" readonly>
            <INPUT size="2" type="text" name="ETRABDY" maxlength="2" value="<%=userPO.getHeader5()%>" readonly>
         </td>
    </tr>
    <tr id=trdark>    	 
	     <td nowrap width=25% align="right">Bank :</td>
         <td>
            <input size="3" type="text" name="ETRABNK" maxlength="3" value="<%=userPO.getHeader6()%>" readonly>             
         </td>
         <td nowrap width=25% align="right">Branch :</td>
         <td>
            <input size="3" type="text" name="ETRABRN" maxlength="3" value="<%=userPO.getHeader7()%>" readonly>             
         </td>
         <td nowrap width=25% align="right">CCY :</td>
         <td>
            <input size="3" type="text" name="ETRACCY" maxlength="3" value="<%=userPO.getHeader8()%>" readonly>             
         </td>
    </tr>
            
  </table>
  </td>
  </tr>
 </table>    
    

          
 <table class="tbenter" width=100% align=center>
   <tr> 
          
     <td class=TDBKG width="25%"> 
          <div align="center"><a href="javascript:goAction('3')"><b>Resubmit</b></a></div>
      	</td>
      	 
      	<td class=TDBKG width="25%"> 
          <div align="center"><a href="javascript:goAction('4')"><b>Reversal and<br>Resubmit</b></a></div>
      	</td>
      	<td class=TDBKG width="25%"> 
       	  <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      	</td>

   </tr>
 </table>
   
  <br>
  
 <TABLE  width="100%" id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP >
        <table id="headTable" width="80%" >
          <tr id="trdark">                     
            
            <th align=CENTER nowrap >                       
            	<div ALIGN="CENTER" >G/L</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >Account</div>
            </th>	
 			<th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >TC</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >Description</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >Amount</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >D/C</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >Amount</div>
            </th>
            <th align=CENTER nowrap > 
            	<div ALIGN="CENTER" >D/C</div>
            </th>
          </TR>             				
		</TABLE>

          <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EGL0040Help.initRow();
				int k=1;
                while (EGL0040Help.getNextRow()) {
                 
                  out.println(EGL0040Help.getRecord());
                  k++;   
                }
              %>
     
    </table>
   </div>
</Table>

  <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
	   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>
   
<%}%>


 </form>

</body>
</html>
 