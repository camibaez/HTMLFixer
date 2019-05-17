<HTML>
<HEAD>
<TITLE>Codigos Especiales</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "msg" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	<% 
		String menu_option = "lc_apr_cc_new";
		String title = "Comercial ";
		if (userPO.getOption().equals("5106")) {
			menu_option = "lc_apr_cc_maint";
		}
		if (userPO.getOption().equals("4006")) {
			menu_option = "lc_apr_standby";
			title = "Stand By ";
		}
	%>
	builtNewMenu(<%= menu_option %>);
	initMenu();
</SCRIPT>
</HEAD>
<BODY   bgcolor="#FFFFFF">
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center"><%= title %> Letter Of Credit Approval Inquiry [Special Codes]
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_special_codes.jsp, ELC0525"></h3>
<HR size="4">
<FORM>
<BR>
  <table class="tableinfo" cellspacing="0" cellpadding="4" width="100%" border="0">
    <TR id="trdark">
      <TD nowrap align="right" width="10%"><B> Product :</B></TD>
      <TD nowrap align="left" width="20%"><INPUT type="text" name="E03LCDPRO" size="5" maxlength="4" value="<%= userPO.getProdCode() %>" readonly></TD>
      <TD nowrap align="right" width="10%"><B>Bank :</B></TD>
      <TD nowrap align="left" width="20%"><INPUT type="text" readonly name="E03LCDBNK" size="3" maxlength="2" value="<%= userPO.getBank()  %>"></TD>
      <TD nowrap width="25%" align="right"><B>Letter of Credit ID :</B></TD>
      <TD nowrap align="left" width="15%"><B>
        <INPUT type="text" readonly name="E03LCDACC" size="21" maxlength="20" value="<%= msg.getE02ACC().trim()%>">
      </B></TD>
    </TR>
  </TABLE>
  <h4>Clasification Codes  </h4>
  <TABLE cellpadding=2 cellspacing=0 width="100%" border="1" bordercolor="#000000" bgcolor="#FFFFFF" >
    <TR bordercolor="#FFFFFF"> 
      <TD nowrap > 
        <TABLE cellpadding=2 cellspacing=0 width="100%" border="0">
          <TR id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Primary Officer :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02OFC" size="5" maxlength="4" value="<%= msg.getE02OFC().trim()%>" readonly>
              <INPUT type="text" name="D02OFC" size="40" maxlength="35" value="<%= msg.getD02OFC().trim()%>" readonly>
               
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0" > 
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="30%" height="37"> 
              <div align="right">Secondary Officer:</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02OF2" size="5" maxlength="4" value="<%= msg.getE02OF2().trim()%>" readonly>
              <INPUT type="text" name="D02OF2" size="40" maxlength="35" value="<%= msg.getD02OF2().trim()%>" readonly>
               
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  > 
            </TD>
          </TR>
          <TR id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Industry Code :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02INC" size="5" maxlength="4" value="<%= msg.getE02INC().trim()%>" readonly>
              <INPUT type="text" name="D02INC" size="40" maxlength="35" value="<%= msg.getD02INC().trim()%>" readonly>
               
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  > 
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Business Line :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02BUC" size="5" maxlength="4" value="<%= msg.getE02BUC().trim()%>" readonly>
              <INPUT type="text" name="D02BUC" size="40" maxlength="35" value="<%= msg.getD02BUC().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Country Residence :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02GEC" size="5" maxlength="4" value="<%= msg.getE02GEC().trim()%>" readonly>
              <INPUT type="text" name="D02GEC" size="40" maxlength="35" value="<%= msg.getD02GEC().trim()%>" readonly>
               
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  > 
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Country Risk Code :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02GRC" size="5" maxlength="4" value="<%= msg.getE02GRC().trim()%>" readonly>
              <INPUT type="text" name="D02GRC" size="40" maxlength="35" value="<%= msg.getD02GRC().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 1 :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02UC1" size="5" maxlength="4" value="<%= msg.getE02UC1().trim()%>" readonly>
              <INPUT type="text" name="D02UC1" size="40" maxlength="35" value="<%= msg.getD02UC1().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 2 :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02UC2" size="5" maxlength="4" value="<%= msg.getE02UC2().trim()%>" readonly>
              <INPUT type="text" name="D02UC2" size="40" maxlength="35" value="<%= msg.getD02UC2().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 3 :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02UC3" size="5" maxlength="4" value="<%= msg.getE02UC3().trim()%>" readonly>
              <INPUT type="text" name="D02UC3" size="40" maxlength="35" value="<%= msg.getD02UC3().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 4 :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02UC4" size="5" maxlength="4" value="<%= msg.getE02UC4().trim()%>" readonly>
              <INPUT type="text" name="D02UC4" size="40" maxlength="35" value="<%= msg.getD02UC4().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trdark">
            <td nowrap width="30%"> 
              <div align="right">Source of Funds :</div>
            </td>
            <TD nowrap width="70%">
              <INPUT type="text" name="E02ORG" size="5" maxlength="4" value="<%= msg.getE02ORG().trim()%>" readonly>
              <INPUT type="text" name="D02ORG" size="40" maxlength="35" value="<%= msg.getD02ORG().trim()%>" readonly>
               
            </TD>
          </TR>
          <TR id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Destination of Funds :</div>
            </td>
            <TD nowrap width="70%"> 
              <INPUT type="text" name="E02DST" size="5" maxlength="4" value="<%= msg.getE02DST().trim()%>" readonly>
              <INPUT type="text" name="D02DST" size="40" maxlength="35" value="<%= msg.getD02DST().trim()%>" readonly>
               
            </TD>
          </TR>
        </TABLE>
      </TD>
    </TR>
  </TABLE>
</FORM>
</BODY>
</HTML>

