<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Parametros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="doi" class="datapro.eibs.beans.EDI020001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function init() {
      if ("<%= doi.getE01DOIFL0().trim() %>" == 'Y') {
			Options('S') ;
      }
}

function Options(Type) {
	if (Type == 'S') {	
	document.forms[0].E01DOIFL0.value='Y'	
	divAddOpt.style.display = "";
	divAddOpt2.style.display = "";
	};
	else {
	document.forms[0].E01DOIFL0.value='N'		
	divAddOpt.style.display = "none";
	divAddOpt2.style.display = "none";
	};
}		

function DefaultENC(){
var Def = trim(document.forms[0].E01DOIFL1.value);
    
    if (divAddOpt.style.display !="")  {
    	   return true;
    }
	if (Def != ""){
	    return true;
	}else{
		alert("Select Encryption Deafaults");
		document.forms[0].E01DOIFL1.focus();
		return false;
	}
}
 
</script>

</head>

<body nowrap onload=javascript:init()>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Customer Control Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="docInv_paramenters.jsp, EDI0200"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDI0200" onsubmit="return(DefaultENC());">
  <input type=HIDDEN name="SCREEN" value="400">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" >
              <div align="right">Bank :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" name="E01DOIBNK" size="3" maxlength="2" readonly value="<%= doi.getE01DOIBNK()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Document Inventory</h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
           <tr id="trdark"> 
            <td nowrap width="46%" > 
              <div align="right">Approval customer Warning </div>
            </td>
            <td nowrap width="54%" > 
              <div align="left"> 
                <input type="radio" name="E01DOICUS" value="Y"  <%if (doi.getE01DOICUS().equals("Y")) out.print("checked"); %> checked>
                Yes 
                <input type="radio" name="E01DOICUS" value="N"  <%if (doi.getE01DOICUS().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="46%" > 
              <div align="right">Only deposits allowed </div>
            </td>
            <td nowrap width="54%" > 
              <div align="left"> 
                <input type="radio" name="E01DOIDEP" value="Y"  <%if (doi.getE01DOIDEP().equals("Y")) out.print("checked"); %> checked>
                Yes 
                <input type="radio" name="E01DOIDEP" value="N"  <%if (doi.getE01DOIDEP().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <H4>Customer Encryption</H4>
<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="46%">
						<DIV align="right">Enable Customer Encryption :</DIV>
						</TD>
						<TD nowrap width="54%">
						<DIV align="left">
							<INPUT type="radio" name="E01DOIFL0" value="Y" onClick="javascript:Options('S')" <%if (doi.getE01DOIFL0().equals("Y")) out.print("checked"); %>> Yes
						 	<INPUT type="radio" name="E01DOIFL0" value="N" onClick="javascript:Options('H')" <%if (doi.getE01DOIFL0().equals("N")||doi.getE01DOIFL0().equals("")) out.print("checked"); %>>No
						</DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="46%">
						<DIV id="divAddOpt" style="display:none" align="right">Encryption Defaults :</DIV>
						</TD>
						<TD nowrap width="54%">
						<DIV id="divAddOpt2" style="display:none" align="left">
							<SELECT name="E01DOIFL1">
							<OPTION value=" "
								<% if (!(doi.getE01DOIFL1().equals("1") ||doi.getE01DOIFL1().equals("2")||doi.getE01DOIFL1().equals("3")||doi.getE01DOIFL1().equals("4"))) out.print("selected"); %>></OPTION>
							<OPTION value="1"
								<% if (doi.getE01DOIFL1().equals("1")) out.print("selected"); %>>On Demand</OPTION>
							<OPTION value="2"
								<% if (doi.getE01DOIFL1().equals("2")) out.print("selected"); %>>Personal Customer</OPTION>
							<OPTION value="3"
								<% if (doi.getE01DOIFL1().equals("3")) out.print("selected"); %>>Corporative Customer</OPTION>
							<OPTION value="4"
								<% if (doi.getE01DOIFL1().equals("4")) out.print("selected"); %>>Personal And Corporative</OPTION>							
						</SELECT></DIV>
						</TD>
					</TR>

				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
	      <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
