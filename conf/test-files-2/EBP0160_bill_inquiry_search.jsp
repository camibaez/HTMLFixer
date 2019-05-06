<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Inquiry Bills</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP016001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function vendors(){
  getElement("E01REQTYP").value = 'V';
  getElement("E01REQTYPC").checked  = false;
  getElement("E01REQTYPP").checked  = false;
}

function customers(){
  getElement("E01REQTYP").value = 'C';
  getElement("E01REQTYPV").checked  = false;
  getElement("E01REQTYPP").checked  = false;
}

function purcharse(){
  getElement("E01REQTYP").value = 'P';
  getElement("E01REQTYPV").checked  = false;
  getElement("E01REQTYPC").checked  = false;
}


function checkInfo(){
  	
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center"> Bills Inquiry Selection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="bill_inquiry_search, EBP0160"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="V">
    <INPUT TYPE=HIDDEN NAME="E01REQDTE" VALUE="D">
    <INPUT TYPE=HIDDEN name="VENNAME" VALUE=" " size="30" maxlength="30" >  
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
			<td valign="middle" align="left" colspan="3" height=33>
				<INPUT type="radio" name="E01REQTYPV" value="V" onclick="JavaScript:vendors()"
					<% if (msgList.getE01REQTYP().equals("V")) out.print(" checked"); %>> <B>
					<FONT color="navy"></FONT><FONT color="navy">Vendors Bills</FONT></B> <BR>
				<INPUT type="radio" name="E01REQTYPC" value="C" onclick="JavaScript:customers()"
					<% if (msgList.getE01REQTYP().equals("C")) out.print(" checked"); %>> <B>
				    <FONT color="green"></FONT><FONT color="green">Customers Bills</FONT></B> <BR>
				<INPUT type="radio" name="E01REQTYPP" value="P" onclick="JavaScript:purcharse()"
					<% if (msgList.getE01REQTYP().equals("P")) out.print(" checked"); %>> <B>
				    <FONT color="olive"></FONT><FONT color="olive">Purchase Order Bills</FONT></B> <BR>
			</td>
		  </tr>
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%" align="right"> Bank : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBNK" size="3" maxlength="2" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Branch : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBRN" size="4" maxlength="3" onkeypress="enterInteger()">
                 <A href="javascript:GetBranch('E01REQBRN', document.forms[0].E01REQBNK.value)">
                 <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0">
                 </A> (999 = All Branches)
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Code : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQCOD" size="10" maxlength="9" onkeypress="enterInteger()">
            	 <a href="javascript:GetVendorBP('E01REQCOD','VENNAME')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Vendor Help" align="middle" border="0"></a>
                 <a href="javascript:GetCustomerDescId('E01REQCOD','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Customer Help" align="middle" border="0"></a>
                 (0 = All Codes)
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Bill Status : </td>
            <td width="50%" align="left">
             	<select name="E01REQSTS">
             		<option <%= msgList.getE01REQSTS().trim().equals("T")?"selected":"" %> value="T">ALL</option>
			    	<option <%= msgList.getE01REQSTS().trim().equals("W")?"selected":"" %> value="W">Pending for Approval</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("A")?"selected":"" %> value="A">Active (Approved)</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("P")?"selected":"" %> value="P">Paid-Off</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("S")?"selected":"" %> value="S">Suspended</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("R")?"selected":"" %> value="R">Rejected</option>
			    </select>
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Date : </td>
            <td width="50%" align="left">
            	<input type="checkbox" name="E01REQDTED" value="D" <% if (msgList.getE01REQDTE().equals("D")) out.print("checked"); %>>											
                Payment Due Date
            	<input type="checkbox" name="E01REQDTEP" value="P" <% if (msgList.getE01REQDTE().equals("P")) out.print("checked"); %>>
                Last Payment Date 
                
            </td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
			<td width="30%" align="right">Date From : </td>
			<td width="50%" align="left">
            	<INPUT type="text" size="2" maxlength="2" name="E01REQDF1" onkeypress="enterInteger()">
            	<INPUT type="text" size="2" maxlength="2" name="E01REQDF2" onkeypress="enterInteger()">
            	<INPUT type="text" size="2" maxlength="2" name="E01REQDF3" onkeypress="enterInteger()">
            		<A href="javascript:DatePicker(document.forms[0].E01REQDF1,document.forms[0].E01REQDF2,document.forms[0].E01REQDF3)">
					<IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></A>
			<B><%=currUser.getE01DTF()%></B></td>  
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
				<td width="30%" align="right">Date To : </td>
				<td width="50%" align="left"> 
              <input type="text" size="2" maxlength="2" name="E01REQDT1" onKeypress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01REQDT2" onKeyPress="enterInteger()">
              <input type="text" size="2" maxlength="2" name="E01REQDT3" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01REQDT1,document.forms[0].E01REQDT2,document.forms[0].E01REQDT3)">
              <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            <B><%=currUser.getE01DTF()%></B></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table id="tbenter" align="center" style="width:85%; background-color: white;">
   		<tr>
  			<td width="85%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" value="Submit" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<SCRIPT language="JavaScript">

	<% if (currUser.getE01DTF().equals("MDY")) { %>
			getElement("E01REQDF1").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDF2").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDF3").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDT1").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDT2").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDT3").value = '<%=currUser.getE01RDY()%>';
    <% } else if (currUser.getE01DTF().equals("DMY")) { %>    
    		getElement("E01REQDF1").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDF2").value = '<%=currUser.getE01RDM()%>';
			getElement("E01REQDF3").value = '<%=currUser.getE01RDY()%>';
			getElement("E01REQDT1").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDT2").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDT3").value = '<%=currUser.getE01RDY()%>';  	
    	   			
    <% } else { %>
    		getElement("E01REQDF1").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDF2").value = '<%=currUser.getE01RDM()%>';
    	   	getElement("E01REQDF3").value = '<%=currUser.getE01RDD()%>'; 
    	   	getElement("E01REQDT1").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDT2").value = '<%=currUser.getE01RDM()%>';
    	   	getElement("E01REQDT3").value = '<%=currUser.getE01RDD()%>'; 
    <% } %>			
	
	getElement("E01REQSTS").value = 'P';
	getElement("E01REQTYPV").checked = true;
	getElement("E01REQDTED").checked = true;
	getElement("E01REQDTEP").checked = false;    			
	getElement("E01REQBNK").value = '<%=currUser.getE01UBK()%>';
	getElement("E01REQBRN").value = '<%=currUser.getE01UBR()%>';
	
</SCRIPT>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT language="Javascript">
            showErrors();
     </SCRIPT> <%
 }
 %>
</FORM>
</BODY>
</HTML>
 