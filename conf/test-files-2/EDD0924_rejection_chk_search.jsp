<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "dataCR" class= "datapro.eibs.beans.DataCheckReject"   scope="session" />

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }

</script>
<TITLE></TITLE>
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
<h3 align="center">Return Items<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rejection_chk_search.jsp,EDD0924"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="ACCNUM" VALUE="">
  <% if(dataCR.getOption().equals("NSF")){%>
	  <h4 style="text-align:center">Non-Sufficient Funds & Uncollected Items Approvals</h4>
  <%}else{%>
	  <h4 style="text-align:center">Unposted Items Approvals</h4>
  <%}%>

   <table class="tbenter" height="75%" width="100%" border="0">
    <TR>
    <TD>
    <table class="tbenter" width="100%" border="0">
			<% if(dataCR.getOption().equals("NSF")){ %>
                <tr>
                  <td NOWRAP width="50%">

              <div align="right"> Officer Code : </div>
                  </td>
                  <td NOWRAP width="50%">
                    <div align="left">
                      <input type="text" name="E01SELOFC"  size=5 maxlength=3>
                      <a href="javascript:GetCodeCNOFC('E01SELOFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></div>
                  </td>
                </tr>
				<% } %>
                <tr>
                  <td NOWRAP width="50%">
                    <div align="right">
			 Branch :
                    </div>
                  </td>
                  <td NOWRAP width="50%">
                    <div align="left">
                      <input type="text" name="E01SELBRN"  size=5 maxlength=3 value="">
                      <a href="javascript:GetBranch('E01SELBRN','<%=currUser.getE01UBK().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></div>
                  </td>
                </tr>
			<% if(dataCR.getOption().equals("UI")){ %>
                <tr>
                  <td NOWRAP width="50%">
                    <div align="right">
			 Cause :
                    </div>
                  </td>
                  <td NOWRAP width="50%">
                    <div align="left">
					  <input type="text" name="E01SELCAU"  size=5 maxlength=4>
                      <a href="javascript:GetCasualTable('E01SELCAU')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
					</div>
				  </td>
                </tr>
				<% } %>
         </table>


<br>
 <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:enter();">
  </div>		</TD>
    </TR>
  </table>
<script language="JavaScript">
   <% if(dataCR.getOption().equals("NSF")){ %>
      document.forms[0].E01SELOFC.focus();
   <% } else {%>
      document.forms[0].E01SELCAU.focus();
   <% } %>
</script>
</form>
</body>
</html>
