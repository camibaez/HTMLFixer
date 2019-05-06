<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Payment Orders List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<script language="javascript">
  var reason = '';
  
  function goAction(opt) {
    
    document.forms[0].action.value = opt;
    document.forms[0].reason.value = reason;
    var ok = true;
    if (opt == "D") {
      ok = confirm("The select record will be deleted, Are you sure?");
	}
	if (ok) document.forms[0].submit(); 
  }
  
  function showAddInfo(idxRow){
	   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;   
	   var i = document.forms[0].CURRENTROW.value;
	   dataTable.rows[i].className="trnormal";    
	   dataTable.rows[idxRow].className="trhighlight";
	   document.forms[0].CURRENTROW.value = idxRow;
	   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
	   
  }  
</SCRIPT>

</HEAD>

<BODY>

<% 
 String chk = "";
 	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Payment Orders Approval List
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EPR2010">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2010" >

<%
	if ( appList.getNoResult() ) {
%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>There is no records matching your search criteria </b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
  %>
     
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
 <INPUT TYPE=HIDDEN NAME="action" VALUE="A">
 <INPUT TYPE=HIDDEN NAME="reason" VALUE="">   
 
 <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')">Approval</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')">Reject</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Delete</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Exit</a> </div>
      </TD>
    </TR>
 </TABLE>
  
<TABLE  id="mainTable" class="tableinfo" >
 <TR> 
    <TD NOWRAP valign="top" width="100%">
    <TABLE id="headTable" >
  		<TR id="trdark"> 
    		<TH ALIGN=CENTER nowrap></TH>
    		<TH ALIGN=CENTER nowrap>Debit Account</TH>   
    		<TH ALIGN=CENTER nowrap>Applicant</TH>
    		<TH ALIGN=CENTER nowrap>Amount</TH>
    		<TH ALIGN=CENTER nowrap>Currency</TH>
  		</TR>
  	</TABLE>
  
   <div id="dataDiv1" class="scbarcolor" style="padding:0">
    <table id="dataTable">
     <%
                appList.initRow(); 
                chk = "checked";               
                while (appList.getNextRow()) {
                   datapro.eibs.beans.EPR201001Message bean = (datapro.eibs.beans.EPR201001Message) appList.getRecord();
     %>               
        <TR>
			<TD NOWRAP><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> onclick="showAddInfo(this.value);"></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:showInqApprovalPaymentOrder('<%=bean.getE01PRPNUM()%>','<%=bean.getE01PRPDAC()%>','<%= appList.getCurrentRow()%>')"><%=Util.formatCell(bean.getE01PRPDAC()) %></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:showInqApprovalPaymentOrder('<%=bean.getE01PRPNUM()%>','<%=bean.getE01PRPDAC()%>','<%= appList.getCurrentRow()%>')"><%=Util.formatCell(bean.getE01PRPORD())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:showInqApprovalPaymentOrder('<%=bean.getE01PRPNUM()%>','<%=bean.getE01PRPDAC()%>','<%= appList.getCurrentRow()%>')"><%=Util.formatCell(bean.getE01PRPAMT())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:showInqApprovalPaymentOrder('<%=bean.getE01PRPNUM()%>','<%=bean.getE01PRPDAC()%>','<%= appList.getCurrentRow()%>')"><%=Util.formatCell(bean.getE01PRPTCY())%></a>
				<INPUT TYPE=HIDDEN NAME="TXTDATA<%= appList.getCurrentRow()%>" 
				VALUE="<%= bean.getE01PRPDBK()%><br><%= bean.getE01PRPBNF()%><br>
					   <%= bean.getE01PRPCAC()%><br><%= Util.formatDate(bean.getE01PRPOPD(),bean.getE01PRPOPM(),bean.getE01PRPOPY())%><br>
					   <%= bean.getE01PRPUSR()%><br><%= bean.getE01PRPNUM()%><br>
					   <%= bean.getE01PRPDSC()%><br><% if (bean.getE01PRPPVI().equals("1")) { 
					out.print("FED");
                 } else if (bean.getE01PRPPVI().equals("2")) {
                    out.print("SWIFT MT-100/MT-103");
                 } else if (bean.getE01PRPPVI().equals("3")) {
                    out.print("SWIFT MT-200/MT-202");
                 } else if (bean.getE01PRPPVI().equals("4")) {
                    out.print("CHIPS");
                 } else if (bean.getE01PRPPVI().equals("5")) {
                    out.print("ACH");
                 } else if (bean.getE01PRPPVI().equals("6")) {
                    out.print("OFFICIAL CHECK");
                 } else if (bean.getE01PRPPVI().equals("7")) {
                 	out.print("INTERNAL");
                 } %>">						
			</TD>
		</TR>  
   <%             
    				chk = "";     
                }
    %>    
     </table>
   </div>
     </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear">
         <TD ALIGN="RIGHT" valign="middle" nowrap><b>Bank : <br>Beneficiary : <br>Credit Account : <br>Operation Date: <br>Operator : <br>Order Number :<br>Description :<br>Payment Via :</b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
  function resizeDoc() {
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);     
  }
  showChecked("ROW");  
  resizeDoc();
  tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
  window.onresize=resizeDoc;     
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
