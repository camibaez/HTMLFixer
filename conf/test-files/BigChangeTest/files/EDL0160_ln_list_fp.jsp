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

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session"/>
<jsp:useBean id="stBalances" class= "datapro.eibs.beans.EDL030002Message"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}
else  {
%>
	builtNewMenu(ln_i_2_opt);
<%   
}
%>
<%
}
%>

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=4&Pos=' + pos,600,500,4);
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
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h4>There are no results for your search criteria</h4></center>");
	}
	else {
%>
  <h3 align="center">Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_list_fp.jsp,EDL0160"> 
  </h3>
  <hr size="4">
  <BR>
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
  <h4>Basic Account Information</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="32%"  nowrap> 
              <div align="right"><b>Name :</b></div>
            </td>
            <td  width="28%" > 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" > 
              <div align="right"><%= stBalances.getE02DEACCY().trim()%> <b>Principal 
                Amount :</b></div>
            </td>
            <td  width="15%"  nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%"> 
              <div align="right"><b>Address :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%" nowrap>&nbsp;</td>
            <td  width="28%"><%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b> Late Charges:</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%" nowrap>&nbsp;</td>
            <td  width="28%"><%= stBalances.getE02CUMMA4().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Other Charges :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAOTH().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%" nowrap> 
              <div align="right"><b>Opening Date :</b></div>
            </td>
            <td  width="28%"> 
              <div align="left"><%= Util.formatDate(stBalances.getE02OPEND1(),stBalances.getE02OPEND2(),stBalances.getE02OPEND3())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b> Total Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%" nowrap> 
              <div align="right"><b> Maturity Date :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= Util.formatDate(stBalances.getE02MATUR1(),stBalances.getE02MATUR2(),stBalances.getE02MATUR3())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Rate :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="25%" nowrap > 
              <div align="right"><b>e-Mail :</b></div>
            </td>
            <td  width="15%" nowrap > 
              <div align="left"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>
            </td>
            <td  width="32%" > 
              <div align="right"><b>Accrued Through :</b></div>
            </td>
            <td  width="28%" nowrap > 
              <div align="right"></div>
              <%= Util.formatDate(stBalances.getE02LSTCL1(),stBalances.getE02LSTCL2(),stBalances.getE02LSTCL3())%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transactions</h4>
  <TABLE class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER nowrap width="86" ><% if (userPO.getHeader8().trim().equals("B")) out.print("Process Date"); else out.print("Value Date");%></TH>
      <TH ALIGN=CENTER  nowrap width="18" >Posting Date</TH>
      <TH ALIGN=CENTER  nowrap width="18" >TC</TH>
      <TH ALIGN=CENTER  nowrap width="77" >Description </TH>
      <TH ALIGN=CENTER  nowrap > Principal</TH>
      <TH ALIGN=CENTER  nowrap >&nbsp;</TH>
      <TH ALIGN=CENTER  nowrap >Interest </TH>
      <TH ALIGN=CENTER  nowrap >&nbsp;</TH>
      <TH ALIGN=CENTER nowrap >Late Charges</TH>
      <TH ALIGN=CENTER nowrap >&nbsp;</TH>
      <TH ALIGN=CENTER nowrap >Other Charges</TH>
      <TH ALIGN=CENTER nowrap >&nbsp;</TH>
      <TH ALIGN=CENTER nowrap width="37" >BATCH</TH>
      <TH ALIGN=CENTER nowrap width="71" ><% if (userPO.getHeader8().trim().equals("B")) out.print("Value Date"); else out.print("Process Date");%></TH>
      <TH ALIGN=CENTER nowrap width="55" >Time </TH>
      <TH ALIGN=CENTER nowrap width="74" >User</TH>
      <TH ALIGN=CENTER nowrap width="68" >O/ Bank</TH>
      <TH ALIGN=CENTER nowrap width="75" >O/ Branch</TH>
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
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
%>
</TD>
 	</TR>
 	</TABLE>
  <BR>
  <%
  }
%> 
   <br>
<%
	if ( !cifList.getNoResult() ) {
%>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" OnClick="PrintPreview();">
  </div>
<% } %>
</FORM>

</BODY>
</HTML>
