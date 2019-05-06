<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="lcBalances" class="datapro.eibs.beans.ESD081702Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>
	 builtNewMenu(coll_i_opt);
<%
}
%>

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSESD0817C?SCREEN=4&Pos=' + pos,600,500,4);

}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 



 <FORM>
  <h3 align="center">Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="coll_list_fp.jsp,ESD0817"> 
  </h3>
  <hr size="4">
  <%
	if ( cifList.getNoResult() ) {
	%>
	     <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"><b> There is no results for your search
          </b></div>
      </TD></TR>
   		</TABLE>
  <% 		
	}
	else {
%>
<br>
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
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="32%" height="15" nowrap> 
              <div align="right"><b>Address :</b></div>
            </td>
            <td  width="28%" height="15"> 
              <div align="left"><%= lcBalances.getE02CUMMA2().trim()%></div>
            </td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Original</b> <%= lcBalances.getE02CIFCCY().trim()%> 
                <b>Amount :</b></div>
            </td>
            <td  width="15%" height="15" nowrap> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN1().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%"> 
              <div align="right"></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUMMA3().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN2().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="28%"> 
              <div align="left"><%= lcBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Negotiated Amount :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN3().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%" nowrap> 
              <div align="right"><b>Issue Date :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= Util.formatDate(lcBalances.getE02DATEA1(),lcBalances.getE02DATEA2(),lcBalances.getE02DATEA3())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Expiration Date :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.formatDate(lcBalances.getE02DATEB1(),lcBalances.getE02DATEB2(),lcBalances.getE02DATEB3())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%" height="20"> 
              <div align="right"><b>Fax Number :</b></div>
            </td>
            <td  width="28%" nowrap height="20"> 
              <div align="left"><%= lcBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><b>e - Mail :</b></div>
            </td>
            <td  width="15%" nowrap height="20"> 
              <div align="right"><a href="mailto:<%= lcBalances.getE02CUSIAD().trim()%>" target="body"><%= lcBalances.getE02CUSIAD().trim()%></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transactions</h4>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap >Process Date</TH>
      <TH ALIGN=CENTER  nowrap >Value Date</TH>
      <TH ALIGN=CENTER  nowrap >TC</TH>
      <TH ALIGN=CENTER  nowrap >Description </TH>
      <TH ALIGN=CENTER  nowrap > Debits</TH>
      <TH ALIGN=CENTER  nowrap >Credits </TH>
      <TH ALIGN=CENTER nowrap >Batch</TH>
      <TH ALIGN=CENTER nowrap >Time </TH>
      <TH ALIGN=CENTER nowrap >User</TH>
      <TH ALIGN=CENTER nowrap >Originator Bank</TH>
      <TH ALIGN=CENTER nowrap >Originator Branch</TH>
    </TR>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </TABLE>

<BR>
  <table class="tableinfo">
    <tr> 
      <td width="20%"> 
        <div align="center"><b>Totals</b></div>
      </td>
      <td width="45%"><b>Debits</b> : <%= userPO.getHeader19().trim()%></td>
    <td width="35%"><b>Credits </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
 
<p align="center">
 <input id="EIBSBTN" type=button name="Submit" value="Print" onclick="PrintPreview()">
 </p>
  
<%
  }
%>
</FORM>
</BODY>
</HTML>
