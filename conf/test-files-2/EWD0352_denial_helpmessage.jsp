<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Ofac Denial</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0352Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1, desc) {

  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  top.opener.document.forms[0][top.opener.fieldName].focus();
  
  if (top.opener.fieldDesc != null || top.opener.fieldDesc != ""){
   	top.opener.document.forms[0][top.opener.fieldDesc].value = desc;
  }
 
  top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0352Help.getNoResult() ) {
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
   
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th>Code</th>
    <th>Name</th>
  </tr>
  <%
                EWD0352Help.initRow();
                while (EWD0352Help.getNextRow()) {
                    if (EWD0352Help.getFlag().equals("")) {
                    		out.println(EWD0352Help.getRecord());
                    }
                }
    %> 
</TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0352Help.getShowPrev() ) {
      			int pos =EWD0352Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0352?FromRecord=" + pos  + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0352Help.getShowNext() ) {
      			int pos = EWD0352Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0352?FromRecord=" + pos +   "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%
   }  
%>
</body>
</html>