<html>
<head>
<title>Commissions Table</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0312Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 document.forms[0].TABLEN.focus();
}

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();

}


function getParams(table,doctyp,code) {

    document.forms[0].TABLEN.value = table;
	document.forms[0].DOCTYP.value = doctyp;
    document.forms[0].CODEN.value = code;

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>

</head>

<BODY>
<h3 align="center">Commissions Table Management<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_commissions.jsp,EWD0312P"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0312P" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">


<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Product Type :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
          <select name="DOCTYP">

                <option value="BND">Bonds</option>
                <option value="EQT">Equity</option>
                <option value="MUT">Mutual Funds</option>
                <option value="PFS">Preferred Stocks</option>
				<option value="CST">Custody Fee</option>
				<option value="ACD">Commodities</option>
          </select>
		 <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></div>
      </td>
    </tr>
    <tr id="trclear">
      <td align=CENTER width="18%">
        <div align="right">Table Number :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
          <input type="text" name="TABLEN" size="4" maxlength="2">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
        </div>
      </td>
    </tr>
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Customer Number :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
              <input type="text" name="CODEN" size="12" maxlength="9">
              <input type="text" name="CUNDSC" size="25" maxlength="25">
              <a href="javascript:GetCustomerDescId('CODEN','CUNDSC','')">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		 </div>
      </td>
    </tr>
   <tr id="trclear">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=submit name="Submit" value="Submit">
   </TD>

   </tr>
 </TABLE>
</div>

  <%
	if ( EWD0312Help.getNoResult() ) {
 %>
  <TABLE class="tbenter" width=100% height=50%>
    <TR>
      <TD>
      <div align="center">
          <p><b> There is no match for your criteria </b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
              <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
           </tr>
         </table>
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


  <table class="tbenter" width=100% align=center>
    <tr>
      <td class=TDBKG>
        <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG>
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG>
        <div align="center"><a href="javascript:goAction(4)"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG>
        <div align="center"><a href="javascript:goAction(3)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG>
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
              <div align="center">Document <BR>
                Type</div>
            </th>
            <th align=CENTER nowrap >Table <br>
              Number</th>
            <th align=CENTER nowrap >
              <div align="center">Table<br> Description</div>
            </th>
            <th align=CENTER nowrap >
              <div align="center">Customer</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
		<%
                EWD0312Help.initRow();
				int k=1;
                while (EWD0312Help.getNextRow()) {

                  out.println(EWD0312Help.getRecord());
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


  </form>

</body>
</html>
