<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">

<%@ page import ="datapro.eibs.master.Util"%>

<TITLE>Account Link Balance</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript1.1" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "lnkList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<SCRIPT Language="Javascript">
<%
  String opt = "";
  try {
     opt = request.getParameter("OPT");
     if (opt == null) opt = "I";
  }
  catch (Exception e) {
     opt = "I";
  }
   if (opt.equals("I")) {
%>
	builtNewMenu(rt_i_opt);
<% } else {%>
	builtNewMenu(rt_a_opt);
<% } %>		
</SCRIPT>

</HEAD>
<body> 
<% 
    if ( !error.getERRNUM().equals("0")  ) {
  		error.setERRNUM("0");
        out.println("<SCRIPT Language=\"Javascript\">");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<h3 align="center">Account Link Balances<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rtr_link_balances_list.jsp,EDD0012"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
            
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E04CUN" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
           
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>          
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
             
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <% if (lnkList.getNoResult()) { %>
  
   <TABLE class="tbenter" height="60%">
   	<TR>
      <TD ALIGN=CENTER VALIGN=MIDDLE>
  		 
        <H4 style="text-align: center">There is no match for the account <%= userPO.getIdentifier()%>. 
          <br>
        </h4>
      </TD>
    </TR>
   </TABLE>
   
  <% } else {%>
            
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
  <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>Account</TH>
      <TH ALIGN=CENTER NOWRAP>Product</TH>
	  <TH ALIGN=CENTER NOWRAP>Product Type</TH>	  
	  <TH ALIGN=CENTER NOWRAP>Amount</TH>
	  <TH ALIGN=CENTER NOWRAP>Status</TH>
	  <TH ALIGN=CENTER NOWRAP>Beginning</TH>
	  <TH ALIGN=CENTER NOWRAP>Expiration</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">                 
    <table id="dataTable">
    <%
                lnkList.initRow();
                while (lnkList.getNextRow()) {
    				datapro.eibs.beans.EDD001201Message msgList = (datapro.eibs.beans.EDD001201Message)lnkList.getRecord();
    				%>
    				
    				<TR>
						<TD NOWRAP ALIGN="CENTER">
							<%=Util.formatCell(msgList.getE12LNKACC())%>
						</TD>
						<TD NOWRAP ALIGN="LEFT">
							<%=Util.formatCell(msgList.getE12LNKPRO())%>
						</TD>
						<TD NOWRAP ALIGN="LEFT">
							<%=Util.formatCell(msgList.getE12LNKNA1())%>
						</TD>
						<TD NOWRAP ALIGN="RIGHT">
							<%=Util.fcolorCCY(msgList.getE12LNKAMT())%>
						</TD>
						<TD NOWRAP ALIGN="CENTER">
							<%  
								if (msgList.getE12LNKTYP().equals("L")) out.print("Linked");
								else if (msgList.getE12LNKTYP().equals("C")) out.print("Combined");
								else if (msgList.getE12LNKTYP().equals("D")) out.print("Deleted");
								else out.print("");
							%>
						</TD>
						<TD NOWRAP ALIGN="RIGHT">
							<%=Util.formatDate(msgList.getE12LNKOP1(),msgList.getE12LNKOP2(),msgList.getE12LNKOP3())%>
						</TD>
						<TD NOWRAP ALIGN="RIGHT">
							<%=Util.formatDate(msgList.getE12LNKEX1(),msgList.getE12LNKEX2(),msgList.getE12LNKEX3())%>
						</TD>
					</TR>
   <% 	                      
                }
    %> 
   </table>
   </div>
   </TD>
   
  </TR>	
</TABLE>



<SCRIPT language="JavaScript">
	 document.forms[0].totalRow.value="<%= lnkList.getLastRec() %>";
     function resizeDoc() {
       divResize(false);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
    resizeDoc();
    window.onresize=resizeDoc;
     
</SCRIPT> 
<% } %> 
 </FORM>
</BODY>
</HTML>
 