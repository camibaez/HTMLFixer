<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Customer Portfolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cusPort" class="datapro.eibs.beans.ESD008801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }

<%
  if (userPO.getPurpose().equals("MAINTENANCE") ) {
%>
  builtNewMenu(cus_port_opt);
  initMenu();
<% } %>
</SCRIPT>


</head>
<body>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>
<div align="center">
  <h3>Customer Portfolio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
  		name="EIBS_GIF" alt="cus_port_basic.jsp,ESD0088">
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088" >
  <h4>Basic Information</h4>
  <input type="hidden" name="SCREEN" value="300">

  <table border="0" width="100%">
    <tr id="trclear">
      <td width="82%">
     <%
      	if (cusPort.getH01OPECOD().equals("0001")) {
     %>
     	<div align="right"><font color="#FF0000">New Record</font> - Status:</div>
     <% } else { %>
        <div align="right">Status :</div>
     <% } %>
      </td>
      <td width="18%">
		<select name="E01PRFSTS">
                  <option value="" <%if (cusPort.getE01PRFSTS().equals("")) { out.print("selected"); }%>></option>
                  <option value="P" <%if (cusPort.getE01PRFSTS().equals("P")) { out.print("selected"); }%>>Pending</option>
                  <option value="A" <%if (cusPort.getE01PRFSTS().equals("A")) { out.print("selected"); }%>>Active</option>
                  <option value="I" <%if (cusPort.getE01PRFSTS().equals("I")) { out.print("selected"); }%>>Inactive</option>
                </select>
</td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <TD nowrap width="34%">
              <DIV align="right">Portfolio / Description :</DIV>
            </TD><TD nowrap>
              <INPUT type="text" name="E01PRFNUM" size="12" maxlength="9" value="<%= cusPort.getE01PRFNUM().trim()%>" readonly>
              /
              <INPUT type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%= cusPort.getE01PRFDSC()%>">
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0">
            </TD>

          </tr>
			<TR>
				<TD nowrap width="34%">
              <DIV align="right">Main Customer :</DIV>
            </TD><TD nowrap>
              <INPUT type="text" name="E01PRFCUN" size="12" maxlength="9" value="<%= cusPort.getE01PRFCUN().trim()%>" onkeypress="enterInteger()" <% if (userPO.getPurpose().equals("MAINTENANCE")) { out.print("readonly"); }%>>
              <INPUT type="text" name="D01CUSNA1" size="35" maxlength="35" value="<%= cusPort.getD01CUSNA1().trim()%>" readonly>
              <% if (!userPO.getPurpose().equals("MAINTENANCE")) { %>
              <a href="javascript:GetCustomerDescIdNP('E01PRFCUN','D01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <% } %>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0">
            </TD>

			</TR>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Account Officer :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01PRFOFC" size="6" maxlength="4" value="<%= cusPort.getE01PRFOFC().trim()%>">
              <input type="text" name="D01OFCNME" size="35" maxlength="35" value="<%= cusPort.getD01OFCNME()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E01PRFOFC','D01OFCNME', '15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Default Cash Account :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFHAC" size="12" maxlength="9" value="<%= cusPort.getE01PRFHAC()%>">
              <a href="javascript:GetAccount('E01PRFHAC','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
          </tr>         
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFOP1" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01PRFOP2" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01PRFOP3" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01PRFOP1,document.forms[0].E01PRFOP2,document.forms[0].E01PRFOP3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Portfolio Currency :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRFVCY" size="4" maxlength="3" value="<%= cusPort.getE01PRFVCY().trim()%>">
              <a href="javascript:GetCurrency('E01PRFVCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Statement Via :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select name="E01PRFSTM">
                  <option value="N" <%if (cusPort.getE01PRFSTM().equals("N")) { out.print("selected"); }%>>None</option>
                  <option value="E" <%if (cusPort.getE01PRFSTM().equals("E")) { out.print("selected"); }%>>e-Mail</option>
                  <option value="P" <%if (cusPort.getE01PRFSTM().equals("P")) { out.print("selected"); }%>>Print</option>
                  <option value="B" <%if (cusPort.getE01PRFSTM().equals("B")) { out.print("selected"); }%>>Print/e-Mail</option>
                  <option value="F" <%if (cusPort.getE01PRFSTM().equals("F")) { out.print("selected"); }%>>Fax</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" align="right">Notifications Via :</td>
            <td nowrap >
            	<SELECT name="E01PRFCNF">
					<OPTION value="N" <%if (cusPort.getE01PRFCNF().equals("N")) { out.print("selected"); }%>>None</OPTION>
					<OPTION value="E" <%if (cusPort.getE01PRFCNF().equals("E")) { out.print("selected"); }%>>e-Mail</OPTION>
					<OPTION value="P" <%if (cusPort.getE01PRFCNF().equals("P")) { out.print("selected"); }%>>Print</OPTION>
					<OPTION value="B" <%if (cusPort.getE01PRFCNF().equals("B")) { out.print("selected"); }%>>Print/e-Mail</OPTION>
					<OPTION value="F" <%if (cusPort.getE01PRFCNF().equals("F")) { out.print("selected"); }%>>Fax</OPTION>
				</SELECT>
			</td>
          </tr>
          <%if(userPO.getPurpose().equals("NEW")){%>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Cash Account Product :</div>
            </td>
            <td nowrap >
				<INPUT type="text" name="E01PRFCDE"
					size="5" maxlength="4" value="<%= cusPort.getE01PRFCDE()%>">
					<INPUT type="text" name="D01PRFCDE" size="35" maxlength="35"
					value="<%= cusPort.getD01PRFCDE()%>" readonly><A
					href="javascript:GetProduct('E01PRFCDE','D01PRFCDE','RT','')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="bottom" border="0"></A></td>
          </tr>
          <%}%>
			<TR>
				<TD nowrap width="34%" align="right" height="11"></TD>
				<TD nowrap height="11"></TD>
			</TR></table>
      </td>
    </tr>
  </table>

  <BR>
<table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="2">Legal Name :</td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <div align="center">
                <textarea name="E01LEGNME" cols="40" rows="9" readonly> <%= cusPort.getE01LEGNME() %> </textarea>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <div align="left">Comments :</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2 align=center>
              <input type="text" name="E01PRFCM1" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM1() %>">
              <br>
              <input type="text" name="E01PRFCM2" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM2() %>">
              <br>
              <input type="text" name="E01PRFCM3" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM3() %>">
              <br>
              <input type="text" name="E01PRFCM4" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM4() %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<H4>Classification Codes</H4>
<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap width="100%">

			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
				<TBODY>
					<TR id="trdark0">
						<TD nowrap width="22%" align="right">
						<DIV align="right"></DIV>
						Substitute Officer :</TD>
						<TD nowrap width="18%">
							<INPUT type="text" name="E01OF2" size="5" maxlength="3"
							value="<%= cusPort.getE01OF2().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01OF2','15')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A></TD>
						<TD nowrap width="29%">
						<DIV align="right"></DIV>
						</TD>
						<TD nowrap width="31%">
						</TD>
					</TR>
					<TR id="teclear">
						<TD nowrap width="22%">
						<DIV align="right">Industry Code :</DIV>
						</TD>
						<TD nowrap width="18%"><INPUT type="text" name="E01INC" size="5"
							maxlength="3" value="<%= cusPort.getE01INC().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01INC','09')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A></TD>
						<TD nowrap width="29%">
						<DIV align="right">Business Line :</DIV>
						</TD>
						<TD nowrap width="31%"><INPUT type="text" name="E01BUC" size="5"
							maxlength="3" value="<%= cusPort.getE01BUC().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01BUC','12')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A></TD>
					</TR>
					<TR id="trdark0">
						<TD nowrap width="22%">
						<DIV align="right">Country of Residence :</DIV>
						</TD>
						<TD nowrap width="18%"><INPUT type="text" name="E01GEC" size="5"
							maxlength="3" value="<%= cusPort.getE01GEC().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01GEC','03')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A> <IMG
							src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom"></TD>
						<TD nowrap width="29%"><%--  <div align="right">User Code 1 :</div>--%>
						</TD>
						<TD nowrap width="31%"><%--
              <input type="text" name="E01UC1" size="5" maxlength="3" value="<%= cusPort.getE01UC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"  ></a>
              --%></TD>
					</TR>
					<TR id="teclear">
						<TD nowrap width="22%">
						<DIV align="right">Legal Entity :</DIV>
						</TD>
						<TD nowrap width="18%"><INPUT type="text" name="E01UC2" size="5"
							maxlength="3" value="<%= cusPort.getE01UC2().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01UC2','2B')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A></TD>
						<TD nowrap width="29%">
						<DIV align="right">User Code 3 :</DIV>
						</TD>
						<TD nowrap width="31%"><INPUT type="text" name="E01UC3" size="5"
							maxlength="3" value="<%= cusPort.getE01UC3().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01UC3','2C')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A> Only for Reg. "O"</TD>
					</TR>
					<TR id="trdark0">
						<TD nowrap width="22%">
						<DIV align="right">Risk Level :</DIV>
						</TD>
						<TD nowrap width="18%"><INPUT type="text" name="E01RSL" size="5"
							maxlength="4" value="<%= cusPort.getE01RSL().trim()%>"> <A
							href="javascript:GetCodeCNOFC('E01RSL','31')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A></TD>
						<TD nowrap width="29%">&nbsp;</TD>
						<TD nowrap width="31%">&nbsp;</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>


<H4>Additional Information</H4>
<TABLE class="tableinfo" width="100%">
	<TBODY>
		<TR>
			<TD nowrap width="100%">

			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
				<TBODY>
					<TR id="trdark0">
						<TD nowrap width="22%">
						<DIV align="right">Withholding Table :</DIV>
						</TD>
						<TD nowrap width="41%" bordercolor="#FFFFFF"><INPUT type="text"
							name="E01TAX" size="2" maxlength="1"
							value="<%= cusPort.getE01TAX().trim()%>"> <A
							href="javascript:GetCode('E01TAX','STATIC_client_help_tax_instructions.jsp')"><IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
							align="bottom" border="0"></A><IMG
							src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom"></TD>
					</TR>
					<TR id="teclear">

						<TD nowrap width="23%">
						<DIV align="right">Subject to Taxes in U.S. :</DIV>
						</TD>

						<TD nowrap width="36%">
						<INPUT type="radio" name="E01FG2" value="Y" <%if (cusPort.getE01FG2().equals("Y")) out.print("checked"); %>>
							Yes
						<INPUT type="radio" name="E01FG2" value="N"	<%if (cusPort.getE01FG2().equals("N")) out.print("checked"); %>>
						 No <IMG
							src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom" border="0"></TD>
					</TR>
					<TR id="trdark0">
						<TD nowrap width="23%">
						<DIV align="right">Treasury Portfolio :</DIV>
						</TD>

						<TD nowrap width="39%"><INPUT type="radio" name="E01FL5" value="Y" <%if (cusPort.getE01FL5().equals("Y")) out.print("checked"); %>>
						Yes <INPUT type="radio" name="E01FL5" value="N"	<%if (cusPort.getE01FL5().equals("N")) out.print("checked"); %>>
						 No <IMG
							src="<%=request.getContextPath()%>/images/Check.gif"
							alt="mandatory field" align="bottom"></TD>
					</TR>
					<TR id="teclear">
						<TD nowrap width="22%" align="right">Potencial Amount :</TD>
						<TD nowrap width="41%" bordercolor="#FFFFFF"><INPUT type="text"
							name="E01CAI" size="16" maxlength="15"
							value="<%= cusPort.getE01CAI().trim()%>"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<p align="center">
	<input id="EIBSBTN" type=submit name="Submit" value="Submit"><BR>
</p>

</form>
</body>
</html>
