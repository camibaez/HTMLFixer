<html>
<head>
<title>Insurance Policy Information </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaMant" class= "datapro.eibs.beans.ERA001001Message"  scope="session"/>
<jsp:useBean id="insMant" class= "datapro.eibs.beans.ERA001003Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">
	function ERA0010_GetTypeBroker(name,type,name2)
	{
   		page= prefix +language + "EWD0023_brkr_help_container.jsp";
   		fieldName=name;
   		fieldAux1=type;
   		fieldAux2 = name2;
   		CenterWindow(page,600,500,1);
	}
</script>

</head>

<body bgcolor="#FFFFFF">
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"JavaScript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if ( !userPO.getPurpose().equals("NEW") ) {
     //out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>
<h3 align="center">Insurance Policy Information
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ga_maint_ins_detail.jsp,ERA0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1200">
<INPUT TYPE=HIDDEN NAME="E03ROCSEQ" VALUE="<%= insMant.getE03ROCSEQ().trim()%>">

  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="8%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="16%" >
              <div align="left">
                <input type="text" name="E03ROCCUN" readonly size="9" maxlength="9" value="<%= insMant.getE03ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="13%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" width="41%" >
              <div align="left">
                <input type="text" name="E01CUSNA1" readonly size="45" maxlength="45" value="<%= gaMant.getE01CUSNA1().trim()%>" >
             </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
      <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="21%" >
              <div align="right">Bank /Branch /Currency :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E03ROCBNK" readonly size="2" maxlength="2" value="<%= insMant.getE03ROCBNK().trim()%>" >
              /
              <input type="text" name="E01ROCBRN" readonly size="4" maxlength="3" value="<%= gaMant.getE01ROCBRN().trim()%>" >
              /
              <input type="text" name="E01ROCCCY" readonly size="4" maxlength="3" value="<%= gaMant.getE01ROCCCY().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" height="23" >
              <div align="right">G/L Number :</div>
            </td>
            <td nowrap colspan="3" height="23" >
              <input type="text" name="E01ROCGLN" readonly size="16" maxlength="16" value="<%= gaMant.getE01ROCGLN().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="21%" height="23" >
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap colspan="3" height="23" >
              <input type="text" name="E03ROCREF" readonly size="12" maxlength="12" value="<%= insMant.getE03ROCREF().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="21%" height="40" >
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap colspan="3" height="40" >
              <input type="text" name="E01ROCTYP" readonly size="4" maxlength="4" value="<%= gaMant.getE01ROCTYP().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="21%" >
              <div align="right">Description :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01ROCDES" readonly size="35" maxlength="35" value="<%= gaMant.getE01ROCDES().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4>Insurance Policy</h4>
<table class="tableinfo">
  <tr >
  <td nowrap>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">
      <tr id="trdark">
        <td nowrap width="17%" >
            <div align="right"> Company :</div>
        </td>
        <td nowrap width="28%" >
          	<%if (userPO.getPurpose().equals("READONLY")) {%>
          		<input type="text" name="E03ROCICN" size="10" maxlength="9" value="<%= insMant.getE03ROCICN().trim()%>" readonly>
          	<%} else {%>
          		<input type="text" name="E03ROCICN" size="10" maxlength="9" value="<%= insMant.getE03ROCICN().trim()%>" >
		  		<a href="javascript:ERA0010_GetTypeBroker('E03ROCICN','5','E03ROCICM')">
		  		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
        	<%}%>
        </td>
        <td nowrap width="18%" >
            <div align="right">Amount:</div>
        </td>
        <td nowrap width="37%" >
            <input type="text" name="E03ROCIPA" size="17" maxlength="15" value="<%= insMant.getE03ROCIPA().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
        </td>
      </tr>
      <tr id="trclear">
        <td nowrap width="17%" >
            <div align="right">Name :</div>
        </td>
        <td nowrap width="28%" >
          <input type="text" name="E03ROCICM" size="35" maxlength="35" value="<%= insMant.getE03ROCICM().trim()%>" readonly>
        </td>
        <td nowrap width="18%" >
            <div align="right">Policy Number:</div>
        </td>
          <td nowrap width="37%" >
            <input type="text" name="E03ROCCIN" size="10" maxlength="9" value="<%= insMant.getE03ROCCIN().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
          </td>
      </tr>
      <tr id="trdark">
        <td nowrap width="17%" >
            <div align="right">Description :</div>
        </td>
        <td nowrap width="28%" >
          <input type="text" name="E03ROCIPD" size="35" maxlength="35" value="<%= insMant.getE03ROCIPD().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
        </td>
        <td nowrap width="18%" >
            <div align="right">Currency:</div>
        </td>
          <td nowrap width="37%" >
          	<%if (userPO.getPurpose().equals("READONLY")) {%>
            	<input type="text" name="E03ROCICY" size="4" maxlength="3" value="<%= insMant.getE03ROCICY().trim()%>" readonly>
          	<%} else {%>
            	<input type="text" name="E03ROCICY" size="4" maxlength="3" value="<%= insMant.getE03ROCICY().trim()%>" >
            	<a href="javascript:GetCurrency('E03ROCICY',document.forms[0].E03ROCBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
          	<%}%>
          </td>
      </tr>
      <tr id="trclear">
        <td nowrap width="17%" >
            <div align="right">Emision Date:</div>
        </td>
        <td nowrap width="28%" >
          	<%if (userPO.getPurpose().equals("READONLY")) {%>
          		<input type="text" name="E03ROCEM1" size="2" maxlength="2" value="<%= insMant.getE03ROCEM1().trim()%>" readonly>
          		<input type="text" name="E03ROCEM2" size="2" maxlength="2" value="<%= insMant.getE03ROCEM2().trim()%>" readonly>
          		<input type="text" name="E03ROCEM3" size="2" maxlength="2" value="<%= insMant.getE03ROCEM3().trim()%>" readonly>
          	<%} else {%>
          		<input type="text" name="E03ROCEM1" size="2" maxlength="2" value="<%= insMant.getE03ROCEM1().trim()%>" >
          		<input type="text" name="E03ROCEM2" size="2" maxlength="2" value="<%= insMant.getE03ROCEM2().trim()%>" >
          		<input type="text" name="E03ROCEM3" size="2" maxlength="2" value="<%= insMant.getE03ROCEM3().trim()%>" >
            	<a href="javascript:DatePicker(document.forms[0].E03ROCEM1,document.forms[0].E03ROCEM2,document.forms[0].E03ROCEM3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
          	<%}%>
          </td>
        <td nowrap width="18%" >
            <div align="right">Emited by:</div>
        </td>
          <td nowrap width="37%" >
            <input type="text" name="E03ROCEMB" size="10" maxlength="9" value="<%= insMant.getE03ROCEMB().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
          </td>
      </tr>
      <tr id="trdark">
        <td nowrap width="17%" >
            <div align="right">Maturity Date:</div>
        </td>
        <td nowrap width="28%" >
          	<%if (userPO.getPurpose().equals("READONLY")) {%>
          		<input type="text" name="E03ROCMD1" size="2" maxlength="2" value="<%= insMant.getE03ROCMD1().trim()%>" readonly>
          		<input type="text" name="E03ROCMD2" size="2" maxlength="2" value="<%= insMant.getE03ROCMD2().trim()%>" readonly>
          		<input type="text" name="E03ROCMD3" size="2" maxlength="2" value="<%= insMant.getE03ROCMD3().trim()%>" readonly>
          	<%} else {%>
          		<input type="text" name="E03ROCMD1" size="2" maxlength="2" value="<%= insMant.getE03ROCMD1().trim()%>" >
          		<input type="text" name="E03ROCMD2" size="2" maxlength="2" value="<%= insMant.getE03ROCMD2().trim()%>" >
          		<input type="text" name="E03ROCMD3" size="2" maxlength="2" value="<%= insMant.getE03ROCMD3().trim()%>" >
            	<a href="javascript:DatePicker(document.forms[0].E03ROCMD1,document.forms[0].E03ROCMD2,document.forms[0].E03ROCMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
          	<%}%>
          </td>
        <td nowrap width="18%" >
            <div align="right">Exception:</div>
        </td>
          <td nowrap width="37%" >
            <input type="hidden" name="E03ROCRGK" value="<%= insMant.getE03ROCRGK()%>">
		  	<%if (userPO.getPurpose().equals("READONLY")) {
		  		if (insMant.getE03ROCCLF().equals("Y"))
		  			out.print("Yes");
		  		else
		  			out.print("No");
		  		%>
		  	<%} else {%>
			  	<input type="radio" name="CE03ROCRGK" value="Y" onClick="document.forms[0].E03ROCRGK.value='Y'"
			  	<%if(insMant.getE03ROCRGK().equals("Y")) out.print("checked");%>>
            	Yes
	            <input type="radio" name="CE03ROCRGK" value="N" onClick="document.forms[0].E03ROCRGK.value='N'"
			  	<%if(insMant.getE03ROCRGK().equals("N")) out.print("checked");%>>
            	No
		  	<%}%>
      	 </td>
      </tr>
      <tr id="trclear">
        <td nowrap width="17%" >
            <div align="right">Advice of Maturity:</div>
        </td>
          <td nowrap width="28%" >
            <input type="hidden" name="E03ROCCLF" value="<%= insMant.getE03ROCCLF()%>">
		  	<%if (userPO.getPurpose().equals("READONLY")) {
		  		if (insMant.getE03ROCCLF().equals("Y"))
		  			out.print("Yes");
		  		else
		  			out.print("No");
		  		%>
		  	<%} else {%>
	            <input type="radio" name="CE03ROCCLF" value="Y" onClick="document.forms[0].E03ROCCLF.value='Y'"
			  	<%if(insMant.getE03ROCCLF().equals("Y")) out.print("checked");%>>
            	Yes
	            <input type="radio" name="CE03ROCCLF" value="N" onClick="document.forms[0].E03ROCCLF.value='N'"
			  	<%if(insMant.getE03ROCCLF().equals("N")) out.print("checked");%>>
            	No
		  	<%}%>
          </td>
        <td nowrap width="18%" >
            <div align="right">User Code :</div>
        </td>
        <td nowrap width="37%" >
          	<%if (userPO.getPurpose().equals("READONLY")) {%>
	            <input type="text" name="E03ROCUSC" size="5" maxlength="5" value="<%= insMant.getE03ROCUSC().trim()%>" readonly>
	            <input type="hidden" name="E02ROCUSC" size="10" maxlength="9" value="" >
          	<%} else {%>
	            <input type="text" name="E03ROCUSC" size="5" maxlength="5" value="<%= insMant.getE03ROCUSC().trim()%>" >
	            <input type="hidden" name="E02ROCUSC" size="10" maxlength="9" value="" >
	            <a href="javascript:GetCodeDescCNOFC('E03ROCUSC','E02ROCUSC','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          	<%}%>
              </td>
          </tr>
        </table>
      </td>
   </tr>
</table>

<%if (!userPO.getPurpose().equals("READONLY")) {%>
	<p align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
	</p>
<%}%>
</form>
</body>
</html>
