<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<%@page import="datapro.eibs.beans.JBList"%>

<BODY>

   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
             <TD> 
               <div align="center">
               		<b>
               				<%
               					 JBList msgList = (JBList)request.getSession(false).getAttribute("msgList");
               					 int row = 0;
               					 try { row = Integer.parseInt(request.getParameter("row")); } catch (Exception e) {}
               					 msgList.setCurrentRow(row);
               					 out.print(msgList.getFlag() );
               				%>
               		</b>
               	</div>
             </TD>
         </TR>
   		</TABLE>

</BODY>
</HTML>
