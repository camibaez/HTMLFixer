<html>
<head>
<title>Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0317Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">



function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(code) {

    document.forms[0].CODE.value = code;
    
}

function cancelBub(){
  event.cancelBubble = true;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Uncollected / Holds Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_instruments.jsp, EWD0308"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" >
  <p> 
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <%
	if ( EWD0317Help.getNoResult() ) {
 %></p>
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
  <p>&nbsp; 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"> <%= userPO.getCusNum()%> - <%= userPO.getCusName().trim()%> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  rowspan="2"> 
              <div align="right"><b>Cash Account :</b></div>
            </td>
            <td nowrap > 
              <div align="center">Bank </div>
            </td>
            <td nowrap > 
              <div align="center">Branch </div>
            </td>
            <td nowrap > 
              <div align="center">CCY </div>
            </td>
            <td nowrap > 
              <div align="center">G/L </div>
            </td>
            <td nowrap > 
              <div align="center">Account </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"> <%= userPO.getBank()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= userPO.getBranch()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= userPO.getCurrency()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= userPO.getGenLedger()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= userPO.getAccNum()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right"><b>Settlement Date :</b></div>
            </td>
            <td nowrap colspan="5"> <%= userPO.getHeader17()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><br>
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" >
                <table id="headTable" >
          <tr id="trdark"> 
            
            <th align=CENTER nowrap > 
              <div align="center">Reference</div>
            </th>
            <th align=CENTER nowrap >Reason</th>
            <th align=CENTER nowrap >Process<br>Date </th>
            <th align=CENTER nowrap > Maturity<br>Date</th>
            <th align=CENTER nowrap > 
              <div align="center">Number of <br> Days</div>
            </th>
            <th align=CENTER nowrap >Type </th>
            <th align=CENTER nowrap >Amount</th>
            <th align=CENTER nowrap > 
              <div align="center">New <br> Balance</div>
            </th>
          </tr>
        </table>
<div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EWD0317Help.initRow();
				int k=1;
                while (EWD0317Help.getNextRow()) {
                 
                  out.println(EWD0317Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
  <br><table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap colspan="6" ><b>Totals</b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Total Holds :</b></div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"><%= userPO.getHeader18()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Total Uncollected :</b></div>
            </td>
            <td nowrap colspan="5"> 
              <div align="left"><%= userPO.getHeader19()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Total Future Investment Income :</b></div>
            </td>
            <td nowrap colspan="5"> <%= userPO.getHeader20()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Settlement Balance :</b></div>
            </td>
            <td nowrap colspan="5"> 
              <div align="left"><%= userPO.getHeader21()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tbenter" width="98%" align=CENTER>
    <tr> 
      <td width="50%" align=LEFT> <%
        if ( EWD0317Help.getShowPrev() ) {
      			int pos = EWD0317Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0309?SCREEN=11&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EWD0317Help.getShowNext() ) {
      			int pos = EWD0317Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0309?SCREEN=11&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> </td>
    </tr>
  </table>
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


  </form>

</body>
</html>
