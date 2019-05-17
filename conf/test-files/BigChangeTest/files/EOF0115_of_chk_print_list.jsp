<HTML>
<HEAD>
<TITLE>
Official Checks
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">

function enter(accnum , currency) {
   document.forms[0].E01OFMCKN.value = accnum;
   document.forms[0].E01OFMCCY.value = currency;
   document.forms[0].submit();
}
</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
<INPUT TYPE=HIDDEN NAME="E01OFMCCY" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01OFMCKN" VALUE="">


  <h3 align="center"> Official Checks Print<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,EOF0115"> 
  </h3>
<hr size="4">

<%
	if ( dvList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <b> There is no match for your search 
          criteria </b> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="94%">
    <TR> 
      <TD ALIGN=CENTER width="33%">&nbsp;</TD>
      <TD ALIGN=CENTER width="33%">&nbsp;</TD>
      <TD ALIGN=CENTER width="34%">&nbsp;</TD>
    </TR>
  </TABLE>
        
  
  <table class="tableinfo">
    <tr id=trdark>
      <th align=CENTER  nowrap width="1%">&nbsp;</th>
      <th align=CENTER  nowrap width="14%">Reference</th>
      <th align=CENTER  nowrap width="6%">Currency</th>
      <th align=CENTER  nowrap width="6%">Branch</th>
      <th align=CENTER  nowrap width="7%">Amount</th>
      <th align=CENTER  nowrap width="5%"> 
        <div align="right">Status</div>
      </th>
      <th align=CENTER  nowrap width="6%"> 
        <div align="center">Issued</div>
      </th>
      <th align=CENTER  nowrap width="55%"> 
        <div align="center">Beneficiary</div>
      </th>
    </tr>
    <%
                dvList.initRow();
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    }
                }
              %> 
  </table>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( dvList.getShowPrev() ) {
      			int pos =dvList.getFirstRec() - 51;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115P?Pos=" + pos + "&SCREEN=100" +  "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115P?Pos=" + pos + "&SCREEN=100" +  "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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
