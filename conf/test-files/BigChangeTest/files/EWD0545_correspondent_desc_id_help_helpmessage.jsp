<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<%@ page import = "datapro.eibs.master.Util" %>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript" >
//<!-- Hide from old browsers
  //document.write(parent.query.document.scripts["eAction"].innerText);

function enter(code,id) {

  parent.query.enterAction(code,id); 
	   
 }
//-->
</script>
</head>

<jsp:useBean id= "EWD0545Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( EWD0545Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your search criteria </b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER >
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">BIC</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Name</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Branch</TH>
      <TH ALIGN=CENTER  nowrap width="20%">City</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Country</TH>
    </TR>
    <%
                String Type = (String)request.getAttribute("Type");
                String NameSearch = (String)request.getAttribute("NameSearch");
                String CusType = (String)request.getAttribute("CusType");
                EWD0545Help.initRow();
                while (EWD0545Help.getNextRow()) {
               		out.println(EWD0545Help.getRecord());
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0545Help.getShowPrev() ) {
      			int pos =EWD0545Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0545?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&CusType=" + CusType + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0545Help.getShowNext() ) {
      			int pos = EWD0545Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0545?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&CusType=" + CusType + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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

