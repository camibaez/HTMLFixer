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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0325BO" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <h3 align="center">Back Office - Search <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="enter_search.jsp,EFE0000B">
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table  class="tableinfo" align="center" >
    <tr>
      <td>
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Reference Number :</div>
            </td>
            <td width="70%" nowrap>
              <input type="hidden" name="DEAID">
              <input type="hidden" name="TYPE">
              <input type="text" name="REFERENCE" size="15" maxlength="12"  >
              <a href="javascript:GetFeRef('DEAID','TYPE','REFERENCE')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right"> Counterparty : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="CUSTOMER" size="9" maxlength="9">
              <input type="text" name="CUNDSC" size="25" maxlength="25">
              <a href="javascript:GetCustomerDescId('CUSTOMER','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Product Type :</div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="PRODUCT" size="5" maxlength="3">
              <a href="javascript:GetCode('PRODUCT','STATIC_fe_bo_prod.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap >
              <div align="right">Amount : </div>
            </td>
            <td width="70%" nowrap >
              <input type="text" name="AMOUNT1"  size=19 maxlength="19" onKeyPress="enterDecimal()" >
            </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap >
              <div align="right">Currency Code : </div>
            </td>
            <td width="70%" nowrap >
              <div align="left">
                <input type="text" name="CURRENCY"  size=4 maxlength="3">
                <a href="javascript:GetCurrency('CURRENCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr>
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Dealer Code : </div>
            </td>
            <td width="70%" nowrap>
              <div align="left">
                <input type="text" name="DEALER"  size=15 maxlength="12" >
                <a href="javascript:GetUserT('DEALER')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
