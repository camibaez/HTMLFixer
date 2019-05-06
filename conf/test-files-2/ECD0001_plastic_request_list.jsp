<html>
<head>
<title>Solicitud de Plástico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0001DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
 
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
 
 
<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 4){
		if(confirm("Confirm to delete this record")){
			document.forms[0].submit();
		} 
	} else {
		document.forms[0].submit();
	}
}	

function closeEnter(){
   	  setVisibility(document.getElementById("enterData"),"hidden");
}

function showEnterData(evt) {	 
     evt = (evt)? evt: ((window.event) ? window.event : "");
	 document.forms[0].E01CDRTPL.value = "";
	 document.forms[0].E01CDRNPL.value = "";	 
 	 document.forms[0].E01CDRBRD.value = "";
 	 document.forms[0].E01CDRQTY.value = "";
 	 document.forms[0].E01CDRVEN.value = "";
 	 document.forms[0].E01CDRMOX.value = "";
 	 document.forms[0].E01CDRYEX.value = "";
 	 var enterData= document.getElementById("enterData");
	 var divBranch = document.getElementById("branch");
	 var divMatDate = document.getElementById("matdate"); 	 
	 var y=evt.clientY + document.body.scrollTop;
     var x=evt.clientX + document.body.scrollLeft;
	 cancelBub(evt);
	 eval('enterData.style.pixelTop=' + y);
     eval('enterData.style.pixelLeft=' + x);
	 moveElement(enterData, y, x);
	 setVisibility(enterData,"visible");
	 setVisibility(divBranch,"visible");
	 setVisibility(divMatDate,"visible");	 
}

function validate() {
	var plastic = document.forms[0].E01CDRTPL.value;
	var divBranch = document.getElementById("branch");
	var divMatDate = document.getElementById("matdate");
	if (plastic == "50" ||
		plastic == "51" ||
		plastic == "52" ||
		plastic == "53" ||
		plastic == "54" ||
		plastic == "55" ||
		plastic == "56" ||
		plastic == "57" ||
		plastic == "58" ||
		plastic == "59" ||
		plastic == "60" ||
		plastic == "61" ||
		plastic == "62" ||
		plastic == "63" ||
		plastic == "64" ||
		plastic == "65" ||
		plastic == "66" ||
		plastic == "67" ||
		plastic == "68" ||
		plastic == "69" ||
		plastic == "70" ||
		plastic == "71" ||
		plastic == "72" ||
		plastic == "73" ||
		plastic == "74" ||
		plastic == "75" ||
		plastic == "76" ||
		plastic == "77" ||
		plastic == "78" ||
		plastic == "79" ||
		plastic == "80" ||
		plastic == "81" ||
		plastic == "82" ||
		plastic == "83" ||
		plastic == "84" ||
		plastic == "85" ||
		plastic == "86" ||
		plastic == "87" ||
		plastic == "88" ||
		plastic == "89" ||
		plastic == "90" ||
		plastic == "91" ||
		plastic == "92" ||
		plastic == "93" ||
		plastic == "94" ||
		plastic == "95" ||
		plastic == "96" ||
		plastic == "97" ||
		plastic == "98" ||
		plastic == "99") {
	 	document.forms[0].E01CDRBRD.value = "";
	 	setVisibility(divBranch,"hidden");
	 	setVisibility(divMatDate,"hidden");
	}
	else {
	 	setVisibility(divBranch,"visible");
	 	setVisibility(divMatDate,"visible");
	 	}
}



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Card Request<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_request_list.jsp, ECD0001"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0001" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
<!--
  <div id="enterData" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
-->
  <div id="enterData" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Card Type :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="E01CDRTPL"  size="3" maxlength="2" value="<%= msgCD.getE01CDRTPL() %>" onFocus="validate()">            
            <input type="text" name="E01CDRNPL"  size="31" maxlength="30" value="<%= msgCD.getE01CDRNPL() %>" >
            <a href="javascript:GetDescATMCard('E01CDRTPL','E01CDRNPL','D ')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>

      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Branch</div>
        </td>
        <td align=CENTER width="34%"> 
          <div id="branch" align="left">         
            <input type="text" name="E01CDRBRD"  size="4" maxlength="3" value="<%= msgCD.getE01CDRBRD() %>">
			<a href="javascript:GetBranch('E01CDRBRD','')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a> 
          </div>
        </td>
      </tr>

      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Amount :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="E01CDRQTY"  size="8" maxlength="7" value="<%= msgCD.getE01CDRQTY() %>">
          </div>
        </td>
      </tr>
      <tr id="trdark">       
        <td align=CENTER width="18%"> 
          <div align="right">Expiration Date :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div id="matdate" align="left">           
            <input type="text" name="E01CDRMOX"  size="3" maxlength="2" value="<%= msgCD.getE01CDRMOX() %>" > / 
            <input type="text" name="E01CDRYEX"  size="3" maxlength="2" value="<%= msgCD.getE01CDRYEX() %>" >
            (mm/yy) 
          </div>
        </td>
      </tr>

      
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Vendor :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="E01CDRVEN"  size="12" maxlength="10" value="<%= msgCD.getE01CDRVEN() %>">
            <a href="javascript:GetVendor('E01CDRVEN','1')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1);">
        </td>
      </tr>
    </table>
  </div>
  <%
	if ( appList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There are not results</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div></td>
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
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(3)"><b>Receipt</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(5)"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(6)"><b>Validate</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="2%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"><div align="center">Request #</div></th>
            <th align=CENTER nowrap width="12%"><div align="center">Card Type</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Branch</div></th>
            <th align=CENTER nowrap width="9%">Send<br>Amount</th>
            <th align=CENTER nowrap width="9%">Received<br>Amount</th>
            <th align=CENTER nowrap width="9%">Request<br>Date</th>
            <th align=CENTER nowrap width="10%"><div align="center">Request<BR>User</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Received<BR>User</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Status</div></th>
            <th align=CENTER nowrap width="9%"><div align="center">Validate</div></th>
          </tr>
     	<%
        appList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (appList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ECD0001DSMessage msgPart = (datapro.eibs.beans.ECD0001DSMessage) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> 
				onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRNUM())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRNPL())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRBRD())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRQTY())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRREQ())%></TD>
		  	<TD NOWRAP ALIGN="CENTER"><%=Util.formatDate(msgPart.getE01CDRDAY(),msgPart.getE01CDRMON(),msgPart.getE01CDRYEA()) %></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRUSR())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRRUS())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRSTD())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CDRFLG())%></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
     
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0001?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0001?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>

  <%}%>

<SCRIPT language="JavaScript">  
  showChecked("ROW"); 
  document.onclick=closeEnter;
  document.getElementById("enterData").onclick=cancelBub;
</SCRIPT>
</form>

</body>
</html>
