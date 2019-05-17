<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
<!--
var reason = "";

 function showInqApprovalPR(refnum) {
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
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
 	 CenterWindow(page,600,500,2);
 }

 function showAddInfo(refernum,idxRow){
   var i= parseInt(document.forms[0].ActRow.value);
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   //for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
   // }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].ActRow.value = idxRow;
   document.forms[0].REFNUM.value = refernum;
   adjustDifTables(headTable, dataTable, dataDiv1,2,1);
   
  } 

 function goAction(op) {
     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
     if (document.forms[0].REFNUM.value !== "") {
		 document.forms[0].submit();
           
     }
     else {
		  alert("Select an account before  this operation ");	   
     }
  }  
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

function enterDates(recpos){
 document.forms[0].SCREEN.value = '6';
 document.forms[0].Pos.value = "" + recpos;
 document.forms[0].DATES.value = 'Y';
 document.forms[0].OPT.value = 'R';
 document.forms[0].submit();
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</SCRIPT>
</HEAD>

<% 
 if (!error.getERRNUM().equals("0")) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("   showErrors()");
     out.println("</SCRIPT>");
}%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif','<%=request.getContextPath()%>/images/e/reversal_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/apply_over.gif')">
<h3 align="center">Reversals	
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_reversal_list.jsp,EPR1080">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
<INPUT TYPE=HIDDEN NAME="REFNUM" VALUE="">
<INPUT TYPE=HIDDEN NAME="action" VALUE="X">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="OPT">
  <input type=HIDDEN name="DATES" value="">
  <TABLE class="tbenter">
    <TR> 
      <TD ALIGN=CENTER width="50%"> <a href="javascript:enterReason('X')" id="linkReject" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/reversal_over.gif',1)"><img name="Image2" alt="Reversal" border="0" src="<%=request.getContextPath()%>/images/e/reversal.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER width="50%"> <a href="javascript:goExit()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a> 
      </TD>
    </TR>
  </TABLE>
  
  <table class="tbenter" width="100%">
    <tr> 
      <td colspan="2" valign="middle"> 
        <div align="left">Starting Day : 
          <input type="text" name="E01PRITDM" size="2" maxlength="2" value="<%= userPO.getHeader1() %>">
          <input type="text" name="E01PRITDD" size="2" maxlength="2" value="<%= userPO.getHeader2() %>">
          <input type="text" name="E01PRITDY" size="2" maxlength="2" value="<%= userPO.getHeader3() %>">
          <a href="javascript:enterDates(0)"><img name="Image21" alt="Reversal" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif" align="absmiddle"></a></div>
      </td>
    </tr>
  </table>


<table  id="mainTable" class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%" > 
        <table id="headTable" >
          <tr id="trdark"> 
            <td align=CENTER   NOWRAP>&nbsp; &nbsp;</td>
            <td align=CENTER   NOWRAP>Reference No.</td>
            <td align=CENTER   NOWRAP>Customer Name</td>
            <td align=CENTER   NOWRAP >Amount</td>
            <td align=CENTER   NOWRAP>Description</td>
          </tr> 
        </table>
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
      </td>
      <td nowrap align="RIGHT" valign="top"> 
        <table id="tbAddInfoH" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >Basic Information </th>
          </tr>
        </table>
        <table id="tbAddInfo" >
          <tr id="trclear" > 
            <td  align="RIGHT"  valign="center" nowrap ><b>Date Transfer : <br>
              Debit Account : <br>        
              Currency : <br>
              Bank : <br>
              Branch : <br>
              Batch : <br>
              User : </b></td>
            <td align="LEFT" valign="center" nowrap class="tdaddinfo"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustDifTables(headTable, dataTable, dataDiv1,2,1);
      }
	 showChecked("PRINUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>  
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\"javascript:enterDates(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\"javascript:enterDates(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>

</FORM>

</BODY>
</HTML>
