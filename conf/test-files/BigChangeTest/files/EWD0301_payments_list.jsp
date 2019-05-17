<html>
<head>
<title>Payment Interface</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0301help" class= "datapro.eibs.beans.JBList"  scope="session" />
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

}

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();

}


function getParams(code) {

    document.forms[0].AGREEMENT.value = code;

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;
</script>
</head>

<BODY onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/e/new_over.gif','<%=request.getContextPath()%>/images/e/maintenance_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/delete_over.gif')">
<h3 align="center">Payment Interface<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="payments_list.jsp,EWD0301"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0301" >
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>

  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="opt">
  <input type=HIDDEN name="totalRow">
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Agreement Number :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="AGREEMENT" size="12" maxlength="9"> or
        </div>
      </td>
    </tr>
   <tr id="trclear">
      <td align=CENTER width="18%">
        <div align="right">Customer :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="CUSTOMER" size="12" maxlength="9">
		 <a href="javascript:GetCustomerDescId('CUSTOMER','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		  or
        </div>
      </td>
    </tr>
   <tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Account :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="ACCOUNT" size="12" maxlength="12">
         <a href="javascript:GetAccount('ACCOUNT','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        </div>
      </td>
    </tr>
   <tr id="trclear">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Search" onClick="javascript:goAction(5)">
   </TD>

   </tr>
 </TABLE>
</div>
  <%
	if ( ewd0301help.getNoResult() ) {
 %>
  <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD>

      <div align="center">
          <p><font size="3"><b> There is no match for your criteria, please select
            one of the following options</b></font></p>
          <table class="tbenter" width="100%">
            <tr>
              <td align=CENTER class=TDBKG style="cursor:hand"> <a href="javascript:goAction(1)"><b>New</b></a></td>
			  <td align=CENTER class=TDBKG style="cursor:hand" onClick="ShowEnterCod()"> <b>Search</b></td>
              <td align=CENTER class=TDBKG style="cursor:hand"> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Exit</b></a></td>
            </tr>
          </table>
          <p>&nbsp; </p>
        </div>
      </TD></TR>
   		</TABLE>
  <%
	}
	else {
%>
  <p>
  <table class="tbenter" width="100%">
    <tr>
      <td align=CENTER class=TDBKG style="cursor:hand" width="20%"> <a href="javascript:goAction(1)"><b>New</b></a></td>
      <td align=CENTER class=TDBKG style="cursor:hand" width="20%"> <a href="javascript:goAction(2)"><b>Maintenance</b></a></td>
	  <td align=CENTER class=TDBKG style="cursor:hand" width="20%"> <a href="javascript:goAction(3)"><b>Inquiry</b></a></td>
	  <td align=CENTER class=TDBKG style="cursor:hand" onClick="ShowEnterCod()" width="20%"> <b>Search</b></td>
      <td align=CENTER class=TDBKG style="cursor:hand" width="20%"> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Exit</b></a></td>
    </tr>
  </table>
  <center>
    <table  id="mainTable" class="tableinfo">
      <tr >
        <td NOWRAP valign="top" width="100%" >
          <table id="headTable" width="100%" >
            <tr id="trdark">
              <th align=CENTER nowrap >&nbsp;</th>
              <th align=CENTER nowrap >
                <div align="center">Agreement</div>
              </th>
              <th align=CENTER nowrap >
                <div align="center">Customer</div>
              </th>
              <th align=CENTER nowrap >
                <div align="center">Debit <br>Account</div>
              </th>
              <th align=CENTER nowrap >
                <div align="center">Last Update <br> Date</div>
              </th>
            </tr>
          </table>
          <div id="dataDiv1" class="scbarcolor" >
            <table id="dataTable" >
              <%
                ewd0301help.initRow();
				int k=1;
                while (ewd0301help.getNextRow()) {

                  out.println(ewd0301help.getRecord());
                  k++;
                }
              %>
            </table>
          </div>
    </table>

  </center>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();

     window.onresize=resizeDoc;



</SCRIPT>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( ewd0301help.getShowPrev() ) {
      			int pos = ewd0301help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSEWD0301?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
 <%
        if ( ewd0301help.getShowNext() ) {
      			int pos = ewd0301help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSEWD0301?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %>
   </TD>
 	</TR>
 	</TABLE>
  <%
     }
  %>

</form>
</body>
</html>
