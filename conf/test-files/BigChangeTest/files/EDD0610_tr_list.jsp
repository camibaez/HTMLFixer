<HTML>
<HEAD>
<TITLE>
Funds Transfer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "transList" class= "datapro.eibs.beans.JBList"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<BODY onload="MM_preloadImages('collaterals_over.gif')">
<h3 align="center">Funds Transfer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDD0610_tr_list.jsp"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( transList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				There is not result for you are  search criteria 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="15%" >W/T Number</TH>
      <TH ALIGN=CENTER width="20%" >W/T Status</TH>
      <TH ALIGN=CENTER width="32%" >Beneficiaries</TH>
      <TH ALIGN=CENTER width="16%" >Value date</TH>
      <TH ALIGN=CENTER width="17%" >Amount</TH>
    </TR>
    <%
                transList.initRow();
                while (transList.getNextRow()) {
                    if (transList.getFlag().equals("")) {
                    		out.println(transList.getRecord());
                    }
                }
    %> 
  </TABLE>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( transList.getShowPrev() ) {
      			int pos = transList.getFirstRec() - 21;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=3&Type=" + transList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%         
        if ( transList.getShowNext() ) {
      			int pos = transList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=3&Type=" + transList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
 %>       
   </TD>
 	</TR>
 	</TABLE>   
<% 	  
  }
%>

</FORM>

</BODY>
</HTML>
