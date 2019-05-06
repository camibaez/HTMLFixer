<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<title>Customer Portfolio</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0300Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1, code2) {

  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  top.opener.document.forms[0][top.opener.fieldDesc].value = code2;
  top.opener.document.forms[0][top.opener.fieldName].focus();
  top.close();
 }
//-->
</script>
</head>
<body>
<h4 align="center">Customer Portfolio List</h4>
<%
	if ( EWD0300Help.getNoResult() ) {
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
    <th> 
      <div align="center">Principal<br>
        Customer </div>
    </th>
    <th> 
      <div align="center">Portfolio </div>
    </th>
    <th> 
      <div align="center">Portfolio <br>
        Description</div>
    </th>
    <th> 
      <div align="center">Legal Name</div>
    </th>
  </tr>
  <%
                EWD0300Help.initRow();
                while (EWD0300Help.getNextRow()) {
                    if (EWD0300Help.getFlag().equals("")) {
                    		out.println(EWD0300Help.getRecord());
                    }
                }
    %> 
</TABLE>

<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( EWD0300Help.getShowPrev() ) {
       		int pos = EWD0300Help.getFirstRec() - 21;
			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEWD0300?SCREEN=11&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( EWD0300Help.getShowNext() ) {
      		int pos = EWD0300Help.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEWD0300?SCREEN=11&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	
<%
   }  
%>
</body>
</html>