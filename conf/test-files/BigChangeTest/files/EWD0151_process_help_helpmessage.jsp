<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>
<script language="javascript">
//<!-- Hide from old browsers
function enter(code, desc) {
	var oForm = top.opener.document.forms[0];
	if (top.opener.fieldName != "" && oForm[top.opener.fieldName]) {
		oForm[top.opener.fieldName].value = code;
	}
	if (top.opener.fieldAux1 != "" && oForm[top.opener.fieldAux1]) {
		oForm[top.opener.fieldAux1].value = desc;
	}
	top.close();
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "EWD0151Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>

 <SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( EWD0151Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD>

      <div align="center"> <font size="3"><b> There is no results for your search criteria</b></font>
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>

  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="15%">Product</TH>
      <TH ALIGN=CENTER  nowrap width="55%">Description</TH>
    </TR>
    <%
                String AppCode = (String)request.getAttribute("AppCode");
                EWD0151Help.initRow();
                while (EWD0151Help.getNextRow()) {
                    if (EWD0151Help.getFlag().equals("")) {
                    		out.println(EWD0151Help.getRecord());
                    }
                }
              %>
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0151Help.getShowPrev() ) {
      			int pos = EWD0151Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+ request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0151?Process=P&FromRecord=" + pos + " \"> <img src=\"" + request.getContextPath() + "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%
        if ( EWD0151Help.getShowNext() ) {
      			int pos = EWD0151Help.getLastRec();
      			out.print("<A HREF=\"" +request.getContextPath() +"/servlet/datapro.eibs.helps.JSEWD0151?Process=P&FromRecord=" + pos + " \" ><img src=\""+ request.getContextPath() + "/images/s/next_records.gif\" border=0></A>");

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

