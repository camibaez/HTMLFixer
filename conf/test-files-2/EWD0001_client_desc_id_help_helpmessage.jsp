<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %><META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(row) {
	var code = tbList.rows[row +1].cells[0].innerText;		
	var desc = tbList.rows[row +1].cells[1].innerText;
	var id = tbList.rows[row +1].cells[2].innerText;
	
	parent.query.enterAction(code,desc,id); 
	   
 }
//-->
</script>
</head>

<jsp:useBean id= "ewd0001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0001Help.getNoResult() ) {
		String sMsg = "";
		if (userPO.getHeader1().equals("*")) {
			sMsg = "User does not have authority level to see this customer";
		} else {
			//sMsg = "There is no match for your search criteria";
			sMsg = "Your search criteria does not exist in files";
		}	
	
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <b> <%= sMsg %></b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" id="tbList" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Customer /  Portfolio</th>
      <TH ALIGN=CENTER  nowrap width="50%">Short Name</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Identification</TH>
    </TR>
    <%
                String Type = (String)session.getAttribute("Type");
                String NameSearch = (String)session.getAttribute("NameSearch");
                ewd0001Help.initRow();
                while (ewd0001Help.getNextRow()) {
                	datapro.eibs.beans.EWD0001SMessage custbean = (datapro.eibs.beans.EWD0001SMessage) ewd0001Help.getRecord();
     %>				
				    <TR> 
				      <TD ALIGN=LEFT width="10%"><a href="javascript:enter(<%= ewd0001Help.getCurrentRow()%>)"><%= custbean.getSWDCUN() %></a></TD>
				      <TD ALIGN=LEFT width="50%"><a href="javascript:enter(<%= ewd0001Help.getCurrentRow()%>)"><%= custbean.getSWDSHN() %></a></TD>
				      <TD ALIGN=LEFT width="20%"><a href="javascript:enter(<%= ewd0001Help.getCurrentRow()%>)"><%= custbean.getSWDIDN() %></a></TD>
				    </TR>
    <%           } %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0001Help.getShowPrev() ) {
      			int pos =ewd0001Help.getFirstRec() - 81;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0001Help.getShowNext() ) {
      			int pos = ewd0001Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>

