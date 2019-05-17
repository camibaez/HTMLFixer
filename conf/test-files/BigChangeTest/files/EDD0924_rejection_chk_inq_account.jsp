<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Summary Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtRejAccInq" class="datapro.eibs.beans.EDD009001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif','<%=request.getContextPath()%>/images/e/totals_over.gif','<%=request.getContextPath()%>/images/e/position_over.gif','<%=request.getContextPath()%>/images/e/managerial_inquires_over.gif','<%=request.getContextPath()%>/images/e/account_listing_over.gif','<%=request.getContextPath()%>/images/e/lines_of_credit_over.gif','<%=request.getContextPath()%>/images/e/collaterals_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif')" >
<div align="center"></div>
<h3 align="center">Account Summary<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_rejection_account_inquiry, EDD00924"></h3>
<hr size="4">
<form>
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
                <input type="text" readonly name="E01ACMCUN" size="9" maxlength="9"  value="<%= rtRejAccInq.getE01ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E01CUSNA1" size="45" maxlength="45"  value="<%= rtRejAccInq.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMACC" size="12" maxlength="12" value="<%= rtRejAccInq.getE01ACMACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E01ACMCCY" size="3" maxlength="3" value="<%= rtRejAccInq.getE01ACMCCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E01ACMPRO" size="4" maxlength="4"  value="<%= rtRejAccInq.getE01ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Gross Balance :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMMGB" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMMGB().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Average Gross Balance :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMGAV" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMGAV().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Net Balance :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMMNB" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMMNB().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Average Net Balance :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMNAV" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMNAV().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Hold Amount :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMHAM" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMHAM().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Average Gross Balance Annual :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMYAG" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMYAG().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Interest Pending :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMIAC" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMIAC().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Average Net Balance Annual :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMYAN" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMYAN().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected Interest :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMOIA" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMOIA().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Uncollected Balance :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01UNCBAL" size="15" maxlength="15" value="<%= rtRejAccInq.getE01UNCBAL().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected 1 Day :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMUL1" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMUL1().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Last Overdraft Date :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01LSTOD1" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTOD1().trim()%>" >
                <input type="text" readonly name="E01LSTOD2" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTOD2().trim()%>" >
                <input type="text" readonly name="E01LSTOD3" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTOD3().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected 2 Days :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMUL2" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMUL2().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Overdraft Days Annual :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMTOY" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMTOY().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected 3 Days :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMUL3" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMUL3().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Overdraft Days Cycle :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMCDO" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMCDO().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Uncollected more than 3 Days :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMFL1" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMFL1().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Overdraft Times Total :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMTOD" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMTOD().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01OPNDT1" size="2" maxlength="2" value="<%= rtRejAccInq.getE01OPNDT1().trim()%>" >
                <input type="text" readonly name="E01OPNDT2" size="2" maxlength="2" value="<%= rtRejAccInq.getE01OPNDT2().trim()%>" >
                <input type="text" readonly name="E01OPNDT3" size="2" maxlength="2" value="<%= rtRejAccInq.getE01OPNDT3().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Overdraft Times Cycle :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E01ACMDOA" size="4" maxlength="3" value="<%= rtRejAccInq.getE01ACMDOA().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Credit Line Customer :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMCMC" size="9" maxlength="9" value="<%= rtRejAccInq.getE01ACMCMC().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Credit Line Number :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMCMN" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMCMN().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Use of Credit Line :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMCLY" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMCLY().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Available Credit Line :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01LNESAL" size="15" maxlength="15" value="<%= rtRejAccInq.getE01LNESAL().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Credit Line Expire :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01LNXDT1" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LNXDT1().trim()%>" >
                <input type="text" readonly name="E01LNXDT2" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LNXDT2().trim()%>" >
                <input type="text" readonly name="E01LNXDT3" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LNXDT3().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Lack of Funds :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMNRY" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMNRY().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Last Deposit Date :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01LSTDD1" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTDD1().trim()%>" >
                <input type="text" readonly name="E01LSTDD2" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTDD2().trim()%>" >
                <input type="text" readonly name="E01LSTDD3" size="2" maxlength="2" value="<%= rtRejAccInq.getE01LSTDD3().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Last Deposit Amount :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" readonly name="E01ACMLDA" size="15" maxlength="15" value="<%= rtRejAccInq.getE01ACMLDA().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Account Status :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left">
                <input type="text" readonly name="E01DSCAST" size="4" maxlength="2" value="<%= rtRejAccInq.getE01DSCAST().trim()%>" >
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
