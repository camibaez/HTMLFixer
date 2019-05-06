<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate User</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="msgData" class="datapro.eibs.beans.ESS570001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
<script language="Javascript1.1">
  function GetIMFHelp(code){   
  	fieldName=code;
	page= prefix +language + "ESS5700_Message_Help.jsp";
	CenterWindow(page,450,300,2);    
  }
</script>
</head>
<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %>  
<h3 align="center">Confirmation and Alert Message<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="Message_Detail, ESS5700" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS5700" onsubmit="return FieldNotBlank(this)">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <h4>General Information</h4>
  <table class="tableinfo">
     <tr id="trdark"> 
        <td nowrap><div align="right">Message Number :</div></td>
          <td nowrap>
               <div align="left"> 
                  <input type="text" ID="MANDATORY" name="E01IMFCDE" size="6" maxlength="4" value="<%= msgData.getE01IMFCDE() %>" <%= !msgData.getE01IMFCDE().trim().equals("0")?"readonly":""  %> >
                  <% if(msgData.getE01IMFCDE().trim().equals("0")){  %>
                     <a href="javascript:GetIMFHelp('E01IMFCDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>                   
                  <% } %>   
                     <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
               </div>
          </td>        
     </tr>
     <tr id="trclear"> 
        <td nowrap><div align="right">Type :</div></td>
          <td nowrap>
               <div align="left"> 
                  <input type="text" ID="MANDATORY" name="E01IMFLIF" size="3" maxlength="1" value="<%= msgData.getE01IMFLIF() %>" <%= !msgData.getE01IMFCDE().trim().equals("0")?"readonly":""  %> >
                   <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
               </div>
          </td>        
     </tr>
     
     <tr id="trdark">
        <td nowrap><div align="right">Message Text :</div></td>
        <td nowrap>
           <div align="left"> 
              <input type="text" ID="MANDATORY" name="E01IMFLN1" size="75" maxlength="60" value="<%= msgData.getE01IMFLN1() %>"><br>                                    
              <input type="text" name="E01IMFLN2" size="75" maxlength="60" value="<%= msgData.getE01IMFLN2() %>"><br>                                    
              <input type="text" name="E01IMFLN3" size="75" maxlength="60" value="<%= msgData.getE01IMFLN3() %>"><br>                                                                
           </div>
        </td>
  	 </tr>
  </table>
  <br>
<h4>To Configurate a Message :</h4>
  <table class="tableinfo" >
     <tr id="trdark"> 
        <td nowrap>
           This screen allows customize IBS messages.                                                                  
        </td>     
     </tr>
  </table> 
  <br>  
  <table class="tableinfo">
     <tr id="trdark"> 
        <TH>Code</TH>
        <TH>Description</TH>
        <TH>Data</TH>
        <TH>Edited Data Length</TH>
     </tr>
     <tr>
       <td>A1</td>
       <td>Primary Account</td>
       <td>12</td>
       <td>12</td>
     </tr>
	<TR>
		<TD>A2</TD>
		<TD>Secundary Account</TD>
		<TD>12</TD>
		<TD>12</TD>
	</TR>
	<TR>
		<TD>A3</TD>
		<TD>Reference Number</TD>
		<TD>19</TD>
		<TD>19</TD>
	</TR>
	<TR>
		<TD>M1</TD>
		<TD>Transacction Ammount</TD>
		<TD>15,2</TD>
		<TD>19</TD>
	</TR>
	<TR>
		<TD>M2</TD>
		<TD>Interest Ammount or Payment Ammount </TD>
		<TD>15,2</TD>
		<TD>19</TD>
	</TR>
	<TR>
		<TD>M3</TD>
		<TD>Other Ammount</TD>
		<TD>15,2</TD>
		<TD>19</TD>
	</TR>
	<TR>
		<TD>D1</TD>
		<TD>Transaction Date or Open Date </TD>
		<TD>6,0</TD>
		<TD>8</TD>
	</TR>
	<TR>
		<TD>D2</TD>
		<TD>Maturity Date or Payment Date </TD>
		<TD>6,0</TD>
		<TD>8</TD>
	</TR>
	<TR>
		<TD>R1</TD>
		<TD>Interest Rate</TD>
		<TD>9,6</TD>
		<TD>10</TD>
	</TR>
	<TR>
		<TD>T1</TD>
		<TD>Remarks</TD>
		<TD>30</TD>
		<TD>30</TD>
	</TR></table>  
  <table class="tableinfo" >
     <tr id="trdark"> 
        <td>
           Each message is composed of 3 lines of 60 characters to enter your text and variable data. The variable data (A1,A2,...) should be preceded by character (@) and let                                                               
        
		 the right space enough edited to include the data. Begin where the variable data from the character (@)</td>      
     </tr>
  </table>     
  <p align="center"> 
  <input id="EIBSBTN" type=submit name="Submit" value="Save"> </p>
</form>
</body>
</html>
