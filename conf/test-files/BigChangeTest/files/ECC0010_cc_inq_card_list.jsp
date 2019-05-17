<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Credit Cards Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECC001001Message"  scope="session" />
<jsp:useBean id= "cardList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
function cardInquiry(card) {
	document.forms[0].SCREEN.value = "400";
	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I?E01CCMNXN=" + card;
	document.forms[0].submit();
}
</script>
</head>
<body>
<h3 align="center">Credit Cards Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cc_inq_card_list.jsp, ECC0010"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">

  <h4>Customer Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer Number :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCMCUN" size="9" maxlength="9" value="<%= msgCD.getE01CCMCUN().trim()%>"  readonly >
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= msgCD.getE01CUSNA1().trim()%>" readonly >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMCCY" size="3" maxlength="3" value="<%= msgCD.getE01CCMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMPRO" size="4" maxlength="4" value="<%= msgCD.getE01CCMPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Associated Cards</h4>

<%
	if ( cardList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=50%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b>This customer doesn't have associated cards.</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      	<TH ALIGN="CENTER" nowrap>Card Number</TH>
		<TH align="CENTER" nowrap>Expiration Date</TH>
		<TH ALIGN="CENTER" nowrap>Current Balance</TH>
    </TR>
    <%
	cardList.initRow();               
    while (cardList.getNextRow()) {
    	ECC001001Message msgCard = (ECC001001Message) cardList.getRecord();
    %>             
                    
        <TR>
			<TD nowrap align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE01CCMNXN()%>')">
				<%=Util.formatCell(msgCard.getE01CCMNXN())%>
				</A>
			</TD>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE01CCMNXN()%>')">
				<%=Util.formatCell(msgCard.getE01CCMEXM())%>/<%=Util.formatCell(msgCard.getE01CCMEXY())%>
				</A>
			</td>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE01CCMNXN()%>')">
				<%=Util.formatCell(msgCard.getE01CCMLAD())%>
				</A>
			</td>
	   </TR>
        <% 
          }
        %> 
  </TABLE>
<%      
  }
%> 

<br>
  <div align="center"> 
	   <INPUT type="submit" name="EIBSBTN" id="EIBSBTN" value="Return">
  </div>
</form>
</body>
</html>
