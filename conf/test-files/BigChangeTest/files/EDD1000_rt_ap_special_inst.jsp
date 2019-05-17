<html>
<head>
<title>Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtInst" class= "datapro.eibs.beans.ESD000005Message"    scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"    scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 
<h3 align="center">Special Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_special_inst,EDD1000"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
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
                <input type="text" readonly name="E02CUN" size="9" maxlength="9"  value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E02NA1" size="45" maxlength="45"  value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E05ACC" size="12" maxlength="12" value="<%= rtInst.getE05ACC().trim()%>" >
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
                <input type="text" readonly name="E02PRO" size="4" maxlength="4"  value="<%= userPO.getHeader1().trim()%>">
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
      <td align="center"> 
          <input type="text" readonly name="E15DSC" size="80" maxlength="80" value="<%= rtInst.getE15DSC().trim()%>">
          <input type="text" readonly name="E25DSC" size="80" maxlength="80" value="<%= rtInst.getE25DSC().trim()%>">
          <input type="text" readonly name="E35DSC" size="80" maxlength="80" value="<%= rtInst.getE35DSC().trim()%>">
          <input type="text" readonly name="E45DSC" size="80" maxlength="80" value="<%= rtInst.getE45DSC().trim()%>">
          <input type="text" readonly name="E55DSC" size="80" maxlength="80" value="<%= rtInst.getE55DSC().trim()%>">
          <input type="text" readonly name="E65DSC" size="80" maxlength="80" value="<%= rtInst.getE65DSC().trim()%>">
          <input type="text" readonly name="E75DSC" size="80" maxlength="80" value="<%= rtInst.getE75DSC().trim()%>">
          <input type="text" readonly name="E85DSC" size="80" maxlength="80" value="<%= rtInst.getE85DSC().trim()%>">
          <input type="text" readonly name="E95DSC" size="80" maxlength="80" value="<%= rtInst.getE95DSC().trim()%>">
          <input type="text" readonly name="E05DSC" size="80" maxlength="80" value="<%= rtInst.getE05DSC().trim()%>">
          <input type="text" readonly name="EA5DSC" size="80" maxlength="80" value="<%= rtInst.getEA5DSC().trim()%>">
          <input type="text" readonly name="EB5DSC" size="80" maxlength="80" value="<%= rtInst.getEB5DSC().trim()%>">
          <input type="text" readonly name="EC5DSC" size="80" maxlength="80" value="<%= rtInst.getEC5DSC().trim()%>">
          <input type="text" readonly name="ED5DSC" size="80" maxlength="80" value="<%= rtInst.getED5DSC().trim()%>">
          <input type="text" readonly name="EE5SC" size="80" maxlength="80" value="<%= rtInst.getEE5DSC().trim()%>">
          <input type="text" readonly name="EF5DSC" size="80" maxlength="80" value="<%= rtInst.getEF5DSC().trim()%>">
          <input type="text" readonly name="EG5DSC" size="80" maxlength="80" value="<%= rtInst.getEG5DSC().trim()%>">
          <input type="text" readonly name="EH5DSC" size="80" maxlength="80" value="<%= rtInst.getEH5DSC().trim()%>">
          <input type="text" readonly name="EI5DSC" size="80" maxlength="80" value="<%= rtInst.getEI5DSC().trim()%>">
          <input type="text" readonly name="EJ5DSC" size="80" maxlength="80" value="<%= rtInst.getEJ5DSC().trim()%>">
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
