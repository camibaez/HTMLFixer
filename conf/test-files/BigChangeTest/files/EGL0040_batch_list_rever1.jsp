<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EGL0040Help" class= "datapro.eibs.beans.JBList"  scope="session" />
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

function closeEnter(){
   	  enterTransact.filters[0].apply();
      enterTransact.style.visibility="hidden";
      enterTransact.filters[0].Play();
}

function showTransact() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterTransact.style.pixelTop=' + y);
     eval('enterTransact.style.pixelLeft=' + x);
	 enterTransact.filters[0].apply();
     enterTransact.style.visibility="visible";
     enterTransact.filters[0].Play();
	 
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Batch Reversal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sel_tickets.jsp, EGL0040"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEGL0040" >

  <p>
    <input type=HIDDEN name="SCREEN" value="4">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="CODE">

  <%
  if ( EGL0040Help.getNoResult() ) {
    %> </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp; </p>
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
  <p> 

<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td width="25%"> 
        <div align="right">Batch Number : </div>
      </td>
      <td width="25%"> 
        <div align="left">
          <input size="3" type="text" name="E01TRABTH" maxlength="2" value="<%=userPO.getHeader1()%>" readonly> 
      </td>
    
	  <td nowrap width=25% align="right" > Batch Date : </td>
	  <td nowrap width=25% align="left"  > 
	    <input size="2" type="text" name="E01TRABDM" maxlength="2" value="<%=userPO.getHeader2()%>" readonly>
        <INPUT size="2" type="text" name="E01TRABDD" maxlength="2" value="<%=userPO.getHeader3()%>" readonly>
        <INPUT size="2" type="text" name="E01TRABDY" maxlength="2" value="<%=userPO.getHeader4()%>" readonly>
     	 
	  </td>
	</tr>	 
</table>
 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" >
                <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > 
              <div align="center">Reference<br>Number</div></th>
            <th align=CENTER nowrap >Total<BR>Debits</th>
            <th align=CENTER nowrap >Total<BR>Credits</th>
             
          </tr>
        </table>

     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EGL0040Help.initRow();
				int k=1;
                while (EGL0040Help.getNextRow()) {
                 
                  out.println(EGL0040Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
  <table class="tbenter" width="98%" align=CENTER>
    <tr> 
      <td width="50%" align=LEFT> <%
        if ( EGL0040Help.getShowPrev() ) {
      			int pos = EGL0040Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEGL0040?SCREEN=200&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EGL0040Help.getShowNext() ) {
      			int pos = EGL0040Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEGL0040?SCREEN=200&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
