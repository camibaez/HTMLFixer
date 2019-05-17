<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Payment Orders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function setInfo(idx,cancel){  
  for ( var i=2; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idx].className="trhighlight";
   document.forms[0].actRow.value = idx; 
   document.forms[0].actRowCancel.value = cancel;   
}

function goAction(op) {
    var page = "";
    var params ="" 
    if (op == "D") {
    	if (document.forms[0].actRowCancel.value == 'Y') {
    		  alert("The select order it's already canceled");
    		  return;
    	}
    	ok = confirm("The select order will be canceled");
    	if (ok) document.forms[0].submit();
    } else {  
    	if (op == "M" || op == "I" || op == "S") {
    		if (document.forms[0].actRowCancel.value == 'Y' && op == "M"){
    		  alert("Canceled Order, The maintenance can't proceed");
    		  return;
    		}
        	var row = parseInt(document.forms[0].actRow.value) - 2;   
	 		params = "&ROW=" + row; 	
		}
		if (op == "S" ) {
		    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2030?SCREEN=2" + params;
		} else {
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000?SCREEN=400&opt=" + op + params;	
		}
		CenterWindow(page,640,500,2);
	}		 
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

<h3 align="center">Payment Order Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_list.jsp,EPR2000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="actRowCancel" VALUE="">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PRPDAC" size="17" maxlength="15" value="<%= userPO.getAccNum()%>" readonly>
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
      <div align="center"> <h4 style="text-align:center"> That account does not have payment orders. <br>Select New to add new orders</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
           <tr>
              <td class=TDBKG width="50%">
                <div align="center"> <a href="javascript:goAction('N')"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="50%">
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
           </tr>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction('N')">New</a>
      </TD>
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction('I')">Inquiry</a>
      </TD>
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction('S')">Transaction<br>Inquiry</a>
      </TD>  
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction('M')">Maintenance</a>
      </TD> 
      <TD class="TDBKG" width="16%" align="center">
  		<a href="javascript:goAction('D')">Delete</a>
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
      <TH ALIGN=CENTER  nowrap rowspan=2>Status</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Credit</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Amount</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Currency</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Frequency</TH>
      <TH ALIGN=CENTER  nowrap colspan=2>Last Payment.</TH>
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Date</TH>
      <TH ALIGN=CENTER  nowrap >Amount</TH>
    </TR>
    <%
          String prNum = userPO.getIdentifier();
          String chk = "checked";      
          prList.initRow();               
          while (prList.getNextRow()) {
               EPR200001Message msgList = (EPR200001Message) prList.getRecord();
               if (!prNum.equals("")) {               
                 chk = (prNum.equals(msgList.getE01PRPNUM())) ? "checked" : "";                               		 
               }     
       %>             
                    
          <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="ROW" value="<%= prList.getCurrentRow() %>" onClick="setInfo(<%= prList.getCurrentRow() + 2 %>,'<%= msgList.getE01PRPFL3()%>')" <%= chk%>>
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01PRPNUM())%>
		  </td>
		  <td NOWRAP align=center>
          	<% 
          	if(msgList.getE01PRPFL3().equals("Y")) {
          		if(msgList.getE01PRPFL1().equals("A")) out.print("Canceled");
                else out.print("Pending Cancelation");
          	} else {
          		if(msgList.getE01PRPFL1().equals("A")) out.print("Authorized");
                else out.print("Pending Authorization");
             } %>
		  </td>
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE01PRPCAC())%>
		  </td>		  
		  <td NOWRAP >
          	<%=Util.fcolorCCY(msgList.getE01PRPAMT())%>
		  </td>
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE01PRPTCY())%>
		  </td>
		  <td NOWRAP >
			<% if(msgList.getE01PRPFRQ().equals("D")) out.print("Diary");
                else if(msgList.getE01PRPFRQ().equals("W")) out.print("Weekly");
                else if(msgList.getE01PRPFRQ().equals("M")) out.print("Monthly");
                else if(msgList.getE01PRPFRQ().equals("V")) out.print("Variable");
                else if(msgList.getE01PRPFRQ().equals("2")) out.print("Every 2 Month");
                else if(msgList.getE01PRPFRQ().equals("3")) out.print("Every 3 Month");%>
		  </td>	
		  <td NOWRAP >
          	<%=Util.formatDate(msgList.getE01PRPLPD(),msgList.getE01PRPLPM(),msgList.getE01PRPLPY())%>
		  </td>
		  <td NOWRAP align=right>
          	<%=Util.fcolorCCY(msgList.getE01PRPLPA())%>
		  </td>
		</TR>
        <%    
           chk ="";
         }
         %> 
  </TABLE>
  <SCRIPT language="JavaScript">     
	 showChecked("ROW"); 
	 <%  if (!prNum.equals("")) {%>
	 		goAction('M');
	 <% } %>         
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
