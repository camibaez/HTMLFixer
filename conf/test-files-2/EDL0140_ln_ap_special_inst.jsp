<html>
<head>
<title>Approval of Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id = "lnInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);

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
<h3 align="center">Special Instructions of <%= userPO.getHeader4().trim()%></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
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
                <input type="text" readonly name="E02CUN2" size="9" maxlength="9"  value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly name="E02NA12" size="45" maxlength="45"  value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" readonly name="E05ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E02PRO2" size="4" maxlength="4"  value="<%= userPO.getHeader1().trim()%>">
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
          <input type="text" readonly name="E15DSC" size="80" maxlength="80" value="<%= lnInst.getE15DSC().trim()%>"><br>
          <input type="text" readonly name="E25DSC" size="80" maxlength="80" value="<%= lnInst.getE25DSC().trim()%>"><br>
          <input type="text" readonly name="E35DSC" size="80" maxlength="80" value="<%= lnInst.getE35DSC().trim()%>"><br>
          <input type="text" readonly name="E45DSC" size="80" maxlength="80" value="<%= lnInst.getE45DSC().trim()%>"><br>
          <input type="text" readonly name="E55DSC" size="80" maxlength="80" value="<%= lnInst.getE55DSC().trim()%>"><br>
          <input type="text" readonly name="E65DSC" size="80" maxlength="80" value="<%= lnInst.getE65DSC().trim()%>"><br>
          <input type="text" readonly name="E75DSC" size="80" maxlength="80" value="<%= lnInst.getE75DSC().trim()%>"><br>
          <input type="text" readonly name="E85DSC" size="80" maxlength="80" value="<%= lnInst.getE85DSC().trim()%>"><br>
          <input type="text" readonly name="E95DSC" size="80" maxlength="80" value="<%= lnInst.getE95DSC().trim()%>"><br>
          <input type="text" readonly name="E05DSC" size="80" maxlength="80" value="<%= lnInst.getE05DSC().trim()%>"><br>
          <input type="text" readonly name="EA5DSC" size="80" maxlength="80" value="<%= lnInst.getEA5DSC().trim()%>"><br>
          <input type="text" readonly name="EB5DSC" size="80" maxlength="80" value="<%= lnInst.getEB5DSC().trim()%>"><br>
          <input type="text" readonly name="EC5DSC" size="80" maxlength="80" value="<%= lnInst.getEC5DSC().trim()%>"><br>
          <input type="text" readonly name="ED5DSC" size="80" maxlength="80" value="<%= lnInst.getED5DSC().trim()%>"><br>
          <input type="text" readonly name="EE5SC" size="80" maxlength="80" value="<%= lnInst.getEE5DSC().trim()%>"><br>
          <input type="text" readonly name="EF5DSC" size="80" maxlength="80" value="<%= lnInst.getEF5DSC().trim()%>"><br>
          <input type="text" readonly name="EG5DSC" size="80" maxlength="80" value="<%= lnInst.getEG5DSC().trim()%>"><br>
          <input type="text" readonly name="EH5DSC" size="80" maxlength="80" value="<%= lnInst.getEH5DSC().trim()%>"><br>
          <input type="text" readonly name="EI5DSC" size="80" maxlength="80" value="<%= lnInst.getEI5DSC().trim()%>"><br>
          <input type="text" readonly name="EJ5DSC" size="80" maxlength="80" value="<%= lnInst.getEJ5DSC().trim()%>"><br>
      </td>
    </tr>
  </table>
  <div align="center">

  </div>
  </form>
</body>
</html>
