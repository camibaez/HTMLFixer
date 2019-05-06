<html>
<head>
<title>Batch List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "batcList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
 
 

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }

function goAction(op) {
	document.forms[0].opt.value = op;
	document.forms[0].submit();
}

 
</SCRIPT>

 
</head>

<BODY>
<h3 align="center">Batch Reversal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="batch_list_rever.jsp, EGL0040"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0040" >
  <p> 
    <input type=hidden name="SCREEN" 	value="300">
    <input type=hidden name="totalRow" 	value="0">
    <input type=hidden name="BANK" 		value="<%=userPO.getBank()%>">
     
    <input type=hidden name="opt">
  </p>
  <p> 
  <%if ( batcList.getNoResult() ) {%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	<%} else {
		if ( !error.getERRNUM().equals("0")  ) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
	     	out.println("       showErrors()");
     		out.println("</SCRIPT>");
     	}
	%> 
  <p>
  
  
 <table class=tableinfo>
  	<tr>
   	  <td>
  		<table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    		<tr id=trdark>
       	
        		<td align="right">Batch Number : </td>
      			 
       			<td width="25%"> 
        			<div align="left">
         			<input size="4" type="text" name="E01TRABTH" maxlength="4" value="<%=userPO.getHeader1()%>" readonly> 
      			</td>
    
	  			<td nowrap width=25% align="right" > Batch Date : </td>
	  			<td nowrap width=25% align="left"  > 
	     		   <input size="2" type="text" name="E01TRABDM" maxlength="2" value="<%=userPO.getHeader2()%>" readonly>
         		   <INPUT size="2" type="text" name="E01TRABDD" maxlength="2" value="<%=userPO.getHeader3()%>" readonly>
        		   <INPUT size="2" type="text" name="E01TRABDY" maxlength="2" value="<%=userPO.getHeader4()%>" readonly>
     
      		</tr>
            
  		</table>	 
	  </td>
	</tr>	 
</table>
  
  <table class="tbenter" width=100% align=center>
    <tr> 
      
		<td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Detail</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
   
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="20%">Reference<br>Number</th> 
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Total<BR>Debits</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Total<BR>Credits</div>
            </th>             
          </tr>
          <%
          batcList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (batcList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
                datapro.eibs.beans.EGL004001Message msgList = (datapro.eibs.beans.EGL004001Message) batcList.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= batcList.getCurrentRow() %>" <%=chk%>>
            </td>
             
            <td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01TRAACR() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01TRAAMD() %></td>
            <td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01TRAAMC() %></td>  
          </tr>
         <%          
         }  
         %>
        </table>
  </table>
     
<SCRIPT language="JavaScript">
	showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>
