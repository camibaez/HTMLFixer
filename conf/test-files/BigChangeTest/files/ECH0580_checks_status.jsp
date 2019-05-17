<HTML>
<HEAD>
<TITLE>
Checks List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "checks" class= "datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<%  String Action = (String) session.getAttribute("ChkAction");
    String CHKBOOKN = (String) session.getAttribute("CHECKBOOKN");
 %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script>
  function ValidateF(){
	 if(document.forms[0].ACTION.value == "02"){
 		if( document.forms[0].E01CHMICK.value == "" || document.forms[0].E01CHMFCK.value == ""){
    	    alert("Please enter range of checks to modified");
        	return false; 		
 		} 
	    var chki = parseInt(document.forms[0].E01CHMICK.value);
 		var chkf = parseInt(document.forms[0].E01CHMFCK.value);	
	    if(!confirm("Are you sure to change the status of this checks")){
	       return false;
	    } 
 	    if(chki< parseInt(document.forms[0].FCHK.value) || chkf> parseInt(document.forms[0].TCHK.value)){
    	    alert("Range of checks out of checkbook");
        	return false;
     	}          
     	if(chki>chkf){
       		alert("Initial check must be lest than last check");
        	return false;
     	}
     }else{
	    if(!confirm("Are you sure to annul this checkbook")){
	       return false;
	    }         
     }	
     return true;
  }
</script>
</head>

<body>

<h3 align="center">Annul Checkbook or Check<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="checks_status.jsp,ECH0580"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0580" onSubmit="return ValidateF()" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
<INPUT TYPE=HIDDEN NAME="ACTION" VALUE="<%= Action %>">

<%
	if ( checks.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>Not found in this criteria</b></font>
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
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03ACMCUN" size="9" maxlength="9" value="<%= rtBasic.getE03ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Customer Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E03CUSNA1" size="45" readonly maxlength="45" value="<%= rtBasic.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03ACMACC" size="9" readonly maxlength="12" value="<%= rtBasic.getE03ACMACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E03ACMCCY" size="4" readonly maxlength="4" value="<%= rtBasic.getE03ACMCCY().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product Code : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= rtBasic.getE03ACMPRO().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td  nowrap width="16%"><div align="right"><b>Checkbook Number:</b></div></td>
            <td colspan=5> <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= CHKBOOKN %>">  </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
<h4></h4> 
  
  <TABLE class="tableinfo" >
    <TR id ="trdark"> 
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
      <TH ALIGN=CENTER >Check</TH>
      <TH ALIGN=CENTER >Status</TH>
    </TR>
    <%
                checks.initRow();
                while (checks.getNextRow()) {
                    // if (checks.getFlag().equals("")) {
                    		out.println(checks.getRecord());
                    // }
                }
    %> 
  </TABLE>

<%
  }
%>
<br>
<% if(Action.trim().equals("02")){ %>
  <table width="40%" align="center" class="tableinfo">
    <tr>  <td colspan="2" align="center" id="trdark" >Range</td>  </tr>
    <tr>
       <td class="trdark" align="right" width="50%">Initial Check :</td>
       <td class="trlight"><input name="E01CHMICK" type="text" maxlength="5" ></td>
    </tr>
    <tr>
       <td class="trdark" align="right"> Last Check :</td>
       <td class="trlight"><input name="E01CHMFCK" type="text" maxlength="5" ></td>
    </tr>
    <tr>
       <td class="trdark" align="right"> New Status:</td>
       <td class="trlight"><SELECT name="E01CHMSTS">
       							<OPTION value="D">Available</OPTION>
       							<OPTION value="A">Annul</OPTION>
       							<OPTION value="F">Certificated</OPTION>
       							<OPTION value="P">Paid</OPTION>
       							<OPTION value="S">Suspend</OPTION>
       							<OPTION value="C">Conform</OPTION>
       							<OPTION value="X">Protest</OPTION>
       							<OPTION value="T">Suspend by teller</OPTION>
       							<OPTION value="I">Not Found</OPTION>
       						</select>	
       </td>
    </tr>    
   <tr><td align="center" colspan="2"><input id="EIBSBTN" type="submit" value="Annul"></td></tr>
  </table>

<% } else { %>
  <table width="40%" align="center" class="tableinfo">
    <tr> <td colspan="2" align="center" id="trdark" >Are you sure to annul this check?</td> </tr>    
    <tr> <td colspan="2" align="center"><input id="EIBSBTN" type="submit" value="Annul"> </td> </tr>
  </table>
<% } %>  

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>  
</FORM>

</BODY>
</HTML>
