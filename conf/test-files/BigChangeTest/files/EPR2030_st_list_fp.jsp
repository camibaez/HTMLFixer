<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Customers List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="stBalances" class="datapro.eibs.beans.EPR203002Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
//<!-- Hide from old browsers
 
 function enter(recpos){ 	
 	document.forms[0].Pos.value = "" + recpos;
 	document.forms[0].submit();
 }

//-->
</script>
<BODY>


<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%> 

 <h3 align="center">Transaction Inquiries</h3>
  <hr size="4">
  <FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2030">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
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
              <div align="right"><b>Officer :</b></div>
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
<%
	if ( cifList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=50%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no data matching your search criteria</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
  
  
  <h4>Account Basic Data</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="21%" height="15" nowrap> 
              <div align="right"><b>Books Average:  </b></div>
            </td>
            <td  width="30%" height="15"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMNAV().trim())%></div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"><b>Amount</b> <%= stBalances.getE02ACMCCY().trim()%> 
                <b>in Books :</b></div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMMGB().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right"><b>Net Average : </b></div>
            </td>
            <td  width="30%" nowrap> 
             <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMGAV().trim())%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Differed Amount  : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02UNCBAL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Fax : </b></div>
            </td>
            <td  width="30%"> 
              <div align="right"><%= stBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Retained Amount  : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMHAM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>E-mail : </b></div>
            </td>
            <td  width="30%" nowrap> 
             <div align="right"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>             
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Available Amount : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02AVALBL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%"> 
              <div align="right"><b></b></div>
            </td>
            <td  width="30%" nowrap> 
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b> Amount </b><%= Util.formatDate(stBalances.getE02LSSTM1().trim(),stBalances.getE02LSSTM2().trim(), stBalances.getE02LSSTM3().trim())%> 
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
  <h4 align="left">Transactions</h4>
  <TABLE id=cfTable class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER width="5%" nowrap>Process Date</TH>
      <TH ALIGN=CENTER style="display:none" nowrap>Recording Date</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Reference</TH>
      <TH ALIGN=CENTER width="2%" nowrap>TC</TH>
      <TH ALIGN=CENTER width="50%" nowrap>Description </TH>
      <TH ALIGN=CENTER width="20" nowrap>Credit</TH>
      <TH ALIGN=CENTER width="8%" nowrap>Batch</TH>
      <TH ALIGN=CENTER width="5%" nowrap>ValueDate</TH>
      
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
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
 
  <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>

  <p align="center"> 
      <input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Close">
  </p>
  <SCRIPT Language="Javascript">
    var max=cfTable.rows.length;
     for (i=1;i<max ;i++){
      cfTable.rows[i].cells[1].style.display="none";
     }
  </SCRIPT>
  <%
  }
 %> 
</FORM>

</BODY>
</HTML>
