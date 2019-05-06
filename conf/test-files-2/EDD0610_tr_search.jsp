<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<style>
TH {
  background: #FFFFFF;
}
</style>

<body>
<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0610" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <table id="TBHELP" align="center" width="100%" height="90%">
    <tr>
      <td width="7%" height="405">&nbsp;</td>
      <td width="95%" height="405">
        <table id="TBHELP" align="center" width="100%" height="60%" border="0">
          <tr>
            <td>
              <table id="TBHELP" align="center" width="100%">
                <tr>
                  <td width="100%" height="197">
                    <table  id="TBHELP" width="106%" border="0" cellspacing="0" cellpadding="0" height="341">
                      <tr>
                        <th id="THHELP" colspan="8" nowrap>
                          <blockquote>
                            <div align="left">Search Type</div>
                          </blockquote>
                        </th>
                      </tr>
                      <tr>
                        <td id="THHELP" colspan="8" nowrap>&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Wire Transfer Type: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <p>
                            <input type="text" name="E01SCHTYA"  size=3 maxlength="1">
                            <a href="javascript:GetCode('E01SCHTYA','STATIC_tr_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
                          </p>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">W/T Number: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="text" name="E01SCHNUM"  size=10 maxlength="7">
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Value Date to: </div>
                        </td>
                        <td colspan="6" nowrap>
                          <input type="text" size="2" maxlength="2" name="E01SCHFD1">
                          <input type="text" size="2" maxlength="2" name="E01SCHFD2">
                          <input type="text" size="2" maxlength="2" name="E01SCHFD3">
                          <a href="javascript:DatePicker(document.forms[0].E01SCHFD1,document.forms[0].E01SCHFD2,document.forms[0].E01SCHFD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                          from:
                          <input type="text" size="2" maxlength="2" name="E01SCHTD1">
                          <input type="text" size="2" maxlength="2" name="E01SCHTD2">
                          <input type="text" name="E01SCHTD3" size="2" maxlength="2">
						  <a href="javascript:DatePicker(document.forms[0].E01SCHTD1,document.forms[0].E01SCHTD2,document.forms[0].E01SCHTD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                        </td>
                        <td width="32%" nowrap>&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap height="20">
                          <div align="right">W/T Amount to: </div>
                        </td>
                        <td colspan="6" nowrap height="20">
                          <input type="text" name="E01SCHAMF"  size=19>
                          from:
                          <input type="text" name="E01SCHAMT"  size=19>
                        </td>
                        <td width="32%" nowrap height="20">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Debit G/L: </div>
                        </td>
                        <td colspan="6" nowrap>
                          <div align="left">
                            <input type="text" size="1" maxlength="2" name="BNK1">
                            /
                            <input type="text" size="1" maxlength="3" name="CCY1">
                            <a href="javascript:GetCurrency('CCY1',document.forms[0].BNK1.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
                            <input type="text" name="E01SCHDGL"  size=15>
                            <a href="javascript:GetLedger('E01SCHDGL',document.forms[0].BNK1.value,document.forms[0].CCY1.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></div>
                        </td>
                        <td width="32%" nowrap>&nbsp; </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap height="36">
                          <div align="right">Credit G/L: </div>
                        </td>
                        <td colspan="6" nowrap height="36">
                          <div align="left">
                            <input type="text" size="1" maxlength="2" name="BNK2">
                            /
                            <input type="text" size="1" maxlength="3" name="CCY2">
                            <a href="javascript:GetCurrency('CCY2',document.forms[0].BNK2.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
                            <input type="text" name="E01SCHCGL"  size=15>
                            <a href="javascript:GetLedger('E01SCHCGL',document.forms[0].BNK2.value,document.forms[0].CCY2.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
                        </td>
                        <td width="32%" nowrap height="36">&nbsp; </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap height="33">
                          <div align="right">Debit Account: </div>
                        </td>
                        <td colspan="6" nowrap height="33">
                          <div align="left">
                            <input type="text" name="E01SCHDAC"  size=15>
                            <a href="javascript:GetAccount('E01SCHDAC',document.forms[0].BNK1.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a></div>
                        </td>
                        <td width="32%" nowrap height="33">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Credit Account: </div>
                        </td>
                        <td colspan="6" nowrap>
                          <div align="left">
                            <input type="text" name="E01SCHCAC"  size=15>
                            <a href="javascript:GetAccount('E01SCHCAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
                          </div>
                        </td>
                        <td width="32%" nowrap>&nbsp; </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Our Reference: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="text" name="E01SCHORF"  size=19>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">By Order: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="hidden" name="CustID7"  size=10 maxlength="10" value="0">
                          <input type="text" name="E01SCHBYO"  size=30 maxlength="35">
                          <a href="javascript:GetCustomerDescId('CustID7','E01SCHBYO','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Beneficiary: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="hidden" name="CustID8"  size=10 maxlength="10" value="0">
                          <input type="text" name="E01SCHBNF"  size=30 maxlength="35">
                          <a href="javascript:GetCustomerDescId('CustID8','E01SCHBNF','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Input Operator: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="text" name="E01SCHOPR"  size=19>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%" nowrap>
                          <div align="right">Output Operator: </div>
                        </td>
                        <td colspan="7" nowrap>
                          <input type="text" name="E01SCHREL"  size=19>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="8" nowrap>&nbsp; </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <div align="center">
<br>
 <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
        </div>
      </td>
      <td width="7%" height="405">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
