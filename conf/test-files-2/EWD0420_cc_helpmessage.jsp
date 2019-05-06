<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Debit Cards</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0420Help" class= "datapro.eibs.beans.JBList" scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers

function enter(code) {
var form = top.opener.document.forms[0];
 form[top.opener.fieldName].value = code;
 top.close();
 }
 
//-->
</script>
</head>
<body>
<%
	if ( EWD0420Help.getNoResult() ) {
 %>
   		
<h4 align="center">Cards</h4>
<TABLE class="tbenter" width=100% height=100%>
   <TR>
      <TD> 
      	<div align="center"> <b> <B>There is no match for your search
		criteria </B></b></div>
      </TD>
    </TR>
</TABLE>
<%  
	}
	else {
%>	  
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Card Number</th>
    <th> <div align="left">Creation Date</div></th>
    <th> <div align="left">Expiration Date</div></th>
  </tr>
  <%
                EWD0420Help.initRow();
                while (EWD0420Help.getNextRow()) {
                    if (EWD0420Help.getFlag().equals("")) {
                    		out.println(EWD0420Help.getRecord());
                    }
                }
    %> 
</TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0420Help.getShowPrev() ) {
      			int pos = EWD0420Help.getFirstRec() - 21;
      			out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.helps.JSEWD0420?FromRecord=" + pos + "&codeflag=" + userPO.getHeader20() + "&type=" + userPO.getHeader21() + "&branch=" + userPO.getHeader22() + "&user=" + userPO.getHeader23() + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
		%>
	  </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0420Help.getShowNext() ) {
      			int pos = EWD0420Help.getLastRec() + 1;
      			out.print("<A HREF=\"" + request.getContextPath()+ "/servlet/datapro.eibs.helps.JSEWD0420?FromRecord=" + pos + "&codeflag=" + userPO.getHeader20() + "&type=" + userPO.getHeader21() + "&branch=" + userPO.getHeader22() + "&user=" + userPO.getHeader23() + "\" ><img src=\""+ request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
        }
		%>
	  </TD>
	 </TR>
</TABLE>

<%
   }  
%>
</body>
</html>