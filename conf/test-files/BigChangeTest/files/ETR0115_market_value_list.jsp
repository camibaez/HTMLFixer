<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>IRS Market Value Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


function goProcess() {

	document.forms[0].submit();
			 
}

</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">IRS Market Value Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="market_value_list.jsp, ETR0115"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0115">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

<% 
	if ( prList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There are no items.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="javascript:goProcess()">Process</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
  
  <TABLE class="tableinfo" id="dataTable">
    
        <TR id=trdark>
          <td NOWRAP align="center" ><b>Account</b></td>		  
		  <td NOWRAP align="center" ><b>Customer<br>Number</b></td>
          <td NOWRAP align="center" ><b>Customer<br>Name</b></td>		  		  		  
          <td NOWRAP align="center" ><b>Last Market<br>Value</b></td>
          <td NOWRAP align="center" ><b>New Market<br>Value</b></td>
          <td NOWRAP align="center" ><b>Last Market<br>Date</b></td>
          <td NOWRAP align="center" ><b>Product<br></b></td>
          <td NOWRAP align="center" ><b>Sub-Type<br></b></td>
          <td NOWRAP align="center" ><b>Notional<br>Amount</b></td>
          <td NOWRAP align="center" ><b>Value<br>Date</b></td>
          <td NOWRAP align="center" ><b>Maturity<br>Date</b></td>
		</TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
               ETR011501Message msgList = (ETR011501Message) prList.getRecord();			 
         %>             
          <TR id=trclear>
          <td NOWRAP align="right" >
          <a href="javascript:showFRAAcc('<%=msgList.getE01FRAACC()%>','ETR0160')">
          	<%=Util.formatCell(msgList.getE01FRAACC())%>&nbsp;</a>
          	<INPUT TYPE=HIDDEN NAME="E01FRAACC_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAACC() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRACUN_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRACUN() %>">
          	<INPUT TYPE=HIDDEN NAME="E01CUSNA1_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01CUSNA1() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRAMVL_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAMVL() %>">
          	
          	<INPUT TYPE=HIDDEN NAME="E01FRAMMD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAMMD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRAPRO_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAPRO() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRASBT_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRASBT() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRAPRI_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAPRI() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRAVAD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAVAD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01FRAMAD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01FRAMAD() %>">
 		  </td>		
          <td NOWRAP align="center" >
          	<%=Util.formatCell(msgList.getE01FRACUN())%>
		  </td>		  		  		  
          <td NOWRAP align="left" >
          	<%=Util.formatCell(msgList.getE01CUSNA1())%>
		  </td>		  		  		  
          <td NOWRAP align="right" >
          	<%=Util.formatCCY(msgList.getE01FRAMVL())%>
		  </td>		  		  		   		    
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01FRAMWV_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01FRAMWV() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>
          <td NOWRAP align="center" >
          	<%=Util.formatDate(msgList.getE01FRAMMD())%>
		  </td>	
          <td NOWRAP align="center" >
          	<%=Util.formatCell(msgList.getE01FRAPRO())%>
		  </td>		  		  		  		  	  		  		  
          <td NOWRAP align="center" >
          	<%=Util.formatCell(msgList.getE01FRASBT())%>
          </td>
          <td NOWRAP align="right" >
          	<%=Util.formatCell(msgList.getE01FRAPRI())%>
		  </td>		  		  		  		  	  		  		  
          <td NOWRAP align="center" >
          	<%=Util.formatDate(msgList.getE01FRAVAD())%>
		  </td>	
          <td NOWRAP align="center" >
          	<%=Util.formatDate(msgList.getE01FRAMAD())%>
		  </td>	

          		  		  		  		  	  		  		  
          
		</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    if ( prList.getShowPrev() ) {
  		int pos = prList.getFirstRec() - 51;
  		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSETR0115?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    if (prList.getShowNext()) {
  		int pos = prList.getLastRec();
  		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSETR0115?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= prList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= prList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
