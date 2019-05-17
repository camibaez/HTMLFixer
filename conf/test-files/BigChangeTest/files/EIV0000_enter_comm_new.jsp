<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <input type=HIDDEN name="PRODUCT">
  <h3 align="center">Commission Tables Management - New <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="enter_comm_new.jsp,EIV0000">
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table  class="tableinfo" align="center" >
    <tr>
      <td>
        <table id="tableinfo" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr id="trdark">
            <td>&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Product Type : </div>
            </td>
            <td width="70%" nowrap>
              <input type="hidden" name="DOCTYP">
              <input type="radio" name="CDOCTYP" value="BND" onClick="document.forms[0].DOCTYP.value ='BND'">
              Bonds
              <input type="radio" name="CDOCTYP" value="EQT" onClick="document.forms[0].DOCTYP.value ='EQT'">
              Equity
              <input type="radio" name="CDOCTYP" value="MUT" onClick="document.forms[0].DOCTYP.value ='MUT'">
              Mutual Funds
              <input type="radio" name="CDOCTYP" value="ACD" onClick="document.forms[0].DOCTYP.value ='ACD'">
              Commodities
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
            </td>
          </tr>
          <tr id="trclear">
            <td>&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Table Number : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="TABLE" size="4" maxlength="2"  >
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
            </td>
          </tr>
          <tr id="trdark">
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap>
              <div align="right">Table Type :</div>
            </td>
            <td width="70%" nowrap>
              <input type="hidden" name="TABTYP">
              <input type="radio" name="CTABTYP" value="C" onClick="document.forms[0].TABTYP.value ='C'">
              Customer
              <input type="radio" name="CTABTYP" value="" onClick="document.forms[0].TABTYP.value =''" checked>
              Generic<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
          </tr>
          <tr id="trclear">
            <td width="10%" align="center">&nbsp;</td>
            <td width="20%" nowrap >
              <div align="right">Customer Number : </div>
            </td>
            <td width="70%" nowrap >
              <input type="text" name="CUSTOMER" size="12" maxlength="9">
              <input type="text" name="CUNDSC" size="25" maxlength="25">
              <a href="javascript:GetCustomerDescId('CUSTOMER','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
  <div align="center">

    <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </div>
</form>
</body>
</html>
