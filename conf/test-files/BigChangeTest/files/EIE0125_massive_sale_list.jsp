<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
function goProcess() {
	document.forms[0].submit();
}

function changeValue(fld) {
	if (fld.checked == true) {
		fld.value = "Y";
	} else {
		fld.value = "";
	}
}

</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Instrument List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="massive_sale_list.jsp, EIE0125"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0125">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
           </tr>
         <tr id="trdark">  
            <td nowrap >
              <div align="right"><b>Portfolio : </b></div>
            </td>
            <td nowrap ><b>
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getIdentifier().trim()%>">
              </b></td>
            <td nowrap width="20%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" name="E02BRK" size="5" maxlength="3" readonly value="<%= userPO.getCurrency().trim()%>" >
                <input type="text" name="E02BRKN" size="35" maxlength="30" readonly value="<%= userPO.getHeader1().trim()%>">
               </div>
            </td>
              
          </tr>
        </table>
      </td>
    </tr>
  </table>
        
<% 
	if ( dvList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> There are no result for your search criteria.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="javascript:goProcess()">Process</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Exit</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap ></TH> 
      <TH ALIGN=CENTER  nowrap >Action</TH>
      <TH ALIGN=CENTER  nowrap >Portfolio</TH>
      <TH ALIGN=CENTER  nowrap >Instrument</TH>
      <TH ALIGN=CENTER  nowrap >Custodian</TH>
      <TH ALIGN=CENTER  nowrap >CCY</TH>
      <TH ALIGN=CENTER  nowrap >Nominal<br>Value</TH>
      <TH ALIGN=CENTER  nowrap >Quantity</TH>
      <TH ALIGN=CENTER  nowrap >Collateral<br>Amount</TH>
      <TH ALIGN=CENTER  nowrap >Market<br>Price</TH>
    </TR>
    
    <%
                
          dvList.initRow();               
          while (dvList.getNextRow()) {
               EIE012501Message msgList = (EIE012501Message) dvList.getRecord();			 
                    
       %>             
                    
          <TR>
          <td align="center" nowrap > 
        	<input type="checkbox" name="TRANSROW_<%= dvList.getCurrentRow() %>" value="" onClick="changeValue(this);">
        	<input type="hidden" name="SWDMSTCUN_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTCUN()%>" >
        	<input type="hidden" name="SWDISIPTY_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDISIPTY()%>" >
        	<input type="hidden" name="SWDMSTCDE_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTCDE()%>" >
        	<input type="hidden" name="SWDMSTIIC_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTIIC()%>" >
        	<input type="hidden" name="SWDISIATY_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDISIATY()%>" > 
        	<input type="hidden" name="SWDMSTCUC_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTCUC()%>" >     	
        	<input type="hidden" name="SWDMSTBRK_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTBRK()%>" >
      	  </td>
      	  <td NOWRAP align="left">
              <select name="SWDACT_<%= dvList.getCurrentRow() %>">
                <option value="2" >Sale</option>
                <option value="4" >Transfer out</option>
              </select>
      	  </td>		  
          <td NOWRAP align="left"><input type="hidden" name="SWDMSTPRF_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTPRF()%>" ><%=Util.formatCell(msgList.getSWDMSTPRF())%></td>		  
		  <td NOWRAP align="left"><input type="hidden" name="SWDISIDSC_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDISIDSC()%>" ><%=Util.formatCell(msgList.getSWDISIDSC())%></td>	
		  <td NOWRAP align="left"><input type="hidden" name="SWDCUCNME_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDCUCNME()%>" ><%=Util.formatCell(msgList.getSWDCUCNME())%></td>
		  <td NOWRAP align="left"><input type="hidden" name="SWDMSTCCY_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTCCY()%>" ><%=Util.formatCell(msgList.getSWDMSTCCY())%></td>
		  <td NOWRAP align="left"><input type="hidden" name="SWDMSTVNO_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTVNO()%>" ><%=Util.formatCell(msgList.getSWDMSTVNO())%></td>
		  <td NOWRAP align="left"><input type="hidden" name="SWDMSTQTY_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTQTY()%>" ><%=Util.formatCell(msgList.getSWDMSTQTY())%></td>
		  <td NOWRAP align="left"><input type="hidden" name="SWDMSTCOA_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTCOA()%>" ><%=Util.formatCell(msgList.getSWDMSTCOA())%></td>
		  <td NOWRAP align="left"><input type="hidden" name="SWDMSTMKP_<%= dvList.getCurrentRow() %>"  value="<%= msgList.getSWDMSTMKP()%>" ><%=Util.formatCell(msgList.getSWDMSTMKP())%></td>
		</TR>
        <% } %> 
  </TABLE>
  <SCRIPT language="JavaScript">     
     //function resizeDoc() {
     //  divResize();
     //adjustEquTables(headTable, dataTable, dataDiv1,1,false);
     // }
     //resizeDoc();
     //window.onresize=resizeDoc;         
  </SCRIPT> 
<BR>

<%      
  }
%> 
</form>
</body>
</html>
