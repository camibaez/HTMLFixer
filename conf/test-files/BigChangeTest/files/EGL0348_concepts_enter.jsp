<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

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
  <h3 align="center">Offset Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="concepts_enter.jsp, EGL0348">
  </h3>
  
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0348" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <hr size="4">

  <p>&nbsp;</p>
		<table class="tableinfo">
          <tr>
            <td width="53%" nowrap><div align="right">Bank :</div></td>
            <td width="47%" nowrap><input type="text" name="E01GLHB01" size="3" maxlength="2"  ></td>
          </tr>
          <tr>
            <td width="53%" nowrap><div align="right">Application Code :</div></td>
            <td width="47%" nowrap>
              <input type="text" name="E01GLHA01" size="3" maxlength="2"  >
			  <a href="javascript:GetCode('E01GLHA01','STATIC_offset_type.jsp')">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
        </table>
  <p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></p>
  <p>&nbsp;</p>
  <p><BR></p>
  <p align="center">&nbsp; </p>

</form>
</body>
</html>
