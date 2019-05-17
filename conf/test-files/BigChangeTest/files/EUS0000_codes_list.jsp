<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Special User Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EUS000002Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function goDelete() {

	if(confirm("Are you sure you want to delete this code?")){
		document.forms[0].opt.value = 3;
		document.forms[0].submit();
	}
}

function getParameters(tablecode,refcode) {

	document.forms[0].TABLECODE.value = tablecode;
  	document.forms[0].REFCODE.value = refcode;
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center"><%=userPO.getHeader10()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="codes_list.jsp, EUS0000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUS0000" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="REFCODE">
	<input type=HIDDEN name="TABLECODE">
  </p>
  
  <p> 
    <%
	if ( EUS000002Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is not match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
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
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete()"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="20%">Code</th>
            <th align=CENTER nowrap width="75%"> 
              <div align="center">Description</div>
            </th>
          </tr>
          <%
          		EUS000002Help.initRow();
                while (EUS000002Help.getNextRow()) {
                  datapro.eibs.beans.EUS000002Message msgList = (datapro.eibs.beans.EUS000002Message) EUS000002Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" value="<%= EUS000002Help.getCurrentRow() %>" 
              onClick="javascript:getParameters('<%= msgList.getE02US1RTY() %>','<%= msgList.getE02US1CDE() %>');">
			</td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE02US1CDE() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE02US1DSC() %></td>
          </tr>
          <%
                }
              %>
        </table>
  </table>
     
  <SCRIPT language="JavaScript">
 showChecked("CURRCODE");
     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
