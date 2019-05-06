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
			 if (op == 'M'){
      	 	   document.forms[0].SCREEN.value = 3;
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

<h3 align="center">Portfolio Management -  Reference Numbers<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_collaterals_list.jsp, EIE0230"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0230">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
    
<%
	if ( beanList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There is no Result for your search criteria.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>  
      <TD ALIGN=CENTER class="TDBKG" width="100%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
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
            <td nowrap width="14%"> 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> <%= userPO.getHeader1()%> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader2()%> </b> </div>
            </td>
          </tr>
        </table>
     </td>
    </tr>
  </table>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="javascript:goAction('M')">Maintenance</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Reference<br>Number</TH>
      <TH ALIGN=CENTER  nowrap >Intrument</TH>
      <TH ALIGN=CENTER  nowrap >Type</TH>
      <TH ALIGN=CENTER  nowrap >Ccy</TH>
      <TH ALIGN=CENTER  nowrap >Nominal<br> Value</TH>      
      <TH ALIGN=CENTER  nowrap >Quantity</TH>      
      <TH ALIGN=CENTER  nowrap >Max.<br>Collateral %</TH>
      <TH ALIGN=CENTER  nowrap >Investment<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Hold<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Available<br>Balance</TH>
    </TR>
    
    <%
    	  String E01MIVCUN = userPO.getHeader1();
    	  String D01CUSNA1 = userPO.getHeader2();
    
          int row;
 		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
               
          beanList.initRow();             
          while (beanList.getNextRow()) {
               EIE023001Message msgList = (EIE023001Message) beanList.getRecord();		
       %>             
        <TR>
          <td align="center" nowrap > 
        	<INPUT TYPE="radio" NAME="ROW" VALUE="<%= beanList.getCurrentRow() %>" <% if (beanList.getCurrentRow() == row) out.print("checked"); %> >
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01MIVACC())%>
		  </td>		  
		  <td NOWRAP >
			<%=Util.formatCell(msgList.getE01MIVIIC())%> -
			<%=Util.formatCell(msgList.getD01ISIDSC())%>
		  </td>		  
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVPTY())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVCCY())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVCNV())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVCQY())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVMXC())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVCAM())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01MIVHAM())%>
		  </td>
		  <td NOWRAP >
          	<%=Util.formatCell(msgList.getE01CAVBAL())%>
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
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0230?SCREEN=2&E01MIVCUN=" + E01MIVCUN + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0230?SCREEN=2&E01MIVCUN=" + E01MIVCUN + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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
