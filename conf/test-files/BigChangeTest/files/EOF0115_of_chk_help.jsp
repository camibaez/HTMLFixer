
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Checks Issuance
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<BODY>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++){
var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName){
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
top.close();
 }
//-->
</script>



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<h3 align="center">Official Checks Issuance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="of_chk_help.jsp,EOF0115"> 
  </h3>
  <hr size="4">
<FORM>
<%
	if ( dvList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
        <div align="center"> <b> There is no match for your search 
          criteria </b></div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>

<BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Reference</TH>
      <TH ALIGN=CENTER  nowrap width="8%">Currency</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Branch</TH>
      <TH ALIGN=CENTER  nowrap width="9%">Amount</TH>
      <TH ALIGN=CENTER  nowrap width="5%"> 
        <div align="right">Status</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="6%"> 
        <div align="center">Issued</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="55%"> 
        <div align="center">Beneficiary</div>
      </TH>
    </TR>
    <%
                dvList.initRow();
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    }
                }
              %> 
  </TABLE>
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115?SCREEN=3&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115?SCREEN=3&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
