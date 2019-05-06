<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Credit Line by customer
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="javascript">
  function goAction(op) {

     document.forms[0].opt.value = op;
     var ln = "";
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CUS_LINE") 
      	{
		if (document.forms[0].elements[n].checked == true) {
			ln = document.forms[0].elements[n].value;
        		ok = true;
        		break;
		}
      	}
      }
	if ( ok ) {
          // document.forms[0].submit();
	   var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110?SCREEN=2&opt=" + op + "&CUS_LINE=" + ln;
	   CenterWindow(pg,600,500,2);

		
     }
     else {
			alert("Please select a customer to continue.");	   
     }

  }
</script>

<SCRIPT>

<%
boolean hasOptMenu = false;
if (userPO.getPurpose().equals("INQUIRY")){
	if (userPO.getOption().equals("CIF") || userPO.getOption().equals("CLIENT_C"))
	{
		out.write("builtNewMenu( ecif10_i_opt );");
		hasOptMenu = true;
	}
	 else if (userPO.getOption().equals("CIF")) {
			out.write("builtNewMenu( ecif10_i_opt )");
	}
	else if (userPO.getOption().equals("LN")){
		if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V"))
		{
			out.write("builtNewMenu(ln_i_1_opt);");
			hasOptMenu = true;
		}
		else
		{
			out.write("builtNewMenu(ln_i_2_opt);");
			hasOptMenu = true;
		}
	}
}
%>

</SCRIPT>
</HEAD>
<%
  	if (hasOptMenu){
   		out.println("<SCRIPT> initMenu();  </SCRIPT>");
   	}
%> 

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/activity_over.gif','<%=request.getContextPath()%>/images/e/collaterals_over.gif','<%=request.getContextPath()%>/images/e/inquiry_over.gif','<%=request.getContextPath()%>/images/e/related_credit_lines_over.gif')">

<h3 align="center">Line of Credit Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cl_list_by_customer.jsp,ELN0110"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=80%>
   		<TR>
      <TD> 
        
      <div align="center"><b> There is no match for your criteria 
        </b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        
      <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=20%> Customer :</TD>
          <TD ALIGN=LEFT WIDTH=10%><%= userPO.getCusNum() %> </TD>
          <TD ALIGN=LEFT WIDTH=70%><%= userPO.getCusName() %> </TD>
        </TR>
      </TABLE>
	  </TD>
    </TR>
  </TABLE>

  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/INQUIRY.gif" ></a>
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
  </TABLE>
        
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2"></TH>
      <TH ALIGN=CENTER rowspan="2">Number</TH>
      <TH ALIGN=CENTER rowspan="2">Type</TH>
      <TH ALIGN=CENTER rowspan="2">Maturity Date</TH>
      <TH ALIGN=CENTER rowspan="2">CCY</TH>
      <TH ALIGN=CENTER colspan="2">Amount</TH>
      <TH ALIGN=CENTER colspan="2">Collateralized Amount</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Approved</TH>
      <TH ALIGN=CENTER>Available</TH>
      <TH ALIGN=CENTER>Collateral</TH>
      <TH ALIGN=CENTER>Collaterals <br>in Custody</TH>
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
 %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( clList.getShowNext() ) {
      			int pos = clList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
