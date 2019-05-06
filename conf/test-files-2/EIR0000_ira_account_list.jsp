<html>
<head>
<title>IRA Account Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "partList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

var YEAR;

function getParams(myYear){
	YEAR = myYear
}

function goAction(opt) {
    if (opt == "N") {
		document.forms[0].E01IRAYEA.value = "";
		document.forms[0].SCREEN.value = '100';
		var y=event.clientY + document.body.scrollTop;
		var x=event.clientX + document.body.scrollLeft;
		ShowNew(x,y);  		
	} else if (opt == "M") {
		document.forms[0].SCREEN.value = '200';
		document.forms[0].E01IRAYEA.value = YEAR;
  		document.forms[0].submit();
	} else if (opt == "I") {
		document.forms[0].SCREEN.value = '300';
		document.forms[0].E01IRAYEA.value = YEAR;
  		document.forms[0].submit();
  	} else if (opt == "D") {
   		ok = confirm("Are you sure you want to delete this record?");
		document.forms[0].SCREEN.value = '400';
		document.forms[0].E01IRAYEA.value = YEAR;
	  	if (ok) document.forms[0].submit();
  	}
}

function closeEnter(){
   	enterNew.filters[0].apply();
    enterNew.style.visibility="hidden";
    enterNew.filters[0].Play();
}

function ShowNew(x,y) {	 
	cancelBub();
	eval('enterNew.style.pixelTop=' + y);
	eval('enterNew.style.pixelLeft=' + x);
	enterNew.filters[0].apply();
    enterNew.style.visibility="visible";
    enterNew.filters[0].Play();
	document.forms[0].E01IRAYEA.focus();
}

function cancelBub(){
  event.cancelBubble = true;
}

function SetErrorVisible() {	 
	 var myValue = document.forms[0].E01IRAYEA.value;

	 if (!isEmpty(myValue)  || isYear(myValue)) {
	 	document.forms[0].E01IRAYEA.onkeypress = "";
     	errorMsg.style.visibility="hidden";
	 } else {
	 	document.forms[0].E01IRAYEA.onkeypress="";
	 	document.forms[0].E01IRAYEA.value="";
    	errorMsg.style.visibility="visible";
	 }
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">IRA Account Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ira_account_par_list.jsp,EIR0000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEIR0000">
  <input type=HIDDEN name="SCREEN" value="100">
  <input type=HIDDEN name="totalRow" value="0">

<div id="enterNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Year:</div>
        <div id="errorMsg" align="left" style="visibility:hidden;">(No Valid)</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" name="E01IRAYEA" size="4" maxlength="4" onchange="SetErrorVisible()">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="ESBSBTN" type=submit name="Submit" value="Submit"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>
       <div align="center"> 
      
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="17%" > 
              <div align="right">IRA Type :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRATYP" size="3" maxlength="2" value="<%= userPO.getHeader1()%>" readonly>
            <INPUT type="text" name="E01IRADSC" size="30" maxlength="25"
			value="<%= userPO.getHeader2()%>" readonly>
			</td>
          </tr>
        </table>
        </div>

  <%
	if ( partList.getNoResult() ) {
 %> 
 <div align="center"> 
        <p><b> There is no match for your search criteria, please select one of 
          the following options</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
              <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
           </tr>
         </table>
	  </div>
	
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
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction('M')"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction('I')"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction('D')"><b>Delete</b></a></div>
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
              <div align="center">Year</div>
            </th>
            <th align=CENTER nowrap >Max. Annual <BR>
				Contribution</th>
            <th align=CENTER nowrap > 
              <div align="center">Under <br>
                Age of</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Additional<BR>
				Catch-Up</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                partList.initRow();
				int k=1;
                while (partList.getNextRow()) {
                 
                  out.println(partList.getRecord());
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
	     document.forms[0].RAD_IND[0].click();
	 } catch (e) {
	     document.forms[0].RAD_IND.click();
	 }

     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
