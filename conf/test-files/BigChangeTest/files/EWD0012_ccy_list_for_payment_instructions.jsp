<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Currency List</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0012Help" class= "datapro.eibs.beans.JBList" scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080<%= userPO.getPurpose().equals("APPROVAL_INQ")?"A":"" %>" target="detail">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="51">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	if ( ewd0012Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=95% height=95%>
   		<TR>
      <TD> 
      <div align="center"><b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'" height="95%">
 <TR> 
    <TD NOWRAP valign="top" width="100%" height="100%">
  <TABLE id="headTable" >
  <TR id="trdark">
			  <th nowrap ></th>
			  <th nowrap >Currency</th>
			 </tr>
     </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >		
<%
                ewd0012Help.initRow();
		  int i=0;
                while (ewd0012Help.getNextRow()) {
                    if (ewd0012Help.getFlag().equals("")) {
                    		out.println(ewd0012Help.getRecord());
				i++;
                    }

                }
    %> 

  </table>
   </div>
   </TD>
  </TR>	
</TABLE>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= i %>";
     divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false); 

     document.forms[0].submit();    

</SCRIPT>
<%
   }
%>
</form>
</body>
</html>			
