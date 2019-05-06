<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Errors Arta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "arta" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center">Errors Arta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="errors_list.jsp,ARTA0010"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSARTA000C" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">

  <br>
  
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" size="12" maxlength="12"  readonly
					value="<%= userPO.getIdentifier().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table  id="TBERROR" cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="center">Number</div>
            </td>
            <td nowrap width="30%" > 
              <div align="center">Description</div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">Field</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">Code</div>
            </td>
          </tr>
          <% if (!arta.getNoResult()) {
                arta.initRow();
                while (arta.getNextRow()) {
                    if (arta.getFlag().equals("")) {
                    		//out.println(list.getRecord());
	      %> 
          <tr id="trclear">             
            <td nowrap width="20%" > 
              <div align="center"><%= arta.getRecord(0) %></div>
            </td>
            <td nowrap width="30%" > 
              <div align="center"><%= arta.getRecord(1) %></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><%= arta.getRecord(2) %></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"><%= arta.getRecord(3) %></div>
            </td>
          </tr>
          <%
                    }
                }
   		  } else {  %>         
         <tr id="trclear">
            <td colspan=5>
              <h5 align="center">There are no errors</h5>
            </td>
         </tr>
       <%  }   %>
       </table>
        </td>
        </tr>
  </table>

  <BR>
  </form>
</body>
</html>
