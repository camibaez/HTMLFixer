<html>
<head>
<title>Multiple Purchase</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "invList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(ordnum,ordmast) {

    document.forms[0].ORDNUM.value = ordnum;
    document.forms[0].ORDMAST.value = ordmast;
    
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Trade Ticket - Multiple Orders<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_list_purchase.jsp, EIE0130M"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0130M" >
  <input type=HIDDEN name="SCREEN" value="1000">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="ORDNUM">
  <input type=HIDDEN name="ORDMAST" value="<%= userPO.getIdentifier()%>">
  <h4>Basic Information</h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Order Number :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E02ORDMNU" size="9" maxlength="5" value="<%= userPO.getIdentifier()%>" readonly>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Product Type :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="hidden" name="E02ORDPTY"  value="<%= userPO.getHeader7()%>" >
              <% if(userPO.getHeader7().equals("BND")) out.print("Bonds");
              				else if(userPO.getHeader7().equals("EQT")) out.print("Equity");
							else if(userPO.getHeader7().equals("MUT")) out.print("Mutual Funds");
							else if(userPO.getHeader7().equals("PFS")) out.print("Preferred Stocks");
							else if(userPO.getHeader7().equals("ACD")) out.print("Commodities");
							else out.print("");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showCustomerInq(document.forms[0].E02ORDMCU.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Customer </a>:</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02ORDMCU" size="9" maxlength="9" value="<%= userPO.getHeader2()%>">
                <input type="text" name="E02ORDMCN" size="35" maxlength="35" value="<%= userPO.getHeader3()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E02ORDMIC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="help" align="absbottom" border="0" > 
                Instrument </a>:</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E02ORDMIC" size="9" maxlength="9" value="<%= userPO.getHeader4()%>" >
              <input type="text" name="E02ORDICN" size="35" maxlength="30" value="<%= userPO.getHeader5()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E02ORDMCY" size="4" maxlength="3" value="<%= userPO.getHeader6()%>"readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E02ORDIN1" size="3" maxlength="2" value="<%= userPO.getHeader8()%>">
              <input type="text" name="E02ORDIN2" size="3" maxlength="2" value="<%= userPO.getHeader9()%>">
              <input type="text" name="E02ORDIN3" size="3" maxlength="2" value="<%= userPO.getHeader10()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E02ORDST1" size="3" maxlength="2" value="<%= userPO.getHeader11()%>">
              <input type="text" name="E02ORDST2" size="3" maxlength="2" value="<%= userPO.getHeader12()%>">
              <input type="text" name="E02ORDST3" size="3" maxlength="2" value="<%= userPO.getHeader13()%>">
            </td>
          </tr>
			<TR id="trclear">
				<TD nowrap width="17%">
				<DIV align="right">Delivery Date :</DIV>
				</TD>
				<TD nowrap width="36%"><INPUT type="text" name="E02ORDF15A" size="3"
					maxlength="2" value="<%= userPO.getHeader16()%>"> <INPUT type="text"
					name="E02ORDF15B" size="3" maxlength="2"
					value="<%= userPO.getHeader17()%>"> <INPUT type="text"
					name="E02ORDF15C" size="3" maxlength="2"
					value="<%= userPO.getHeader18()%>"></TD>
				<TD nowrap width="14%">
				<DIV align="right"></DIV>
				</TD>
				<TD nowrap width="33%"></TD>
			</TR>
			<tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><b>Available Balance :</b></div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E02ORDMTO" size="17" maxlength="15" value="<%= userPO.getHeader15()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="14%" > 
              <div align="right"><b>Total Trade Ticket :</b></div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E02ORDMBA" size="17" maxlength="16" value="<%= userPO.getHeader14()%>"
				onKeyPress="enterDecimal()" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
	if ( invList.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width="100%" height="50%" >
    <tr>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<p> 

          
  <table class="tbenter" align=center>
    <tr> 
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Order<br>
                Number</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Customer</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center"> Nominal<br>
                Value</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Quantity </div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Price </div>
            </th>
            <th align=CENTER nowrap >Investment<br>
              Amount</th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                invList.initRow();
				int k=1;
                while (invList.getNextRow()) {
                 
                  out.println(invList.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>
  <%}%> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(10)">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
</form>

</body>
</html>