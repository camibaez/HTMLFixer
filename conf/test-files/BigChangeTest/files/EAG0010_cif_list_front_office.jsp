<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Front Office - Customer List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

 function goAction(op) {

	document.forms[0].opt.value = op;
    var formLength= document.forms[0].elements.length;
    var ok = false;
 	var cun = "0";
  	var prf = "";
	var pg = "";
    for(n=0;n<formLength;n++) {
    	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "PORNUM") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
 		}
	}
  	if (!ok && op < 4) {
  		alert("Please select a Portfolio to continue.");	   
		return;
    }
  	if (op < 4) {
      	prf = document.forms[0].PORTFOLIO.value;
      	cun = document.forms[0].CUSTOMER.value; 
    }
	switch (op){
		// Portfolio Summary Inquiry
		case 1:  {
           	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088?SCREEN=600&PORTFOLIO=" + prf + "&CUSTOMER=" + cun;
			CenterWindow(pg,600,500,2);
          	break;
        }
		// Front Office - Customer Security
		case 2:  {
           	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0087?SCREEN=11&CUSTOMER=" + cun;
			window.location.href=pg;
          	break;
        }
		// Not Verified or Exit
   		default: {
	  	    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEAG0010?SCREEN=1&TYPE=FRONT_OFFICE";
			window.location.href=pg;
	  	  	break;
        }
    }  
  }
  
function getPortfClient(indexRow,customer,portfolio) {

    document.forms[0].CUSTOMER.value = customer;
    document.forms[0].PORTFOLIO.value = portfolio;
    showAddInfo(indexRow)
}
  
function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   tbAddInfo.rows[0].cells[1].filters[0].apply();
   tbAddInfo.rows[0].cells[1].style.color="";
   tbAddInfo.rows[0].cells[1].filters[0].Play();   
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
}    
</script>

</HEAD>

<BODY>

<h3 align="center"><%= userPO.getHeader7()%><br>Portfolios List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_list_front_office.jsp,EAG0010"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEAG0010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="CUSTOMER">
<INPUT TYPE=HIDDEN NAME="PORTFOLIO">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( cifList.getNoResult() ) {
 %>
   	<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      		<TD> 
      			<div align="center"> <font size="3"><b> There is no match for your criteria</b></font>
	 			</div>
      		</TD>
		</TR>
   	</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER class=IBSBTN> <a href="javascript:goAction(1)">
		 <img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/portfoliosummary.gif" ></a> 
      </TD>
      <TD ALIGN=CENTER class=IBSBTN> <a href="javascript:goAction(2)">
		 <img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/submit.gif" ></a>
      </TD>
      <TD ALIGN=CENTER class=IBSBTN> <a href="javascript:goAction(99)">
	 	 <img name="Image4" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a> 
      </TD>
    </TR>
  </TABLE>
  
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
     <TABLE id="headTable" >
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Portfolio</TH>
      <TH ALIGN=CENTER NOWRAP>Portfolio Description</TH>
      <TH ALIGN=CENTER NOWRAP>Officer</TH>
      <TH ALIGN=CENTER NOWRAP>Branch</TH>
      <TH ALIGN=CENTER NOWRAP>Customer</TH>
      <TH ALIGN=CENTER NOWRAP>Customer Name</TH>
      <TH ALIGN=CENTER NOWRAP>Short Name</TH>
  </TR>
</TABLE>

    
   <div id="dataDiv1" class="scbarcolor">
    <table id="dataTable" >
  <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
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

     <Table id="tbAddInfo" width="100%">
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  valign="middle" nowrap ><b>ID. Number : <br>ID. Type : <br>ID. Country : <br>Status : <br>RelationShip :<br>Type : </b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
	function resizeDoc() {
      adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
    }
    showAddInfo(0);
    resizeDoc();
    window.onresize=resizeDoc;

</SCRIPT>

<BR>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 101;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEAG0010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEAG0010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>
<%           
  }
%>

</FORM>

</BODY>
</HTML>
