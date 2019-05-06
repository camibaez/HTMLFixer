<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Document List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "docList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"></SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT language="javascript">
  function goAction(row) {
     document.forms[0].ROW.value = row;
     document.forms[0].submit();
  }
  
<%
boolean menu = true;

if ( userPO.getPurpose().equals("INQUIRY") ) {
	if ( userPO.getOption().equals("RT") ) {
%>
		builtNewMenu(rt_i_opt);
<% } else if ( userPO.getOption().equals("SV") ) { %>
			builtNewMenu(sv_i_opt);
<% } else if (userPO.getOption().equals("CD")) { %>
			builtNewMenu(cd_i_opt);
<% } else if (userPO.getOption().equals("LN")) {
   			if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
				builtNewMenu(ln_i_1_opt);
<%   		} else  {  %>
				builtNewMenu(ln_i_2_opt);
<%  		}
 		 } else if ( userPO.getOption().equals("CLIENT_P") ) {
%>
					builtNewMenu(client_inq_personal_opt);
<%				} else if ( userPO.getOption().equals("CLIENT_C") ) {
%>
							builtNewMenu(client_inq_corp_opt);
<% 					   } else if ( userPO.getOption().equals("LC") ) {
%>
									builtNewMenu(lc_i_opt);
<%							  } else if ( userPO.getOption().equals("DV") ) {
%>
											builtNewMenu(coll_i_opt);
<%									 } else menu = false;
} else if ( userPO.getPurpose().equals("APPROVAL_INQ")) {
   
     		if ( userPO.getOption().equals("RT") ) {
%>
				builtNewMenu(rt_a_opt);
<%			} else if ( userPO.getOption().equals("SV") ) {
%>
						builtNewMenu(sv_a_opt);
<% 				   } else if (userPO.getOption().equals("CD")){
%>
								builtNewMenu(cd_a_opt);
<%   
						  } else if (userPO.getOption().equals("LN")){
%>
										builtNewMenu(ln_a_opt);
<%   
 								 } else if ( userPO.getOption().equals("CLIENT_P") ) {
%>
											 builtNewMenu(client_ap_personal_opt);
<%     
 										} else if ( userPO.getOption().equals("CLIENT_C") ) {
%>
													builtNewMenu(client_ap_corp_opt);
<%      
    										   } else menu = false;
   	} else menu = false;
%>
   
</SCRIPT>

</HEAD>

<BODY>

<% if (menu == true) { %>
<SCRIPT Language="Javascript">  initMenu(); </SCRIPT>
<% } %>

<h3 align="center">Documents<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="doc_inq_list.jsp, EDI0010"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">

<%
if ( docList.getNoResult() ) {
%>
  
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD> 
        <div align="center">
          <font size="3"><b>
        	There is no match for your search criteria 
          </b></font>
        </div>
      </TD>
    </TR>
  </TABLE>

<%   		
}
else {
%>

<% 
      	String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_INQ") ) {
              if ( !pagename.equals("") ) {
%>
       	<SCRIPT Language="Javascript">
	   		CenterWindow('<%= pagename %>',620,500,2);
       	</SCRIPT>
<% 
              }
	}
%> 

  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="15%">
		Table : 
      </TD>
      <TD ALIGN=LEFT width="5%">
		<%= userPO.getHeader18() %>
      </TD>
      <TD ALIGN=CENTER width="20%">
		Description : 
      </TD>
      <TD ALIGN=LEFT width="60%">
		<%= userPO.getHeader19() %>
      </TD>
    </TR>
  </TABLE>

  <TABLE class="tableinfo">
    <TR id="TRDARK"> 
      <TH ALIGN=CENTER>Sequence</TH>
      <TH ALIGN=CENTER>Description</TH>
      <TH ALIGN=CENTER>Frequency</TH>
      <TH ALIGN=CENTER>Status</TH>
      <TH ALIGN=CENTER>Expiration Date</TH>
    </TR>
  <%
                int row;
		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
                docList.initRow();
                while (docList.getNextRow()) {
					     if (!docList.getRecord(8).equals("0")) {
  %>

    <TR id="TRCLEAR"> 
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><%= docList.getRecord(2) %></A></TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><%= docList.getRecord(3) %></A></TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)">
        <% if (docList.getRecord(4).equals("M")) out.print("MONTHLY");
           else if (docList.getRecord(4).equals("B")) out.print("BI-MONTHLY"); 
           else if (docList.getRecord(4).equals("Q")) out.print("QUATERLY");
           else if (docList.getRecord(4).equals("S")) out.print("SEMESTRAL"); 
           else if (docList.getRecord(4).equals("X")) out.print("NO MATURE");
           else if (docList.getRecord(4).equals("1")) out.print("YEARLY");
           else if (docList.getRecord(4).equals("2")) out.print("EVERY TWO YEARS");
           else if (docList.getRecord(4).equals("3")) out.print("EVERY THREE YEARS");        
           else if (docList.getRecord(4).equals("4")) out.print("EVERY FOUR YEARS");
           else if (docList.getRecord(4).equals("5")) out.print("EVERY FIVE YEARS");
		   else out.print(""); %>
	  </A>	
      </TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)">
        <% if (docList.getRecord(5).equals("CO")) out.print("COMPLETED(SCANNED)");
           else if (docList.getRecord(5).equals("NP")) out.print("NOT PRESENT");
           else if (docList.getRecord(5).equals("")) out.print("INCOMPLETE");
           else if (docList.getRecord(5).equals("PD")) out.print("PAST DUE");
           else if (docList.getRecord(5).equals("NA")) out.print("NOT APPLICABLE");
		   else out.print(""); %>	
	  </A>
      </TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><%= Util.formatDate(docList.getRecord(9),docList.getRecord(10),docList.getRecord(11))%></A></TD>      
    </TR>

  <%
                  }
                  else {
  %>

    <TR id="TRCLEAR"> 
      <TD NOWRAP ALIGN=CENTER><%= docList.getRecord(2) %></TD>
      <TD NOWRAP ALIGN=CENTER><%= docList.getRecord(3) %></TD>
      <TD NOWRAP ALIGN=CENTER>
        <% if (docList.getRecord(4).equals("M")) out.print("MONTHLY");
           else if (docList.getRecord(4).equals("B")) out.print("BI-MONTHLY"); 
           else if (docList.getRecord(4).equals("Q")) out.print("QUATERLY");
           else if (docList.getRecord(4).equals("S")) out.print("SEMESTRAL"); 
           else if (docList.getRecord(4).equals("X")) out.print("NO MATURE");
           else if (docList.getRecord(4).equals("1")) out.print("YEARLY");
           else if (docList.getRecord(4).equals("2")) out.print("EVERY TWO YEARS");
           else if (docList.getRecord(4).equals("3")) out.print("EVERY THREE YEARS");        
           else if (docList.getRecord(4).equals("4")) out.print("EVERY FOUR YEARS");
           else if (docList.getRecord(4).equals("5")) out.print("EVERY FIVE YEARS");
		   else out.print(""); %>
      </TD>
      <TD NOWRAP ALIGN=CENTER>
        <% if (docList.getRecord(5).equals("CO")) out.print("COMPLETED(SCANNED)");
           else if (docList.getRecord(5).equals("NP")) out.print("NOT PRESENT");
           else if (docList.getRecord(5).equals("")) out.print("INCOMPLETE");
           else if (docList.getRecord(5).equals("PD")) out.print("PAST DUE");
           else if (docList.getRecord(5).equals("NA")) out.print("NOT APPLICABLE");
		   else out.print(""); %>	
      </TD>
      <TD NOWRAP ALIGN=CENTER><%= Util.formatDate(docList.getRecord(9),docList.getRecord(10),docList.getRecord(11))%></TD>      
    </TR>

  <%
                  }
                }
  %> 
  </TABLE>

<%
}
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</FORM>

</BODY>
</HTML>
