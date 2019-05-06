<html>
<head>
<title>Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="branch" class="datapro.eibs.beans.EIB000001Message"  scope="session" />

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


<H3 align="center">Interbranch Account Generation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="interbranch_generation.jsp, EIB0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEIB0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">


  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="50%" >
              <div align="center"></div>
            </td>
            <td nowrap width="25%" >
              <div align="center">Bank</div>
            </td>
            <td nowrap width="25%" >
              <div align="center">Currency</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%" >
              <div align="right"><b>Due From :</b></div>
            </td>
            <td nowrap width="25%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01IBTDFB" size="3"  maxlength="2" value="<%= branch.getE01IBTDFB().trim()%>">
                </font></font></font> </b></div>
            </td>
            <td nowrap width="25%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01IBTDFC" size="4"  maxlength="3" value="<%= branch.getE01IBTDFC().trim()%>">
                <a href="javascript:GetCurrency('E01IBTDFC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a></font></font></font></b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%" >
              <div align="right"><b>Due To :</b></div>
            </td>
            <td nowrap width="25%" >
              <div align="center"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01IBTDTB" size="3"  maxlength="2" value="<%= branch.getE01IBTDTB().trim()%>" >
                </font></font></font></b></div>
            </td>
            <td nowrap width="25%" >
              <div align="center"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="50%">
              <div align="right">Due From Account :</div>
            </td>
            <td nowrap width="50%">
              <div align="left">
                <input type="text" name="E01IBTDFA" size="17" maxlength="16" value="<%= branch.getE01IBTDFA().trim()%>">
                <a href="javascript:GetLedger('E01IBTDFA',document.forms[0].E01IBTDFB.value,document.forms[0].E01IBTDFC.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%">
              <div align="right">Due To Account :</div>
            </td>
            <td nowrap width="50%">
              <input type="text" name="E01IBTDTA" size="17" maxlength="16" value="<%= branch.getE01IBTDTA().trim()%>">
              <a href="javascript:GetLedger('E01IBTDTA',document.forms[0].E01IBTDTB.value,'','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%" >
              <div align="right">Entry Type :</div>
            </td>
            <td nowrap width="50%" height="19">
              <input type="radio" name="E01IBTENT" value="S"  <%if (branch.getE01IBTENT().equals("S")) out.print("checked"); %>>
              Single Entry (Debit-Credit);
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%" >&nbsp;</td>
            <td nowrap width="50%" height="19">
              <input type="radio" name="E01IBTENT" value="D"  <%if (branch.getE01IBTENT().equals("D")) out.print("checked"); %>>
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
