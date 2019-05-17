<html> 
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<%--
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
--%>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function PrintPreview() {

	var pg = "<%=request.getContextPath()%>/pages/e/ECD0001_plastic_req_inq_print.jsp";
	CenterWindow(pg,720,500,2);

}

</SCRIPT>  

</head>

 <% 
 datapro.eibs.beans.JBObjList appList = (datapro.eibs.beans.JBObjList) session.getAttribute("appStatusList");
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<BODY>
<h3 align="center">Card Request
<BR>Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ECD0001_plastic_req_inq_list"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0001" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="101">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Request # : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDRNUM" size="15" maxlength="13" readonly value="<%= userPO.getHeader1() %>">
			  </div>
            </td>
            <TD nowrap width="16%"> 
              <DIV align="right">Card Type :</DIV>
            </TD><TD nowrap width="16%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CDRTPL" size="3" maxlength="2" readonly value="<%= userPO.getHeader8() %>">
                <INPUT type="text" name="E01CDRNPL" size="31" maxlength="30" readonly value="<%= userPO.getHeader2() %>">
                 </DIV>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Branch : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDRBRD" size="4" maxlength="3" readonly value="<%= userPO.getHeader15() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Request Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CDRDAY" size="2" maxlength="2" readonly value="<%= userPO.getHeader5() %>">
                <input type="text" name="E01CDRMON" size="2" maxlength="2" readonly value="<%= userPO.getHeader6() %>">
                <input type="text" name="E01CDRYEA" size="4" maxlength="4" readonly value="<%= Util.formatYear(userPO.getHeader7()) %>">
              </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Send Amount :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDRQTY" size="5" maxlength="4" readonly value="<%= userPO.getHeader3() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Receipt  Amount :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01CDRREQ" size="5" maxlength="4" readonly value="<%= userPO.getHeader4() %>">
                 </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <%
	if ( appList.getNoResult() ) {
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
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <%-- Se agrego este boton para Banco del tesoro --%>
      <td class=TDBKG> 
 		<div align="center"><a href="javascript:goAction(101)"><b>Change <BR>Status</b></a></div>
      </td>
      
      <td class=TDBKG> 
		<div align="center" style="cursor:hand" onClick="PrintPreview()"><a><b>Print</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
    <p> 
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="20%"><div align="center">Card Number</div></th>
            <th align=CENTER nowrap width="10%">Status</th>
			<th align=CENTER nowrap width="60%">Notes</th>
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
           datapro.eibs.beans.ECD000101Message msgPart = (datapro.eibs.beans.ECD000101Message) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> 
				onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDRINI())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDRSTD())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDROBS())%></TD>
		</TR>    		
    	<%}%>    
        </table>
	</TD>    		
	</TR>
    </table>
 
 <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0001?SCREEN=2&opt=51&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0001?SCREEN=2&opt=51&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>
     
  <%}%>

<SCRIPT language="JavaScript">  
  showChecked("ROW");  
</SCRIPT>
</form>

</body>
</html>
