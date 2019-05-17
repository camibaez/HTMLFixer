<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Transfer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
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
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=3&REFNUM="+document.forms[0].REFNUM.value;
	 CenterWindow(page,600,500,2);
  }

 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
 
 function showAddInfo(refernum,idxRow){

   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   //tbAddInfo.rows[0].cells[1].filters[0].apply();
   tbAddInfo.rows[0].cells[1].style.color="";
   //tbAddInfo.rows[0].cells[1].filters[0].Play();
   for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].REFNUM.value = refernum;
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
   
  }
  
 function enter(recpos){ 	
 	document.forms[0].Pos.value = "" + recpos;
 	document.forms[0].submit();
 }
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
 
 function FilterType() {
 	document.forms[0].SCREEN.value = "9";
 	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060';
    document.forms[0].submit();
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
<%
String transTyp = "";
try {
	 transTyp = request.getParameter("TRANSTYP");
} catch (Exception e) {
	 transTyp = "";
}
if (transTyp == null) transTyp = "";
%>
<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/inquiry_over.gif')">
<h3 align="center"> Wire Transfers Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_inq_list.jsp,EPR1060"> 
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="REFNUM" VALUE="">
    <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">

  </p>
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('')"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  
  <TABLE  id="mainTable" class="tableinfo" width="50%">
    <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <TABLE id="headTable" width="354" >
          <TR id="trdark"> 
            <TH ALIGN=CENTER NOWRAP></TH>
            <TH ALIGN=CENTER NOWRAP>Reference No.</TH>
            <TH ALIGN=CENTER NOWRAP>Amount</TH>
            <TH ALIGN=CENTER NOWRAP>Status</TH>
            <TH ALIGN=CENTER NOWRAP>Date</TH>
			<TH ALIGN=CENTER NOWRAP>Transfer <br> Type</TH>
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
            <TD  ALIGN="RIGHT"  valign="middle" nowrap ><b>Debit Account : <br>Credit Account : <br>By Order : <br>Beneficiary : <br>
              Beneficiary Bank :<br>
              Ordering Inst. : 
             </b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
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
