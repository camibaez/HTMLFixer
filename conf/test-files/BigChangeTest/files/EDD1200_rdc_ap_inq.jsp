<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Return Deposit Checks Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "objList" class= "datapro.eibs.beans.JBObjList"  scope="session" /> 
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT Language="Javascript">
		builtNewMenu(rdc_a_opt);
 </SCRIPT>

</head>
<body nowrap onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif','<%=request.getContextPath()%>/images/e/print_over.gif')" onbeforeprint="hideOpt(true)" onafterprint="hideOpt(false)">
<%@ page import = "datapro.eibs.master.Util" %>

<% 
     out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Return Deposit Checks Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rdc_ap_inq,EDD1200"></h3>
<hr size="4">
  
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201">
  <div> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="">
     <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0"> 
    <BR>
  </div>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" readonly name="E01WTRARF" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap  > 
              <div align="right">Concept : </div>
            </td>
            <td nowrap > 
                <input type="text" name="E01OFFOPE" size="2" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
                <input type="text" name="E01OFFCON" size="26" maxlength="25" value="<%= userPO.getHeader2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01OFFBNK" size="2" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
                <input type="text" name="E01OFFBRN" size="5" maxlength="3" value="<%= userPO.getBranch().trim()%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="right">Amount : </div>
            </td>
            <td nowrap > 
              <div align="left">
              	<input type="text" readonly name="E01AMOUNT" size="17" maxlength="16" value="<%= userPO.getHeader3().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>   
  <BR>
    <table  id="mainTable" class="tableinfo" >
      <tr > 
        <td NOWRAP valign="top"> 
          <table id="headTable">
            <tr id="trdark"> 
              <TH align=CENTER nowrap> 
                Seq.
              </TH>
              <TH align=CENTER nowrap> 
                Account
              </TH>
              <TH align=CENTER nowrap> 
               Customer
              </TH>
              <TH align=CENTER nowrap> 
               Amount
              </TH>
              <TH align=CENTER nowrap> 
                Trans. Code
              </TH>
              <TH align=CENTER nowrap> 
                Check Number
              </TH>              
            </tr>
          </table>
          <div id="dataDiv1" class="scbarcolor" > 
			   <table id="dataTable">
			    <%
		               objList.initRow();
		               int k=1;
		               while (objList.getNextRow()) {
		               		datapro.eibs.beans.EDD121201Message msgCh = (datapro.eibs.beans.EDD121201Message)objList.getRecord();
		               		if (userPO.getIdentifier().equals(msgCh.getE01WTRARF())) {
			     %> 
			    <TR> 
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01WTRSEQ()) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01ACMACC()) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01CUSNA1()) %></TD>
				  <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgCh.getE01AMOUNT()) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01TRNCDE()) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01NUMCHK()) %></TD>
			    </TR>
			    <%
			                k++;
			                }
			           }
			      
			    %> 
			  </table>            
          </div>
        </td>
       </tr>   
    </table>

<SCRIPT language="JavaScript">
  function resizeDoc() {
  	   document.forms[0].totalRow.value="<%= k %>";
       divResize();
       adjustEquTables(headTable, dataTable, dataDiv1, 0, false);
  }
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>  
</form>
</body>
</html>
