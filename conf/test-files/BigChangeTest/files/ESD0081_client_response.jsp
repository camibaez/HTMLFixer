<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Qualifile</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="quali" class="datapro.eibs.beans.JBQualiFile"  scope="session" />
<jsp:useBean id="closures" class="datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="accountActions" class="datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="products" class="datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="qualiReasons" class="datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="creditReasons" class="datapro.eibs.beans.JBListRec"  scope="session" />

</head>

<body>

 
<h3 align="center">Customer Information Response<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_both_enter_new, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
    <%
	if ( (quali.getPleaseCallCd().equals("Y")) || (quali.getQualiFileNotPerformedCd().equals("Y")) ) {
%>
  </p>
  <table class="tbenter" width=100% height=100%>
    <tr> 
      <td height="550"> 
        <div align="center"> 
          <% if ( (quali.getPleaseCallCd().equals("Y")) ) {%>
          <h4>Please Call eFunds at 1-800-328-5120 </h4>
          <%}%>
			<br>
		<% if ( (quali.getQualiFileNotPerformedCd().equals("Y")) ) {%> 
		   <h4>Invalid Social Security Number  - no QualiFile Inquiry attempted</h4>
		<%}%>
		</div>
      </td>
    </tr>
  </table>
  <%
	}
	else {
%>
  
  <h4>Customer Information (As Entered)</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="FirstNm" size="13" maxlength="12" value="<%= quali.getFirstNm()%>">
              <input type="text" name="MiddleNm" size="2" maxlength="1" value="<%= quali.getMiddleNm()%>">
              <input type="text" name="LastNm" size="21" maxlength="20" value="<%= quali.getLastNm()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="StreetAdrressTxt" size="26" maxlength="25" value="<%= quali.getStreetAdrressTxt()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="CityNm" size="15" maxlength="15" value="<%= quali.getCityNm()%>">
              <input type="text" name="StateCd" size="3" maxlength="2" value="<%= quali.getStateCd()%>">
              <input type="text" name="PostalPlusFourCd" size="9" maxlength="20" value="<%= quali.getPostalPlusFourCd()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Social Security :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="GovernmentNbr" size="10" maxlength="9" value="<%= quali.getGovernmentNbr()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">DL Number :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="IdentificationStateNbr" size="25" maxlength="25" value="<%= quali.getIdentificationStateNbr()%>">
                <input type="text" name="IdentificationStateCd" size="3" maxlength="2" value="<%= quali.getIdentificationStateCd()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Account Actions</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Action :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="AccountAcceptanceText" size="11" maxlength="10" value="<%= quali.getAccountAcceptanceText()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="6%" >Recomended Actions</td>
          </tr>
          <%
                accountActions.initRow();
                while (accountActions.getNextRow()) {
                    if (accountActions.getFlag().equals("")) {
                    		
	      %>
          <tr id="trclear"> 
            <td nowrap width="6%" > 
              <div align="center"><%= accountActions.getRecord(0) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  
  <h4 align="left">Product Offer</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="6%" >Product</td>
            <td nowrap width="23%" > 
              <div align="center">Limits</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center">A.P.R</div>
            </td>
          </tr>
          <%
                products.initRow();
                while (products.getNextRow()) {
                    if (products.getFlag().equals("")) {
                    		
	      %>
          <tr id="trclear"> 
            <td nowrap width="6%" > 
              <div align="center"><%= products.getRecord(0) %></div>
            </td>
            <td nowrap width="23%" > 
              <div align="center"><%= Util.fcolorCCY(products.getRecord(1) %></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"><%= products.getRecord(2) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">QualiFile Details</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="64%" >
              <div align="right">P$YCLE Cluster Code :</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="ZipClusterCategoryCd" size="7" maxlength="6" value="<%= quali.getZipClusterCategoryCd()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="64%" > 
              <div align="right">QualiFile Score :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" name="ScoreNbr" size="5" maxlength="4" value="<%= quali.getScoreNbr()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2" >Reasons</td>
          </tr>
          <%
                qualiReasons.initRow();
                while (qualiReasons.getNextRow()) {
                    if (qualiReasons.getFlag().equals("")) {
                    		
	      %>
          <tr id="trclear"> 
            <td nowrap width="64%" > 
              <div align="center"><%= qualiReasons.getRecord(0) %></div>
            </td>
            <td nowrap width="36%" > 
              <div align="center"><%= qualiReasons.getRecord(1) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="64%" > 
              <div align="right">Credit Score :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                <input type="text" name="CreditBureauScoreNbr" size="5" maxlength="4" value="<%= quali.getCreditBureauScoreNbr()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2" >Reasons</td>
          </tr>
          <%
                creditReasons.initRow();
                while (creditReasons.getNextRow()) {
                    if (creditReasons.getFlag().equals("")) {
                    		
	      %>
          <tr id="trclear"> 
            <td nowrap width="64%" > 
              <div align="center"><%= creditReasons.getRecord(0) %></div>
            </td>
            <td nowrap width="36%" > 
              <div align="center"><%= creditReasons.getRecord(1) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">FraudFinder Details</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <textarea  name="FraudFinderResponseTxt" cols="68" rows="2"><%= quali.getFraudFinderResponseTxt()%></textarea>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Identification Validation</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Social Security Validation :</div>
            </td>
            <td nowrap> 
              <input type="text" name="ValidGovernmentNumberTxt" size="66" maxlength="65" value="<%= quali.getValidGovernmentNumberTxt()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">DL Format :</div>
            </td>
            <td nowrap width="0%"> 
              <input type="text" name="ValidDriverLicenseTxt" size="60" maxlength="58" value="<%= quali.getValidDriverLicenseTxt()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">eFunds History</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Previous Inquiry :</div>
            </td>
            <td nowrap width="0%"> 
              <input type="text" name="PreviosInquiryQty" size="5" maxlength="5" value="<%= quali.getPreviosInquiryQty()%>">
            </td>
            <td nowrap colspan="2"> 
              <% if(quali.getPreviousInquiriesNotFoundCd().equals("Y")){%>
              No Previous Inquiries Found 
              <%}%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Closures :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="TotalClosures" size="5" maxlength="4" value="<%= quali.getTotalClosures()%>">
            </td>
            <td nowrap colspan="2"> 
              <div align="left"> 
                <% if(quali.getClosuresNotFoundCd().equals("Y")){%>
                No Closures Found 
                <%}%>
              </div>
            </td>
          </tr>
		  <% if(quali.getClosuresNotFoundCd().equals("N")){%>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Disputed Closures :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="ConsumerDisputeQty" size="4" maxlength="3" value="<%= quali.getConsumerDisputeQty()%>">
            </td>
            <td nowrap width="70%"> 
              <div align="right">Paid Closures :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="PaidClosureQty" size="4" maxlength="3" value="<%= quali.getPaidClosureQty()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Unpaid Closures :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="UnpaidClosureQty" size="4" maxlength="3" value="<%= quali.getUnpaidClosureQty()%>">
            </td>
            <td nowrap width="70%">&nbsp;</td>
            <td nowrap width="70%">&nbsp;</td>
          </tr>
		  <%}%>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Reported Closures</h4>
   
  <% if(quali.getClosuresNotFoundCd().equals("N")){%>
  <h4>No Closures Reported</h4>         
  
  <%   		
	}
	else {
%>
  <br>
  <table class=tableinfo >
    <tr > 
      <td width=63% id ="trdark" align=right >Original Charge - Off Amount.: </td>
      <td width=37%><%=quali.getOriginalChargeOffAmt()%> <%=quali.getSettlementPaidTxt()%></td>
    </tr>
    <tr> 
      <td colspan="2" id ="trdark" align=right> 
        <div align="left"><%= quali.getConsumerDisputeTxt()%></div>
      </td>
    </tr>
    <tr> 
      <td width=63% id ="trdark" align=right>Date : </td>
      <td width=37%><%= quali.getSettlementPaidDt()%></td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="3%" >Category</td>
            <td nowrap width="3%" > Reasons</td>
          </tr>
          <%
                closures.initRow();
                while (closures.getNextRow()) {
                    if (closures.getFlag().equals("")) {
                    		
	      %>
          <tr id="trclear"> 
            <td nowrap width="3%" > 
              <div align="center"><%= closures.getRecord(0) %> </div>
            </td>
            <td nowrap width="3%" > 
              <div align="left"><%= closures.getRecord(1) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %>
        </table>
      </td>
    </tr>
  </table>
     <h4 align="left">Collections Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right"><%= quali.getCollectionAmountTxt()%></div>
            </td>
            <td nowrap width="0%"> 
              <input type="text" name="TotalCollectionAmt" size="11" maxlength="10" value="<%= quali.getTotalCollectionAmt()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Collections Payment Recorded Date :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="CollectionsPaymentRecordedDt" size="9" maxlength="8" value="<%= quali.getCollectionsPaymentRecordedDt()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="left"> 
                <% if(quali.getCollectionsPaidCd().equals("Y")){%>
                Amount has been paid or Settled in Full 
                <%}%>
              </div>
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
            }    
  %>
  <h4 align="left">Retail Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Retail :</div>
            </td>
            <td nowrap width="0%"> 
              <div align="left"><%= quali.getUnpaidRetailItemsFoundTxt()%> <%= quali.getUnpaidRetailItemsNotFoundTxt()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4 align="left">Consumer Debit Education</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Consumer Debit Education Completion Date :</div>
            </td>
            <td nowrap width="0%"> 
              <%= quali.getConsumerDebitEducationCompletionDt()%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Reference Details</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Debit Bureau Reference :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="ConsumerDetailReferenceNbr" size="13" maxlength="12"  value="<%= quali.getConsumerDetailReferenceNbr()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Credit Bureau ID :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="CreditBureauId" size="5" maxlength="4"  value="<%= quali.getCreditBureauId()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Credit Bureau Reference :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="CreditBureauReferenceNbr" size="20" maxlength="19"  value="<%= quali.getCreditBureauReferenceNbr()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Transaction Tracking ID :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="TransactionTrackingId" size="50" maxlength="48" value="<%= quali.getTransactionTrackingId()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <%
  }
%> 
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit22" value="Submit" >
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
