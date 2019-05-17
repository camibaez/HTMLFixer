<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>IRA Account Parameters Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="iraAcc" class="datapro.eibs.beans.EIR000001Message"  scope="session" />
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
</SCRIPT>

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
  <h3>IRA Accounts Parameters <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ira_account_basic_readonly.jsp,EIR0000"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEIR0000" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN"  value="500" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">IRA Type :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRATYP" size="3" maxlength="2" value="<%= iraAcc.getE01IRATYP()%>" readonly>
            <INPUT type="text" name="E01IRADSC" size="30" maxlength="25"
			value="<%= iraAcc.getD01IRADSC()%>" readonly>
			</td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Year :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRAYEA" size="6" maxlength="4" value="<%= iraAcc.getE01IRAYEA()%>" readonly>
            </td>
            <td nowrap width="14%" > 
              <div align="right">  </div>
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" >
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> Maximum Annual<BR>Contribution
				</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRAAC1" size="20" maxlength="15" value="<%= iraAcc.getE01IRAAC1()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Under<BR>
				Age of:</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01IRAAG1" size="4" maxlength="3" value="<%= iraAcc.getE01IRAAG1()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 

            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Additional Catch-Up</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRAAC2" size="20" maxlength="15" value="<%= iraAcc.getE01IRAAC2()%>" readonly>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33%" >
              <a href="javascript:GetCodeCNOFC('E01FEBCTR','03')"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Age when contribution must cease:</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRAAG2" size="20" maxlength="15" value="<%= iraAcc.getE01IRAAG2()%>" readonly>
            </td>
            <td nowrap width="14%" ></td>
            <td nowrap width="33%" ></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Age when  distribution may start:</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01IRAAG3" size="20" maxlength="15" value="<%= iraAcc.getE01IRAAG3()%>" readonly>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33%" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Age when distribution must start:</div>
            </td>
            <td nowrap width="36%" >
              <input type="text" name="E01IRAAG4" size="20" maxlength="15" value="<%= iraAcc.getE01IRAAG4()%>" readonly>
            </td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="33%" >&nbsp;</td>
          </tr>
           <tr id="trclear">
            <td nowrap width="17%" >
              <div align="right">Contribution Due Date:</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01IRACDM" size="2" maxlength="2" value="<%= iraAcc.getE01IRACDM().trim()%>" onkeypress="enterInteger()" readonly>
                  <input type="text" name="E01IRACDD" size="2" maxlength="2" value="<%= iraAcc.getE01IRACDD().trim()%>" onkeypress="enterInteger()" readonly>
                  <input type="text" name="E01IRACDY" size="2" maxlength="2" value="<%= iraAcc.getE01IRACDY().trim()%>" onkeypress="enterInteger()" readonly>
                  <a href="javascript:DatePicker(document.forms[0].E01IRACDM,document.forms[0].E01IRACDD,document.forms[0].E01IRACDY)"></a> 
                </div>
              </td>            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="33%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
    </tr>
  </table>
  </form>
</body>
</html>
