<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Assign Documents Required by Product</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/etyle.css" rel="stylesheet">
<jsp:useBean id= "EDP071801Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) {	
	document.forms[0].opt.value = op;
	i = 0;
   var recnum = document.forms[0].RECNUM.value;
   for (i = 0; i < recnum; i++) {

		}
//alert(document.forms[0].DPWFG20.value);
	document.forms[0].submit();		  	
}


function getParams(currrow,cacti,dacti) {

	document.forms[0].CURRENTROW.value = currrow;
}



</SCRIPT>  
</head>
<BODY>
<h3 align="center">Assign Documents Required by Product</h3>

	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ListRecDoc_maint, EDP0718">

    <table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% align="center" >
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Product : 
        </td>
        <td nowrap width=60% align="left"> 
			<INPUT type="text" name="PRD" size="5" maxlength="4" value="<%= userPO.getHeader9().trim()%>" readonly>
			<INPUT type="text" name="TYP" size="5" maxlength="4" value="<%= userPO.getHeader10().trim()%>" readonly>
			<INPUT type="text" name="DESPRD" size="35" maxlength="35" value="<%= userPO.getHeader11().trim()%>" readonly>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Subject Credit : 
        </td>
        <td nowrap width=60% align="left"> 
			<INPUT type="text" name="SUJ" size="5" maxlength="4" value="<%= userPO.getHeader12().trim()%>" readonly>
			<INPUT type="text" name="DSCSUJ" size="35" maxlength="35" value="<%= userPO.getHeader13().trim()%>" readonly><BR>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          Table of Documents : 
        </td>
        <td nowrap width=60% align="left"> 
			<INPUT type="text" name="TDO" size="5" maxlength="4" value="<%= userPO.getHeader14().trim()%>" readonly>
        </td>
      </tr>
    </table>	

<HR size="4" width="100%" align="right">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0718" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="200">
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EDP071801Help.getNoResult() ) {
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
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"> <div align="center">Document</div> </th>
            <th align=CENTER nowrap width="20%"> <div align="center">Description</div> </th>
            <th align=CENTER nowrap width="10%"> <div align="center">Type</div> </th>
            <th align=CENTER nowrap width="10%"> <div align="center">Credit Destination</div> </th>
            <th align=CENTER nowrap width="10%"> <div align="center">Status</div> </th>
           </tr>
          <%
                EDP071801Help.initRow();
				int recnum = 0;
                while (EDP071801Help.getNextRow()) {
                datapro.eibs.beans.EDP071801Message msgList = (datapro.eibs.beans.EDP071801Message) EDP071801Help.getRecord();
				
		 %>
          <tr> 
            <td NOWRAP  align=center width="10%" >
		   <%if (!msgList.getE01DPHDOC().equals("0000")) { ;%> 
			<INPUT type="text" name="E01DPHDOC<%= recnum %>" size="5" maxlength="4" value="<%= msgList.getE01DPHDOC()%>" readonly>
		   <% } %>
			</td>

            <td NOWRAP  align=LEFT width="20%"><%= msgList.getE01DPHDDE() %></td>

            <td NOWRAP  align=CENTER width="10%"> 
		   <%if (!msgList.getE01DPHDOC().equals("0000")) { ;%> 
			<SELECT name="DPHTDO<%= recnum %>" 
			>
		    <option value=" " 
			   <%if (msgList.getE01DPHTDO().equals(" ")) { out.print("selected"); }%>></option>
			<option value="1" 
			   <%if (msgList.getE01DPHTDO().equals("1")) { out.print("selected"); }%>>Required</option>
			<option value="3"
			   <%if (msgList.getE01DPHTDO().equals("3")) { out.print("selected"); }%>>Optional</option>	
			</SELECT>
			   <% } %>
			</td>

            <td NOWRAP  align=CENTER width="20%">  			
		   <%if (!msgList.getE01DPHDOC().equals("0000")) { ;%> 
	   			<input type="text" name="DPHCN2<%= recnum %>" size="5" maxlength="4" value="<%= msgList.getE01DPHCN2().trim()%>" >
				<INPUT type="text" name="E01DPHC2D<%= recnum %>" size="15" maxlength="15" value="<%= msgList.getE01DPHC2D().trim()%>" readonly> 
				<A href="javascript:GetCodeDescCNOFCPC('DPHCN2<%= recnum %>','E01DPHC2D<%= recnum %>','38')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0">
				</A>
		   <% } %>

   			</td>
            <td NOWRAP  align=CENTER width="10%">  			
		   <%if (!msgList.getE01DPHDOC().equals("0000")) { ;%> 
			<SELECT name="DPHEST<%= recnum %>" >
			<option value=" " 
			   <%if (msgList.getE01DPHEST().equals(" ")) { out.print("selected"); }%>></option>
			<option value="A" 
			   <%if (msgList.getE01DPHEST().equals("A")) { out.print("selected"); }%>>Active</option>
			<option value="I"
				<%if (msgList.getE01DPHEST().equals("I")) { out.print("selected"); }%>>Inactive</option>
			</SELECT>
			   <% } %>
   			</td>

		    <input type=HIDDEN name="DPHDOC<%= recnum %>" value="<%= msgList.getE01DPHDOC()%>">
		    <input type=HIDDEN name="E01DPHTDO<%= recnum %>">
		    <input type=HIDDEN name="E01DPHUDO<%= recnum %>">
		    <input type=HIDDEN name="E01DPHEST<%= recnum %>">
		    <input type=HIDDEN name="E01DPHPRD<%= recnum %>">
   			<input type=HIDDEN name="DPHCN1<%= recnum %>" value="<%= msgList.getE01DPHCN1().trim()%>" >
   			<input type=HIDDEN name="DPHCN3<%= recnum %>" value="<%= msgList.getE01DPHCN3().trim()%>" >

          </tr>
          <%recnum += 1; }; %>
          <input type="HIDDEN" name="RECNUM" value="<%= recnum %>">
	</table>
  </table>
<%}%>
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
		<td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goAction(2)"><b>Submit</b></a></div> 
     </td> 
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>

</form>
</body>
</html>