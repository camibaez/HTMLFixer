<html>
<head>
<title>Currencies</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EGL0360Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">
function goAction(op) {
	document.forms[0].opt.value = op;
	document.forms[0].submit();
}
</SCRIPT>  

</head>
<body>
<h3 align="center">Foreign Currencies List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fex_currency_list.jsp,EGL0360"></h3> 
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0360" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CCY" value="">
  <input type=HIDDEN name="BNK" value="">
  <%if ( EGL0360Help.getNoResult() ) {%>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
           </tr>
         </table>
	  </div>

	  </TD>
	</TR>
    </TABLE>
	<%}	else {
		if ( !error.getERRNUM().equals("0")  ) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
     		out.println("       showErrors()");
     		out.println("</SCRIPT>");
     	}
	%> 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Currency</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Description</div>
            </th>
            <th align=CENTER nowrap width="10%">Rate</th>
            <th align=CENTER nowrap width="10%">Mult/Div</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Decimals</div>
            </th>
            <th align=CENTER nowrap width="10%">Short Name</th>
            <th align=CENTER nowrap width="10%">Reference</th>
          </tr>
          <%
          boolean firstTime = true;
          String chk = "";
		  EGL0360Help.initRow();
		  while (EGL0360Help.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
          	  	datapro.eibs.beans.EGL036001Message msgList = (datapro.eibs.beans.EGL036001Message) EGL0360Help.getRecord();
		  %>
				<TR>
						
					<TD NOWRAP  ALIGN=CENTER width="10%">
						<input type="radio" name="CURRCODE" value="<%= EGL0360Help.getCurrentRow() %>" <%=chk%>></TD>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATCCY() %></td>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATDSC() %></td>
					<TD NOWRAP  ALIGN=RIGHT width=\"10%\"><%= msgList.getE01RATEXR() %></td>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATMUD() %></td>	
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATDCP() %></td>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATCYA() %></td>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01RATRNM() %></td>
				</TR>
		 <%}%>
        </table>
    </table>
  <%}%>

<SCRIPT language="JavaScript">
  showChecked("CURRCODE");
</SCRIPT>
</form>

</body>
</html>
