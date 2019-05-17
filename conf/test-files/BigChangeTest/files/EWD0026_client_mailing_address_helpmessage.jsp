<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Mailing Address Search</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0026Help" class= "datapro.eibs.beans.JBListRec"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
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
</head>
<body>
<%
	if ( ewd0026Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> There is no match for your search 
        criteria </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
	  ewd0026Help.initRow();
         while (ewd0026Help.getNextRow()) {
            if (ewd0026Help.getFlag().equals("")) {
%>
					  <BR>
					  <TABLE class=tableinfo style="width:95%" align=center>
						 <TR >
						  <td width=20% id ="trdark" align=right >Account No.: </td>
					         
    <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(1)%></a></td>
						</TR>
						<TR>
						 <td width=20% id ="trdark" align=right>Address No.: </td>
						 
    <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(0)%></a></td>
						</TR>
						<TR >
						 <td width=20% id ="trdark" align=right>Name : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(2)%></a></td>
						</TR>
						<TR>
						 <td width=20% id ="trdark" align=right> Address : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')">
						   <%=ewd0026Help.getRecord(3)%><BR>
						   <%=ewd0026Help.getRecord(4)%><BR>
						   <%=ewd0026Help.getRecord(5)%></a></td>
						<TR >
						 <td width=20% id = "trdark" align=right> City : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(6)%></a></td>
						</TR>
						<TR>
						 <td width=20% id = "trdark" align=right> State : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(7)%></a></td>
						</TR>
						<TR >
						 <td width=20% id = "trdark" align=right>Country : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(8)%></a></td>
						</TR>
						<TR>
						 <td width=20% id = "trdark" align=right> Zip Code : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(9)%></a></td>
						</TR>
						<TR >
						 <td width=20% id = "trdark" align=right> P.O Box : </td>
						 <td width=80%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(10)%></a></td>
						</TR>
					</TABLE>				
					<BR>
  <%
                    }
                }
            }    
  %> 
</body>
</html>