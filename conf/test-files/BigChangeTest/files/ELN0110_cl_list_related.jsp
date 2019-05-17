<HTML>
<HEAD>
<TITLE>
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
  function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CUS_LINE") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert("Please select a customer to continue.");	   
     }

  }
</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/activity_over.gif','<%=request.getContextPath()%>/images/e/collaterals_over.gif','<%=request.getContextPath()%>/images/e/inquiry_over.gif','<%=request.getContextPath()%>/images/e/related_credit_lines_over.gif')">

<h3 align="center">Line of Credit Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_list_by_type.jsp,ELN0110"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        
      <div align="center"><b> There is no match for your criteria</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap>
        
      <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=20%> Line :</TD>
          <TD ALIGN=LEFT WIDTH=10%><%= userPO.getCreditLineNum() %></TD>
          <TD ALIGN=LEFT WIDTH=10%><%= userPO.getCreditLineType() %> </TD>
          <TD ALIGN=LEFT WIDTH=70%><%= userPO.getHeader1() %> </TD>
        </TR>
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=20%> Customer :</TD ALIGN=LEFT WIDTH=50%>
          <TD ALIGN=LEFT WIDTH=10%><%= userPO.getCusNum() %></TD>
          <TD ALIGN=LEFT colspan="2"> <%= userPO.getCusName() %> </TD>
        </TR>
      </TABLE>
	  </TD>
    </TR>
  </TABLE>

  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/inquiry_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/INQUIRY.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/activity_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/activity.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/collaterals_over.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/collaterals.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(4)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<%=request.getContextPath()%>/images/e/related_credit_lines_over.gif',1)"><img name="Image4" border="0" src="<%=request.getContextPath()%>/images/e/related_credit_lines.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  <TABLE>
        
  
<TABLE class="tableinfo">
  <TR id="trdark"> 
    <TH ALIGN=CENTER rowspan="2"></TH>
    <TH ALIGN=CENTER rowspan="2">Maturity Date</TH>
    <TH ALIGN=CENTER rowspan="2">Line Number</TH>
    <TH ALIGN=CENTER rowspan="2">Line Type</TH>
    <TH ALIGN=CENTER rowspan="2">Customer Number</TH>
    <TH ALIGN=CENTER rowspan="2">MDA</TH>
    <TH ALIGN=CENTER colspan="3">Amount</TH>
  </TR>
  <TR id="trdark"> 
    <TH ALIGN=CENTER>Approved</TH>
    <TH ALIGN=CENTER>Available</TH>
    <TH ALIGN=CENTER>Collateral</TH>
  </TR>
  <%
                clList.initRow();
                while (clList.getNextRow()) {
                    if (clList.getFlag().equals("")) {
                    		out.println(clList.getRecord());
                    }
                }
    %> 
</TABLE>

<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( clList.getShowPrev() ) {
      			int pos = clList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=3&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%        
        if ( clList.getShowNext() ) {
      			int pos = clList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=3&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
 %>       
</TD>
</TR>
</TABLE>
<%
  }
%>

</FORM>

</BODY>
</HTML>
