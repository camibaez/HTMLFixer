<html> 
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgFRate" class= "datapro.eibs.beans.EDL0157DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

	builtNewMenu(ln_m_opt);	

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 4){
		if(confirm("are you sure you want to delete this record?")){
			document.forms[0].submit();
		} 
	} else {
		document.forms[0].submit();
	}
}	

function closeEnter(){
   	  enterData.filters[0].apply();
      enterData.style.visibility="hidden";
      enterData.filters[0].Play();
}

function ShowEnterData() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterData.style.pixelTop=' + y);
     eval('enterData.style.pixelLeft=' + x);
	 enterData.filters[0].apply();
     enterData.style.visibility="visible";
     enterData.filters[0].Play();	 
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<BODY>
<h3 align="center">Floating Rates Schedule<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="floatRate_schedule_list.jsp, EDL0157"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0157" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( appList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
 				<div align="center"><a href="javascript:goAction(1);"><b>New</b></a></div>
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
	
  <%  
		}
	else {
%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG> 
 		<div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(3)"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG> 
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
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"><div align="center">Effective Date</div></th>
            <th align=CENTER nowrap width="30%">Table</th>
            <th align=CENTER nowrap width="30%">Days Prior</th>
            <th align=CENTER nowrap width="30%">Rate Revision Cycle </th>
            <th align=CENTER nowrap width="10%"><div align="center">Rate/Spread </div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Status</div></th>

          </tr>
     	<%
        appList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (appList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EDL0157DSMessage msgPart = (datapro.eibs.beans.EDL0157DSMessage) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> 
				onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
				
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatDate(msgPart.getE01DLVSDM(), msgPart.getE01DLVSDD(), msgPart.getE01DLVSDY())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01DLVFTB())%><%=Util.formatCell(msgPart.getE01DLVFTY())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01DLVDYS())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01DLVRRP())%><%=Util.formatCell(msgPart.getE01DLVF03())%></TD>
					
            
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01DLVRTE())%> 
			<%
			if (msgPart.getE01DLVFLG().equals("+"))
				{
				out.write("ADD");
				}
				else if (msgPart.getE01DLVFLG().equals("-"))
				{
				out.write("SUBSTRACT");
				}
				else
				{
				out.write("REPLACE");
				}				
			%></TD>
			<TD NOWRAP ALIGN="CENTER">	<%
			if (msgPart.getE01DLVSTS().equals("*"))
				{
				out.write("APPLIED");
				} else {
				out.write("PENDING");
				}
			%>		</TD>

		</TR>    		
    	<%}%>    
        </table>
    </table>
     
  <%}%>


</form>

</body>
</html>
