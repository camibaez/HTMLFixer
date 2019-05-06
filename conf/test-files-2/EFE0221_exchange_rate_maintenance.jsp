<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Exchange Rate Maintenance</title>
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

function goDetail(bnk,ccy,flag)
{
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0220?SCREEN=2&E01RATBNK=" + bnk + "&E01RATCCY=" + ccy + "&H01FLGWK1=" + flag;
	CenterWindow(page,560,500,2);
}
 function updateRows(i,last,first){
 	document.getElementById('TOTROWS').value = i;
	document.getElementById('NEXTROWS').value = last;
	document.getElementById('CURRROWS').value = first;
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

<h3 align="center">Exchange Rates Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="exchange_rate_maintenance.jsp, EFE0221"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0221">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="<%=request.getParameter("flag")%>">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">

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
    <TR id=clear>
          <td NOWRAP align="center" ><b></b></td>		  
		  <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>		  		  		  
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" colspan="2"><b>Counter Value</b></td>
          <td NOWRAP align="center" colspan="2"><B>Foreign Exchange</B></td>
          <td NOWRAP align="center" colspan="2"><B>7 / 15 /30/ 60 Days</B></td>
          <td NOWRAP align="center" colspan="2"><B>90 /120/ 150 Days</B></td>
          <td NOWRAP align="center" colspan="2"><B>180 / 270 / 360 Days</B></td>
    </TR>
    <TR id=trdark>
          <td NOWRAP align="center" ><b>Currency</b></td>		  
		  <td NOWRAP align="center" ><b>Spot<br>Rate</b></td>
          <td NOWRAP align="center" ><b>Previous<br>Update</b></td>		  		  		  
          <td NOWRAP align="center" ><b>Previuos<br>Spot Rate</b></td>
          <td NOWRAP align="center" ><b>Purchase<br>Rate</b></td>
          <td NOWRAP align="center" ><b>Sale<br>Rate</b></td>
          <td NOWRAP align="center" ><b>Purchase<br>Rate</b></td>
          <td NOWRAP align="center" ><b>Sale<br>Rate</b></td>
          <td NOWRAP align="center" ><b>Points<br></b></td>
          <td NOWRAP align="center" ><b>Rate<br></b></td>
          <td NOWRAP align="center" ><b>Points<br></b></td>
          <td NOWRAP align="center" ><b>Rate<br></b></td>
          <td NOWRAP align="center" ><b>Points<br></b></td>
          <td NOWRAP align="center" ><b>Rate<br></b></td>
    </TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
               EFE022101Message msgList = (EFE022101Message) prList.getRecord();			 
         %>             
    <TR id=trclear>
          <td NOWRAP align="right" >
          <a href="javascript:goDetail('<%=msgList.getE01RATBNK()%>','<%=msgList.getE01RATCCY()%>',document.forms[0]['H01FLGWK1'].value)">
          	<%=Util.formatCell(msgList.getE01RATCCY())%>&nbsp;</a>
          	<INPUT TYPE=HIDDEN NAME="E01RATBNK_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATBNK() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATCCY_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATCCY() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATPUD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATPUD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATRDD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATRDD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATPER_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATPER() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATMUD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATMUD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATKPR_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATKPR() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATKSR_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATKSR() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATDCP_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATDCP() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATTLR_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATTLR() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATTLO_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATTLO() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATBSE_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATBSE() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATNAC_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATNAC() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATNAT_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATNAT() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATREF_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATREF() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATUSD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATUSD() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATDSC_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATDSC() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATRF2_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATRF2() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATRF3_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATRF3() %>">
          	<INPUT TYPE=HIDDEN NAME="E01RATCLM_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RATCLM() %>">
          </td>		

		  <td NOWRAP align="right" >
		  	<input type="text" name="E01RATEXR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATEXR().trim() %>" size="14" maxlength="13" onKeypress="enterSignDecimal">
		  </td>
		  <td NOWRAP align="center" >
          	<%=Util.formatDate(msgList.getE01RATPUD())%>
		  </td>	
          <td NOWRAP align="right" >
          	<%=Util.formatCell(msgList.getE01RATPER())%>
		  </td>		  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01RATCPR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATCPR() %>" size="14" maxlength="13" onKeypress="enterSignDecimal">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATCSR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATCSR() %>" size="14" maxlength="13" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFPR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFPR() %>" size="14" maxlength="13" onKeypress="enterSignDecimal">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFSR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFSR() %>" size="14" maxlength="13" onKeypress="enterSignDecimal">
		  </td>
		  <td NOWRAP align="right" >
		   <input type="text" name="E01P7_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P7().trim() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR1_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR1() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P90_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P90() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR5_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR5() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P180_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P180() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
		  <td NOWRAP align="right">
           	<input type="text" name="E01RATFR8_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR8() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>
	</TR>		  		  		  		 
		 
	<TR>		  
		  <td NOWRAP align="center" colspan="4"><b><%=Util.formatCell(msgList.getE01RATDSC())%></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
		  		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P15_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P15() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR2_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR2() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P120_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P120() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR6_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR6() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P270_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P270() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR9_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR9() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
	</TR>
		 
	<TR>		  
		  <td NOWRAP align="center" ><b></b></td>		  
		  <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>		  		  		  
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
		 
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P30_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P30() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR3_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR3() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P150_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P150() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR7_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR7() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P360_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P360() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATF10_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATF10() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
	</TR>
	
	<TR>		  
		  <td NOWRAP align="center" ><b></b></td>		  
		  <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>		  		  		  
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
          <td NOWRAP align="center" ><b></b></td>
	
		  <td NOWRAP align="right" >
		  	<input type="text" name="E01P60_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01P60() %>" size="4" maxlength="3" onKeypress="enterInteger">
		  </td>
          <td NOWRAP align="right" >
		  	<input type="text" name="E01RATFR4_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01RATFR4() %>" size="17" maxlength="15" onKeypress="enterSignDecimal">
		  </td>		  		  		  		  	  		  		  
          
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="100%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    if ( prList.getShowPrev() ) {
  		int pos = prList.getFirstRec() - 51;
  		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0221?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    if (prList.getShowNext()) {
  		int pos = prList.getLastRec();
  		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0221?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	updateRows(<%= i%>,<%= prList.getLastRec()%>,<%= prList.getFirstRec()%>);

</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
