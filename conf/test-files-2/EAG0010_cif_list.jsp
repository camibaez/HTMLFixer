<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Portfolios List</TITLE>
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
      
     if ( ok ) {
        prf = document.forms[0].PORTFOLIO.value;
        cun = document.forms[0].CUSTOMER.value; 
		switch (op){
   		  case 7:  {
            pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=600&E01CUN=" + cun;
            break;
          }
   		  case 8:  {
            pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEWD0300?SCREEN=2&opt=4&CODE=" + prf + "&CUSTOMER=" + cun;
           break;
          } 
          case 9:  {
            pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088?SCREEN=600&PORTFOLIO=" + prf + "&CUSTOMER=" + cun;
           break; 
          }
   		  default: {
	  	    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=4&opt=" + op + "&CUSTOMER=" + prf;
	  	    break;
          }
        }  
   	    CenterWindow(pg,600,500,2);  
     } else {
		alert("Please select a Portfolio to continue.");	   
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

<h3 align="center"><%= userPO.getHeader7()%><br>Portfolios List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_list.jsp,EAG0010"></h3>
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
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(7)"><b>Customer<br>Inquiry</b></a>
      </TD> 
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(8)"><b>Portfolio<br>Inquiry</b></a> 
      </TD>
      <!--<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(9)"><b>Portfolio<br>Summary</b></a> 
      </TD>-->
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(1)"><b>Totals</b></a> 
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(2)"><b>Position</b></a> 
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(3)"><b>Management<br>Inquiries</b></a>
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(4)" ><b>Account<br>Listing</b></a>
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(5)"><b>Lines of <br>Credit</b></a>
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(6)"><b>Collaterals</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG ><a href="javascript:goAction(10)"><b>Investment<br>Position</b></a>
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Exit</b></a> 
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
