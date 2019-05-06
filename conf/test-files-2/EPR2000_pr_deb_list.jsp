<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Credit Account Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

function setInfo(idx){  
  for ( var i=2; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idx].className="trhighlight";
   document.forms[0].actRow.value = idx;    
}

function goAction() {	
	var row = parseInt(document.forms[0].actRow.value) - 2; 
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000?SCREEN=700&opt=I&ROW=" + row; 
	CenterWindow(page,600,500,2);
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

<h3 align="center">Credit Accounts Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_deb_list.jsp,EPR2000"></h3>
<hr size="4">

<form >

  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="actRowCancel" VALUE="">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Credit Account: </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PRPCAC" size="9" maxlength="9" value="<%= userPO.getAccNum()%>" readonly>
              </div>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
      
<%
	if ( prList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> The selected account doesn't have a linked debit account.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	
<%
	}
	else {
%>
  
  <BR>
  <TABLE class="tbenter">
    <TR>
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction()">Inquiry</a>
      </TD>
       <TD class="TDBKG" width="20%" align="center">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>  
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%" rowspan=2></TH> 
      <TH ALIGN=CENTER  nowrap rowspan=2>Ref.</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Debit Acc</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Amount</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Currency</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Frequency</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Status</TH>
      <TH ALIGN=CENTER  nowrap colspan=2>Last Payment.</TH>
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Date</TH>
      <TH ALIGN=CENTER  nowrap >Amount</TH>
    </TR>
    <%
          
          prList.initRow();               
          while (prList.getNextRow()) {
               EPR200002Message msgList = (EPR200002Message) prList.getRecord();
               
               			 
                    
       %>             
                    
          <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="ROW" value="<%= prList.getCurrentRow() %>" onClick="setInfo(<%= prList.getCurrentRow() + 2 %>)" <% if (prList.getCurrentRow() == 0) out.print("checked");%>>
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE02PRPNUM())%>
		  </td>
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE02PRPDAC())%>
		  </td>		  
		  <td NOWRAP >
          	<%=Util.fcolorCCY(msgList.getE02PRPAMT())%>
		  </td>
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE02PRPTCY())%>
		  </td>
		  <td NOWRAP >
			<% if(msgList.getE02PRPFRQ().equals("D")) out.print("Diary");
                else if(msgList.getE02PRPFRQ().equals("W")) out.print("Weekly");
                else if(msgList.getE02PRPFRQ().equals("M")) out.print("Monthly");
                else if(msgList.getE02PRPFRQ().equals("V")) out.print("Variable");
                else if(msgList.getE02PRPFRQ().equals("2")) out.print("Every 2 Month");
                else if(msgList.getE02PRPFRQ().equals("3")) out.print("Every 3 Month");%>
		  </td>	
		  <td NOWRAP >
			<% if(msgList.getE02PRPFL1().equals("A")) out.print("Authorized");
                else out.print("Pending Authorization"); %>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatDate(msgList.getE02PRPLPD(),msgList.getE02PRPLPM(),msgList.getE02PRPLPY())%>
		  </td>
		  <td NOWRAP align=right>
          	<%=Util.fcolorCCY(msgList.getE02PRPLPA())%>
		  </td>
		</TR>
        <%        }
              %> 
  </TABLE>
   <SCRIPT language="JavaScript">     
	 showChecked("ROW"); 
       
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
