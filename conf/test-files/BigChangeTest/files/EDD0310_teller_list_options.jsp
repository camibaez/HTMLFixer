<html>
<head>
<title>Teller Maintenace</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	document.forms[0].submit();
}

function exit() {
	parent.document.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

</SCRIPT> 

</head>

<BODY>

<h3 align="center">TELLER MAINTENANCE<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_list.jsp, EDD0310"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0310" target="_parent">
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN id="idxrow" name="idxrow">
    
<% if ( EDD031001Help.getNoResult() ) { %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="50%"><div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div></td>
              <td class=TDBKG width="50%"><div align="center"><a href="javascript:exit()"><b>Exit</b></a></div></td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	<%} else {
		if ( !error.getERRNUM().equals("0")  ) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
	     	out.println("       showErrors()");
     		out.println("</SCRIPT>");
     	}
	%> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      	<td class=TDBKG width="25%"><div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div></td>
		<td class=TDBKG width="25%"><div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div></td>
	  	<td class=TDBKG width="25%"><div align="center"><a href="javascript:goAction(3)"><b>Delete</b></a></div></td>
      	<td class=TDBKG width="25%"><div align="center"><a href="javascript:exit()"><b>Exit</b></a></div></td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo" align="center" style="width='95%'">
     <tr id="trdark"> 
       <th align=CENTER nowrap width="20%">Teller ID</th>
       <th align=CENTER nowrap width="20%"><div align="center">Currency</div></th>
       <th align=CENTER nowrap width="60%"><div align="center">Type</div></th>
     </tr>
  </table>
<%	} %>
</form>
</body>
</html>
