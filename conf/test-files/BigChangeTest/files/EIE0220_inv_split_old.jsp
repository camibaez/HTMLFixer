<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Split</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invSplit" class="datapro.eibs.beans.EIE022001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript">


 function Calculate() {
  document.forms[0].SCREEN.value = "300";
  document.forms[0].submit();
  }

</script>
</head>
<body nowrap>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<div align="center">
  <h3>Stock Split<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_split.jsp,EIE0220">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0220" >
    <input type="hidden" name="SCREEN"  value="400" >

		<h4>Instrument Information</h4>

		<TR>
			<TD nowrap height="222">
			<TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
				<TBODY>

					<TR id="trdark">
						<TD nowrap width="17%">
						<DIV align="right"><A href="javascript:showInstrumentInq(document.forms[0].E01ISIIIC.value)"><IMG src="<%=request.getContextPath()%>/images/1aquire.gif" alt="Help" border="0"> Instrument </A> :</DIV>
						</TD>
						<TD nowrap width="56%"><INPUT type="text" name="E01ISIIIC"  size="4" maxlength="3" value="<%= invSplit.getE01ISIIIC()%>" onkeypress="enterDecimal()">
						<INPUT type="text" name="E01ISIDSC" readonly size="35" maxlength="30" value="<%= invSplit.getE01ISIDSC()%>" onkeypress="enterDecimal()">
							<!-- <A href="javascript:GetInstrumentSplit('E01ISIIIC','E01ISIDSC','E01ISINUM','E01ISIPTY')"> -->
							<A href="javascript:GetInstrumentParams('E01ISIIIC','E01ISIDSC','E01ISICCY','','','','E01ISIPTY')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"> </A>
							<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="17%" height="33">
						<DIV align="right">Instrument Type :</DIV>
						</TD>
						<TD nowrap height="33" width="56%"><input type="text" name="E01ISIPTY" readonly size="15" maxlength="15" value="<%= invSplit.getE01ISIPTY()%>" onKeyPress="enterDecimal()"> Currency: <INPUT
					type="text" name="E01ISICCY" readonly size="15" maxlength="15"
					value="<%= invSplit.getE01ISICCY()%>" onkeypress="enterDecimal()"></TD>

					</TR>


        </table>
      </td>
    </tr>
  </table>
		     <h4>Outstanding Balance</h4>

			 <TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
				    <TBODY>

					<TR id="trdark">

						<TD nowrap width="17%" >
						<DIV align="right"><A href="javascript:showOpenDetailInstrument(document.forms[0].E01ISIIIC.value)"><IMG src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" > Current Quantity :</A></DIV>
						</TD>
						<TD nowrap height="35" width="56%"><input type="text" name="E01QUANTY" readonly size="17" maxlength="15" value="<%= invSplit.getE01QUANTY()%>" onKeyPress="enterDecimal()">
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="17%" height="40">
						<DIV align="right">Market Price :</DIV>
						</TD>
						<TD nowrap height="40" width="56%"><input type="text" name="E01UNTPRI" readonly size="17" maxlength="15" value="<%= invSplit.getE01UNTPRI()%>" onKeyPress="enterDecimal()">
						</TD>
					</TR>

					<TR id="trdark">
						<TD nowrap width="17%" height="40">
						<DIV align="right">Market Value :</DIV>
						</TD>
						<TD nowrap height="40" width="56%">
						<input type="text" name="E01NOMVAL" readonly size="17" maxlength="15" value="<%= invSplit.getE01NOMVAL()%>" onKeyPress="enterDecimal()"></TD>
					</TR>

					</TABLE>

						<h4>Split Information</h4>
					  <TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
				    <TBODY>
					<TR id="trdark">
						<TD nowrap width="17%">
						<DIV align="right">Factor :</DIV>
						</TD><TD nowrap width="56%"><input type="text" name="E01SCRFAC"  size="11" maxlength="15" value="<%= invSplit.getE01SCRFAC()%>" onKeyPress="enterDecimal()"></TD>

					</TR>
					<TR id="trclear">
						<TD nowrap width="17%">
			<DIV align="right">New Market Price :</DIV>
			</TD><TD nowrap width="56%"><INPUT type="text" name="E01NEWMKP"  size="17" maxlength="15" value="<%= invSplit.getE01NEWMKP()%>" onkeypress="enterDecimal()"></TD>

					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
 <p>&nbsp;</p>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type="button" name="btnval" value="Validate" onClick="Calculate()">
        </div>
      </td>
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td>
        <div align="center"> </div>
      </td>
    </tr>
  </table>

  </form>
</body>
</html>

