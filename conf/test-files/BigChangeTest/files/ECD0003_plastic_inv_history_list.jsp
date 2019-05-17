<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "hisList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0003DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function PrintPreview() {

	var pg = "<%=request.getContextPath()%>/pages/e/ECD0003_plastic_inv_history_print.jsp";
	CenterWindow(pg,720,500,2);

}

</SCRIPT> 

</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<BODY>
<h3 align="center">Card Inventory<BR>Historic
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_inv_history_list.jsp , ECD0003">
</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0003" >
  <input type=HIDDEN name="SCREEN" value="3">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( hisList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There are not results</b></p>
	  </div>
	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> 
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="15%">Date</th>
            <th align=CENTER nowrap width="15%">Time</th>
            <th align=CENTER nowrap width="15%">Branch</th>
            <th align=CENTER nowrap width="15%">Amount</th>
            <th align=CENTER nowrap width="20%">Card Type</th>
            <th align=CENTER nowrap width="20%">Status</th>
            
          </tr>
     	<%
        hisList.initRow(); 
        while (hisList.getNextRow()) {
           datapro.eibs.beans.ECD0003DSMessage msgPart = (datapro.eibs.beans.ECD0003DSMessage) hisList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER">
				<%= Util.formatDate(msgPart.getE03CDRDAR(),msgPart.getE03CDRMOR(),msgPart.getE03CDRYER()) %>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatTime(msgPart.getE03CDRTIR())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE03CDRBRN())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE03CDRREQ())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE03CDRTPL())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE03CDRSTD())%>
			</TD>

		</TR>    		
    	<%}%>    
        </table>
    </table>
    
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( hisList.getShowPrev() ) {
      			int pos = hisList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0003?SCREEN=104&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( hisList.getShowNext() ) {
      			int pos = hisList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0003?SCREEN=104&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>

  <p align="center"> 
      <input id="EIBSBTN" type=button name="Print" OnClick="PrintPreview()" value="Print">
    
  </p>
     
  <%}%>

</form>

</body>
</html>
