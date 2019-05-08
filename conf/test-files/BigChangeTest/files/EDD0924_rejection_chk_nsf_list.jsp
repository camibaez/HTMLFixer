<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Checks List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dataCR" class= "datapro.eibs.beans.DataCheckReject"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="javascript">

function closeSearch(){
   	  schACC.filters[0].apply();
      schACC.style.visibility="hidden";
      schACC.filters[0].Play();
}

function hideComments(){
   	  Comments.filters[0].apply();
      Comments.style.visibility="hidden";
      Comments.filters[0].Play();
}

function closeDivs() {
  closeSearch();
  hideComments();
}

function cancelBub(){
  event.cancelBubble = true;
}

function ShowSearchAcc() {	 
	 var y=event.clientY + document.body.scrollTop - schACC.clientHeight;
     var x=event.clientX + document.body.scrollLeft - 1;
	 cancelBub();
	 eval('schACC.style.pixelTop=' + y);
     eval('schACC.style.pixelLeft=' + x);
	 schACC.filters[0].apply();
     schACC.style.visibility="visible";
     schACC.filters[0].Play();
	 document.forms[0].ACCNUM.focus();
}

function OkComments(){
	var idxacc =document.forms[0].ActAccRow.value;
	var idxchk =document.forms[0].ActChkRow.value;
	var dataT = document.all["dataTable"+idxacc];
	document.forms[0]["REMDATA"+idxacc+""+idxchk].value = trim(document.forms[0].txtComments.value);
	if (document.forms[0]["REMDATA"+idxacc+""+idxchk].value == ""){
	  document.images["IMGREM"+idxacc+""+idxchk].style.display="none";
    } else {
      document.images["IMGREM"+idxacc+""+idxchk].style.display="";
	}
	adjustEquTables(headTable2, dataT, dataDiv2,1,false);
	Comments.filters[0].apply();
    Comments.style.visibility="hidden";
    Comments.filters[0].Play();
}

function addComments() {
	 var idxacc =document.forms[0].ActAccRow.value;
	 var idxchk =document.forms[0].ActChkRow.value;	 
	 var y= mainTable2.offsetTop + 10;
     var x= mainTable2.offsetLeft  + (Comments.clientWidth /2);
	 
	 eval('Comments.style.pixelTop=' + y );
     eval('Comments.style.pixelLeft=' + x);
	 Comments.filters[0].apply();
     Comments.style.visibility="visible";
     Comments.filters[0].Play();
     document.forms[0].txtComments.value=document.forms[0]["REMDATA"+idxacc+""+idxchk].value;
	 document.forms[0].txtComments.focus();
}

function ShowComments(idxacc,idxchk) {	 
	 var y=event.clientY + document.body.scrollTop - Comments.clientHeight;
     var x=event.clientX + document.body.scrollLeft - 1;
	 document.forms[0]["RECNUM"+idxacc][idxchk].click();
	 cancelBub();
	 eval('Comments.style.pixelTop=' + y);
     eval('Comments.style.pixelLeft=' + x);
	 Comments.filters[0].apply();
     Comments.style.visibility="visible";
     Comments.filters[0].Play();
     document.forms[0].txtComments.value=document.forms[0]["REMDATA"+idxacc+""+idxchk].value;
	 document.forms[0].txtComments.focus();
}

function goAction(op) {
     var form = document.forms[0];
     var formLength= document.forms[0].elements.length;
     var ok = false;
     var num = "";
     var pg = "";
	
     //for(var n=0;n<formLength;n++) {
     // 	var elementName= document.forms[0].elements[n].name;
     // 	if(elementName == "RECNUM") {
	//	if (document.forms[0].elements[n].checked == true) {
			num = form["ActAccRow"].value;
        		ok = true;
    //    		break;
	//	}
    //  	}
    //  }
      if ( ok ) {
      
        if (op==6) showICheck('','','','','','',form.ActRow.value);
        else {
			switch (op) {
				
				case 1 :  // Account Sumary Inquiry
					pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924?SCREEN=6&ACCNUM=" + form["CURACC_"+num].value;
					break;
				case 2 :  // Account Inquiry
				  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=1&ACCNUM=" + form["CURACC_"+num].value;
					break;
				case 3 :  // Account Statement
				  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=2&ACCNUM=" + form["CURACC_"+num].value;
					break;
				case 4 :  // Account Average
				  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=3&ACCNUM=" + form["CURACC_"+num].value;
					break;
				case 5 :  // Signature Image Inquiry
					pg = "<%=request.getContextPath()%>/pages/e/EDD0924_rejection_chk_view_images.jsp?ROW="+form.ActRow.value;
					break;
			}
			CenterWindow(pg,620,500,2);
		}
      }
      else {
	alert("Please select an account number to continue.");	   
      }

}

function doPrint() {
	var num = document.forms[0]["ActAccRow"].value;
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924?SCREEN=20&NUM=" + num;
	CenterWindow(pg,620,500,2);
}

function ChangeStatusOfficer(op) {
	 document.forms[0].ACTSTS.value=op;
	 document.forms[0].SCREEN.value='16';
	 document.forms[0].submit();
}

function showACC(){
//var acc = trim(document.forms[0].ACCNUM.value);
 document.forms[0].FlagMov.value="0";
 document.forms[0].submit();
}

document.onclick= closeDivs;

</script>

<script language="javascript">

function showAccInfo(idxRow){
  var i= parseInt(document.forms[0].ActAccRow.value);
  var dataT = document.all["dataTable"+idxRow];
  tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["LNCRDATA"+idxRow].value;
  document.all["dataTable"+i].style.display="none";
  document.all["dataTable"+idxRow].style.display="";
  dataTable.rows[i].className="trnormal";
  dataTable.rows[idxRow].className="trhighlight";
  adjustEquTables(headTable1, dataTable, dataDiv1,1,false);
  adjustEquTables(headTable2, dataT, dataDiv2,1,false);
  showChecked("RECNUM"+idxRow);
  document.forms[0].ActAccRow.value=""+idxRow;
}    

function showChkInfo(idxTable,idxRow,idxAbsRow){
  var i= parseInt(document.forms[0].ActChkRow.value);
  if (document.forms[0].ActAccRow.value==idxTable) {
    document.all["dataTable"+idxTable].rows[i].className="trnormal";}
  document.all["dataTable"+idxTable].rows[idxRow].className="trhighlight";
  document.forms[0].ActChkRow.value=""+idxRow;
  document.forms[0].ActRow.value=""+idxAbsRow;
}

function GetInfo(currentrow){
  var form = document.forms[0];
  var maxrow = document.all["dataTable"+currentrow].rows.length;
  
  var optAcc = form["OPTION_"+currentrow];
  for(var n=0;n<maxrow;n++) {
   var optChk = form["OPTION_"+currentrow+""+n];
   var maxopt = optChk.length;    
   for(var i=0;i<maxopt;i++) {
    if (optChk[i].value == optAcc[optAcc.selectedIndex].value) {
     optChk.selectedIndex = i;}
   }
  }
}

function SendInfo(){
  document.forms[0].FlagMov.value="1";
  document.forms[0].submit();
}

function ShowPrev(){
  document.forms[0].FlagMov.value="-";
  document.forms[0].submit();
}

function ShowNext(){
  document.forms[0].FlagMov.value="+";
  document.forms[0].submit();
}

function changeInfo(acc,row){
  var form = document.forms[0];
  var currentrow = acc + "" + row;
  if (form["OPTION_"+ currentrow].value == "0004") {
	var officer = form["NEWOF1_"+ currentrow].value;
	
	var Params = "?CurrRow="+ row + "&Officer=" + officer + "&Idx=" + acc;
	page= prefix + language + "EDD0924_rejection_chk_chg_offc.jsp" + Params; 
	CenterWindow(page, 470, 200, 3);
  }  
}
</script>

</HEAD>

<BODY>
<SCRIPT Language="Javascript">
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }	

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> 
<SCRIPT Language="Javascript">
      showErrors();
</SCRIPT>
 <%
 }
%>

<h3 align="center">Return Items<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rejection_chk_nsf_list.jsp,EDD0924"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActAccRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActChkRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="FlagMov" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ACTSTS" VALUE="0">
 <h4 style="text-align:center">Non-Sufficient Funds & Uncollected Items Approvals -- Officer Code : <% if ( dataCR.getOfficer().trim().equals("")) {out.print("All");} else {out.print(dataCR.getOfficer());} %></h4>

<div id="schACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Search Account : 
          <input type="text" maxlength=9 size=11 name="ACCNUM" onKeyPress="enterInteger()"
			 oncontextmenu="showPopUp(accountHelp,this.name,<%= dataCR.getBank() %>,'','','','RT'); return false;">  
	 </TD>
      <TD ALIGN=Left nowrap>
	     <a href="javascript:showACC()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/search1.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<div id="Comments" style="position:absolute; visibility:hidden; left:25px; top:-100px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=Left nowrap>
          Comments :<BR> 
          <input type="text" maxlength=61 size=60 name="txtComments">
      </TD>
    </TR>
    <TR>
      <TD ALIGN=Center nowrap>
	     <a href="javascript:OkComments()">Ok</a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<%
	if ( accList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> There is no match for your criteria 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
	
	if ( (!dataCR.getOfficer().trim().equals("")) && (userPO.getHeader17().equals("C") || userPO.getHeader17().equals("O")) ) {

%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right"><b>Officer Status :</b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
                <input type="text" name="E01STS" size="10" maxlength="10" readonly value="<% if (userPO.getHeader17().equals("C")) {out.print("Closed");} else {out.print("Open");}%>">
              </div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                 <% if (userPO.getHeader17().equals("C")) {%>
                	<input id="EIBSBTN" type="button" name="Open" value="Open" onClick="ChangeStatusOfficer('O')">
                <% } else if (userPO.getHeader17().equals("O")) {%>	
                	<input id="EIBSBTN" type="button" name="Close" value="Close" onClick="ChangeStatusOfficer('C')">
                <% } %>
              </div>
            </td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%	
	}	
	
%>
  
  <TABLE class="tbenter" width="100%">
    <TR>
      <TD ALIGN=CENTER > <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/summary_over.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/summary.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER > <a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif',1)"><img name="Image4" border="0" src="<%=request.getContextPath()%>/images/e/INQUIRY.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER > <a href="javascript:goAction(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER > <a href="javascript:goAction(4)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif',1)"><img name="Image6" border="0" src="<%=request.getContextPath()%>/images/e/AVERAGE.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:doPrint()" >Print</a> 
      </TD>
      <TD ALIGN=CENTER > <a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image9" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a></TD>
    </TR>
  </TABLE>
        
  
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER width="100%">
    <TR> 
      <TD NOWRAP valign="top" width="100%"> 
        <TABLE id="headTable1" >
     		<TR id="trdark"> 
      			<TH ALIGN=CENTER NOWRAP>Action</TH>
      			<TH ALIGN=CENTER NOWRAP onClick="ShowSearchAcc()" style="cursor:hand">Account</TH>
      			<TH ALIGN=CENTER NOWRAP>Name</TH>      
      			<TH ALIGN=CENTER NOWRAP>Gross Balance</TH>
      			<TH ALIGN=CENTER NOWRAP>Net Balance</TH>
      			<TH ALIGN=CENTER NOWRAP>Type
				</TH>
     		</TR>
    	 </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">
    	<table id="dataTable">
  <%
                accList.initRow();
                while (accList.getNextRow()) {
                    if (!accList.getFlag().equals("")) {	
  %> 
     		<TR> 
      			
                <TD ALIGN=Center NOWRAP>
				<DIV> 
                <input type="radio" name="RECNUM" value="<%= accList.getCurrentRow() %>" onClick="showAccInfo('<%= accList.getCurrentRow() %>')">
                <% if (userPO.getHeader18().equals("1")) { %>
	                <select name="OPTION_<%= accList.getCurrentRow() %>"  onChange="GetInfo('<%= accList.getCurrentRow() %>')" onClick="radioClick('RECNUM',<%= accList.getCurrentRow() %>)" style="font-size:7pt">
	                  <option value="" <% if (accList.getRecord(17).equals("")) out.print("selected"); %>></option>
	                  <option value="0012" <% if (accList.getRecord(17).equals("0012")) out.print("selected"); %>>Return All</option>                  
				      <option value="0013" <% if (accList.getRecord(17).equals("0013")) out.print("selected"); %>>Pay All</option>                  			    
	                </select>                
                <% } else { %>
	                <select name="OPTION_<%= accList.getCurrentRow() %>"  onChange="GetInfo('<%= accList.getCurrentRow() %>')" onClick="radioClick('RECNUM',<%= accList.getCurrentRow() %>)" style="font-size:7pt">
	                  <option value="" <% if (accList.getRecord(17).equals("")) out.print("selected"); %>></option>
	                  <option value="0002" <% if (accList.getRecord(17).equals("0002")) out.print("selected"); %>>Return All</option>
	                  <option value="0003" <% if (accList.getRecord(17).equals("0003")) out.print("selected"); %>>Pay All</option>
	                  <option value="0012" <% if (accList.getRecord(17).equals("0012")) out.print("selected"); %>>Return All w/o Charges</option>                  
				      <option value="0013" <% if (accList.getRecord(17).equals("0013")) out.print("selected"); %>>Pay All w/o Charges</option>                  			    
	                </select>
	            <% } %>    
				<INPUT TYPE=HIDDEN NAME="LNCRDATA<%= accList.getCurrentRow()%>" VALUE="<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(5)) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(6)) %><BR>
				<%= accList.getRecord(7) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(10)) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(11)) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(12)) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(13)) %><BR>
				<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(14)) %>">
                <input type="HIDDEN" name="CURACC_<%= accList.getCurrentRow() %>" value="<%= accList.getRecord(0) %>">
				</DIV>
				</TD>
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(0) %></a></TD>
      			<TD ALIGN=LEFT NOWRAP><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><div><%= accList.getRecord(2) %></DIV></a></TD>      
      			<TD ALIGN=RIGHT NOWRAP><DIV><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(3)) %></a></DIV></TD>
      			<TD ALIGN=RIGHT NOWRAP><DIV><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(4)) %></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><DIV><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><% if (accList.getRecord(8).equals("001")) out.print("NSF"); else if (accList.getRecord(8).equals("002")) out.print("UNC"); %></a></DIV></TD>
     		</TR>
  <% 
                    }
                }
  %>
 	</table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
            <TH ALIGN=CENTER nowrap >Additional Info.</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign="center" nowrap >
              <p><b>Orig/Amount. : <br>
                Available. : <br>
                Maturity Date : <br>
				1 Day Uncoll. : <br>
				2 Days Uncoll. : <br>
				Over 2 Days   : <br>
				F. Float 1 Day : <br>
				F.Float 2 Days :
			  </b></p>
              
            </TD>
         <TD ALIGN="RIGHT" valign="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="25%" ALIGN=LEFT>
<%
        if ( accList.getShowPrev() ) {
				out.println("<A HREF=\"javascript:ShowPrev()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD ALIGN=CENTER > <a href="javascript:goAction(5)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','<%=request.getContextPath()%>/images/e/signature_over.gif',1)"><img name="Image7" border="0" src="<%=request.getContextPath()%>/images/e/signature.gif" ></a></TD>
  <TD ALIGN=CENTER > <a href="javascript:goAction(6)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','<%=request.getContextPath()%>/images/e/checkimage_over.gif',1)"><img name="Image8" border="0" src="<%=request.getContextPath()%>/images/e/checkimage.gif" ></a></TD>
  <TD ALIGN=CENTER > <a href="javascript:addComments()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','<%=request.getContextPath()%>/images/e/comments_over.gif',1)"><img name="Image9" border="0" src="<%=request.getContextPath()%>/images/e/comments.gif" ></a></TD>
  <TD WIDTH="25%" ALIGN=RIGHT>     
 <%      
        if ( accList.getShowNext() ) {
      			out.println("<A HREF=\"javascript:ShowNext()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>
  
  <TABLE  id="mainTable2" class="tableinfo" ALIGN=CENTER width="100%">
    <TR> 
      <TD NOWRAP valign="top" width="100%" > 
        <TABLE id="headTable2" >
     		<TR id="trdark"> 
      			<TH ALIGN=CENTER NOWRAP>Action</TH>
				<TH ALIGN=CENTER NOWRAP>Check Number</TH>
      			<TH ALIGN=CENTER NOWRAP>Amount</TH>
      			<TH ALIGN=CENTER NOWRAP>Status</TH>
				<TH ALIGN=CENTER NOWRAP>TC</TH>
      			<TH ALIGN=CENTER NOWRAP>Description</TH> 
      			<TH ALIGN=CENTER NOWRAP>Origin</TH>     
      			
     		</TR>
    	 </TABLE>
  
   <div id="dataDiv2" class="scbarcolor">
    <%
             accList.initRow();
             int j=0;
			 
             int accChecked = 0;
			 boolean firstime = true;
			 String chk = "";
			 String acc = "";
			 int recnum = 0;
		  	 try { recnum = Integer.parseInt(request.getParameter("ROW")); } catch (Exception e) {};
			 chkList.setCurrentRow(recnum);
			 acc = chkList.getRecord(0);		
              while (accList.getNextRow()) {
    %> 
   <table id="dataTable<%=j%>" class="scbarcolor" style="display:none;">
  <%
          	    chkList.initRow();
			    int k = 0;
				firstime = true;
                while (chkList.getNextRow()) {
                    if (chkList.getFlag().equals(accList.getFlag())) {
						if (acc.equals(accList.getRecord(0))) {
							accChecked = j;
						  	chk = (chkList.getCurrentRow()== recnum)?"checked":""; 
						}else {
							chk = (firstime)?"checked":"";
						}
						firstime = false;	
  %> 
     		<TR> 
      			
              <TD ALIGN=Left NOWRAP>
				<DIV ALIGN=Left> 
                <input type="radio" name="RECNUM<%=j%>" value="<%= chkList.getCurrentRow() %>" <%=chk%> onClick="showChkInfo('<%=j%>','<%=k%>','<%= chkList.getCurrentRow() %>')">
                <% if (userPO.getHeader18().equals("1")) { %>
	                <SELECT name="OPTION_<%=j%><%=k%>" onChange="changeInfo('<%= j %>','<%= k %>')" style="font-size:7pt">
					 <OPTION value="" <% if (chkList.getRecord(17).equals("")) out.print("selected"); %>></OPTION>
					 <OPTION value="0014" <% if (chkList.getRecord(17).equals("0014")) out.print("selected"); %>>Waive Charges</OPTION>
				     <OPTION value="0012" <% if (chkList.getRecord(17).equals("0012")) out.print("selected"); %>>Return</OPTION>                  
				     <OPTION value="0013" <% if (chkList.getRecord(17).equals("0013")) out.print("selected"); %>>Pay</OPTION>                  
				    </SELECT>
                <% } else { %>
	                <SELECT name="OPTION_<%=j%><%=k%>" onChange="changeInfo('<%= j %>','<%= k %>')" style="font-size:7pt">
					 <OPTION value="" <% if (chkList.getRecord(17).equals("")) out.print("selected"); %>></OPTION>
					 <OPTION value="0002" <% if (chkList.getRecord(17).equals("0002")) out.print("selected"); %>>Return</OPTION>
					 <OPTION value="0003" <% if (chkList.getRecord(17).equals("0003")) out.print("selected"); %>>Pay</OPTION>
				     <OPTION value="0004" <% if (chkList.getRecord(17).equals("0004")) out.print("selected"); %>>Change</OPTION>                  
				     <OPTION value="0012" <% if (chkList.getRecord(17).equals("0012")) out.print("selected"); %>>Return w/o Charges</OPTION>                  
				     <OPTION value="0013" <% if (chkList.getRecord(17).equals("0013")) out.print("selected"); %>>Pay w/o Charges</OPTION>                  
				    </SELECT>
			    <% } %>
				<INPUT TYPE=HIDDEN NAME="REMDATA<%=j%><%=k%>" VALUE="<%= chkList.getRecord(22) %>">
				<input type="HIDDEN" name="NEWOF1_<%=j%><%=k%>" value="<%= chkList.getRecord(8) %>">			   
				<img name="IMGREM<%=j%><%=k%>" src="<%=request.getContextPath()%>/images/e/info.gif" alt="More Information" border="0" onclick="ShowComments(<%=j%>,<%=k%>)"
				 <% if (chkList.getRecord(22) == null || chkList.getRecord(22).trim().equals("")) out.print("style=\"display:none;\""); %>>
				</DIV>
			  </TD>
      			<TD ALIGN=CENTER NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(2) %></a></DIV></TD>
      			<TD ALIGN=RIGHT NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= datapro.eibs.master.Util.fcolorCCY(chkList.getRecord(3)) %></a></DIV></TD>      
      			<TD ALIGN=CENTER NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)">
      			 <% if (userPO.getHeader18().equals("1")) { 
 					if (chkList.getRecord(5).equals("3N")) out.print("Charges Waive"); 
					   else if (chkList.getRecord(4).equals("E")) out.print("Paid"); 
					   else if (chkList.getRecord(4).equals("A")) out.print("Returned");   			 
      			 } else {
					if (chkList.getRecord(4).equals("R")) out.print("Returned"); 
					   else if (chkList.getRecord(4).equals("P")) out.print("Paid"); 
					   else if (chkList.getRecord(4).equals("A")) out.print("Paid W/O Charges");
					   else if (chkList.getRecord(4).equals("E")) out.print("Returned W/O Charges");
				}
				%></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(5) %></a></DIV></TD>
      			<TD ALIGN=LEFT NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(6) %></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><div><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><% if (chkList.getRecord(7).equals("1")) { out.print("Incleaning");}
					else if (chkList.getRecord(7).equals("2")) { out.print("Teller");} 
					else {out.print("Batching");} %></a></DIV></TD>
     		</TR>
  <% 
						k++;
                    }		
                }
  %>
 	</table>
  <%  
               j++;      
            }
   %>
   </div>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     
	 function resizeDoc() {
      var actvTb = document.forms[0].ActAccRow.value;
      var dataT = document.all["dataTable"+actvTb];
       adjustEquTables(headTable1, dataTable, dataDiv1,1,false);
       adjustEquTables(headTable2, dataT, dataDiv2,1,false);
      }
     if ( getMSIEVer() < 5.5 ) {
		schACC.style.filter="blendTrans(duration=1)"; 
		Comments.style.filter="blendTrans(duration=1)"; 
	 }
	 if (document.all["dataTable"].rows.length > 1) {
	      document.forms[0].RECNUM[<%= accChecked %>].click();
     } else {
       	  document.forms[0].RECNUM.click();
     }
     resizeDoc();
     window.onresize=resizeDoc;
	 tbAddInfoH.rows[0].cells[0].height = headTable1.rows[0].cells[0].clientHeight;
	 
</SCRIPT>
  <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="SendInfo()">
  </div>
<%           
  }
%>
</FORM>

</BODY>
</HTML>
