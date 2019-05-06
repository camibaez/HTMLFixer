<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Detalles Operacion</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function ok() {
  	top.opener.reason1 = document.forms[0].txtReason1.value;
  	top.opener.reason2 = document.forms[0].txtReason2.value;
  	top.opener.reason3 = document.forms[0].txtReason3.value;
  	top.opener.reason4 = document.forms[0].txtReason4.value;
  	top.opener.reason5 = document.forms[0].txtReason5.value;
  	top.opener.msg = document.forms[0].txtmsg.value;
  	top.opener.goAction(top.opener.option);
	top.close();
 }
//-->
</script>
</HEAD>
<BODY>
    <%
        String type;
		  try{type = request.getParameter("type");}catch(Exception e){type = "";}
    %>

<FORM  action="javascript:ok()">
<table align=center width="100%" id="tbhelp">
  <TR>
    <TH colspan="2">
      <div align="center">Detalles Operaci&oacute;n
        <hr>
      </div>
    </TH>
  </TR>
  <TR>
    <TD align="center" colspan="2">
		<div align="left">Seleccione la(s) raz&oacute;n(s) asociada(s) con la acci&oacute;n a ejecutar</div>
    </TD>
  </TR>
  <TR>
  	<TD>
	  <table  class="tableinfo">
	    <tr >
	      <td nowrap>
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">
	        	<tr id="trdark">
				    <TD align="right" width="20%">
						<div align="right">Raz&oacute;n 1 :</div>
				    </TD>
				    <TD align="left" width="80%">
						<input type="text" name="txtReason1" size="4" maxlength="3" value="">
						<a href="javascript:GetCodeReason('txtReason1','<%=type%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
				    </TD>
				  </TR>
				  <TR id="trclear">
				    <TD align="right" width="20%">
						<div align="right">Raz&oacute;n 2 :</div>
				    </TD>
				    <TD align="left" width="80%">
						<input type="text" name="txtReason2" size="4" maxlength="3" value="">
						<a href="javascript:GetCodeReason('txtReason2','<%=type%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
				    </TD>
				  </TR>
				  <TR id="trdark">
				    <TD align="right" width="20%">
						<div align="right">Raz&oacute;n 3 :</div>
				    </TD>
				    <TD align="left" width="80%">
						<input type="text" name="txtReason3" size="4" maxlength="3" value="">
						<a href="javascript:GetCodeReason('txtReason3','<%=type%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
				    </TD>
				  </TR>
				  <TR id="trclear">
				    <TD align="right" width="20%">
						<div align="right">Raz&oacute;n 4 :</div>
				    </TD>
				    <TD align="left" width="80%">
						<input type="text" name="txtReason4" size="4" maxlength="3" value="">
						<a href="javascript:GetCodeReason('txtReason4','<%=type%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
				    </TD>
				  </TR>
				  <TR id="trdark">
				    <TD align="right" width="20%">
						<div align="right">Raz&oacute;n 5 :</div>
				    </TD>
				    <TD align="left" width="80%">
						<input type="text" name="txtReason5" size="4" maxlength="3" value="">
						<a href="javascript:GetCodeReason('txtReason5','<%=type%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
				    </TD>
				  </TR>
				</table>
			</TD>
		</TR>
	</table>
	</TD>
  <TR>
  	<TD align="center" colspan="2">
		<div align="left">Mensaje :</div>
	 </TD>
  </TR>
  <TR>
  	<TD>
		<table  class="tableinfo">
			    <tr >
			      <td nowrap>
			        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			        	<tr id="trdark">
						    <TD align="center" colspan="2">
								<textarea cols="50" rows="15" name="txtmsg"></textarea>
						    </TD>
						</TR>
					</table>
				</TD>
			</TR>
		</table>
	</TD>
  </TR>

</table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onclick="ok()">
        </div>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>

</FORM>
</BODY>
</HTML>
