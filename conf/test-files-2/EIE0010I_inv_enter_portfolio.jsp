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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0302" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <input type=HIDDEN name="RWDTYP" value="A">
  <h3 align="center">Portfolio Inquiry</h3>
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr>
      <td nowrap align="center">
        <table class="tableinfo" align="center" width="100%" >
          <tr>
            <td>
              <table width="100%">
                <tr tr id="trdark">
                  <td valign="middle" align="center" colspan="2" height=33>
                    <div align="left"><b>Search by </b></div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Customer :</div>
                  </td>
                  <td width="73%" nowrap>
                    <input type="text" name="CUSTOMER"  size=9 maxlength="9"
						>
                    <input type="text" name="DESCRIPTION"  size=40 maxlength="35"
						>
                    <a href="javascript:GetCustomerDescId('CUSTOMER','DESCRIPTION','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Officer Code :</div>
                  </td>
                  <td width="73%" nowrap>
                    <div align="left">
                      <input type="text" name="OFFICER"  size=9 maxlength="9">
<% // 					  onChange="document.forms[0].RWDTYP.value='O'"> %>
                      <a href="javascript:GetCodeCNOFC('OFFICER','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                    </div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Portfolio Type :</div>
                  </td>
                  <td width="73%" nowrap>
                    <div align="left">
                      <input type=HIDDEN name="SWDTYP">
                      <input type="radio" name="CSWDTYP" value="D" onClick="document.forms[0].SWDTYP.value='D'">
                      Discretionary
                      <input type="radio" name="CSWDTYP" onClick="document.forms[0].SWDTYP.value='N'" value="N">
                      Non Discretionary
                      <input type="radio" name="CSWDTYP" onClick="document.forms[0].SWDTYP.value=''" checked>
                      Both</div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Portfolio Status :</div>
                  </td>
                  <td width="73%" nowrap>
                    <input type=HIDDEN name="SWDSTS">
                    <input type="radio" name="CSWDSTS" value="A" onClick="document.forms[0].SWDSTS.value='A'">
                    Active
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value='I'" value="I">
                    Inactive
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value='P'" value="P">
                    Pending
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value=''" checked value=" ">
                    All </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Opening Date :</div>
                  </td>
                  <td width="73%" nowrap>
                    <div align="left">
                      <input type="text" size="2" maxlength="2" name="SWDOP1" onKeyPress="enterInteger()" >
                      <input type="text" size="2" maxlength="2" name="SWDOP2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="SWDOP3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].SWDOP1,document.forms[0].SWDOP2,document.forms[0].SWDOP3)">
                      <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0">
                      </a> To
                      <input type="text" size="2" maxlength="2" name="SWDUP1" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="SWDUP2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="SWDUP3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].SWDUP1,document.forms[0].SWDUP2,document.forms[0].SWDUP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                    </div>
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
          <tr bgcolor="#FFFFFF">
            <td>
              <div align="center"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
