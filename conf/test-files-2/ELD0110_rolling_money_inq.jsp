<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Anti-Money Laundering ("AML")</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function showInquiry(app, acc) {

	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELD0110?SCREEN=3&APP=" + app + "&ACC=" + acc;
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

 
<h3 align="center">Anti-Money Laundering Activity Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rolling_money_inq.jsp, ELD0110"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELD0110">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  
     
     
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ROLACC" size="9" maxlength="9" readonly value="<%= userPO.getHeader5().trim()%>">
               </div>                                                                             
            </td>
            <td nowrap width="25%" > 
              <div align="right"><b>Account Type :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ROLATY" size="4" maxlength="4" readonly value="<%= userPO.getHeader6().trim()%>">
              </div>
            </td>  
            <td nowrap width="25%" > 
              <div align="right"><b>Customer :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ROLCUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader7().trim()%>">
              </div>
            </td>  
           </tr>
          
            
          <tr id="trdark"> 
            <td nowrap width="10%"> 
              <div align="right"><b>Range :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01RANGO" size="3" maxlength="3" readonly value="<%= userPO.getHeader4().trim()%>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>From  Date :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              <input type="text" name="E01ROLTO1" size="2" maxlength="2" readonly value="<%= userPO.getHeader8().trim()%>">
              <input type="text" name="E01ROLTO2" size="2" maxlength="2" readonly value="<%= userPO.getHeader9().trim()%>">
              <input type="text" name="E01ROLTO3" size="2" maxlength="2" readonly value="<%= userPO.getHeader10().trim()%>">
              </div>
            </td> 
            <td nowrap width="10%"> 
              <div align="right"><b>To  Date :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              <input type="text" name="E01FRODTE1" size="2" maxlength="2" readonly value="<%= userPO.getHeader1().trim()%>">
              <input type="text" name="E01FRODTE2" size="2" maxlength="2" readonly value="<%= userPO.getHeader2().trim()%>">
              <input type="text" name="E01FRODTE3" size="2" maxlength="2" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td> 
             
             
                         
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
  </table>
  
    
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
<%
	}
	else {
%>
  
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Activity Type</TH>
      <TH ALIGN=CENTER  nowrap >Actual <BR>Counter </TH>
      <TH ALIGN=CENTER  nowrap >Expected<BR>Counter</TH>
      <TH ALIGN=CENTER  nowrap >Actual<BR>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Expected<BR>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Variation</TH>    
    </TR>
    
    <%
    	  String E01FRODT1 = userPO.getHeader1();
    	  String E01FRODT2 = userPO.getHeader2();
    	  String E01FRODT3 = userPO.getHeader3();
    	  String E01RANGO = userPO.getHeader4();
    	   
                   
          beanList.initRow();             
          while (beanList.getNextRow()) {
               ELD011001Message msgList = (ELD011001Message) beanList.getRecord();		
       %>             
        <TR>
        	<td nowrap > 
        	    <input  name="E01ROLTYP" readonly value='<%= msgList.getE01ROLTYP().trim()%>'>               
                
            </td>
          <!-- <td NOWRAP >
          	<a href= ><%=Util.formatCell(msgList.getE01ROLTYP())%></a>
		  </td>	-->		  		  	  
		  <td NOWRAP align=center>		    
          	 <a href ><%= Util.formatCell(msgList.getE01ROLCEX())%></a> 
		  </td>
		  <td NOWRAP align=center>
          	<a href ><%=Util.formatCell(msgList.getE01ROLCRE())%></a>          	
		  </td>
		  <td NOWRAP align=center>
          	<a href ><%=Util.formatCell(msgList.getE01ROLAEX())%></a>
		  </td>   
		   
		  <td NOWRAP align=center>
          	<a href ><%=Util.formatCell(msgList.getE01ROLARE())%></a>
		  </td>
		   <td NOWRAP align=center>
          	<a href ><%=Util.formatCell(msgList.getE01ROLVAR())%></a>
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
      			int pos =beanList.getFirstRec() - 51;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELD0110?SCREEN=2&E01FRODT1=" + E01FRODT1 + "&E01FRODT2=" + E01FRODT2 + "&E01FRODT3=" + E01FRODT3+ "&E01RANGO=" + E01RANGO + "&FromRecord=" + pos +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( beanList.getShowNext() ) {
      			int pos = beanList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSELD0110?SCREEN=2&E01FRODT1=" + E01FRODT1 + "&E01FRODT2=" + E01FRODT2 + "&E01FRODT3=" + E01FRODT3+ "&E01RANGO=" + E01RANGO + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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
