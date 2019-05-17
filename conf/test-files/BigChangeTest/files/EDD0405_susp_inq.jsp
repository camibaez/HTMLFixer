<HTML>
<%@ page import ="datapro.eibs.master.Util" %>
<HEAD>
<TITLE>
Suspended Inquiry
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "susp" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

<%
}
%>
</SCRIPT>

</head>

<body>

<%
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 


<h3 align="center">Stop Payments<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="susp_inq.jsp,EDD0405"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0405" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0"> 
<%
	if ( susp.getNoResult() ) {
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
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getHeader3().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="9" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getHeader1().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4></h4> 
  
  <TABLE  id="mainTable" class="tableinfo"  NOWRAP>
 <TR> 
   <TD NOWRAP valign="top" width="100%" >
    <TABLE id="headTable"  NOWRAP>
     <TR id="trdark"> 
      <TH ALIGN=CENTER colspan="3" nowrap>Check Number </TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Check Amount</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Stop Payment<br>Date</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>ACH Type<br>Transaction</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Customer<br>Charges</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>SubAccount</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>User</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap>Comments</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap>From</TH>
      <TH ALIGN=CENTER nowrap>To</TH>
      <TH ALIGN=CENTER nowrap>Date</TH>
    </TR>
    </TABLE>
    <div id="dataDiv1" class="scbarcolor" style="padding:0" NOWRAP>
    <table id="dataTable"  NOWRAP>
    <%
                int i=0;
                susp.initRow();
                while (susp.getNextRow()) {
                    datapro.eibs.beans.EDD0405DSMessage msgList = (datapro.eibs.beans.EDD0405DSMessage) susp.getRecord();
                    i++;
     %>     
     <TR>
		<TD NOWRAP><%=Util.formatCell(msgList.getE01STPFCK())%></TD>
		<TD NOWRAP><%=Util.formatCell(msgList.getE01STPTCK())%></TD>
		<TD NOWRAP ALIGN=CENTER><%=Util.formatDate(msgList.getE01STPDT1(), msgList.getE01STPDT2(), msgList.getE01STPDT3())%></TD>
		<TD NOWRAP ALIGN=RIGHT><%=Util.fcolorCCY(msgList.getE01STPAMT())%></TD>
		<TD NOWRAP ALIGN=CENTER><%=Util.formatDate(msgList.getE01STPRD1(), msgList.getE01STPRD2(), msgList.getE01STPRD3())%></TD>
		<TD NOWRAP ALIGN=CENTER><% if (msgList.getE01STPPRF().equals("Y")) out.print("Yes"); else out.print("No"); %></TD>
		<TD NOWRAP ALIGN=CENTER><% if (msgList.getE01STPCCF().equals("Y")) out.print("Yes"); else out.print("No"); %></TD>
		<TD NOWRAP ALIGN=LEFT><%=Util.formatCell(msgList.getE01STPPTS())%></TD>
		<TD NOWRAP ALIGN=LEFT><%=Util.formatCell(msgList.getE01STPRUS())%></TD>
		<TD NOWRAP><%=Util.formatCell(msgList.getE01STPRMK())%></TD>
		
	</TR>            
      <%            
                }
    %> 
      
  </table>
   </div>
   </TD>
  </TR>	
</TABLE>
      
<SCRIPT language="JavaScript">
  document.forms[0].totalRow.value="<%= i %>";
  function resizeDoc() {
       divResize();
       adjustDifTables(headTable, dataTable, dataDiv1,0,0);
  }
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>

  <h4></h4>
	<table class="tableinfo">
    <tr > 
      <td nowrap>
        
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right"><b>Total : </b></div>
            </td>
            <td width="50%"><%= userPO.getHeader4() %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<%
  }
%>

</FORM>

</BODY>
</HTML>
