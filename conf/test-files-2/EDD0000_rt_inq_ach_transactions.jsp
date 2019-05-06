<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<HTML>
<HEAD>
<TITLE>
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "achList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="javascript">
	
	builtNewMenu(rt_i_opt);

</script>
</HEAD>

<%

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<BODY>
<h3 align="center">Last ACH 50 Transactions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_inq_ach_transactions.jsp,EDD0000"> 
</h3>
<hr size="4">
  
<FORM >

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
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<p></p>
<%
	if (achList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100%  height=75%>
   		<TR>
      <TD> 
        <div align="center"> <b>There are no results for your search criteria</b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>  

  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="15%">Effective <br>Date</TH>
      <TH ALIGN=CENTER width="40%">Narrative</TH>
      <TH ALIGN=CENTER width="20%">Transaction<br>Amount</TH>
      <TH ALIGN=CENTER width="5%"></TH>
      <TH ALIGN=CENTER width="20%">Remarks</TH>
    </TR>
    <%
    			String prcFlag = "";
                achList.initRow();
                while (achList.getNextRow()) {
                    datapro.eibs.beans.EDD009003Message msgList = (datapro.eibs.beans.EDD009003Message) achList.getRecord();
                    if (msgList.getE03PRCFLG().equals("D")) {
                    	prcFlag = "Processed";
                    } else {
                    	prcFlag = "Pending";
                    }
    %>              
    			  <TR>
					<TD NOWRAP ALIGN=CENTER><%=Util.formatDate(msgList.getE03DATE1(), msgList.getE03DATE2(), msgList.getE03DATE3())%></TD>
					<TD NOWRAP ALIGN=LEFT><%=Util.formatCell(msgList.getE03NAR())%></TD>
					<TD NOWRAP ALIGN=RIGHT><%=Util.fcolorCCY(msgList.getE03AMT())%></TD>
					<TD NOWRAP ALIGN=CENTER><%=Util.formatCell(msgList.getE03DRCR())%></TD>
					<TD NOWRAP ALIGN=LEFT><%=Util.formatCell(prcFlag)%></TD>
				   </TR>
      
    <%            }
    %> 
  </TABLE>
  
  <%
  }
 %>


</FORM>

</BODY>
</HTML>
