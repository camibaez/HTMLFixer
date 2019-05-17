<html>
<head>
<title>Instrucciones Especiales</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "dcInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </script>

<script Language="Javascript">

	builtNewMenu(dc_s_inquiry);

</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center"> Clean Collections Approval [Special Instructions]
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sing_special_inst.jsp, EDC0040"></h3>
<hr size="4">
 <form METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0040" >
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Collection Number :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input readonly  type="text" name="E05ACC" size="14" maxlength="12" value="<%= dcInst.getE05ACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input readonly  type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>"><br>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
  <table class="tableinfo">
    <tr  > 
      <td> 
        <p align="center"> 
          <input readonly  type="text" name="E15DSC" size="80" maxlength="80" value="<%= dcInst.getE15DSC().trim()%>"><br>
          <input readonly  type="text" name="E25DSC" size="80" maxlength="80" value="<%= dcInst.getE25DSC().trim()%>"><br>
          <input readonly  type="text" name="E35DSC" size="80" maxlength="80" value="<%= dcInst.getE35DSC().trim()%>"><br>
          <input readonly  type="text" name="E45DSC" size="80" maxlength="80" value="<%= dcInst.getE45DSC().trim()%>"><br>
          <input readonly  type="text" name="E55DSC" size="80" maxlength="80" value="<%= dcInst.getE55DSC().trim()%>"><br>
          <input readonly  type="text" name="E65DSC" size="80" maxlength="80" value="<%= dcInst.getE65DSC().trim()%>"><br>
          <input readonly  type="text" name="E75DSC" size="80" maxlength="80" value="<%= dcInst.getE75DSC().trim()%>"><br>
          <input readonly  type="text" name="E85DSC" size="80" maxlength="80" value="<%= dcInst.getE85DSC().trim()%>"><br>
          <input readonly  type="text" name="E95DSC" size="80" maxlength="80" value="<%= dcInst.getE95DSC().trim()%>"><br>
          <input readonly  type="text" name="E05DSC" size="80" maxlength="80" value="<%= dcInst.getE05DSC().trim()%>"><br>
          <input readonly  type="text" name="EA5DSC" size="80" maxlength="80" value="<%= dcInst.getEA5DSC().trim()%>"><br>
          <input readonly  type="text" name="EB5DSC" size="80" maxlength="80" value="<%= dcInst.getEB5DSC().trim()%>"><br>
          <input readonly  type="text" name="EC5DSC" size="80" maxlength="80" value="<%= dcInst.getEC5DSC().trim()%>"><br>
          <input readonly  type="text" name="ED5DSC" size="80" maxlength="80" value="<%= dcInst.getED5DSC().trim()%>"><br>
          <input readonly  type="text" name="EE5DSC" size="80" maxlength="80" value="<%= dcInst.getEE5DSC().trim()%>"><br>
          <input readonly  type="text" name="EF5DSC" size="80" maxlength="80" value="<%= dcInst.getEF5DSC().trim()%>"><br>
          <input readonly  type="text" name="EG5DSC" size="80" maxlength="80" value="<%= dcInst.getEG5DSC().trim()%>"><br>
          <input readonly  type="text" name="EH5DSC" size="80" maxlength="80" value="<%= dcInst.getEH5DSC().trim()%>"><br>
          <input readonly  type="text" name="EI5DSC" size="80" maxlength="80" value="<%= dcInst.getEI5DSC().trim()%>"><br>
          <input readonly  type="text" name="EJ5DSC" size="80" maxlength="80" value="<%= dcInst.getEJ5DSC().trim()%>"><br>
        </p>
      </td>
    </tr>
  </table>
    <p>
  </form>
</body>
</html>