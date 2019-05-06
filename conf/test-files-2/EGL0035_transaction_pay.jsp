<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" /> 
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<SCRIPT LANGUAGE="JavaScript">

<%
    String option = userPO.getAccOpt();

	trans.initRow();
	int blank_row = 0;
    try {
    	blank_row = Integer.parseInt(transData.getTrNum());
    } catch (Exception e) {
    	blank_row = 0;
    }
    int max_row = 1300;
    int row = 0;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    } catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans.getLastRow()) ) {
      	total_row = trans.getLastRow() + 1 + blank_row;
    } else {
		total_row = row;       
    }

  	if (!userPO.getOption().equals("TRANSACTION")) {  
    	if (userPO.getOption().equals("CD")) {
			if (userPO.getPurpose().equals("CD_TRANSACTION")) {
%> 				builtNewMenu(cd_t_m_opt); <%			
			} else {
%>    			builtNewMenu(cd_m_opt);	<%
			}
 		} else if (userPO.getOption().equals("LN")) {
%> 					builtNewMenu(ln_m_opt); <%
 		} else if (userPO.getOption().equals("OCK")) {
 					if ( userPO.getHeader19().equals("0")) {
%> 						builtNewMenu(of_p_opt); <%
 					} else {
%> 						builtNewMenu(of_np_opt); <%
 					}
 		} else if (userPO.getOption().equals("PR")) {
%> 					builtNewMenu(pr_m_opt); <%
		} else if (userPO.getOption().equals("LN_TRANSACTION")) {
%> 					builtNewMenu(ln_t_m_opt); <%
		} else if (userPO.getOption().equals("CD_TRANSACTION")) {
%> 					builtNewMenu(cd_t_m_opt); <%
		} else if (userPO.getOption().equals("CP")) {
%>					builtNewMenu(cp_m_opt);	<%
		} else {
			/*  default menu */
		}
%> 		
   		initMenu();
<% 	} %>

	builtHPopUp();

	function showPopUp(optHelp,fieldname,bank,ccy,aux1,aux2,opcode) {
   		init(optHelp,fieldname,bank,ccy,aux1,aux2,opcode);
   		showPopupHelp();
   	}
   
	function checkRowValue() {
  		var r = <%= total_row %> + parseInt(document.forms[0].TEMP_ROW.value);
  		if (r > <%= max_row %>) {
    		alert("Registers out of range, maximum number is 1300");
  		} else {
    		document.forms[0].ROW.value = r + "";
  		}
	}
  
	function submitThis(option) {
  		var okdel = false;
  		document.forms[0].opt.value = option;
  		if ( option==8 ) {
			document.forms[1].submit();
  		} else if ( option==4 ) { 
    		if (confirm("This option will delete the batch")) {
				document.forms[1].SCREEN.value = 4;
				document.forms[1].submit();
			}	
		} else {
			if ( option==1) {
   				if (confirm("All selected transactions will be deleted")) {
   					document.forms[0].submit();	
				}
			} else {
      			document.forms[0].submit(); 
      		}
      	}
    }  			
				
	function doPrint() {
 		page= prefix +language + "EGL0035_transaction_print.jsp";
 		CenterWindow(page,700,450,3);
	}

	function setCurrentRow(row) {
		var form = document.forms[0];
   		form["CURRENTROW"].value = row;
   		
   		if (form["E01WRKTDS_"+ row].value == "") form["E01WRKTDS_"+ row].value = form["E01WRKTDS"].value;
   		if (form["E01WRKVD1_"+ row].value == "") form["E01WRKVD1_"+ row].value = form["E01WRKVD1"].value;
   		if (form["E01WRKVD2_"+ row].value == "") form["E01WRKVD2_"+ row].value = form["E01WRKVD2"].value;
   		if (form["E01WRKVD3_"+ row].value == "") form["E01WRKVD3_"+ row].value = form["E01WRKVD3"].value;
	}

	function GetInfo(currentrow) {
 		var form = document.forms[0];
 		var rowSel = "";
		if (currentrow) {
			setCurrentRow(currentrow);
			rowSel = "?CurrRow=" + currentrow;
		}
  
		pg = prefix + language + "EGL0035_transaction_info.jsp" + rowSel;
		CenterNamedWindow(pg, 'Information', 600, 500, 1);          
	}
	
</SCRIPT>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
%>
     	<SCRIPT Language="Javascript">
            showErrors();
     	</SCRIPT>
<%
 	}
%>

<% 
 	if ( transData.isFlagPrint()  ) {
    	transData.setFlagPrint(false);
%>
     	<SCRIPT Language="Javascript">
            doPrint();
     	</SCRIPT>
<%
 	}
 	
 	String title = "Multiple Transactions Input";
 	if (session.getAttribute("TARGET") != null) {
	 	if ( session.getAttribute("TARGET").equals("EGL0035M") ) {
	 		title = title + " Monthly";
	 	} else {
	 		if ( session.getAttribute("TARGET").equals("EGL0035A") ) {
	    		title = title + " Years";
	    	}	
	 	}	
	 }	
%>

</head>

<body>
<h3 align="center"><%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transaction_pay,EGL0035"></h3>
<hr size="4">  
	<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    		<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(1)">Delete<br>Selection</a></td>
			<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(2)">Duplicate<br>Selection</a></td>
<% 		if ( transData.getWrkFile().equals("2") ) { %>
			<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(4)">Delete<br>Batch</a></td>
<% 		} %>
			<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(5)">Print</a></td>
			<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(6)">Accept</a></td>
 <% 	if ( transData.getWrkFile().equals("2") ) {%>
			<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(7)">Accept<br>with Errors</a></td>
 <% 	} %>
		<td align="center" class="TDBKG" width="15%"><a href="javascript:submitThis(8)">Validate</a></td>
    	</tr>
	</table>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035">
  
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="">
    <input type=HIDDEN name="OPTHELP" value="">
    <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%= total_row %>">
    <INPUT TYPE=HIDDEN NAME="PORT" VALUE="<%= session.getAttribute("TARGET") %>">
        
  	<table class="tableinfo" cellspacing=0 >
    	<tr id="trdark"> 
      		<td align="right"  nowrap width="12%"  bordercolor="#FFFFFF"> 
<% 			if (userPO.getOption().equals("LN")) { 
				out.println("Account : ");
			} else 
				if (userPO.getOption().equals("CD")) { 
					out.println("Certificate : ");
				} else 
					if (userPO.getOption().equals("OCK")) { 
						out.println("Check Number : ");
				  	} else 
        				if (userPO.getOption().equals("PR")) {
        					out.println("Reference No. : ");
        				} else 
        					if (userPO.getOption().equals("TRANSACTION")) { 
        						out.println("Batch Number : ");
        					}
%> 
      		</td>
      		<td align="right"  nowrap width="22%"  bordercolor="#FFFFFF"> 
        		<div align="left"> 
<% 					if (userPO.getOption().equals("TRANSACTION")) { %>
          				<input type="text" name="E01BTHNUM" size="6" maxlength="5"  value = "<%= transData.getBthnum() %>">
<%					} else { 
           				if (userPO.getOption().equals("OCK")) { 
%> 
             				<input type="text" name="E01NUMACC" size="11" maxlength="10"  value = "<%= transData.getChkNum() %>">
<% 						} else {
%>
            				<input type="text" name="E01NUMACC" size="17" maxlength="15"  value = "<%= transData.getAccNum() %>">
<% 						} 
%> 
<% 					} 
%> 
				</div>
      		</td>
      		<td align="left" nowrap width="9%"  bordercolor="#FFFFFF"> 
        		<div align="right"> 
<% 				if (userPO.getOption().equals("TRANSACTION")) { 
%> 
          			Originator : 
<% 				} 
%> 
				</div>
      		</td>
      		<td align="right" nowrap width="14%"  bordercolor="#FFFFFF"> 
        		<div align="left"> 
<% 				if (userPO.getOption().equals("TRANSACTION")) { 
%> 
          			<input type="text" name="E01WRKOBK" size="4" maxlength="2"  value = "<%= transData.getBank() %>">
          			<input type="text" name="E01WRKOBR" size="5" maxlength="3"  value = "<%= transData.getBranch() %>">
<% 				} 
%> 
				</div>
      		</td>
      		<td align="right" nowrap width="14%"  bordercolor="#FFFFFF"> Total Debits : </td>
      		<td align="left" nowrap  bordercolor="#FFFFFF" width="25%"> 
        		<input type="text" name="DEBIT" size="14" maxlength="13" id="txtright"  value = "<%= transData.getDebitAmt() %>">
      		</td>
      		<td align="left" nowrap  bordercolor="#FFFFFF" width="4%">&nbsp; </td>
   		</tr>
   		<tr id="trdark"> 
      		<td align="right" nowrap width="12%"  bordercolor="#FFFFFF">Total Transactions :</td>
      		<td align="right" nowrap width="22%"  bordercolor="#FFFFFF"> 
        		<div align="left"> 
          			<input type="text" name="ROW" size="5" maxlength="5" id="txtright"  value="<%= total_row %>">
        		</div>
      		</td>
      		<td align="left" nowrap width="9%"  bordercolor="#FFFFFF">&nbsp; </td>
      		<td align="right" nowrap width="14%"  bordercolor="#FFFFFF"> 
        		<div align="left"></div>
      		</td>
      		<td align="right" nowrap width="14%"  bordercolor="#FFFFFF"> Total Credits : </td>
      		<td align="left" nowrap  bordercolor="#FFFFFF" width="25%"> 
        		<input type="text" name="CREDIT" size="14" maxlength="13" id="txtright"  value = "<%= transData.getCreditAmt() %>">
      		</td>
      		<td align="left" nowrap  bordercolor="#FFFFFF" width="4%">&nbsp; </td>
    	</tr>
	</table>
	
  	<BR>
  	
  	<table class="tableinfo">
    	<tr  id="trclear">
      		<td align="right" width="17%"> Description : </td>
      		<td align="left" width="40%" nowrap> 
        		<input type="text" name="E01WRKTDS" size="30" maxlength="300"  value = "<%= transData.getDescription() %>" >
        		<a href="javascript:GetInfo()"><img src="<%=request.getContextPath()%>/images/e/info.gif" title="More Information" align="middle" border="0" ></a> 
      		</td>
      		<td align="right"width="14%">Value Date : </td>
      		<td align="left" width="29%" nowrap> 
        		<input type="text" name="E01WRKVD1" size="2" maxlength="2"  value = "<%= transData.getDate1() %>">
        		<input type="text" name="E01WRKVD2" size="2" maxlength="2"  value = "<%= transData.getDate2() %>">
        		<input type="text" name="E01WRKVD3" size="2" maxlength="2"  value = "<%= transData.getDate3() %>">
        		<a href="javascript:DatePicker(document.forms[0].E01WRKVD1,document.forms[0].E01WRKVD2,document.forms[0].E01WRKVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
      		</td>
    	</tr>
  	</table>
  	
  	<BR>
  
 	<TABLE  id="mainTable" class="tableinfo" >
 		<TR> 
    		<TD NOWRAP>
        		<TABLE id="headTable" >
          			<TR id="trdark"> 
            			<th nowrap >&nbsp;</th>
            			<th align="center" nowrap >Bnk </th>
            			<th align="center" nowrap >Brn </th>
            			<th align="center" nowrap >Ccy </th>
            			<th align="center" nowrap >General<br>Ledger</th>
            			<th align="center" nowrap >Cost<br>Center</th>
            			<th align="center" nowrap > Account<br>Number</th>
						<th align="center" nowrap > Pay/<br>Thru Number</th>              
            			<th align="center" nowrap >TR/CD</th>
            			<th align="center" nowrap >Amount </th>
            			<th align="center" nowrap >D/C</th>
						<th align="center" nowrap >Value Date</th>
            			<th nowrap >&nbsp;</th>
          			</tr>
        		</TABLE>
  
   				<div id="dataDiv1" class="scbarcolor" >
          			<table id="dataTable" >
<%
	 				 	trans.initRow();
                		while (trans.getNextRow()) {
%>
            			<tr id="trclear"> 
              				<td align="center" nowrap > 
                				<input type="checkbox" name="TRANSROW_<%= trans.getCurrentRow() %>" value="checked">
              				</td>
              				<td align="center" nowrap  > 
                				<input type="text" name="E01WRKBNK_<%= trans.getCurrentRow() %>" size="2" maxlength="2"  value="<%= trans.getRecord(0) %>" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtchanged\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKBRN_<%= trans.getCurrentRow() %>" size="3" maxlength="3"  value="<%= trans.getRecord(1) %>" onKeypress="enterInteger()" oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtchanged\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKCCY_<%= trans.getCurrentRow() %>" size="3" maxlength="3" value="<%= trans.getRecord(2) %>" oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKGLN_<%= trans.getCurrentRow() %>" size="13" maxlength="12" value="<%= trans.getRecord(3) %>" onKeypress="enterInteger()" oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,document.forms[0].E01WRKCCY_<%= trans.getCurrentRow() %>.value,'','','')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKCCN_<%= trans.getCurrentRow() %>" size="8" maxlength="8" value="<%= trans.getRecord(4) %>" oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKACC_<%= trans.getCurrentRow() %>" size="13" maxlength="13" value="<%= trans.getRecord(5) %>" onKeypress="enterInteger()" oncontextmenu="showPopUp(accountHelp,this.name,'','','','','RT')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKPYT_<%= trans.getCurrentRow() %>" size="6" maxlength="5" value="<%= trans.getRecord(45) %>" onKeypress="enterInteger()" oncontextmenu="showPopUp(subaccountHelp,this.name,'','',document.forms[0].E01WRKACC_<%= trans.getCurrentRow() %>.value,'','')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKCDE_<%= trans.getCurrentRow() %>" size="2" maxlength="2" value="<%= trans.getRecord(6) %>" oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKAMT_<%= trans.getCurrentRow() %>" size="17" maxlength="17" value="<%= trans.getRecord(7) %>" onKeypress="enterDecimal()" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                				<input type="text" name="E01WRKDCC_<%= trans.getCurrentRow() %>" size="1" maxlength="1" value="<%= trans.getRecord(8) %>" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" <% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
              				</td>
              				<td align="center" nowrap > 
                  				<input type="text" name="E01WRKVD1_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(10) %>" onKeypress="enterInteger()" id="txtright">
                  				<input type="text" name="E01WRKVD2_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(11) %>" onKeypress="enterInteger()" id="txtright">                  
                  				<input type="text" name="E01WRKVD3_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(12) %>" onKeypress="enterInteger()" id="txtright">                
              				</td>              
              				<td align="left" nowrap > 
                				<div align=left > <a href="javascript:GetInfo('<%= trans.getCurrentRow()%>')" >
                					<img src="<%=request.getContextPath()%>/images/e/info.gif" title="More Information" align="middle" border="0" ></a> 
                  					<input type= Hidden name="E01WRKTDS_<%= trans.getCurrentRow()%>" size="37" maxlength="300" 
                  						value="<%= trans.getRecord(9)+trans.getRecord(15)+trans.getRecord(16)+
                                                   trans.getRecord(17)+trans.getRecord(18)+trans.getRecord(19)+
										  		   trans.getRecord(20)+trans.getRecord(21)+trans.getRecord(22)+
												   trans.getRecord(23)%>">                  
                  					<input type= Hidden name="E01WRKMD1_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(37) %>">
                  					<input type= Hidden name="E01WRKMD2_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(38) %>">
                  					<input type= Hidden name="E01WRKMD3_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(39) %>">
                  					<input type= Hidden name="E01WRKTYP_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(25) %>">
                  
<%
									if (option.equals("AC")) {
%>
									  <input type= Hidden name="E01WRKCKN_<%= trans.getCurrentRow()%>" size="12" maxlength="10" value = "<%= trans.getRecord(27) %>">
					                  <input type= Hidden name="E01WRKEXR_<%= trans.getCurrentRow()%>" size="12" maxlength="11" value = "<%= trans.getRecord(13) %>">
					                  <input type= Hidden name="E01WRKCUN_<%= trans.getCurrentRow()%>" size="10" maxlength="9" value = "<%= trans.getRecord(26) %>">
					                  <input type= Hidden name="E01WRKCR2_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(41) %>">
					                  <input type= Hidden name="E01WRKUN2_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(42) %>">
					                  <input type= Hidden name="E01WRKCR3_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(43) %>">
					                  <input type= Hidden name="E01WRKUN3_<%= trans.getCurrentRow()%>" value = "<%= trans.getRecord(44) %>">
<%
									}
%>
                  					<input type= Hidden name="DUPLIC_<%= trans.getCurrentRow()%>" size="2" maxlength="2" value = "<%= trans.getRecord(24) %>">
                				</div>
              				</td>
            			</tr>
<%
                }
				
				for (int i=trans.getRow(); i < total_row; i++) {
%>
            		<tr id="trclear"> 
              			<td align="center" nowrap > 
                			<input type="checkbox" name="TRANSROW_<%= i %>" value="checked">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKBNK_<%= i %>" size="2" maxlength="2" onFocus="setCurrentRow('<%= i %>')">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKBRN_<%= i %>" size="3" maxlength="3" oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,'','','','')" onFocus="setCurrentRow('<%= i %>')">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKCCY_<%= i %>" size="3" maxlength="3" value="" id="txtright" oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,'','','','')" onFocus="setCurrentRow('<%= i %>')">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKGLN_<%= i %>" size="13" maxlength="12" value="" id="txtright" onKeypress="enterInteger()" onFocus="setCurrentRow('<%= i %>')" oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,document.forms[0].E01WRKCCY_<%= i %>.value,'','','')">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKCCN_<%= i %>" size="8" maxlength="8" value="" id="txtright" onFocus="setCurrentRow('<%= i %>')" oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,'','','','')" >
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKACC_<%= i %>" size="13" maxlength="13" value="" id="txtright" onKeypress="enterInteger()" onFocus="setCurrentRow('<%= i %>')" oncontextmenu="showPopUp(accountHelp,this.name,'','','','','RT')">
              			</td>
			  			<td align="center" nowrap > 
                			<input type="text" name="E01WRKPYT_<%= i %>" size="6" maxlength="5" value="" id="txtright" onKeypress="enterInteger()" onFocus="setCurrentRow('<%= i %>')" oncontextmenu="showPopUp(subaccountHelp,this.name,'','',document.forms[0].E01WRKACC_<%= i %>.value,'','')">
              			</td>              
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKCDE_<%= i %>" size="2" maxlength="2" value="" id="txtright" onFocus="setCurrentRow('<%= i %>')" oncontextmenu="showPopUp(cnofHelp,this.name,'','','','','20')" >
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKAMT_<%= i %>" size="17" maxlength="17" value="" id="txtright" onKeypress="enterDecimal()" onFocus="setCurrentRow('<%= i %>')">
              			</td>
              			<td align="center" nowrap > 
                			<input type="text" name="E01WRKDCC_<%= i %>" size="1" maxlength="1" value="" id="txtright" onFocus="setCurrentRow('<%= i %>')">
              			</td>
              			<td align="center" nowrap > 
                  			<input type= "text" name="E01WRKVD1_<%= i %>" size="2" maxlength="2" value = "" onKeypress="enterInteger()" id="txtright">
                  			<input type= "text" name="E01WRKVD2_<%= i %>" size="2" maxlength="2" value = "" onKeypress="enterInteger()" id="txtright">
                  			<input type= "text" name="E01WRKVD3_<%= i %>" size="2" maxlength="2" value = "" onKeypress="enterInteger()" id="txtright">                
              			</td>              
              			<td align="left" nowrap > 
                			<div align="left" > <a href="javascript:GetInfo('<%= i %>')">
                				<img src="<%=request.getContextPath()%>/images/e/info.gif" title="More Information" align="middle" border="0" ></a> 
				                <input type= Hidden name="E01WRKTDS_<%= i %>" size="37" maxlength="300" value="" >
				                <input type= Hidden name="E01WRKMD1_<%= i %>" size="2" maxlength="2" value = "">
				                <input type= Hidden name="E01WRKMD2_<%= i %>" size="2" maxlength="2" value = "">
				                <input type= Hidden name="E01WRKMD3_<%= i %>" size="2" maxlength="2" value = "">
				                <input type= Hidden name="E01WRKTYP_<%= i %>" size="2" maxlength="2" value = "<%=transData.getProdtype()%>">
<%
								if (option.equals("AC")) {
%>
									 <input type= Hidden name="E01WRKCKN_<%= i %>" size="12" maxlength="10" value = "">
					                 <input type= Hidden name="E01WRKEXR_<%= i %>" size="12" maxlength="11" value = "">
					                 <input type= Hidden name="E01WRKCUN_<%= i %>" size="10" maxlength="9" value = "">
					                 <input type= Hidden name="E01WRKCR2_<%= i %>" value = "">
					                 <input type= Hidden name="E01WRKUN2_<%= i %>" value = "">
					                 <input type= Hidden name="E01WRKCR3_<%= i %>" value = "">
					                 <input type= Hidden name="E01WRKUN3_<%= i %>" value = "">
<%
								}
%>
                  					<input type= Hidden name="DUPLIC_<%= i %>" size="2" maxlength="2" value = "">
                				</div>
              				</td>
            			</tr>
<%
					}
%>
					</table>
  				</div>
  			</TD>
  		</TR>	
	</TABLE>

  	<BR>
  
  	<table class="tbenter" width="100%">
		<tr>
			<td colspan="2">
				<h4 style="text-align:right"><input type="checkbox" name="H02FLGWK2" value="Y">Accept with Warnings</h4>
			</td>
  		</tr>		
    	<tr> 
      		<td width="91%"> 
        		<div align="right">Records to Add : 
          			<input type="text" name="TEMP_ROW" size="4" maxlength="3" value="0" onKeypress="enterInteger()" onblur="checkRowValue()">
        		</div>
      		</td>
      		<td  width="8%"><a href="javascript:submitThis(3)"><img src="<%=request.getContextPath()%>/images/e/apply_on.gif" title="Apply" align="middle" border="0" ></a></td>
    	</tr>
  	</table>
  	
    <BR>
  
<SCRIPT language="JavaScript">
	function resizeDoc() {
       divResize();
     	adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 1, false);
     }
     resizeDoc();
     window.onresize=resizeDoc;
</SCRIPT>  

</form>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
</form>
</body>
</html>
