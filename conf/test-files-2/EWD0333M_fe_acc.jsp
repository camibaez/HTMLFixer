<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Treasury </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "ewd0333Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.js"> </SCRIPT>


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
  <FORM name="form1" METHOD="post" action="/servlet/datapro.eibs.forex.JSEWD0333M" >
  <input type=HIDDEN name="opt" value="">
  <input type=HIDDEN name="SCREEN" value="2">
  
  <h3 align="center">NDF - Settlement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_acc_jsp, EWD0333M"> 
  </h3>
  
<hr size="4">
  <input type=HIDDEN name="totalRow" value="0">
  <%
	if ( ewd0333Help.getNoResult() ) {
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
      <td align=CENTER> <a href="/eIBS_R04M03/pages/background.htm" onClick="top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/EXIT.gif" ></a></td>
    </tr>
  </table>


<TABLE  id="mainTable" class="tableinfo">
<TR > 
    <TD NOWRAP valign="top" width="100%" >
<TABLE id="headTable" width="100%" >
  <TR id="trdark"> 
    <th>&nbsp;</th> 
    <th>Account<BR>Number</th>
    <th>Counterparty </th>
    <th>Type </th>
    <th>Action<BR> Taken</th>
    <th>Primary Source <br> Amount</th>
    <th>Counter Balance <br>Amount</th>
    <th>Rate</th>
	 <th>Value <br>Date</th>
	 <th>Status</th>
  </tr>
  </table>
  <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
  <%
                ewd0333Help.initRow();
				int k = 1;
                while (ewd0333Help.getNextRow()) {
                    if (ewd0333Help.getFlag().equals("")) {
                    		out.println(ewd0333Help.getRecord());
							k ++;
                    }
                }
    %> 
</TABLE>
</div>
</td>
</tr>
</table>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( ewd0333Help.getShowPrev() ) {
      			int pos = ewd0333Help.getFirstRec() - 101;
      			out.println("<A HREF=\"/eIBS_R04M03/servlet/datapro.eibs.forex.JSEWD0333M?Pos=" + pos +"\"><IMG border=\"0\" src=\"/eIBS_R04M03/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( ewd0333Help.getShowNext() ) {
      			int pos = ewd0333Help.getLastRec();
      			out.println("<A HREF=\"/eIBS_R04M03/servlet/datapro.eibs.forex.JSEWD0333M?Pos=" + pos +"\"><IMG border=\"0\" src=\"/eIBS_R04M03/images/e/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>

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

