<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Financial Transaction List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
 function sendClick(refnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "PRINUM" && elementValue== refnum) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
 }

 function goAction(refnum) {
     if ( refnum !== "") {
		  sendClick(refnum);
     }
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000?SCREEN=3&REFNUM="+document.forms[0].REFNUM.value;
	 CenterWindow(page,800,600,2);
  }

 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
 
 function showAddInfo(refernum,idxRow){
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].REFNUM.value = refernum;
   //adjustDifTables(headTable, dataTable, dataDiv1,2,1);
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
   
  }   
  
 function FilterType() {
 	document.forms[0].SCREEN.value = "1";
 	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1080';
    document.forms[0].submit();
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

<%
String transTyp = "";
String customer = "";
try {
	 transTyp = request.getParameter("TRANSTYP");
	 customer = request.getParameter("CUSNUM");
} catch (Exception e) {
	 transTyp = "";
	 customer = "";
}
if (transTyp == null) transTyp = "";
if (customer == null) customer = "";
%>
<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/maintenance_over.gif')">
<h3 align="center">Financial Transaction Module<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_maint_list.jsp,EPR1080"> 
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Transference Type :</b></div>
            </td>
            <td nowrap width="10%" > 
             <select name="TRANSTYP">
                <option value="" <% if (!(transTyp.equals("I") ||transTyp.equals("O") ||transTyp.equals("B"))) out.print("selected"); %>>All</option>
                <option value="I" <%if (transTyp.equals("I")) out.print("selected"); %>>Incoming</option>
                <option value="O" <%if (transTyp.equals("O")) out.print("selected"); %>>Outgoing</option>
                <option value="B" <%if (transTyp.equals("B")) out.print("selected"); %>>Internals</option>
              </select>
              
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Customer Number :</b></div>
            </td>
            <td nowrap width="10%" > 
				<input type="text" name="CUSNUM" size="14" maxlength="10" value="<%= customer %>" >     
				<a href="javascript:javascript:GetCustomerDescId('CUSNUM','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Reference Number :</b></div>
            </td>
            <td nowrap width="10%" > 
				<input type="text" name="REFNUM" size="14" maxlength="10" value="" >     
            </td>
            <td nowrap width="50%" > 
              <input id="EIBSBTN" type=button name="Submit" value="Filter" OnClick="FilterType();">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="50%">
  			<a href="javascript:goAction('')" id="" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/maintenance_over.gif',1)"><img name="Image1" alt="Maintenance" border="0" src="<%=request.getContextPath()%>/images/e/maintenance.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="50%">
  			<a href="javascript:goExit()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
      <tr id="trdark"> 
        <th align=CENTER NOWRAP></th>
        <th align=CENTER NOWRAP>Reference</th>
        <th align=CENTER NOWRAP>Amount</th>
        <th align=CENTER NOWRAP>Name</th>
		<th align=CENTER NOWRAP>Description</th>
      </tr>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">              
    <table id="dataTable">
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign="center" nowrap ><b>Date Transfer : <br>
              Debit Account : <br>Amount : <br>Currency : <br>Bank : <br>Branch : <br>Beneficiary : <br>Batch : <br>User : </b></TD>
         <TD ALIGN="LEFT" valign="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
	 showChecked("PRINUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
   
</SCRIPT>

</FORM>

</BODY>
</HTML>
