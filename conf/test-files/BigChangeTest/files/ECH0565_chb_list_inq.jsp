<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Checkbook Inquiry
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />

<jsp:useBean id="checkBooks" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT  Language="Javascript">
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
</SCRIPT>

</head>

<body>

<h3 align="center">Checkbook Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="chb_list_inq.jsp, ECH0565"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0565" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%
	if ( checkBooks.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        		There are not results for your search criteria 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> 
 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03ACMCUN" size="9" maxlength="9" value="<%= rtBasic.getE03ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E03CUSNA1" size="45"  maxlength="45" value="<%= rtBasic.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03ACMACC" size="12" readonly maxlength="12" value="<%= rtBasic.getE03ACMACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E03ACMCCY" size="4" readonly maxlength="4" value="<%= rtBasic.getE03ACMCCY().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= rtBasic.getE03ACMPRO().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR> 
 <table  class="tableinfo">
    <tr> 
      <td nowrap> 
       <table cellspacing="0" cellpadding="2" width="100%" border="0">
        
          <tr id="trdark">
            <td align=right>
            	<b>Customized Name :</b>
            </td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E03CHPNO1" size="35" maxlength="35" value="<%= rtBasic.getE03CHPNO1().trim()%>" readonly>
            </td>
            
          </tr>
          
          <tr id="trclear">
            <td nowrap align="right">
              <SELECT name="E03CHPRE1">
                            <OPTION value="Y" <%if (!rtBasic.getE03CHPRE1().equals("O")) out.print("selected"); %>>AND</OPTION>
                            <OPTION value="O" <%if (rtBasic.getE03CHPRE1().equals("O")) out.print("selected"); %>>AND/OR</OPTION>
                        </SELECT>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E03CHPNO2" size="35" maxlength="35" value="<%= rtBasic.getE03CHPNO2().trim()%>" readonly>
            </td>
            
          </tr>
          
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Checkbook Type :</b>
            </td>
            <td nowrap align=left>
              <INPUT type="text" name="E03ACMTCB" size="3" maxlength="2" value="<%= rtBasic.getE03ACMTCB().trim()%>" readonly>
            </td>
            <td align=right nowrap>
              <b>Branch : </b>
            </td>
            <td nowrap>
              <input type="text" name="E03CHPDBR" size="3" maxlength="3" value="<%= rtBasic.getE03CHPDBR().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap align=right> 
              <b>Charges for Checkbooks :</b>
            </td>
            <td nowrap ><INPUT type="radio" name="E03ACMCBC" value="Y" <% if(!rtBasic.getE03ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
              Yes 
              <INPUT type="radio" name="E03ACMCBC" value="N" <% if(rtBasic.getE03ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
               No
            </td>
            <td nowrap align=right><b>Current Stock :</b>
            </td>
            <td nowrap >
              <INPUT type="text" name="E03ACMASK" size="3" maxlength="2" value="<%= rtBasic.getE03ACMASK().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Restrictions in Checkbooks Delivery :</b>
            </td>
            <td nowrap >
              <INPUT type="radio" name="E03CHPCON" value="Y" <% if(rtBasic.getE03CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              Yes 
              <INPUT type="radio" name="E03CHPCON" value="N" <% if(!rtBasic.getE03CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              No
            </td>
            <td nowrap align=right> 
              <b>Minimum Stock :</b>
            </td>
            <td nowrap><INPUT type="text" name="E03ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE03ACMMSK().trim()%>" readonly> </td>
            
          </tr>
        </table>
    </td>
   </tr>
 </table>
<BR>
<TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER colspan="2">Date</TH>
      <TH ALIGN=CENTER rowspan="2">Checkbook<br>
        Number</TH>
      <TH ALIGN=CENTER rowspan="2">Checkbook<br>
        Status</TH>
      <TH ALIGN=CENTER rowspan="2">Check<br>
        Number </TH>
      <TH ALIGN=CENTER rowspan="2">Initial<br>Check</TH>
      <TH ALIGN=CENTER rowspan="2">Last<br>Check</TH>
      <TH ALIGN=CENTER colspan="5">Checkbook<br>Status</TH>
      <TH ALIGN=CENTER rowspan="2">Branch for<br>Customer Pick-up</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Request</TH>
      <TH ALIGN=CENTER>Delivery</TH>
      <TH ALIGN=CENTER>So</TH>
      <TH ALIGN=CENTER>Re</TH>
      <TH ALIGN=CENTER>De</TH>
      <TH ALIGN=CENTER>Rea</TH>
      <TH ALIGN=CENTER>Dec</TH>
    </TR>
    <%
                checkBooks.initRow();
                while (checkBooks.getNextRow()) {
                    // if (checkBooks.getFlag().equals("")) {
                    		out.println(checkBooks.getRecord());
                    // }
                }
    %> 
  </TABLE>

<%
  }
%>

</FORM>

</BODY>
</HTML>
