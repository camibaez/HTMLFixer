<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
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
<jsp:useBean id= "ewd0010Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( ewd0010Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b>There is no match for your search criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Bank</TH>
      <TH ALIGN=CENTER  nowrap width="10">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Account</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Description</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Class</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Type</TH>
      </TR>
    <%
                String shrBank = "";
                try {
                	if (session.getAttribute("shrBank") != null) {
                		shrBank = (String) session.getAttribute("shrBank");
                	}
                } catch (Exception e) {
                	shrBank = "";
                }
                String NameSearch = "";
                try {
                	if (session.getAttribute("NameSearch") != null) {
                		NameSearch = (String) session.getAttribute("NameSearch");
                	}
                } catch (Exception e) {
                	NameSearch = "";
                }
                String shrAppCode = "";
                try {
                	if (session.getAttribute("shrAppCode") != null) {
                		shrAppCode = (String) session.getAttribute("shrAppCode");
                	}
                } catch (Exception e) {
                	shrAppCode = "";
                }
                String shrCurrency = "";
                try {
                	if (session.getAttribute("shrCurrency") != null) {
                		shrCurrency = (String) session.getAttribute("shrCurrency");
                	}
                } catch (Exception e) {
                	shrCurrency = "";
                }
                ewd0010Help.initRow();
                while (ewd0010Help.getNextRow()) {
                    if (ewd0010Help.getFlag().equals("")) {
                    		out.println(ewd0010Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0010Help.getShowPrev() ) {
      			int pos =ewd0010Help.getFirstRec() - 21;
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0010?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrCurrency=" + shrCurrency +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0010Help.getShowNext() ) {
      			int pos = ewd0010Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0010?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrCurrency=" + shrCurrency+ "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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