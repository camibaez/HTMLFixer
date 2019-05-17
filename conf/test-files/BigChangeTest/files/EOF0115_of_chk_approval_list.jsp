<HTML>
<HEAD>
<TITLE>
List Official Checks to Approval
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
  var reason = '';
 
  function goAction(op) {
     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
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
			alert("Select a check before performing this operation");	   
     }

   }

  function confirmDel(){
  
  	if( confirm("Are you sure you want to remove this check?") ){
  		goAction("D");
  	}
  
  }
  
  function goExit(){
   window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }
  
</script>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
         
<h3 align="center"> Approval of Official checks <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EOF0115"> 
  </h3>
<hr size="4">

  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goAction('A')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/approve_over.gif',1)"><img name="Image1" alt="Approve" border="0" src="<%=request.getContextPath()%>/images/e/approve.gif" ></a>
      </TD>
      <!--
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:enterReason('R')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reject_over.gif',1)"><img name="Image2" alt="Reject" border="0" src="<%=request.getContextPath()%>/images/e/reject.gif" ></a>
      </TD>
      -->
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:confirmDel();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/delete_over.gif',1)"><img name="Image3" alt="Delete" border="0" src="<%=request.getContextPath()%>/images/e/delete.gif" ></a>
      </TD>

      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goExit()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER NOWRAP>
 <TR> 
    <TD NOWRAP>
  <TABLE id="headTable"  NOWRAP>
  <TR id="trdark"> 
      <th align=CENTER  nowrap >&nbsp;</th>
      <th align=CENTER  nowrap >Reference</th>
      <th align=CENTER  nowrap >Currency</th>
      <th align=CENTER  nowrap >Branch</th>
      <th align=CENTER  nowrap >Amount</th>
      <th align=CENTER  nowrap > 
        <div align="right">Status</div>
      </th>
      <th align=CENTER  nowrap > 
        <div align="center">Issued</div>
      </th>
      <th align=CENTER  nowrap > 
        <div align="center">Beneficiary</div>
      </th>
    </tr>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" style="padding:0" NOWRAP>
    <table id="dataTable"  NOWRAP>
    <%
                dvList.initRow();
                 int k=1;
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    		k++;
                    }
                }
                 if ( k > 10 ) {
               }
              %> 
   </table>
   </div>
   
  </TD>
  </TR>	
</TABLE>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>

<SCRIPT language="JavaScript">
   document.forms[0].totalRow.value="<%= k %>";

  function resizeDoc() {
       divResize();
    adjustEquTables(headTable, dataTable, dataDiv1,1,false); 
    }
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>
  
</FORM>

</BODY>
</HTML>

