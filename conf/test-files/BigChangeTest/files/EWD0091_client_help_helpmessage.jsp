<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function enter(code,desc) {
var form= top.opener.document.forms[0];
 form[top.opener.fieldName].value = code;
 form[top.opener.fieldDesc].value = desc;
top.close();
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "EWD0091Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( EWD0091Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b> There is no match for your  search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
} else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="20%">Code</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Name</TH>
     </TR>
    <%
		String shrBank = (String)session.getAttribute("shrBank");
                String NameSearch = (String)session.getAttribute("NameSearch");
                String shrAppCode = (String)session.getAttribute("shrAppCode");
                String shrSelect = (String)session.getAttribute("shrSelect");
                EWD0091Help.initRow();
                while (EWD0091Help.getNextRow()) {
                    if (EWD0091Help.getFlag().equals("")) {
                    		out.println(EWD0091Help.getRecord());
                   }
                }
     %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%

        if ( EWD0091Help.getShowPrev() ) {
      		int pos =EWD0091Help.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0091?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0091Help.getShowNext() ) {
      		int pos = EWD0091Help.getLastRec();
		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0091?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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