<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Offering Memorandum</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "offList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 5) {
	   ok = confirm("Are you sure do you want to delete this record?");
	   if (ok) document.forms[0].submit();
	}
	else if (op == 6) {
	   var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0185?SCREEN=9&OFF=" + document.getElementById("ROW").value;
	   CenterWindow(pg,700,500,2);
	}
	else {
		document.forms[0].submit();
	}
}

function closeEnter(){
   	  enterLine.filters[0].apply();
      enterLine.style.visibility="hidden";
      enterLine.filters[0].Play();
}

function goNew() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterLine.style.pixelTop=' + y);
     eval('enterLine.style.pixelLeft=' + x);
	 enterLine.filters[0].apply();
     enterLine.style.visibility="visible";
     enterLine.filters[0].Play();
	 
}

function cancelBub(){
	event.cancelBubble = true;
}

document.onclick = closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Offering Memorandum<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="offering_memo_list.jsp, ELN0185"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0185" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="400">
    <input type=HIDDEN id="ROW" name="OFF" value="">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" value="">
  </p>
  
  <div id="enterLine" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Customer Number :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="CUSCUN" size="10" maxlength="9" onKeyPress="enterInteger()" value="<%= userPO.getCusNum() %>"> 
         <a href="javascript:GetCustomerDescId('CUSCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
        </div>
      </td>
    </tr>
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Line of Credit Number :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="OFFLNN" size="14" maxlength="13" onKeyPress="enterInteger()"> 
         <a href="javascript:GetCreditLine('OFFLNN',document.forms[0].CUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
        </div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Transaction Type :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="OFFOTY" size="5" maxlength="4" > 
         <a href="javascript:GetCodeCNOFC('OFFOTY','04')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"></a>
        </div>
      </td>
    </tr>
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Transaction Currency :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="OFFCCY" size="4" maxlength="3" > 
         <a href="javascript:GetCurrency('OFFCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a>
        </div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Transaction Amount :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="OFFAMT" size="20" maxlength="19" onKeyPress="enterDecimal()"> 
        </div>
      </td>
    </tr>
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Offering Date :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="RUNDT1" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDM() %>"> 
         <input type="text" name="RUNDT2" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDD() %>"> 
         <input type="text" name="RUNDT3" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDY() %>"> 
         <a href="javascript:DatePicker(document.forms[0].RUNDT1,document.forms[0].RUNDT2,document.forms[0].RUNDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absbottom" border="0"></a>
        </div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Offering Expiration Date :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="EXPDT1" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDM() %>"> 
         <input type="text" name="EXPDR2" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDD() %>"> 
         <input type="text" name="EXPDT3" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= currUser.getE01RDY() %>"> 
         <a href="javascript:DatePicker(document.forms[0].EXPDT1,document.forms[0].EXPDR2,document.forms[0].EXPDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absbottom" border="0"></a>
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(1)"> 
   </TD>
   
   </tr>
 </TABLE>
</div>

    <%
	if ( offList.getNoResult() ) {
 %> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="17%"> 
        <div align="center" style="cursor:hand" onClick="goNew()"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG width="15%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No records selected. Press New to create.</b></p>
          <p>&nbsp;</p>
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

  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="14%"> 
        <div align="center" style="cursor:hand" onClick="goNew()"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG width="14%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="14%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG width="14%"> 
        <div align="center"><a href="javascript:goAction(5)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG width="14%"> 
        <div align="center"><a href="javascript:goAction(6)"><b>Print</b></a></div>
      </td>
      <td class=TDBKG width="14%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
          
  <br>
  <TABLE id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
	<TR> 
    	<TD NOWRAP width="100%" >
  			<TABLE id="headTable" >
  				<TR id="trdark">  
            		<th align=CENTER nowrap width="2%">&nbsp;</th>
            		<th align=CENTER nowrap width="14%">Customer</th>
            		<th align=CENTER nowrap width="14%">Offering<br>Number</th>
            		<th align=CENTER nowrap width="14%">Offering<br>Date</th>
            		<th align=CENTER nowrap width="14%">Offering<br>Exp. Date</th>
            		<th align=CENTER nowrap width="14%">Transaction<br>Type</th>
            		<th align=CENTER nowrap width="14%">Transaction<br>Amount</th>
            		<th align=CENTER nowrap width="14%">Offering<br>Status</th>
          		</TR>
  
			<%
				int indexRow = 0;
				offList.initRow();
				while (offList.getNextRow()) {
					datapro.eibs.beans.ELN018501Message msgList = (datapro.eibs.beans.ELN018501Message) offList.getRecord();
			%>
		 		<tr> 
            		<td NOWRAP  align=CENTER width="2%"> 
              			<input type="radio" name="CURRCODE" value="<%= indexRow %>" <% if (indexRow == 0) { out.print("checked"); }%> onClick="updateChecked(this.value)">
            		</td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01CUSCUN() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01OFFNUM() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01RUNDT1() %>/<%= msgList.getE01RUNDT2() %>/<%= msgList.getE01RUNDT3() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01EXPDT1() %>/<%= msgList.getE01EXPDR2() %>/<%= msgList.getE01EXPDT3() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01OFFOTY() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01OFFAMT() %></td>
            		<td NOWRAP  align=CENTER width="14%"><%= msgList.getE01OFFSTA() %></td>
          		</tr>
			<%
					indexRow++;
				}
			%>
       		</TABLE>
   		</TD>
   	</TR>	
  </TABLE>

  <SCRIPT language="JavaScript">
	showChecked("CURRCODE");
	
	function updateChecked(value) {
		document.getElementById("ROW").value = value;
	}
	
  </SCRIPT>
  
<%}%>

  </form>

</body>
</html>
