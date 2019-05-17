<html>
<head>
<title>Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="branch" class="datapro.eibs.beans.EIB000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

%>


<H3 align="center">Inter Bank/Inter Branch General Ledger Account Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="interbranch_maintenance.jsp, EIB0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEIB0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">

  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="center"></div>
            </td>
            <td nowrap width="5%" >
              <div align="center">Bank</div>
            </td>
            <td nowrap width="5%" >
              <div align="center">Branch</div>
            </td>
            <td nowrap width="5%" >
              <div align="center">Currency</div>
            </td>
            <td nowrap width="15%" >
              <div align="center">Number</div>
            </td>
            <td nowrap width="20%" >
              <div align="center">Description</div>
            </td>
            <td nowrap width="20%" >
              <div align="center">Type</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">Due From Account :</div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDFB" size="3"  maxlength="2" value="<%= branch.getE02IBTDFB().trim()%>" readonly>
                </font></font></font> </b></div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDFR" size="3"  maxlength="4" value="<%= branch.getE02IBTDFR().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDFC" size="4"  maxlength="3" value="<%= branch.getE02IBTDFC().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
            <td nowrap width="15%">
              <div align="left">
				<input type="text" name="E02IBTDFA" size="17" maxlength="16" value="<%= branch.getE02IBTDFA().trim()%>">
				<a href="javascript:GetLedger('E02IBTDFA',document.forms[0].E02IBTDFB.value,document.forms[0].E02IBTDFC.value,'')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </div>
            </td>
            <td nowrap width="20%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02GLDGFA" size="25"  maxlength="25" value="<%= branch.getE02GLDDFA().trim()%>" readonly>
                </font></font></font> </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
				<select name="E02IBTDFF" onchange="SetCodeType()">
				  <option value=" "></option>
				  <option value="A" <%if (branch.getE02IBTDFF().equals("A")) out.print("selected"); %>>Customer Account </option>
				  <option value="G" <%if (branch.getE02IBTDFF().equals("G")) out.print("selected"); %>>General Ledger </option>
				</select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Due To Account :</div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDTB" size="3"  maxlength="2" value="<%= branch.getE02IBTDTB().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDTR" size="3"  maxlength="4" value="<%= branch.getE02IBTDTR().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
            <td nowrap width="5%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02IBTDTC" size="4"  maxlength="3" value="<%= branch.getE02IBTDFC().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
            <td nowrap width="15%" >
				<input type="text" name="E02IBTDTA" size="17" maxlength="16" value="<%= branch.getE02IBTDTA().trim()%>">
				<a href="javascript:GetLedger('E02IBTDTA',document.forms[0].E02IBTDTB.value,'','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="20%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02GLDGTA" size="25"  maxlength="25" value="<%= branch.getE02GLDDTA().trim()%>" readonly>
                </font></font></font> </b></div>
            </td>
            <td nowrap width="20%" >
				<select name="E02IBTDTF" onchange="SetCodeType()">
				  <option value=" "></option>
				  <option value="A" <%if (branch.getE02IBTDTF().equals("A")) out.print("selected"); %>>Customer Account </option>
				  <option value="G" <%if (branch.getE02IBTDTF().equals("G")) out.print("selected"); %>>General Ledger </option>
				</select>
            </td>
          </tr>
          <tr id="trclear" >
            <td nowrap width="20%" >
              <div align="right">Entry Type :</div>
            </td>
            <td nowrap width="80%" height="19" colspan="6">
              <input type="radio" name="E02IBTENT" value="S"  <%if (branch.getE02IBTENT().equals("S")) out.print("checked"); %>>
              Single Entry (Debit-Credit);
            </td>
          </tr>
          <tr id="trclear" >
            <td nowrap width="20%" >&nbsp;</td>
            <td nowrap width="80%" height="19" colspan="6">
              <input type="radio" name="E02IBTENT" value="D"  <%if (branch.getE02IBTENT().equals("D")) out.print("checked"); %>>
              Double Entry (Debit & Credit);
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
