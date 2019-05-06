<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Linea de Credito</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="JavaScript">

function enter(cod) {
	document.forms[0].PRODCOD.value = cod;
	document.forms[0].submit();
}

</SCRIPT>
</HEAD>
<body> 
<!--
<h3 align="center">Overdraft Protection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="tr_prod_list.jsp,EDD0430"></h3>
<hr>
-->
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" target="_parent">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">
  <INPUT TYPE=HIDDEN NAME="PRODCOD" VALUE="">
  <input TYPE=HIDDEN NAME="PRODITEM" value="">
  
  <% if (prodList.getNoResult()) { %>
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
  
 <H4 style="text-align: center">
  Select a Product to associate it to the account <%= userPO.getIdentifier()%>.
 </h4>
          
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
  <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable1" >
  	<TR id="trdark"> 
       <TH ALIGN=CENTER NOWRAP>Code</TH>
	  <TH ALIGN=CENTER  NOWRAP>Description</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">                 
    <table id="dataTable1">
    <%
                int j=0;
                String itemChk="";
                boolean firstTime=true;
                prodList.initRow();
                while (prodList.getNextRow()) {
                    itemChk=(firstTime) ? "checked":"";
                    firstTime=false;
    %>
                <TR> 
       				<TD  ALIGN=LEFT NOWRAP><div nowrap><a href="javascript:enter('<%= prodList.getRecord(0) %>')"><%= prodList.getRecord(0) %></a></DIV></TD>
      				<TD  ALIGN=LEFT NOWRAP><div nowrap><a href="javascript:enter('<%= prodList.getRecord(0) %>')"><%= prodList.getRecord(1) %></a></DIV></TD>      
      			</TR>  
    <%                 
                     j++;       
                }
    %> 
   </table>
   </div>
   </TD>
   
  </TR>	
</TABLE>

 
<SCRIPT language="JavaScript">
     function resizeDoc() {
       adjustEquTables(headTable1, dataTable1, dataDiv1,1,false);
      }
	 //showChecked("PRODITEM");
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT> 
<% } %> 
 </FORM>
</BODY>
</HTML>
 