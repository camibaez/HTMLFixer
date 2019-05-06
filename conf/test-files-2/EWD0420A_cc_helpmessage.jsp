<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Debit Card</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0420Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers

function enter(code, mEx, yEx, dEm, mEm, yEm) {
var form = top.opener.document.forms[0];
 form[top.opener.fieldName].value = code;
 form[top.opener.monthEx].value = mEx;
 form[top.opener.yearEx].value = yEx;
 form[top.opener.dayEm].value = dEm;
 form[top.opener.monthEm].value = mEm;
 form[top.opener.yearEm].value = yEm;
 
 top.close();
 }
 
//-->
</script>
</head>
<body>
<%
	if ( EWD0420Help.getNoResult() ) {
 %>
   		
<h4 align="center">Debit Card</h4>
<TABLE class="tbenter" width=100% height=100%>
   <TR>
      <TD> 
      	<div align="center"> <b> <B><B>There is no match for your search
		criteria </B></B></b></div>
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
<%
   }  
%>
</body>
</html>