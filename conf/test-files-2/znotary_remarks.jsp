<html>
<head>
<title>remarks</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body bgcolor="#FFFFFF">



<h3 align="center">Proposal Disbursement</h3>
<hr size="4">


 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
  <BR>
 <table class="tableinfo" >
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Proposal Date :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" readonly name="1" maxlength="45" size="4" value="05">
              <input type="text" readonly name="12" maxlength="45" size="4" value="01">
              <input type="text" readonly name="122" maxlength="45" size="4" value="04">
            </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Proposal Number :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="13" maxlength="45" size="15" value="000036">
            </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Customer :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="3" maxlength="35" size="36" value="Lorenzo Perez">
            </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Proposal Type :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="4" maxlength="30" size="31" value="Comercial">
            </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Status :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="5" maxlength="4" size="7" value="DB">
              <input type="text" readonly name="53" maxlength="4" size="30" value="Desembolso">
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <table class="tableinfo" width="548" >
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right"> Date :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" readonly name="14" maxlength="45" size="4">
              <input type="text" readonly name="123" maxlength="45" size="4">
              <input type="text" readonly name="1222" maxlength="45" size="4">
            </td>
            <td nowrap width="58%">
              <div align="right">Credit Account :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" readonly name="14222" maxlength="45" size="4">
            </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right"> Rate :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="13222" maxlength="45" size="10" value="9.698">
            </td>
            <td width="58%" nowrap>
              <div align="right">Debit Account :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="13232" maxlength="45" size="15">
              <a href="javascript:GetAccount('E01DEAACC','','CD','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Rate Adjustment :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="4222" maxlength="30" size="10" value="-3.00%">
            </td>
            <td width="58%" nowrap>
              <div align="right">Automatic Charges :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" readonly name="13233" maxlength="45" size="15" value="Yes">
              <a href="javascript:GetAccount('E01DEAACC','','CD','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
