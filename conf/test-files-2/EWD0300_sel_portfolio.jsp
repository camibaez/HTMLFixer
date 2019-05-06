<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Customer Portfolio Inquiry</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "EWD0300Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
<!--

  function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(code, customer, idxRow) {

    document.forms[0].CODE.value = code;
    document.forms[0].CUSTOMER.value = customer;
	showAddInfo(idxRow);
	
}

  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

 function extraInfo(textfields,noField) {
 var pos=0
 var s= textfields;
 for ( var i=0; i<noField ; i++ ) {
   pos=textfields.indexOf("<br>",pos+1);
  }
 s=textfields.substring(0,pos);
 return(s);
 }
 
 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value; // extraInfo(document.forms[0]["TXTDATA"+idxRow].value,7);
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
  }
//-->
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

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEWD0300" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE">
  <input type=HIDDEN name="CUSTOMER">
  <h3 align="center">Customer Portfolio Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
  	  name="EIBS_GIF" ALT="sel_portfolio.jsp,EWD0300"> 
  </h3>
<hr size="4">
  <p><%
	if ( EWD0300Help.getNoResult() ) {
 %></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%" >
    <tr> 
      <td > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
        </div>
      </td>
    </tr>
  </table>
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
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(4)"><b>Inquiry</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
<br>
<TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP> </TH>            
            <TH ALIGN=CENTER NOWRAP>Portfolio<br>
              Number</TH>
            <TH ALIGN=CENTER NOWRAP>Description</TH>
            <TH ALIGN=CENTER NOWRAP>Customer</TH>
            <TH ALIGN=CENTER NOWRAP>Opening<br>
              Date</TH>
            <TH ALIGN=CENTER NOWRAP>Currency</TH>
    </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
    <%
                EWD0300Help.initRow();
                int k=1;
                while (EWD0300Help.getNextRow()) {
                    if (EWD0300Help.getFlag().equals("")) {
                    		out.println(EWD0300Help.getRecord());
                    k++;
                    }        
                }
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH"   width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Basic Information </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo"  >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT" VALIGN="TOP" nowrap > 
              <p><b>
				Officer Code : <br>
				Officer Name : <br><br>
                Legal Name : 
				</b>
			  </p>
            </TD>
         <TD ALIGN="LEFT"  class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>
</Table>  	

<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( EWD0300Help.getShowPrev() ) {
       		int pos = EWD0300Help.getFirstRec() - 21;
			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEWD0300?SCREEN=1&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( EWD0300Help.getShowNext() ) {
      		int pos = EWD0300Help.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEWD0300?SCREEN=1&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	 
  <p> 
    <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("PORTNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
	</SCRIPT>
    <%}%> </p>
</FORM>

</BODY>
</HTML>
