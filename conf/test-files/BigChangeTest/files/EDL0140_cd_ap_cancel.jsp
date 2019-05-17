<html>
<head>
<title>Prepayment of Certificates of Deposit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></SCRIPT>
<SCRIPT Language="Javascript">

   builtNewMenu(approval_opt);
   initMenu();

</SCRIPT>
</head>

<jsp:useBean id= "cdCancel" class= "datapro.eibs.beans.EDL013007Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center">Prepayment <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_ap_cancel.jsp, EDL0140" > 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <INPUT TYPE=HIDDEN NAME="E07DEABNK" VALUE="<%= cdCancel.getE07DEABNK().trim()%>">
  <input type=HIDDEN name="E07DEAACD" value="<%= cdCancel.getE07DEAACD().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly size="9" maxlength="9" name="E07DEACUN" value="<%= cdCancel.getE07DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly size="45" maxlength="45" name="E07CUSNA1" value="<%= cdCancel.getE07CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Contract :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly size="12" maxlength="9" name="E07DEAACC" value="<%= cdCancel.getE07DEAACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E07DEACCY" size="3" maxlength="3" value="<%= cdCancel.getE07DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly size="4" maxlength="4" name="E07DEAPRO" value="<%= cdCancel.getE07DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Financial Information</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Last Calculation Date :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" readonly name="E07DEALC1" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC1().trim()%>">
              <input type="text" readonly name="E07DEALC2" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC2().trim()%>">
              <input type="text" readonly name="E07DEALC3" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC3().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" readonly name="E07DEAMEP" size="15" maxlength="13" value="<%= cdCancel.getE07DEAMEP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%" height="23"> 
              <div align="right">Interest Amount :</div>
            </td>
            <td nowrap width="61%" height="23"> 
              <input type="text" readonly name="E07DEAMEI" size="15" maxlength="13" value="<%= cdCancel.getE07DEAMEI().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%" height="19"> 
              <div align="right">Withholding :</div>
            </td>
            <td nowrap width="61%" height="19"> 
              <input type="text" readonly name="E07DEAWHL" size="15" maxlength="13" value="<%= cdCancel.getE07DEAWHL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Sales Taxes :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" readonly name="E07DEATAX" size="15" maxlength="13" value="<%= cdCancel.getE07DEATAX().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" readonly name="E07DEATOT" size="15" maxlength="13" value="<%= cdCancel.getE07DEATOT().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p></p>
  <h4>Prepayment of Deals</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap height="21">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="39%" height="23"> 
              <div align="right">Penalty Rate :</div>
            </td>
            <td nowrap width="61%" height="23">
              <input type="text" readonly name="E07PENRTE" size="9" maxlength="9" value="<%= cdCancel.getE07PENRTE().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%">
              <div align="right">Number of Days :</div>
            </td>
            <td nowrap width="61%" height="22" bordercolor="#FFFFFF" >
              <input type="text" readonly name="E07PENDYS" size="3" maxlength="3" value="<%= cdCancel.getE07PENDYS().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p></p>
  <h4>Transaction Information</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNPRI" size="15" maxlength="13" value="<%= cdCancel.getE07TRNPRI().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Interests :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNINT" size="15" maxlength="13" value="<%= cdCancel.getE07TRNINT().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Penalty :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNPEN" size="15" maxlength="13" value="<%= cdCancel.getE07TRNPEN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Withholding :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNWHL" size="15" maxlength="13" value="<%= cdCancel.getE07TRNWHL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Sales Taxes :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNTAX" size="15" maxlength="13" value="<%= cdCancel.getE07TRNTAX().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Prepayment Amount :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E07TRNTOT" size="15" maxlength="13" value="<%= cdCancel.getE07TRNTOT().trim()%>">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="center"><b>Repayment Account</b></div>
            </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark"> 
            <td nowrap width="31%" > 
              <div align="center">Concept</div>
            </td>
            <td nowrap width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td nowrap width="13%" > 
              <div align="center">Branch</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Currency</div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="center" nowrap > 
                <input type="text" readonly name="E07TRNOPC" value="<%= cdCancel.getE07TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E07TRNGLN" value="<%= cdCancel.getE07TRNGLN().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E07TRNCON" value="<%= cdCancel.getE07TRNCON().trim()%>">
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" readonly size="2" maxlength="2" value="<%= cdCancel.getE07TRNBNK().trim()%>" name="E07TRNBNK">
              </div>
            </td>
            <td nowrap width="13%" > 
              <div align="center"> 
                <input type="text" readonly size="3" maxlength="3" value="<%= cdCancel.getE07TRNBRN().trim()%>" name="E07TRNBRN">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" readonly size="3" maxlength="3" name="E07TRNCCY" value="<%= cdCancel.getE07TRNCCY().trim()%>">
              </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" readonly size="16" maxlength="12" value="<%= cdCancel.getE07TRNACC().trim()%>" name="E07TRNACC">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  </form>
</body>
</html>
