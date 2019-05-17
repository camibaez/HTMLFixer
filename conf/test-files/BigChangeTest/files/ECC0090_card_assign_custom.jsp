<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Debit Cards Assignment</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "cardList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECC009001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
<body>
<h3 align="center">Debit Cards Assigment<br>New Assigment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="card_assign_custom.jsp, ECC0090"> 
</h3>
<hr size="4">
<% 
if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
 
	cardList.initRow();
	cardList.getNextRow();
	datapro.eibs.beans.ECC009001Message msgPart0 = (datapro.eibs.beans.ECC009001Message) cardList.getRecord();
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0090" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TARTYP" VALUE="<%= msgPart0.getE01TARTYP().trim()%>">
  <input type=HIDDEN name="E01CCRCID" value="<%= msgPart0.getE01CCRCID().trim()%>">
  <input type=HIDDEN name="E01PRINA1" value="<%= msgPart0.getE01PRINA1().trim()%>">
  <input type=HIDDEN name="E01PRICUN" value="<%= msgPart0.getE01PRICUN().trim()%>">
  <input type=HIDDEN name="E01CCRTYP" value="<%= msgPart0.getE01CCRTYP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCRPER" VALUE="P">

  
  <h4>Customer Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Customer ID :</div>
            </td>
            <td nowrap width="16%"> 
              	<input type="text" name="E01CCRCID" size="16" maxlength="15" value="<% if(msgPart0.getE01CCRTPI().equals("T")) { out.println(userPO.getIdentifier()); } else if (msgPart0.getE01CCRTPI().equals("A")) { out.println(userPO.getHeader9()); } else { out.println(userPO.getIdentifier()); }%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Customer Name :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01PRINA1" size="36" maxlength="35" value="<% if (msgPart0.getE01CCRTPI().equals("T")) { out.println(userPO.getCusName()); } else if (msgPart0.getE01CCRTPI().equals("A")) { out.println(userPO.getHeader11()); } else { out.println(userPO.getCusName()); }%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E01PRICUN" size="10" maxlength="10" value="<% if (msgPart0.getE01CCRTPI().equals("T")) { out.println(userPO.getCusNum()); } else if (msgPart0.getE01CCRTPI().equals("A")) { out.println(userPO.getHeader10()); } else { out.println(userPO.getCusNum()); }%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Customer Type :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCRTYP" size="5" maxlength="4" value="<% if (msgPart0.getE01CCRTPI().equals("T")) { out.println(userPO.getCusType()); } else if (msgPart0.getE01CCRTPI().equals("A")) { out.println(userPO.getHeader12()); } else { out.println(userPO.getCusType()); }%>" readonly>
              </div>
             </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
<BR>
<TABLE class="tableinfo" align="center">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="50%">
						<DIV align="right">Plastic Type :</DIV>
						</TD>
						<TD nowrap width="50%">
							<DIV align="left">
								<INPUT type="text" name="E01CCRPLA" size="3" maxlength="2" value="">
								<a href="javascript:GetDescATMCard('E01CCRPLA','','D ')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a>
							</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
  <br>
  <div align="center"> 
	   <INPUT type="submit" name="EIBSBTN" id="EIBSBTN" value="Submit">
  </div>
  </form>
</body>
</html>
