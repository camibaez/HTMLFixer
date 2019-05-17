<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Payment Plan Schedule
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="header" class= "datapro.eibs.beans.EDL090001Message"  scope="session"/>


<jsp:useBean id= "list" class= "datapro.eibs.beans.JBListRec"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_a_opt);
<%   
}
else  {
%>
	builtNewMenu(ln_a_opt);
<%   
}
%>

</SCRIPT>

</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
     out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<form>
  <input TYPE=HIDDEN name="SCREEN" value="500">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">


  
  <h3 align="center">Payment Schedule<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_crn_pay.jsp , EDL0900"> 
  </h3>
  <hr size="4">

<h4></h4>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap   > 
              <div align="right"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap   > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <div align="right"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap  > 
              <div align="right"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap  > 
              <div align="right"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap  > 
              <div align="right">Calculation Type :</div>
            </td>
            <td nowrap  > 
              <div align="right"><%= userPO.getHeader15().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap >Nbr</TH>
      <TH ALIGN=CENTER nowrap >Payment Date</TH>
      <TH ALIGN=CENTER nowrap >Principal</TH>
      <TH ALIGN=CENTER nowrap >Interest</TH>
      <TH ALIGN=CENTER nowrap >Other Charges</TH>
      <TH ALIGN=CENTER nowrap  >Total Payments</TH>
      <TH ALIGN=CENTER nowrap >Balance</TH>
      <TH ALIGN=CENTER nowrap >Status</TH>
      <TH ALIGN=CENTER nowrap >Maturity</TH>
      <TH ALIGN=CENTER nowrap >Date Paid</TH>
      <TH ALIGN=CENTER nowrap >Amount Paid</TH>
    </TR>
    <%
                list.initRow();
                while (list.getNextRow()) {
                    if (list.getFlag().equals("")) {
                    		//out.println(list.getRecord());
	%> 
    <TR> 
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(0) %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(1) %></A></TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(2) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(3) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(4) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(5) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><a href="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(6) %></a></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="center"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(7) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(8) %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(9) %></A></TD>
      <TD ALIGN=CENTER  nowrap> 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(10) %></A></div>
      </TD>
    </TR>
    <%
                    }
                }
    %> 
  </TABLE>

</FORM>

</BODY>
</HTML>
