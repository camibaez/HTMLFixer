<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function advanceSearch(){
	  document.forms[0].SCREEN.value = 300;
	  document.forms[0].submit();
	 }
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
<div align="center">
  <h3>Coupon Payment Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="search_coupon_.jsp,EWD0316">
  </h3>
</div>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0316" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
 	<INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr>
      <td nowrap align="center">
        <table  class="tableinfo">
          <tr >
            <td nowrap>
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="trdark">
                  <td nowrap colspan="2" >
                    <div align="left"><b>Search by :</b></div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td nowrap width="17%" >
                    <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].INSTCODE.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
                      Instrument Code</a> :</div>
                  </td>
                  <td nowrap >
                    <div align="left">
                      <input type="text" name="INSTCODE" size="9" maxlength="9" >
                      <input type="text" name="DESCRIPTION" size="35" maxlength="30">
                      <a href="javascript:GetInstrumentParams('INSTCODE','DESCRIPTION','','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a></div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td nowrap width="17%" >
                    <div align="right">Custodian :</div>
                  </td>
                  <td nowrap width="36%" >
                    <input type="text" name="CUSTODIAN"  size=4 maxlength="3"
					>
                    <input type="text" name="DESCR"  size=35 maxlength="35"
					>
                    <a href="javascript:GetCustodian('CUSTODIAN','DESCR')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF">
            <td width="33%">
              <div align="center">
                <input id="EIBSBTN" type=submit name="Submit" value="Submit">
              </div>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>


</form>
</body>
</html>