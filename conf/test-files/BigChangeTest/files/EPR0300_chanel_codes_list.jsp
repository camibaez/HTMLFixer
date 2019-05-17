<%@ page import = "datapro.eibs.master.Util" %> 
<html>
<head>
<title>C�digos de Transacci�n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">



function goAction(opt) {
    if (opt == "N") {
		document.forms[0].SCREEN.value = '11';
  		document.forms[0].submit();			
	} else if (opt == "M") { 
		document.forms[0].SCREEN.value = '12';
  		document.forms[0].submit();
	} else if (opt == "D") {
      		ok = confirm("Are you sure you want to delete this record?");
		document.forms[0].SCREEN.value = '14';
	  	if (ok) document.forms[0].submit();
  	}
}

function getParameters(code) {

	document.forms[0].E01PRATCD.value = code;
  
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Channels Table<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="transaction_codes_list.jsp, EPR0300"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEPR0300" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="100">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="E01PRATCD" value="">
  </p>
  
  <p> 
    <%
	if ( msgList.getNoResult() ) {
 %>
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
          <p><b>There is not match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center" style="cursor:pointer" onClick="goAction('N')"><a><b>New</b></a></div>
              </td>
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
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr>
      <td class=TDBKG width="30%"> 
        <div align="center" style="cursor:pointer" onClick="goAction('N')"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('M')"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Delete</b></a></div>
      </td>      
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.htm"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
    			     <TD NOWRAP width="100%" >
  				<TABLE id="headTable" >
  				   <TR id="trdark">  
            		<th align=CENTER nowrap width="5%">&nbsp;</th>
            		<th align=CENTER nowrap width="20%">Code</th>
            		<th align=CENTER nowrap width="75%">Description</th>
          			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
          <%
                msgList.initRow();
                while (msgList.getNextRow()) {
                 
                  datapro.eibs.beans.EPR030201Message msgPart = (datapro.eibs.beans.EPR030201Message) msgList.getRecord();
		 %>
		 	<tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRENTROW" value="<%= msgList.getCurrentRow() %>"
			  onClick="getParameters('<%= msgPart.getE01PRCCNL() %>')">
            </td>
            <td NOWRAP  align=CENTER width="20%"><%= msgPart.getE01PRCCNL() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgPart.getE01PRCDSC() %></td>
          </tr>
          <%
                }
              %>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

	  
    				 
  <SCRIPT language="JavaScript">
     radioClick("CURRENTROW",0);
     showChecked("CURRENTROW");
  </SCRIPT>
  <SCRIPT language="JavaScript">
			
			function resizeDoc() {
      		 	divResize();
     		    adjustEquTables(
     		    	getElement("headTable"),
     		    	getElement("dataTable"),
     		    	getElement("dataDiv1"),1,false);
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
  
     


<%}%>


  </form>

</body>
</html>
