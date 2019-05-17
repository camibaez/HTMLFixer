<html>
<head>
<title>Renewed Cards Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD003001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
 
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
 
 
<script language="JavaScript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 2){
		if(confirm("Confirm to activate the selected card")){
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
	 document.forms[0].E01TDDNUM.value = "";
 	 var enterData = document.getElementById("enterData");
	 var y=evt.clientY + document.body.scrollTop;
     var x=evt.clientX + document.body.scrollLeft;
	 cancelBub(evt);
	 eval('enterData.style.pixelTop=' + y);
     eval('enterData.style.pixelLeft=' + x);
	 moveElement(enterData, y, x);
	 setVisibility(enterData,"visible");
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Renewed Cards Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="renewed_cards_list.jsp, ECD0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0030" >
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
          <div align="right">Card Number :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="E01TDDNUM" size="25" maxlength="20" value="<%= msgCD.getE01TDDNUM() %>">            
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
        <div align="center" style="cursor:hand" onClick="showEnterData()"><a><b>Search</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Activate</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(3)"><b>Inquiry</b></a></div>
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
            <th align=CENTER nowrap width="20%"><div align="center">Card Number</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Expiration Date</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Main Account</div></th>
            <th align=CENTER nowrap width="18%"><div align="center">Customer Number</div></th>
            <th align=CENTER nowrap width="40%"><div align="center">Customer Name</div></th>
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
           datapro.eibs.beans.ECD003001Message msgPart = (datapro.eibs.beans.ECD003001Message) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> 
				onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01TDDNUM())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01TDDEXM())%>/<%=Util.formatCell(msgPart.getE01TDDEXY())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01TDDCRA())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01TDDCUN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01TDDNAM())%></TD>
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0030?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSECD0030?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
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
