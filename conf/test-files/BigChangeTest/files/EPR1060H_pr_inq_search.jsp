<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060H" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td valign="middle" align="center" colspan="3" height=33> <b>Financial 
              Transaction Help</b> </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Customer Number : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01ORDCUS"  size=10 maxlength="10" onKeyPress="enterInteger()">
              <a href="javascript:GetCustomerDescId('E01ORDCUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a></td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right"> Date From: </div>
            </td>
            <td width="70%" nowrap> 
              <input type="text" size="2" maxlength="2" name="E01SCHFD1" onKeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01SCHFD2" onKeyPress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01SCHFD3" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01SCHFD1,document.forms[0].E01SCHFD2,document.forms[0].E01SCHFD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              To: 
              <input type="text" size="2" maxlength="2" name="E01SCHTD1" onKeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01SCHTD2" onKeyPress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01SCHTD3" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01SCHTD1,document.forms[0].E01SCHTD2,document.forms[0].E01SCHTD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap > 
              <div align="right">W/T Amount From: </div>
            </td>
            <td width="70%" nowrap > 
              <input type="text" name="E01FRAMNT"  size=19 maxlength="19" onKeypress="enterDecimal()">
              To: 
              <input type="text" name="E01TOAMNT"  size=19 maxlength="19" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap > 
              <div align="right">G/L Debit Account: </div>
            </td>
            <td width="70%" nowrap > 
              <div align="left"> 
                <input type="text" name="E01DEBGLN"  size=15 maxlength="12" onKeypress="enterInteger()">
                <a href="javascript:GetLedger('E01DEBGLN','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap > 
              <div align="right">G/L Credit Account: </div>
            </td>
            <td width="70%" nowrap > 
              <div align="left"> 
                <input type="text" name="E01CREGLN"  size=15 maxlength="12" onKeypress="enterInteger()">
                <a href="javascript:GetLedger('E01CREGLN','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
          
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap > 
              <div align="right">Debit Account: </div>
            </td>
            <td width="70%" nowrap > 
              <div align="left"> 
                <input type="text" name="E01DEBACC"  size=15 maxlength="12" onKeypress="enterInteger()">
                <a href="javascript:GetAccount('E01DEBACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">Credit Account: </div>
            </td>
            <td width="70%" nowrap> 
              <div align="left"> 
                <input type="text" name="E01CREACC"  size=15 maxlength="12" onKeypress="enterInteger()">
                <a href="javascript:GetAccount('E01CREACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">W/T Status: </div>
            </td>
            <td width="70%" nowrap> 
              <select name="E01WRTSTS">
                <option value=" "> </option>
                <option value="R">Released/Approved</option>
                <option value="D">Deleted</option>
                <option value="P">O/D Repair Pending</option>
                <option value="C">Repair Pending</option>
                <option value="V">Voided</option>
                <option value="X">Reversed</option>
                <option value="*">Approval Pending</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">By Order: </div>
            </td>
            <td width="70%" nowrap> 
              <input type="hidden" name="CustID7"  size=10 maxlength="10" value="0">
              <input type="text" name="E01WRTBYO"  size=36 maxlength="35">
              <a href="javascript:GetCustomerDescId('CustID7','E01WRTBYO','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
            </td>
          </tr>
          <tr> 
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap> 
              <div align="right">Beneficiary: </div>
            </td>
            <td width="70%" nowrap> 
              <input type="hidden" name="CustID8"  size=10 maxlength="10" value="0">
              <input type="text" name="E01WRTBNF"  size=36 maxlength="35">
              <a href="javascript:GetCustomerDescId('CustID8','E01WRTBNF','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td width="20%"> 
              <div align="right">Ordering Institution: </div>
            </td>
            <td width="70%" nowrap> 
              <input type="text" name="E01WRTORI"  size=35 maxlength="35">
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td width="20%"> 
              <div align="right">Beneficiary Bank :</div>
            </td>
            <td width="70%" nowrap> 
              <input type="text" name="E01WRTBBK"  size=35 maxlength="35">
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
