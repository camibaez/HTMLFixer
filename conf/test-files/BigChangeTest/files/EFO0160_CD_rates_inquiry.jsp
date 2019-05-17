<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head> 
<title>Front Office - CD Rates Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<jsp:useBean id="msgInq" class="datapro.eibs.beans.EFO016002Message" scope="session" />   
<jsp:useBean id="prdList" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="ratList" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<SCRIPT Language="Javascript">
<!--- hide script from old browsers
	
function changePrd(prd,ccy){
	getElement("E02FESTCY").value = ccy;
	getElement("E02FESPRO").value = prd;
	document.forms[0].SCREEN.value = '3';
	document.forms[0].submit();
}	


 //  Process according with user selection
 function goAction(op) {
	
	if (getElement("E02FESTCY").value == "" && !(op == 2)) {
		alert("Please select Currency.");
		return;	 
	} 
	
   	switch (op){
	// Get Rates	 
  	case 1:  {
    	document.forms[0].SCREEN.value = '3';
		document.forms[0].submit();
       	break;
        }
	// Return to Previus Screen
	case 2:  {
    	pg = "<%=request.getContextPath()%>/pages/background.jsp";
		window.location.href=pg;
        break;
        }
	// 
  	default:  {
		document.forms[0].SCREEN.value = '3';
		document.forms[0].submit();
       	break;
		}

    }  
 }

// end hiding from old browsers -->
</SCRIPT>


</head>
<body>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
<div align="center">
<h3>CD Rates Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="front_office_CD_rates_inquiry.jsp,EFO0160"></h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFO0160">
<INPUT type="hidden" name="SCREEN" value="3">
<INPUT type="hidden" name="E02FESPRO" value="<%= msgInq.getE02FESPRO().trim()%>">

<TABLE class="tbenter" width="100%">
 	<tr id="trintrot"> 
    	<td colspan="7"><%= currUser.getH01USR()%></td>
        <td width="20%"> 
          <div align="right"><%= datapro.eibs.master.Util.formatDate(currUser.getE01RDM(),currUser.getE01RDD(),currUser.getE01RDY())%></div>
        </td>
    </tr>    
	<TR> 
	</TR>
</TABLE>

<table class="tableinfo">
	<tr>
		<td nowrap width="100%">
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY>
				<!--<TR id="trintro">
					<TD nowrap align="right" width="20%"><B>Relationship Type : </B></TD>
					<TD nowrap width="30%">
						<SELECT name="E02FESCCL">
							<OPTION value="I" <% if (msgInq.getE02FESCCL().equals("I")) out.print("selected"); %>>International</OPTION>
							<OPTION value="P" <% if (msgInq.getE02FESCCL().equals("P")) out.print("selected"); %>>Premier</OPTION>
							<OPTION value="E" <% if (msgInq.getE02FESCCL().equals("E")) out.print("selected"); %>>Elite</OPTION>
						</SELECT>
					</TD>
					<TD nowrap align="right" width="25%">
					</TD>
					<TD nowrap width="25%"></TD>
				</TR>-->
				<TR id="trintro">
					<TD height="10" width="20%" align="right">Currency :</TD>
					<TD height="10" align="left" width="30%" nowrap>
						<INPUT type="text" readonly name="E02FESTCY" size="4" value="<%= msgInq.getE02FESTCY().trim()%>" onchange="changePrd('E02FESPRO',this.value)">
							<A href="javascript:GetCodeDescCNOFC('E02FESTCY','E02FESTCD','25')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"></A>
						<INPUT type="text" readonly name="E02FESTCD" size="30" value="<%= msgInq.getE02FESTCD().trim()%>">
					</TD>
					
				</TR>
		</TABLE>
		</td>
	</tr>
</table>

<table width="100%">		
  	<tr>
  		<!--<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Getrate" value="Get Rates" onClick="javascript:goAction(1);">
     	  </div>	
  		</td>-->
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Return" value="Return" onClick="javascript:goAction(2);">
     	  </div>	
  		</td>
  	</tr>	
</table>	

<h4> Products</h4>

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
    	<TABLE id="headTable" >
     		<TR id="trdark"> 
				<TH ALIGN=CENTER NOWRAP></TH>
      			<TH ALIGN=CENTER NOWRAP>Code</TH>
     			<TH ALIGN=CENTER NOWRAP>Currency</TH>
     			<TH ALIGN=CENTER NOWRAP>Description</TH>
  	 		</TR>
		</TABLE> 
        <div id="dataDiv1" class="scbarcolor"> 
           	<table id="dataTable" >
             	<%
					prdList.initRow();
               		int k=1;
               		while (prdList.getNextRow()) {
                   		if (prdList.getFlag().equals("")) {
                   			out.println(prdList.getRecord());
                   		k++;
                   		}        
               		}
           		%>
           	</table>
          </div>
       </td>
  	</tr>
</table>

<h4> Rates</h4>
<TABLE  id="mainTable1" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
    	<TABLE id="headTable1" >
     		<%
                ratList.initRow();
				if (ratList.getNextRow()) {
					if (ratList.getFlag().equals("")) {
						out.println(ratList.getRecord());
					}
				}
			%>
		</TABLE> 
        <div id="dataDiv2" class="scbarcolor"> 
           	<table id="dataTable1" >
             	<%
               		k=1;
               		while (ratList.getNextRow()) {
                   		if (ratList.getFlag().equals("")) {
                   			out.println(ratList.getRecord());
                   		k++;
                   		}        
               		}
           		%>
           	</table>
          </div>
       </td>
  	</tr>
</table>

<B> 
	<SCRIPT language="JavaScript">
    	function resizeDoc() {
    		adjustEquTables(headTable, dataTable, dataDiv1,1,false);
			adjustEquTables(headTable1, dataTable1, dataDiv2,1,false);
    	}	
    	resizeDoc();
    	window.onresize=resizeDoc;
	</SCRIPT>
</B>
</form>
</body>
</html>
