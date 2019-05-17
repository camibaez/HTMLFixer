<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Cambio de Status</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECC009001Message"  scope="session" />
<jsp:useBean id= "cardList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
function cardInquiry(card) {
	document.forms[0].E01CCRNUM.value = card;
	document.forms[0].submit();
}
</script>
</head>
<body>
<h3 align="center">Change Status<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="card_status_list.jsp, ECC0090"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0090">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="E02TARTYP" VALUE="<%= msgCD.getE01TARTYP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCRNUM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="accmain" VALUE="">

  <h4>Customer Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><B>Customer ID :</B></div>
            </td>
            <td nowrap width="16%"> 
              	<input type="text" name="E02CCRCID" size="16" maxlength="15" value="<%= msgCD.getE01CCRCID().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><B>Customer Name :</B></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02PRINA1" size="36" maxlength="35" value="<%= msgCD.getE01PRINA1().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"><B>Customer Number :</B></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02PRICUN" size="10" maxlength="10" value="<%= msgCD.getE01PRICUN().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><B>Customer Type :</B></div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="text" name="E01CCRTYP" size="5" maxlength="4" value="<%= msgCD.getE01CCRTYP().trim()%>" readonly>
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Related Cards</h4>

<%
	if ( cardList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=50%>
 		<TR>
      <TD> 
        
      <div align="center"> <FONT size="3"><B> Customer don't have
		 related cards</B></FONT></div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      	<TH ALIGN="CENTER" nowrap>Card Number</TH>
		<TH align="CENTER" nowrap>Assign<br>Date</TH>
		<TH ALIGN="CENTER" nowrap>Account Number</TH>
      	<TH ALIGN="CENTER" nowrap>Product<br>Type</TH>
      	<TH ALIGN="CENTER" nowrap>Status</TH>
		<TH align="CENTER" nowrap>Delivery<br>Branch</TH>
		<TH align="CENTER" nowrap>Assign<br>Type</TH>
		<TH ALIGN="CENTER" nowrap>User</TH>
		<TH align="center" nowrap>Default</TH>
    </TR>
    <%
	cardList.initRow();               
    while (cardList.getNextRow()) {
    	ECC009002Message msgCard = (ECC009002Message) cardList.getRecord();
    	if (msgCard.getE02CCRASG().equals("P") || msgCard.getE02CCRASG().equals("S")) {		 
    %>             
                    
        <TR>
			<TD nowrap align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRNUM())%>
				</A>
			</TD>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRASD())%>/<%=Util.formatCell(msgCard.getE02CCRASM())%>/<%=Util.formatCell(msgCard.getE02CCRASY())%>
				</A>
			</td>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRCRA())%> (<%=Util.formatCell(msgCard.getE02CCRASG())%>)
				</A>
			</td>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRTYP())%>/<%=Util.formatCell(msgCard.getE02CCRSTP())%>
				</A>
			</td>
			<TD nowrap align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRDSC())%>
				</A>
			</TD>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRBRN())%>
				</A>
			</td>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<% if (msgCard.getE02CCRTPI().equals("T")) { out.println("Titular"); } else { out.println("Adicional"); }%>
				</A>
			</td>
			<td NOWRAP align="center">
				<A HREF="javascript:cardInquiry('<%= msgCard.getE02CCRNUM()%>')">
				<%=Util.formatCell(msgCard.getE02CCRUSR())%>
				</A>
			</td>
        	<td NOWRAP align="center">
				<% if (msgCard.getE02CCRPRI().equals("*")) { %>
				<img src="<%=request.getContextPath()%>/images/cone.gif" alt="main" align="absbottom" border="0">
				<% } %>
			</td>
	   </TR>
        <% 
          	}
          }
        %> 
  </TABLE>
<%      
  }
%> 

</form>
</body>
</html>