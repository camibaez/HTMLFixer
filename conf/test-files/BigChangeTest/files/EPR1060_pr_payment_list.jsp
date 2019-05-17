<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">

 function sendClick(refnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "PRINUM" && elementValue== refnum)
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
 }

 function goAction(refnum) {
     if ( refnum !== "") {
		  sendClick(refnum);
     }
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=11&REFNUM="+document.forms[0].REFNUM.value;
	 CenterWindow(page,600,500,2);
  }

 function goOpen(refnum) {
     if ( refnum !== "") {
		  sendClick(refnum);
     }


     document.forms[0].submit();

  }

 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

 function showAddInfo(refernum,amount,idxRow){
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].REFNUM.value = refernum;
   document.forms[0].AMOUNT.value = amount;
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);

  }

 function enter(recpos){
 	document.forms[0].Pos.value = "" + recpos;
 	document.forms[0].submit();
 }

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

 function showOfac(fieldValue){
        document.forms[0].REFNUM.value=fieldValue;

	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "REFNUM" && elementValue== fieldValue)
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }
</script>
</HEAD>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/inquiry_over.gif')">
<h3 align="center"> Wire Transfers Payment Queue<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_inq_list.jsp,EPR1060">
</h3>
<hr size="4">
<FORM Method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950">

<INPUT TYPE=HIDDEN NAME="REFNUM" VALUE="">
  <input type=HIDDEN name="AMOUNT">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">

<div id="enterACC" style="position:absolute; visibility:hidden; left:50px; top:100px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">

      <td align=CENTER width="18%">
        <div align="right">Account Number :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
              <INPUT type="text" name="E01DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>

        </div>
      </td>
    </tr>
   <tr id="trclear">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="document.forms[0].submit();">
   </TD>

   </tr>
 </TABLE>
</div>



<TABLE class="tbenter">
    <TR>
      <td class=TDBKG width="33%" >
                <div align="center" ><a href="javascript:goAction()"><b>Details</b></a></div>
      </td>
      <td class=TDBKG width="33%" >
                <div align="center" ><a href="javascript:ShowEnterCod()"><b>Payment</b></a></div>
      </td>

      <td class=TDBKG width="33%" >
                <div align="center" ><a href="javascript:goExit()"><b>Exit</b></a></div>
      </td>
    </TR>
  </TABLE>

  <TABLE  id="mainTable" class="tableinfo" width="50%">
    <TR >
    <TD NOWRAP valign="top" width="100%" >
        <TABLE id="headTable" width="354" >
          <TR id="trdark">
            <TH ALIGN=CENTER NOWRAP></TH>
            <TH ALIGN=CENTER NOWRAP>Reference No.</TH>
            <TH ALIGN=CENTER NOWRAP>Amount</TH>
            <TH ALIGN=CENTER NOWRAP>Description</TH>
          </TR>
        </TABLE>

   <div id="dataDiv1" class="scbarcolor">
    <table id="dataTable">
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }
                }
    %>
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign="center" nowrap ><b>Debit Account : <br>Credit Account : <br>By Order : <br>Beneficiary : <br>
              Beneficiary Bank :<br>
              Ordering Inst. : </b></TD>
         <TD ALIGN="LEFT" valign="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
	 showChecked("PRINUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;

</SCRIPT>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
 <%
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %>
   </TD>
 </TR>
</TABLE>

</FORM>

</BODY>
</HTML>
