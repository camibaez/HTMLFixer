<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Change Attribute</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "dataCR" class= "datapro.eibs.beans.DataCheckReject"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<%
    String m = "";
	String index = "";
    m = request.getParameter("CurrRow");
	index = request.getParameter("Idx");
	if (index == null) {index="0";}
    if (m != null) {
       int recnum = 0;
       try { recnum = Integer.parseInt(m); } catch (Exception e) {};
	chkList.setCurrentRow(recnum);
    }
    else {
	m = "";
	chkList.setCurrentRow(0);
    }
%>

<SCRIPT LANGUAGE="JavaScript" >

function enterInfo() {
  var row=<%= m %>;
  var idx=<%= index %>;
  var form = top.opener.document.forms[0];
  form["NEWOF1_" + idx + row].value = trim(document.forms[0].NEWOF1.value);
  top.close();
}

</SCRIPT>

</head>
<body>
<form>

  <h4 style="text-align:center">Change Attribute</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing=2 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
			<td nowrap >
              <div align="center">Attribute</div>
            </td>
            <td nowrap >
              <div align="center">Actual</div>
            </td>
            <td nowrap >
              <div align="center">New</div>
            </td>
          </tr>
          <tr id="trclear">
			<td nowrap id="trdark">
              <div align="center"><b>Officer Code</b></div>
            </td>
            <td nowrap >
			<div align="left">
              <input type="text" name="CUROF1" size="5" maxlength="3" value="<%= chkList.getRecord(8) %>" readonly>
			</div>
            </td>
            <td nowrap >
			<div align="left">
              <input type="text" name="NEWOF1" size="5" maxlength="3" value="<%= request.getParameter("Officer") %>" onKeypress="enterInteger()" >
              <a href="javascript:GetCodeCNOFC('NEWOF1','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></div>
            </div>
            </td>
          </tr>

	 </table>
	</td>
    </tr>
  </table>

  <br>
 <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="enterInfo()">
  </div>
<SCRIPT>
		document.forms[0].NEWOF1.focus();
   		document.forms[0].NEWOF1.select();
</SCRIPT>
</form>
</body>
</html>
