<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Foreign Exchange </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0308Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1,code2,code3,code4,code5,code6,code7) {
  var topForm = top.opener.document.forms[0];
  topForm[top.opener.fieldName].value = code1
  if(top.opener.fieldDesc != "" && topForm[top.opener.fieldDesc] != null){top.opener.document.forms[0][top.opener.fieldDesc].value = code2}
  if(top.opener.fieldId !== "" && topForm[top.opener.fieldId] != null){topForm[top.opener.fieldId].value = code3}
  if(top.opener.fieldAux1 !== "" && topForm[top.opener.fieldAux1] != null){topForm[top.opener.fieldAux1].value = code4}
  if(top.opener.fieldAux2 !== "" && topForm[top.opener.fieldAux2] != null){topForm[top.opener.fieldAux2].value = code5}
  if(top.opener.fieldDate1 !== "" && topForm[top.opener.fieldDate1] != null){topForm[top.opener.fieldDate1].value = code6}
  if(top.opener.fieldDate2 !== "" && topForm[top.opener.fieldDate2] != null){topForm[top.opener.fieldDate2].value = code7}
  
  top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0308Help.getNoResult() ) {
 %>
   		
<h4 align="center">&nbsp;</h4>
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
<div align="center"><h4>Instrument List </h4></div>
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Code </th>
    <th> 
      <div align="left">Description </div>
    </th>
    <th>Currency</th>
    <th> 
      <div align="center">Type</div>
    </th>
    <th> 
      <div align="left">Symbol </div>
    </th>
    <th> 
      <div align="left">ISIN </div>
    </th>
    <th> 
      <div align="left">CUSIP </div>
    </th>
    <th> 
      <div align="left">Status </div>
    </th>
    <th> 
      <div align="left">Issuer </div>
    </th>
    <th> 
      <div align="left">Issue<br>
        Date </div>
    </th>
  </tr>
  <%
              String des = (String)session.getAttribute("DESCRIPTION");  
              String insttype = (String)session.getAttribute("INTSTYPE");
			  EWD0308Help.initRow();
                while (EWD0308Help.getNextRow()) {
                    if (EWD0308Help.getFlag().equals("")) {
                    		out.println(EWD0308Help.getRecord());
                    }
                }
    %> 
</TABLE>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0308Help.getShowPrev() ) {
      			int pos = EWD0308Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0308Help.getShowNext() ) {
      			int pos = EWD0308Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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