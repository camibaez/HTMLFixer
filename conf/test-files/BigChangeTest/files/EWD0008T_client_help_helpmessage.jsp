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
function enter(code1,code2) {
	  top.opener.document.forms[0][top.opener.fieldName].value = code1;
	  if (top.opener.fieldAux1 != '')
		  top.opener.document.forms[0][top.opener.fieldAux1].value = code2;
	  top.close();
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0008Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
  <h4 align="center"><%
	if ( ewd0008Help.getNoResult() ) {
%> </h4>
  <div align="center"></div>
  <TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <b> There is no match for your  search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap colspan="4">Product Selection</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="15%">Product Code</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Product Type</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="55%">Description</TH>
    </TR>
    <%
                String AppCode = (String)session.getAttribute("AppCode");
                String ProductBank = (String)session.getAttribute("ProductBank");
                String srhProduct = (String)session.getAttribute("srhProduct");
                ewd0008Help.initRow();
                while (ewd0008Help.getNextRow()) {
                    if (ewd0008Help.getFlag().equals("")) {
                    		out.println(ewd0008Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0008Help.getShowPrev() ) {
      			int pos =ewd0008Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0008?AppCode=" + AppCode + "&FromRecord=" + pos +  "&ProductBank=" + ProductBank + "&srhProduct=" + srhProduct + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0008Help.getShowNext() ) {
      			int pos = ewd0008Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0008?AppCode=" + AppCode + "&FromRecord=" + pos +  "&ProductBank=" + ProductBank + "&srhProduct=" + srhProduct + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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

