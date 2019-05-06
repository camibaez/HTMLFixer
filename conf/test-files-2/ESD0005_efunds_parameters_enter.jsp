<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="efunds" class="datapro.eibs.beans.ESD000508Message" scope="session" />

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>
<h3 align="center">Control Parameters - Interfaces<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="efunds_parameters_enter.jsp,ESD0005"> 
  </h3>
  <hr size="4">
 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
  
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table class="tbenter" align="center" style="width:85%">
    <tr> 
      <td> 
        <table class="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td width="50%" nowrap> 
              <div align="right">Bank :</div>
            </td>
            <td width="50%" nowrap> 
              <input type="text" name="E08EFNBNK" size="3" maxlength="2" value="<%= efunds.getE08EFNBNK()%>">
            </td>
          </tr>
          <tr> 
            <td width="50%" nowrap> 
              	&nbsp;
            </td>
            <td width="50%" nowrap> 
            	&nbsp;
            </td>
          </tr>
          <tr> 
            <td width="50%" nowrap align="right">
               <input type="radio" name="OPT" value="E" checked>
            </td>
            <td width="50%" nowrap>
               eFUNDS 
            </td>
          </tr> 
          <tr> 
            <td width="50%" nowrap align="right">
               <input type="radio" name="OPT" value="C">
            </td>
            <td width="50%" nowrap>
               Clarke American 
            </td>
          </tr>   
        </table>
      </td>
    </tr>
  </table>
 
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  
 
</form>
</body>
</html>
