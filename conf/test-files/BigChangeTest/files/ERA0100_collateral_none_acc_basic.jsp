<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "collBasic" 	class= "datapro.eibs.beans.ERA010001Message"  	scope="session"/>
<jsp:useBean id= "insList" 		class= "datapro.eibs.beans.JBObjList"   		scope="session"/>
<jsp:useBean id= "error" 		class= "datapro.eibs.beans.ELEERRMessage"  		scope="session"/>
<jsp:useBean id= "userPO" 		class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	builtNewMenu(colla_i_opt); 

	function goAction() {
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100?SCREEN=9&ROW=" + document.forms[0].ACTROW.value;
		CenterWindow(page,600,500,2);
	 }
	
	function setRow(actrow) {
		document.forms[0].ACTROW.value = actrow;
	}

</SCRIPT>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

<% 
 	boolean firstTime = true;
 	String chk = "";
 	int row;
 	try {
	  	row = Integer.parseInt(request.getParameter("ROW"));
	  	firstTime = false;
	} catch (Exception e) {
		row = 0;
		firstTime = true;		
	} 
 
	if ( !error.getERRNUM().equals("0")  ) {
    	out.println("<SCRIPT Language=\"Javascript\">");
    	error.setERRNUM("0");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
	}
%>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Non-Collaterals Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_none_acc_basic.jsp, ERA0100"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type=HIDDEN name="BNKNUM" value="<%= collBasic.getE01ROCBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim() %>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Line Type: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getType().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Summary</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
            <tr id="trdark"> 
              <td width=25%> 
                
              <div align="right">Appraised Value: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <input type="text" id="txtright" name="E01ROCAPA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAPA().trim()%>">
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Number of Units: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCNUN" readonly size="7" maxlength="5" value="<%= collBasic.getE01ROCNUN().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                
              <div align="right">Eligible Value: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCLIV" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCLIV().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Unit Face Value: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCPPU" readonly size="15" maxlength="13" value="<%= collBasic.getE01ROCPPU().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td width=25%> 
                
              <div align="right"> Ineligible Value: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCINA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCINA().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Unit Value: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCMPU" readonly>
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                
              <div align="right">Face Value: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCFAA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCFAA().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Appraised by: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" name="E01ROCABY" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCABY().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td width=25%> 
                
              <div align="right">Value Adjustment: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCAM1" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAM1().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Last Appraised Date: </div>
              </td>
              
            <td width=29%> 
              <div align="left">
                <input type="text" name="E01ROCAP1" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCAP1().trim()%>">
                <input type="text" name="E01ROCAP2" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCAP2().trim()%>">
                <input type="text" name="E01ROCAP3" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCAP3().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                
              <div align="right">Collateral Amount: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCCOP" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCCOP().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Opening Date: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" name="E01ROCOP1" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCOP1().trim()%>">
                <input type="text" name="E01ROCOP2" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCOP2().trim()%>">
                <input type="text" name="E01ROCOP3" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCOP3().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td width=25%> 
                
              <div align="right">Used Amount: </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCUSE" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCUSE().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Maturity Date: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" name="E01ROCMT1" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCMT1().trim()%>">
                <input type="text" name="E01ROCMT2" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCMT2().trim()%>">
                <input type="text" name="E01ROCMT3" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCMT3().trim()%>">
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                
              <div align="right">Available : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                <input type="text" id="txtright" name="E01ROCBAL" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCBAL().trim()%>">
              </div>
              </td>
              
            <td width=24%> 
              <div align="right">Revision Date: </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
                <input type="text" name="E01ROCRE1" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCRE1().trim()%>">
                <input type="text" name="E01ROCRE2" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCRE2().trim()%>">
                <input type="text" name="E01ROCRE3" readonly size="2" maxlength="2" value="<%= collBasic.getE01ROCRE3().trim()%>">
              </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  <h4>Details</h4>
<table class="tableinfo">
      <tr > 
        <td >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td width=21%> 
              <div align="right">Bank/Branch : </div>
            </td>
            <td width=32% NOWRAP> 
              <div align="left"> 
                <input type="text" name="E01ROCBNK" readonly size="4" maxlength="2" value="<%= collBasic.getE01ROCBNK().trim()%>">
                <input type="text" name="E01ROCBRN" readonly size="5" maxlength="3" value="<%= collBasic.getE01ROCBRN().trim()%>">
              </div>
            </td>
            <td width=16%> 
              <div align="right">G/L Account: </div>
            </td>
            <td width=31% nowrap> 
              <div align="left"> 
                <input type="text" name="E01ROCGLN" readonly size="18" maxlength="16" value="<%= collBasic.getE01ROCGLN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=21%> 
              <div align="right">Owner: </div>
            </td>
            <td width=32%> 
              <div align="left"> 
                <input type="text" name="E01CUSNAM" readonly size="37" maxlength="35" value="<%= collBasic.getE01CUSNAM().trim()%>">
              </div>
            </td>
            <td width=16%> 
              <div align="right">Exchange Rate: </div>
            </td>
            <td width=31% nowrap> 
              <div align="left"> 
                <input type="text" name="E01ROCOFX" readonly size="13" maxlength="11" value="<%= collBasic.getE01ROCOFX().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=21%> 
              <div align="right">Description: </div>
            </td>
            <td width=32%> 
              <div align="left"> 
                <input type="text" name="E01ROCDES" readonly size="37" maxlength="35" value="<%= collBasic.getE01ROCDES().trim()%>">
              </div>
            </td>
            <td width=16%> 
              <div align="right">Interest Accrued: </div>
            </td>
            <td width=31% nowrap> 
              <div align="left"> 
                <input type="text" name="E01ROCAM2" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAM2().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=21%> 
              <div align="right">Location : </div>
            </td>
            <td width=32%> 
              <div align="left"> 
                <input type="text" name="E01ROCLOC" readonly value="<%= collBasic.getE01ROCLOC().trim()%>">
              </div>
            </td>
            <td width=16%> 
              <div align="right">Insurance Policy: </div>
            </td>
            <td width=31% nowrap> 
              <div align="left"> 
                <input type="text" name="E01ROCINF" readonly size="3" maxlength="1" value="<%= collBasic.getE01ROCINF().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=21%> 
              <div align="right">Endorsed : </div>
            </td>
            <td width=32%> 
              <div align="left"> 
                <input type="text" name="E01ROCEND" readonly size="3" maxlength="1" value="<%= collBasic.getE01ROCEND().trim()%>">
              </div>
            </td>
            <td width=16%> 
              <div align="right"></div>
            </td>
            <td width=31%> 
              <div align="left"> </div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
<BR>
<%if ( !(insList.getNoResult() )) {%>
<h4>Insurance Policy List</h4>
<input type="hidden" name="ACTROW" value="<%= row %>">
<input type="hidden" name="opt" value="1">
<table class="tbenter">
  	<tr>
		<td class=tdBKG>
        	<div align="center"><a href="javascript:goAction()">Detail</a> </div>
      	</td>
	</tr>
</table>

<table  id="mainTable" class="tableinfo" border=1>
 	<tr > 
    	<td nowrap valign="top" width="100%" >
		<table id="headTable" width="100%">
			<tr id="trdark"> 
				<th align="center" width="5%"> </th>
				<th align="center" width="55%">Description</th>
				<th align="center" width="20%">Policy Number</th>
				<th align="center" width="20%">Maturity Date</th>
			</tr>
    	</table>

	<%if (insList.getNoResult() ) {%>
	   	<table class="tbenter" width=100%  height=75%>
	   		<tr><td> 
				<div align="center"> <b>There are no results for your search criteria</b></div>
			</td></tr>
	   	</table>
	<%}	else {
		insList.initRow();
		while (insList.getNextRow()) {
	     	if (firstTime) {
				firstTime = false;
				chk = "checked";
	  	 	} else {
				if (insList.getCurrentRow() == row )
					chk = "checked";
				else 
					chk = "";
	  		}
	    	datapro.eibs.beans.ERA010003Message msgList = (datapro.eibs.beans.ERA010003Message) insList.getRecord();
	 	%>              
			<div id="dataDiv1" class="scbarcolor" >
			<table id="datatable" width="100%">
				<tr>
					<td nowrap width="5%"><input type="radio" name="SEQ" value="<%= msgList.getE03ROCSEQ()%>" <%=chk%> onClick="setRow('<%=insList.getCurrentRow()%>')"></td>
					<td nowrap align="left" width="55%"><%=Util.formatCell(msgList.getE03ROCIPD())%></td>
					<td nowrap align="center" width="20%"><%=Util.formatCell(msgList.getE03ROCCIN())%></td>
					<td nowrap align="center" width="20%"><%=Util.formatDate(msgList.getE03ROCMD1(), msgList.getE03ROCMD2(), msgList.getE03ROCMD3())%></td>
				</tr>
		<%}%> 
			</table>
			</div>
	<%}%>
    	</td>
   	</tr>
</table>
<%}%>
</form>
</body>
</html>

