<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
var form= top.opener.document.forms[0];
form[top.opener.fieldName].value = code;
form[top.opener.fieldName].focus();
top.close();
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0336Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( ewd0336Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b> There is no match for your  search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'100%'">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="20%">Customer</TH> 
      <TH ALIGN=CENTER  nowrap width="10%">Account</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Original<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Participated <br> Amount</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Available <br> Amount</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Maturity </TH>
      <TH ALIGN=CENTER  nowrap width="10%">Rate</TH>
    </TR>
    <%
                
                String NameSearch = (String)session.getAttribute("NameSearch");
                ewd0336Help.initRow();               
                while (ewd0336Help.getNextRow()) {
                    EWD0336DSMessage msgHelp = (EWD0336DSMessage) ewd0336Help.getRecord();			 
                    
       %>             
                    
          <TR>
           <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.formatCell(msgHelp.getSWDDSC())%></a>
		  </td>
		  <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.formatCell(msgHelp.getSWDACC())%></a>
		  </td>
		  <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.formatCell(msgHelp.getSWDCCY())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.fcolorCCY(msgHelp.getSWDOAM())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.fcolorCCY(msgHelp.getSWDASD())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.fcolorCCY(msgHelp.getSWDAMT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.formatDate(msgHelp.getSWDMD1(),msgHelp.getSWDMD2(),msgHelp.getSWDMD3())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getSWDACC()%>')">
										<%=Util.formatCell(msgHelp.getSWDRTE())%></a>
		  </td>
		</TR>
        <%        }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0336Help.getShowPrev() ) {
      			int pos =ewd0336Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0336?NameSearch=" + NameSearch + "&FromRecord=" + pos  +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0336Help.getShowNext() ) {
      			int pos = ewd0336Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0336?NameSearch=" + NameSearch + "&FromRecord=" + pos  + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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