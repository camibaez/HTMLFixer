<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="APPCODE" VALUE="<%=request.getParameter("APPCODE")%>">
  <h3 align="center">Control Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="bank_setup_basic_enter.jsp,ESD0005"> 
  </h3>
  <hr size="4">
<p></p>
  <table class="tableinfo" align="center" width="85%">
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <TR>
            <td nowrap width="50%" align="right">Bank :</td>
            <TD nowrap width="50%" align="left"> 
              <INPUT type="text" name="E01SELBNK" size="3" maxlength="2">
            </TD>
				
			</TR>
			<tr>
            <td nowrap width="50%" align="right">Currency :</td>
            <td nowrap width="50%" align="left"> 
              <input type="text" name="E01SELCCY" size="4" maxlength="3"  >
            </td>
          </tr>
			<TR>
				<TD nowrap width="50%" align="right">Year :</TD>
				<TD nowrap width="50%" align="left">
				<INPUT type="text" name="E01SELYEAR" size="3" maxlength="2"></TD>
			</TR></table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
      
</form>
</body>
</html>
