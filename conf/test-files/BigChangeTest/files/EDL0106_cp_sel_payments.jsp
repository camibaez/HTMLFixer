<html>
<head>
<title>Payment Schedule</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdList" class= "datapro.eibs.beans.JBList"  scope="session" />
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


function getParams(code,date1,date2,date3,paysecu) {   

	document.forms[0].CODE.value = code;
    document.forms[0].DATE1.value = date1;
    document.forms[0].DATE2.value = date2;
    document.forms[0].DATE3.value = date3;
    document.forms[0].paysecu.value = paysecu;       
    
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<BODY>
<P>`</P>
<h3 align="center">Payment Schedule<img 
src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_sel_payments.jsp, EDL0106"></h3>
<hr size="4">
 
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0106" >
  <input type=HIDDEN name="SCREEN" value="1000">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE" value="<%= userPO.getIdentifier()%>">
  <input type=HIDDEN name="DATE1">
  <input type=HIDDEN name="DATE2">
  <input type=HIDDEN name="DATE3">
  <input type=HIDDEN name="paysecu"> 
  

<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
		<td align=CENTER width="35%">
		<div align="right">Starting Date :</div>
		</td>
		<td align=CENTER width="65%">
		<div align="left"><input type="text" name="DATES1" size="3"
			maxlength="2"> <input type="text" name="DATES2" size="3"
			maxlength="2"> <input type="text" name="DATES3" size="3"
			maxlength="2"></div>
		</td>
	</tr>
    <tr id="trclear">
		<td align=CENTER width="35%">
		<div align="right">Payment Frequency :</div>
		</td>
		<td align=CENTER width="65%">
		<div align="left"><input type="text" name="FRECPER" size="3"
			maxlength="3"> <select name="FRECCOD">
			<option value="D">Days</option>
			<option value="M">Months</option>
			<option value="Y">Years</option>
		</select></div>
		</td>
	</tr>
	
	   
	<tr id="trdark">
		<td align=CENTER width="35%">
		<div align="right">Payment Type :</div>
		</td>
		<td nowrap width="66%" >
		<select name="FRECTYP">
			<option value="C">Call</option>
			<option value="P">Put</option>
		</select>
		</td>
	</tr>
	
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(5);"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>

  
 <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="9%" >              
            <div align="left"> <%= userPO.getHeader1()%> </div>  
            </td>
            <td nowrap width="12%" > 
              <div align="right">Name :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= userPO.getHeader2()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right">Account :</div>
            </td>
            <td nowrap width="9%">
              <div align="left"> <%= userPO.getIdentifier().trim()%> </div>               
            </td>
            <td nowrap width="12%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader3()%> </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Product :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader4()%> </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 

  <%
	if ( cdList.getNoResult() ) {
 %>
<TABLE class="tbenter" width="100%" height="50%" >
    <tr>
      <TD > 
        <div align="center"> 
          <p><b>There is no payments defined at this time, please select one of 
            the following options </b></p>
          <table  class="tbenter" width=100% align=center>
            <tr > 
              <td class=TDBKG width="29%" > 
                <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="34%" > 
                <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Automatic <BR>Calculation</b></a></div>
      		 </td>
              <td class=TDBKG width="37%" > 
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

          
  <table class="tbenter" align=center>
    <tr> 
      <td class=TDBKG > 
        <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Automatic<BR>
          Calculation</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(3)"><b>Delete</b></a></div>
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
              <div align="center">Type</div>
            </th>
            
            <th align=CENTER nowrap > 
              <div align="center">Date</div>
            </th>
            
            <th align=CENTER nowrap > 
              <div align="center">Sequence</div>
            </th>
            
            <th align=CENTER nowrap > 
              <div align="center">Deal Type</div>
            </th>
                        
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                cdList.initRow();
				int k=1;
                while (cdList.getNextRow()) {
                 
                  out.println(cdList.getRecord());
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

<p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit2" value="Submit" onClick="goAction(10)">
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

