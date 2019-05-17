<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Date Selector: Reports of Foreign Transaction Excess $5000</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "reportDate" class="datapro.eibs.beans.EFRM01001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">
function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

</SCRIPT>  

</head>

<BODY>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
   	}
%>


<h3 align="center">Report of Foreign Transfer of Funds in Excess of $5000<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="DATA_RANGE_PICKER.jsp, EFRM010"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM010" >
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="150">
  <%int row = 0; %>
  <br>
 <p></p>  

  <table class="tableinfo">
    <tr > 
      <td nowrap height = 94> 
        <table cellpadding=1 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" > 
              <div align="center"> <b>Date (<%=currUser.getE01DTF()%>) Range : </b></div>
            </td>
            <td nowrap width="15%"><div align="right"><b>FROM : &nbsp;</b></div></td>
            <td nowrap width="15%"> 
              <div align="left"> 
				<% if(currUser.getE01DTF().equals("DMY")){ %>
              	<input type="text" name="E01REQPDD" maxlength="2" size="3" value="<%= reportDate.getE01REQPDD() %>">
                <input type="text" name="E01REQPDM" maxlength="2" size="3" value="<%= reportDate.getE01REQPDM() %>">
				<input type="text" name="E01REQPDY" maxlength="2" size="3" value="<%= reportDate.getE01REQPDY() %>">
           				<a href="javascript:DatePicker(document.forms[0].E01REQPDD,document.forms[0].E01REQPDM,document.forms[0].E01REQPDY)">
           				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
				<% } else if(currUser.getE01DTF().equals("MDY")){ %>
              	<input type="text" name="E01REQPDM" maxlength="2" size="3" value="<%= reportDate.getE01REQPDM() %>">
                <input type="text" name="E01REQPDD" maxlength="2" size="3" value="<%= reportDate.getE01REQPDD() %>">
				<input type="text" name="E01REQPDY" maxlength="2" size="3" value="<%= reportDate.getE01REQPDY() %>">
           				<a href="javascript:DatePicker(document.forms[0].E01REQPDM,document.forms[0].E01REQPDD,document.forms[0].E01REQPDY)">
           				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
				<% } %>              
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="right"><b>TO : &nbsp;</b></div>
            </td>
            <td nowrap width="47%"> 
              <div align="left"> 
				<% if(currUser.getE01DTF().equals("DMY")){ %>
              	<input type="text" name="E01REQTDD" maxlength="2" size="3" value="<%= reportDate.getE01REQTDM() %>">
                <input type="text" name="E01REQTDM" maxlength="2" size="3" value="<%= reportDate.getE01REQTDD() %>">
				<input type="text" name="E01REQTDY" maxlength="2" size="3" value="<%= reportDate.getE01REQTDY() %>">
	          		<a href="javascript:DatePicker(document.forms[0].E01REQTDD,document.forms[0].E01REQTDM,document.forms[0].E01REQTDY)">
	          		<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
				<% } else if(currUser.getE01DTF().equals("MDY")){ %>
              	<input type="text" name="E01REQTDM" maxlength="2" size="3" value="<%= reportDate.getE01REQTDM() %>">
                <input type="text" name="E01REQTDD" maxlength="2" size="3" value="<%= reportDate.getE01REQTDD() %>">
				<input type="text" name="E01REQTDY" maxlength="2" size="3" value="<%= reportDate.getE01REQTDY() %>">
	          		<a href="javascript:DatePicker(document.forms[0].E01REQTDM,document.forms[0].E01REQTDD,document.forms[0].E01REQTDY)">
	          		<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
				<% } %>              
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br>
	<div align="center" style="width:95%"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

</form>
</body>
</html>
