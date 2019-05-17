<html>
<head>
<title>Official Checks Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>
<body nowrap>

<h3 align="center">Official Checks Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="chk_off_inq.jsp,ETL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <h4>Basic Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Status Checks :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01SELSCH" size="2" maxlength="2" value="">
              <a href="javascript:GetCode('E01SELSCH','STATIC_dv_stat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Check Number :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01SELNCH" size="10" maxlength="9">
              <a href="javascript:GetCheck('E01SELNCH')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01SELACC" size="13" maxlength="12">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  </form>
</body>
</html>
