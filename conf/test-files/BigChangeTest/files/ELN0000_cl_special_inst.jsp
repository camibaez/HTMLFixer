<html>
<head>
<title>Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "clInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cl_m_opt);


</SCRIPT>

</head>

<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 
<h3 align="center">Special Instructions <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_special_inst,ELN0000"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E05ACC" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Line :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E05ACC1" size="12" maxlength="12" value="<%= userPO.getCreditLineNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap align="center"> 
          <input type="text" name="E15DSC" size="80" maxlength="80" value="<%= clInst.getE15DSC().trim()%>"><br>
          <input type="text" name="E25DSC" size="80" maxlength="80" value="<%= clInst.getE25DSC().trim()%>"><br>
          <input type="text" name="E35DSC" size="80" maxlength="80" value="<%= clInst.getE35DSC().trim()%>"><br>
          <input type="text" name="E45DSC" size="80" maxlength="80" value="<%= clInst.getE45DSC().trim()%>"><br>
          <input type="text" name="E55DSC" size="80" maxlength="80" value="<%= clInst.getE55DSC().trim()%>"><br>
          <input type="text" name="E65DSC" size="80" maxlength="80" value="<%= clInst.getE65DSC().trim()%>"><br>
          <input type="text" name="E75DSC" size="80" maxlength="80" value="<%= clInst.getE75DSC().trim()%>"><br>
          <input type="text" name="E85DSC" size="80" maxlength="80" value="<%= clInst.getE85DSC().trim()%>"><br>
          <input type="text" name="E95DSC" size="80" maxlength="80" value="<%= clInst.getE95DSC().trim()%>"><br>
          <input type="text" name="E05DSC" size="80" maxlength="80" value="<%= clInst.getE05DSC().trim()%>"><br>
          <input type="text" name="EA5DSC" size="80" maxlength="80" value="<%= clInst.getEA5DSC().trim()%>"><br>
          <input type="text" name="EB5DSC" size="80" maxlength="80" value="<%= clInst.getEB5DSC().trim()%>"><br>
          <input type="text" name="EC5DSC" size="80" maxlength="80" value="<%= clInst.getEC5DSC().trim()%>"><br>
          <input type="text" name="ED5DSC" size="80" maxlength="80" value="<%= clInst.getED5DSC().trim()%>"><br>
          <input type="text" name="EE5SC" size="80" maxlength="80" value="<%= clInst.getEE5DSC().trim()%>"><br>
          <input type="text" name="EF5DSC" size="80" maxlength="80" value="<%= clInst.getEF5DSC().trim()%>"><br>
          <input type="text" name="EG5DSC" size="80" maxlength="80" value="<%= clInst.getEG5DSC().trim()%>"><br>
          <input type="text" name="EH5DSC" size="80" maxlength="80" value="<%= clInst.getEH5DSC().trim()%>"><br>
          <input type="text" name="EI5DSC" size="80" maxlength="80" value="<%= clInst.getEI5DSC().trim()%>"><br>
          <input type="text" name="EJ5DSC" size="80" maxlength="80" value="<%= clInst.getEJ5DSC().trim()%>"><br>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>