<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<META name="GENERATOR" content="IBM WebSphere Studio">

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="javascript">
</script>

</head>

<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<body>
 
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>

<% if ( !EDD031001Help.getNoResult() ) { %>

  <table  id=cfTable class="tableinfo" width="100%">
    <tr > 
      <td valign="top"> 
        <table id="headTable" width="100%">
          <%
          EDD031001Help.initRow();
          boolean firstTime = true;
          String chk = "";
          while (EDD031001Help.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
                datapro.eibs.beans.EDD031001Message msgList = (datapro.eibs.beans.EDD031001Message) EDD031001Help.getRecord();
                String sType = "";
                if (msgList.getE01TLMTYP().equals("T")) {
                	sType = "Regular Teller";
                } else if (msgList.getE01TLMTYP().equals("H")) {
                	sType = "Head Teller";
                } else if (msgList.getE01TLMTYP().equals("O")) {
                    sType = "O/D Official";
                } else if (msgList.getE01TLMTYP().equals("S")) {
                    sType = "Operations Supervisor";
                } else if (msgList.getE01TLMTYP().equals("I")) {
                    sType = "Teller Interface";
                }
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= EDD031001Help.getCurrentRow() %>" <%=chk%> onclick="enter(<%= EDD031001Help.getCurrentRow() %>)">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01TLMTID() %></td>
            <td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01TLMCCY() %></td>
            <td NOWRAP  align=CENTER width=\"60%\"><%= sType %></td>
          </tr>
          <%
                }
              %>
        </table>
       </td>
      </tr>  
  </table>

<%	} %>

<script language="JavaScript">

	function enter(value) {
		parent.list.window.document.getElementById("idxrow").value = value;
	}

</SCRIPT> 

</FORM>
</BODY>
</HTML>

