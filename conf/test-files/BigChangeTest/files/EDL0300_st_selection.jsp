<html>
<head>
<title>Account Statement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body nowrap>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>
	   builtNewMenu(cd_i_opt);
<%
}
%>

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 


<h3 align="center"> Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="st_selection.jsp , EDL0300"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Contract :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right"><b>Date Type :</b></div>
            </td>
            <td nowrap width="1%">&nbsp;</td>
            <td nowrap width="15%"> 
              <input type="radio" name="E01VALBTH" value="B" checked>
              <b>Process</b> <b>Date</b></td>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="47%"> 
              <input type="radio" name="E01VALBTH" value="V">
              <b>Value Date</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right"> <b>Select Dates from :</b></div>
            </td>
            <td nowrap width="1%">&nbsp;</td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E01FRDTE1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01FRDTE2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01FRDTE3" size="2" maxlength="2" onkeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01FRDTE1,document.forms[0].E01FRDTE2,document.forms[0].E01FRDTE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>to :</b></div>
            </td>
            <td nowrap width="47%"> 
              <div align="left"> 
                <input type="text" name="E01TODTE1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01TODTE2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="E01TODTE3" size="2" maxlength="2" onkeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01TODTE1,document.forms[0].E01TODTE2,document.forms[0].E01TODTE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right"><b>Select Amount from :</b></div>
            </td>
            <td nowrap width="1%" >&nbsp;</td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01FRAMNT" size="15" maxlength="13" onkeypress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>to :</b></div>
            </td>
            <td nowrap width="47%" > 
              <div align="left"> 
                <input type="text" name="E01TOAMNT" size="15" maxlength="13" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
     <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

  </form>
</body>
</html>
