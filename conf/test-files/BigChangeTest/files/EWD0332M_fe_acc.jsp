<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Treasury </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "ewd0332Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<script language="JavaScript">
  function goAction(op) {
         
        if(op==1){
		 document.forms[0].opt.value = 1;
        }  
		else if(op==2){
		 document.forms[0].opt.value = 2;
        }  
		if(op==3){
		 document.forms[0].opt.value = 3;
        }  
		document.forms[0].submit();

  }

</SCRIPT> 

</head>
<body>
  <FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0332M" >
  <input type=HIDDEN name="opt" value="">
  <input type=HIDDEN name="SCREEN" value="2">
  <h3 align="center">Forward Rate Agreements Accounts - Settlement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_acc.jsp,ewd0332M"> 
  </h3>
<hr size="4">
  <input type=HIDDEN name="totalRow" value="0">
  <%
	if ( ewd0332Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<p>&nbsp;</p>


<table class="tbenter" width="100%">
    <tr> 
      <td align=CENTER> <a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/complete_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/complete.gif" ></a> 
      </td>
      <td align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a></td>
    </tr>
  </table>


<TABLE  id="mainTable" class="tableinfo">
<TR > 
    <TD NOWRAP valign="top" width="100%" >
<TABLE id="headTable" width="100%" >
  <TR id="trdark"> 
    <th>&nbsp;<BR> 
    <th>Account<BR>
      Number</th>
    <th>Counterparty 
            </th>
	<th>Action<BR> Taken</th>
    <th>Contract <br>Type </th>
	<th>Currency </th>
    <th>Principal<br> Balance</th>
    <th>Notional <br>Amount</th>
    <th>Rate</th>
	 <th>Value <br>Date</th>
	 <th>Status</th>
  </tr>
  </table>
  <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
  <%
                ewd0332Help.initRow();
				int k = 1;
                while (ewd0332Help.getNextRow()) {
                    if (ewd0332Help.getFlag().equals("")) {
                    		out.println(ewd0332Help.getRecord());
							k ++;
                    }
                }
    %> 
</TABLE>

</div>
</td>
</tr>
</table>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
</SCRIPT>
<%
   }  
%>

</form>
</body>
</html>

