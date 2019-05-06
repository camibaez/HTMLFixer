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

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="stBalances"  class="datapro.eibs.beans.ECIF03002Message"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
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
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=4&Pos=' + pos,600,500,4);
}
function PrintPreviewPDF() {
 <% 
  iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=6&Pos=' + pos,600,500,4);
}
function PrintPreviewEMAIL() {
 <% 
  iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=7&Pos=' + pos,600,500,4);
}

</SCRIPT>



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 

<FORM>

  <h3 align="center">Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="st_list_fv.jsp , ECIF030" width="32" height="32"> 
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
  <h4>Account Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="21%" height="15" nowrap> 
              <div align="right"><b>Primary Officer :</b></div>
            </td>
            <td  width="30%" height="15"> 
              <div align="right"><%= stBalances.getE02DSCOFC().trim()%></div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"> <b>Gross</b> <%= stBalances.getE02ACMCCY().trim()%> 
                <b>Balance</b> <b>: </b></div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMMGB().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right"><b>E-Mail :</b></div>
            </td>
            <td  width="30%" nowrap> 
              <div align="right"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Uncollected Balance : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02UNCBAL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Facsimile :</b></div>
            </td>
            <td  width="30%"> 
              <div align="right"><%= stBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Hold Amount : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMHAM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Net Average :</b></div>
            </td>
            <td  width="30%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMNAV().trim())%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Credit Limit :</b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMCLI().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Gross Average :</b></div>
            </td>
            <td  width="30%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMGAV().trim())%> 
              </div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Available Balance : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02AVALBL().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right"></div>
            </td>
            <td  width="30%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b> Balance as of </b><%= Util.formatDate(stBalances.getE02LSSTM1().trim(),stBalances.getE02LSSTM2().trim(), stBalances.getE02LSSTM3().trim())%> 
                <b>: </b></div>
            </td>
            <td  width="16%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(userPO.getHeader5().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
	if ( cifList.getNoResult() ) {
%> 
  <table class="tbenter" width=100% height=100%>
    <tr> 
      <td> 
        <div align="center"> <font size="3"><b> There is no match for your search 
          criteria </b></font> </div>
      </td>
    </tr>
  </table>
  <%
	}
	else {
%>  
  <h4>Transactions</h4>
  <table class="tableinfo">
    <tr id=trclear> 
      <th align=CENTER width="53" nowrap>Value<br>
        Date</th>
      <th align=CENTER width="70" nowrap>Posting<br>Date</th>
      <th align=CENTER width="50" nowrap>PT Number</th>
      <th align=CENTER width="70" nowrap>Reference</th>
      <th align=CENTER width="24" nowrap>TC</th>
      <th align=CENTER width="233" nowrap>Description </th>
      <th align=CENTER width="48" nowrap> 
        <div align="right">Debits </div>
      </th>
      <th align=CENTER width="50" nowrap> 
        <div align="center">Credits</div>
      </th>
      <th align=CENTER width="57" nowrap> 
        <div align="center">Balance</div>
      </th>
      <th align=CENTER width="49" nowrap>Batch</th>
      <th align=CENTER width="44" nowrap>Process Date </th>
      <th align=CENTER width="38" nowrap>Time</th>
      <th align=CENTER width="56" nowrap>User </th>
      <th align=CENTER width="72" nowrap> 
        <p>Org/<br>
          Bank</p>
      </th>
      <th align=CENTER width="95" nowrap>Org/<br>
        Branch</th>
    </tr>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </table>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF030?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%     
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF030?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
%> 
</TD>
 	</TR>
 	</TABLE>
<BR>
<div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="HTML"  OnClick="PrintPreview();">
	   <input id="EIBSBTN" type=button name="Submit" value="PDF"   OnClick="PrintPreviewPDF();">
	   <input id="EIBSBTN" type=button name="Submit" value="EMAIL" OnClick="PrintPreviewEMAIL();">
	   
  </div>  

  <%
  }
%> 
</FORM>

</BODY>
</HTML>
