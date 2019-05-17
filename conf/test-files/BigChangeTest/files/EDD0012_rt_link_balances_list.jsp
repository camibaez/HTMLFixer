<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">

<%@ page import ="datapro.eibs.master.Util"%>

<TITLE>Account Link Balance</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript1.1" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "lnkList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "selRow" class= "java.lang.String"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<SCRIPT Language="Javascript">

	builtNewMenu(rt_m_opt);
	
	function showAccInfo(idxRow){
  	  var selRow = document.forms[0].ROW.value;
   	  
      dataTable.rows[selRow].className="trnormal";   
      dataTable.rows[idxRow].className="trhighlight";
   
      document.forms[0].E12LNKOP1.value = document.forms[0]["LNKOP1_"+idxRow].value;
      document.forms[0].E12LNKOP2.value = document.forms[0]["LNKOP2_"+idxRow].value;
      document.forms[0].E12LNKOP3.value = document.forms[0]["LNKOP3_"+idxRow].value;
      document.forms[0].E12LNKEX1.value = document.forms[0]["LNKEX1_"+idxRow].value;
      document.forms[0].E12LNKEX2.value = document.forms[0]["LNKEX2_"+idxRow].value;
      document.forms[0].E12LNKEX3.value = document.forms[0]["LNKEX3_"+idxRow].value;
      
      var optChk = document.forms[0].OPTION;
      var maxopt = optChk.length;    
      for(var i=0;i<maxopt;i++) {
    		if (optChk[i].value == document.forms[0]["LNKTYP_"+idxRow].value) {
     			optChk.selectedIndex = i;
     		}
   	  }
   	  
      document.forms[0].ROW.value = idxRow;  
    }
    
    function updateFields(idxRow){
  	     
      document.forms[0]["LNKOP1_"+idxRow].value = document.forms[0].E12LNKOP1.value;
      document.forms[0]["LNKOP2_"+idxRow].value = document.forms[0].E12LNKOP2.value;
      document.forms[0]["LNKOP3_"+idxRow].value = document.forms[0].E12LNKOP3.value;
      document.forms[0]["LNKEX1_"+idxRow].value = document.forms[0].E12LNKEX1.value;
      document.forms[0]["LNKEX2_"+idxRow].value = document.forms[0].E12LNKEX2.value;
      document.forms[0]["LNKEX3_"+idxRow].value = document.forms[0].E12LNKEX3.value;
      
      var optChk = document.forms[0].OPTION;
      var val = optChk[optChk.selectedIndex].value;
      var txtval = " ";
      document.forms[0]["LNKTYP_"+idxRow].value = val;
      if (val == "D") txtval = "Deleted";
      if (val == "L") txtval = "Linked";
      if (val == "C") txtval = "Combined";
      dataTable.rows[idxRow].cells[5].innerHTML = txtval;
      
      adjustEquTables(headTable, dataTable, dataDiv1,1,false);
    }   
	
</SCRIPT>

</HEAD>
<body> 
<% 
    if ( !error.getERRNUM().equals("0")  ) {
  		error.setERRNUM("0");
        out.println("<SCRIPT Language=\"Javascript\">");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<h3 align="center">Account Link Balances<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rtr_link_balances_list.jsp,EDD0012"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=selRow%>">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
            
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E04CUN" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
           
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>          
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
             
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <% if (lnkList.getNoResult()) { %>
  
   <TABLE class="tbenter" height="60%">
   	<TR>
      <TD ALIGN=CENTER VALIGN=MIDDLE>
  		 
        <H4 style="text-align: center">There is no match for the account <%= userPO.getIdentifier()%>. 
          <br>
        </h4>
      </TD>
    </TR>
   </TABLE>
   
  <% } else {%>
            
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
  <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Account</TH>
      <TH ALIGN=CENTER NOWRAP>Product</TH>
	  <TH ALIGN=CENTER NOWRAP>Product Type</TH>	  
	  <TH ALIGN=CENTER NOWRAP>Amount</TH>
	  <TH ALIGN=CENTER NOWRAP>Status</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">                 
    <table id="dataTable">
    <%
                int row = 0;
                try {
                  row = Integer.parseInt(selRow);
                } catch (Exception e) {}
                
                String chk="";
                // boolean firstTime=true;
                lnkList.initRow();
                while (lnkList.getNextRow()) {
    				datapro.eibs.beans.EDD001201Message msgList = (datapro.eibs.beans.EDD001201Message)lnkList.getRecord();
    				chk = (row == lnkList.getCurrentRow()) ? "checked" : "";
    				%>
    				
    				<TR>
    				    <TD NOWRAP ALIGN="CENTER">
    				        <input type="radio" name="ACCNUM" value="<%= lnkList.getCurrentRow() %>" <%=chk %> onclick="showAccInfo(<%= lnkList.getCurrentRow() %>)">
						</TD>
						<TD NOWRAP ALIGN="CENTER">
							<%=Util.formatCell(msgList.getE12LNKACC())%>
						</TD>
						<TD NOWRAP ALIGN="LEFT">
							<%=Util.formatCell(msgList.getE12LNKPRO())%>
						</TD>
						<TD NOWRAP ALIGN="LEFT">
							<%=Util.formatCell(msgList.getE12LNKNA1())%>
						</TD>
						<TD NOWRAP ALIGN="RIGHT">
							<%=Util.fcolorCCY(msgList.getE12LNKAMT())%>
							<input type="hidden" name="LNKOP1_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKOP1()%>">
							<input type="hidden" name="LNKOP2_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKOP2()%>">
							<input type="hidden" name="LNKOP3_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKOP3()%>">
							<input type="hidden" name="LNKEX1_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKEX1()%>">
							<input type="hidden" name="LNKEX2_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKEX2()%>">
							<input type="hidden" name="LNKEX3_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKEX3()%>">
							<input type="hidden" name="LNKTYP_<%= lnkList.getCurrentRow() %>" value="<%=msgList.getE12LNKTYP()%>">						
						
						</TD>
						<TD NOWRAP ALIGN="CENTER">
							<%  
								if (msgList.getE12LNKTYP().equals("L")) out.print("Linked");
								else if (msgList.getE12LNKTYP().equals("C")) out.print("Combined");
								else if (msgList.getE12LNKTYP().equals("D")) out.print("Deleted");
								else out.print("");
							%>
						</TD>
						
					</TR>
   <%
 	                chk ="";       
                }
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH"   width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Action / Dates</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo"  >
      <tr>
         <TD  ALIGN="RIGHT"  nowrap >
           Action : 
         </TD>
         <TD ALIGN="LEFT"  nowrap >
             <select name="OPTION">
                <option value="" ></option>
                <option value="L">Link</option>
                <option value="C">Combine</option>
                <option value="D">Delete</option>                  
		     </select>
         </TD>
      </tr>
      <tr> 
            <td nowrap> 
              <div align="right">Beginning Date :</div>
            </td>
            <td nowrap> 
                <input type="text" name="E12LNKOP1" size="3" maxlength="2" value="" onkeypress="enterInteger()">
                <input type="text" name="E12LNKOP2" size="3" maxlength="2" value="" onkeypress="enterInteger()">
                <input type="text" name="E12LNKOP3" size="3" maxlength="2" value="" onkeypress="enterInteger()">
            </td>
      </tr>
      <tr> 
            <td nowrap> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap> 
                <input type="text" name="E12LNKEX1" size="3" maxlength="2" value="" onkeypress="enterInteger()">
                <input type="text" name="E12LNKEX2" size="3" maxlength="2" value="" onkeypress="enterInteger()">
                <input type="text" name="E12LNKEX3" size="3" maxlength="2" value="" onkeypress="enterInteger()">
            </td>
      </tr>
      <tr>             
          <td nowrap colspan=2 align=center> 
               <input id="EIBSBTN" type=button value="update" onclick="updateFields(document.forms[0].ROW.value)">
           </td>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

  <p align="center">
      <input id="EIBSBTN" type=submit name="Submit" value="Submit">   
  </p>

<SCRIPT language="JavaScript">
	 document.forms[0].totalRow.value="<%= lnkList.getLastRec() %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("ACCNUM");
	 resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT> 
<% } %> 
 </FORM>
</BODY>
</HTML>
 