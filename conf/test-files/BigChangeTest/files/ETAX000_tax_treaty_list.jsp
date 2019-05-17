<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tax Treaty Table List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


function goAction(op) {

    document.forms[0].opt.value = op;
    if (op == 'N') { //new
          document.forms[0].SCREEN.value = 3; 
          document.forms[0].submit();
    } else {
      	   var formLength= document.forms[0].elements.length;
           var ok = false;
		   var row = "";
           for(n=0;n<formLength;n++)
           {
            	var elementName= document.forms[0].elements[n].name;
            	if(elementName == "ROW") 
            	{
					if (document.forms[0].elements[n].checked == true) {
               			ok = true;
						row =  document.forms[0].elements[n].value;
              			break;
					}
            	}
            }
      	 if ( ok ) {
			 if (op == 'D') {//delete
      	 		
      	 		if (confirm('Are you Sure you Want to Delete this Item?')) {
      	 			document.forms[0].SCREEN.value = 7;
      	 			document.forms[0].submit();
      	 		}
      	 	
      	 	} else
      	 	   document.forms[0].SCREEN.value = 5;
			   document.forms[0].submit();
           }
           else {
      			alert("A valid name must be selected before this operation");	   
           }
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

<h3 align="center">Tax Treaty Table List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fx_list.jsp, EFE0100"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSETAX000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TAXINC" VALUE="<%=userPO.getHeader1()%>">
  <INPUT TYPE=HIDDEN NAME="E01TAXCTR" VALUE="<%=userPO.getHeader2()%>">
      
<%
	if ( beanList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There is no Result for your search criteria. <br>Click New to add one</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<a href="javascript:goAction('N')">New</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('N')">New</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('M')">Maintenance</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('D')">Delete</a>
      </TD>            
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Income<br>Code</TH>
      <TH ALIGN=CENTER  nowrap >Income<br>Description</TH>
      <TH ALIGN=CENTER  nowrap >Country</TH>
      <TH ALIGN=CENTER  nowrap >Withholding<br>Tax Rate</TH>      
    </TR>
    
    <%
    	  String E01TAXINC = userPO.getHeader1();
    	  String E01TAXCTR = userPO.getHeader2();
    
          int row;
 		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
               
          beanList.initRow();             
          while (beanList.getNextRow()) {
               ETAX00001Message msgList = (ETAX00001Message) beanList.getRecord();		
       %>             
        <TR>
          <td align="center" nowrap > 
        	<INPUT TYPE="radio" NAME="ROW" VALUE="<%= beanList.getCurrentRow() %>" <% if (beanList.getCurrentRow() == row) out.print("checked"); %> >
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01TAXINC())%>
		  </td>		  
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getD01INCNME())%>
		  </td>		  
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getD01CTRNME())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01TAXRTE())%>
		  </td>
		</TR>
		
        <% 
         }
         %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( beanList.getShowPrev() ) {
      			int pos =beanList.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSETAX000?SCREEN=2&E01TAXINC=" + E01TAXINC + "&E01TAXCTR=" + E01TAXCTR + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSETAX000?SCREEN=2&E01TAXINC=" + E01TAXINC + "&E01TAXCTR=" + E01TAXCTR + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</form>
</body>
</html>
