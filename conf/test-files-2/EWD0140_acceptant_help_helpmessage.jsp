<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(code,nda) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++){
var elementName= top.opener.document.forms[0].elements[n].name;
    if(elementName == top.opener.fieldAux1) {
		top.opener.document.forms[0].elements[n].value = nda;
	}
	if(elementName == top.opener.fieldName){
  		top.opener.document.forms[0].elements[n].value = code;
  		//break;
	}
	
 }
top.close();
 }
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ewd0140Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0140Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your search criteria</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="60%">Name</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Identification</TH>
    </TR>
    <%
                String NameSearch = (String)request.getAttribute("NameSearch");
                String FromRecord = (String)request.getAttribute("FromRecord");
             
                ewd0140Help.initRow();
                while (ewd0140Help.getNextRow()) {
                    if (ewd0140Help.getFlag().equals("")) {
                    		out.println(ewd0140Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0140Help.getShowPrev() ) {
      			int pos = ewd0140Help.getFirstRec() - 21;
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0140?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0140Help.getShowNext() ) {
      			int pos = ewd0140Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0140?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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