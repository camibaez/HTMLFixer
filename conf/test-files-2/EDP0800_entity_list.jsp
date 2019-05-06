<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lending Operations with Other Financial Institutions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "EDP080001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="JavaScript">
function goAction(op) {	
	var msg1 = "Esta seguro que desea ";
	var msg2 = "el registro seleccionado";
	document.forms[0].opt.value = op;
	switch (op) { 
	case  1:  
       document.forms[0].SCREEN.value="300";
       document.forms[0].PURPOSE.value="NEW";
	 break;	
	case  2:
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="INQUIRY";
	 break;   
	case  3:
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="MAINTENANCE";
	 break;   
	case  4: //ok = confirm(msg1 + " Eliminar " + msg2);
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="DELETE";
	 break;
	};
	document.forms[0].submit();		  	       	       
}


</SCRIPT>  
</head>
<BODY>
<h3 align="center">Lending Operations with Other Financial Institutions
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="entity_list.jsp, EDP0800">
	<BR><INPUT type="text" name="DSC" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
	<INPUT type="text" name="DSC" size="35" maxlength="35" value="<%= userPO.getCusName().trim()%>" readonly><h3>
<HR size="4" width="100%" align="right">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0800" >
  <p> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="PURPOSE">
  </p>
  <p> 
 <%
	if (EDP080001Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
  <%  
		}
	else {
%> <% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
	<% if(!userPO.getPurpose().equals("INQUIRY")) { %>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>New</b></a></div>
     </td>
	<%};%>
     <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Inquiry</b></a></div>
     </td>
	<% if(!userPO.getPurpose().equals("INQUIRY")) { %>
	<td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goAction(3)"><b>Maintenance</b></a></div> 
	</td> 
	<td class=TDBKG width="20%"> 
		<div align="center"><a href="javascript:goAction(4)"><b>Delete</b></a></div>
	</td>
	<%};%>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> <div align="center">Institution</div> </th>
            <th align=CENTER nowrap width="10%">Credit Type</th>
            <th align=CENTER nowrap width="9%"> <div align="center">Amount Granted</div> </th>
            <th align=CENTER nowrap width="9%"> <div align="center">Balance</div> </th>
            <th align=CENTER nowrap width="5%"> <div align="center">Rate</div> </th>
            <th align=CENTER nowrap width="9%"> <div align="center">Date <BR> Disbursement</div> </th>
            <th align=CENTER nowrap width="9%"> <div align="center">Date <BR> Expiration</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Payment <BR>Capital</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Payment <BR>Interest</div> </th>
            <th align=CENTER nowrap width="9%"> <div align="center">Guarantee Type</div> </th>
            <th align=CENTER nowrap width="5%"> <div align="center">% Part.</div> </th>
           </tr>
          <%
                EDP080001Help.initRow();
                chk = "checked";
                while (EDP080001Help.getNextRow()) {
                 
                  datapro.eibs.beans.EDP080001Message msgList = (datapro.eibs.beans.EDP080001Message) EDP080001Help.getRecord();
		 %>
		<% if (!msgList.getD01DUEINS().equals("TOTAL")) { %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
                <input type="radio" name="CURRCODE2" value="<%= EDP080001Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value);">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getD01DUEINS() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DUEPDS() %></td>
            <td NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEAMT() %></td>
            <td NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEBAL() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01DUERTE() %></td>
            <td NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEOP1()%>/<%= msgList.getE01DUEOP2()%>/<%= msgList.getE01DUEOP3()%></td>	
            <td NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEMA1()%>/<%= msgList.getE01DUEMA2()%>/<%= msgList.getE01DUEMA3()%></td>	
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getD01DUEPPR() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getD01DUEPIN() %></td>
            <td NOWRAP  align=CENTER width=\"9%\"><%= msgList.getD01DUETYG() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01DUEPPA() %></td>
          </tr>
 	        <% } else { %>
          <tr id="trdark"> 
            <th NOWRAP  align=CENTER width="5%"> 
            </th>
            <th NOWRAP  align=CENTER width=\"10%\"><%= msgList.getD01DUEINS() %></th>
            <th NOWRAP  align=CENTER width=\"10%\"></th>
            <th NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEAMT() %></th>
            <th NOWRAP  align=CENTER width=\"9%\"><%= msgList.getE01DUEBAL() %></th>
            <th NOWRAP  align=CENTER width=\"5%\"></th>
            <th NOWRAP  align=CENTER width=\"9%\"></th>	
            <th NOWRAP  align=CENTER width=\"9%\"></th>	
            <th NOWRAP  align=CENTER width=\"9%\"></th>
            <th NOWRAP  align=CENTER width=\"9%\"></th>
            <th NOWRAP  align=CENTER width=\"9%\"></th>
            <th NOWRAP  align=CENTER width=\"5%\"></th>
          </tr>
          <%};
              				chk = "";     
                }
              %>
        </table>
  </table>
  
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EDP080001Help.getShowPrev() ) {
		int pos = EDP080001Help.getFirstRec() - 20;
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.creditproposal.JSEDP0800?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
  <%
        if ( EDP080001Help.getShowNext() ) {
		int pos = EDP080001Help.getLastRec();
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.creditproposal.JSEDP0800?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>
  
  
  <SCRIPT language="JavaScript">
 showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>