<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<html>
<head><title>Offset Accounts, Concept</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0036Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1, code2, code3, code4, code5, code6) {
  //var formLength= top.opener.document.forms[0].elements.length;
  //var n= top.opener.document.forms[0][top.opener.fieldName].sourceIndex;
  //for(n=0;n<formLength;n++){
  //var elementName= top.opener.document.forms[0].elements[n].name;
 //	if(elementName == top.opener.fieldName){
  //		top.opener.document.forms[0].elements[n+1].value = code4;
  //		top.opener.document.forms[0].elements[n+2].value = code5;
  //		top.opener.document.forms[0].elements[n+3].value = code6;
  //		break;
	//}
 //}
  top.opener.UpdateCodes(top.opener.fieldName,code4,code5,code6);
  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  top.opener.document.forms[0][top.opener.fieldAux1].value = code2;
  top.opener.document.forms[0][top.opener.fieldAux2].value = code3;

  // top.opener.document.forms[0][top.opener.fieldName].value = code4;
  // top.opener.document.forms[0][top.opener.fieldCode5].value = code5;
  // top.opener.document.forms[0][top.opener.fieldCode6].value = code6;

  top.opener.document.forms[0][top.opener.fieldAux2].focus();

  top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0036Help.getNoResult() ) {
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
			 <th>Operation<BR> Code</th>
			 <th>Description</th>
			 <th>General<BR> Ledger</th>
			 <th>Source <BR> of<BR> Funds</th>
			 <th>Disbursement<BR> of <BR>Funds</th>
             <th>Uncollected <BR> Hold <BR>Days</th>
			</tr>	
			<TR>
			<td><a href="javascript:enter('','','','','','')">NONE</a></td>
			<td><a href="javascript:enter('','','','','','')">NONE</a></td>
			<td><a href="javascript:enter('','','','','','')">NONE</a></td>
			<td><a href="javascript:enter('','','','','','')">NONE</a></td>
			<td><a href="javascript:enter('','','','','','')">NONE</a></td>
            <td><a href="javascript:enter('','','','','','')">NONE</a></td>
			</TR>

<%
                EWD0036Help.initRow();
                while (EWD0036Help.getNextRow()) {
                    if (EWD0036Help.getFlag().equals("")) {
                    		out.println(EWD0036Help.getRecord());
                    }
                }
    %> 

  </TABLE>
<%
   }  
%>
</body>
</html>