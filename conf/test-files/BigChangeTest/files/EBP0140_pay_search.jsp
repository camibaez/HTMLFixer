<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Pay Bills Selection</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP014001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


function checkInfo(){
  	
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Selection of
    <%	if (msgList.getE01REQTYP().equals("C")) { 
		 	out.println(" Customer "); 
		} else { out.println(" Vendor ");
		}  	
	%>Bills to Pay<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pay_search, EBP0140"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="<%=msgList.getE01REQTYP()%>"> 
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
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
            <td width="30%" align="right"> Payment Via : </td>
            <td width="50%" align="left">
             	<select name="E01REQPVI">
             		<option <%= msgList.getE01REQPVI().trim().equals("T")?"selected":"" %> value="T">ALL</option>
			    	<option <%= msgList.getE01REQPVI().trim().equals("A")?"selected":"" %> value="A">ACH</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("R")?"selected":"" %> value="R">Retail Account</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("G")?"selected":"" %> value="G">GL Account</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("C")?"selected":"" %> value="C">Official Check</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("S")?"selected":"" %> value="S">Swift</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("P")?"selected":"" %> value="P">Petty Cash</option>
			    </select>
            </td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
			<td width="30%" align="right">Payment Due Date From : </td>
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
				<td width="30%" align="right">Payment Due Date To : </td>
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
  <table id="tbenter" align="center" style="width:85%">
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
	getElement("E01REQBNK").value = '<%=currUser.getE01UBK()%>';
	getElement("E01REQBRN").value = '<%=currUser.getE01UBR()%>';
	getElement("E01REQPVI").value = 'T';
</SCRIPT>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT language="Javascript">
    showErrors();
    </SCRIPT> 
 <% }%>
</BODY>
</HTML>
 