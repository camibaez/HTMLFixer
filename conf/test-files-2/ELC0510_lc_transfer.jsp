<!--
	Author:		Saif Mazhar
	Created:	1/26/07
	k0d3r
	-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letter of Credit Transfer</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </script>

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC051005Message"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />




<script LANGUAGE="javascript">
   	
   	<% if (!userPO.getPurpose().equals("NEW")) { %>
   			builtNewMenu(lc_transfer);
			initMenu();
	<% } else { %>		
   			builtHPopUp();
   	<% } %>		

	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}
   	
</script>



<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
</head>
<body>
<h3 align="center">Letter Of Credit Transfer 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_transfer.jsp, ELC0510"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
  <input TYPE=HIDDEN NAME="SCREEN" VALUE="107">
  <table class="tableinfo">
    <tbody>
      <tr>
        <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tbody>
              <tr id="trdark0">
                <td nowrap width="16%"><div align="right"><b>Bank :</b></div></td>
                <td nowrap width="20%"><input type="text" name="E05LCMBNK" readonly size="4" maxlength="2" value="<%=msgLC.getE05LCMBNK().trim()%>">
                </td>
                <td nowrap width="16%"><div align="right"><b>Letter of Credit Number : </b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <%if (msgLC.getE05LCMACC().trim().equals("999999999999")) {%>
                    <input type="text" size="12" maxlength="12" value="New" readonly>
                    <input type="hidden" name="E05LCMACC" value="<%=msgLC.getE05LCMACC().trim()%>" readonly>
                    <%} else {%>
                    <input type="text" name="E05LCMACC" size="12" maxlength="12" value="<%=msgLC.getE05LCMACC().trim()%>" readonly>
                    <%}%>
                    </b></div></td>
              </tr>
              <tr id="trclear0">
                <td nowrap width="16%"><div align="right"><b>Our Reference :</b></div></td>
                <td nowrap width="20%"><div align="left">
                    <input type="text" name="E05LCMORF" size="20" maxlength="16" value="<%=msgLC.getE05LCMORF().trim()%>" readonly>
                  </div></td>
                <td nowrap width="16%"><div align="right"><b>Product :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMPRO" size="4" maxlength="4" value="<%=msgLC.getE05LCMPRO().trim()%>" readonly>
                    </b></div></td>
              </tr>
              <tr id="trdark0">
                <td nowrap width="16%"><div align="right"><b>Their Reference :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMTRF" size="20" maxlength="16" value="<%=msgLC.getE05LCMTRF().trim()%>" readonly>
                    </b></div></td>
                <td nowrap width="16%"><div align="right"><b>Product Description :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05DSCPRO" size="40" maxlength="35" value="<%=msgLC.getE05DSCPRO()%>"
							readonly>
                    </b></div></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <h4>Transfer Information</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td align="right">Number : </td>
            <td align="left"><input type="text" name="E05LCTANUM" size="2"maxlength="2" readonly value="<%=msgLC.getE05LCTNUM()%>"></td>
            <td align="right">Amount  :</td>
            <td align="left"><input type="text" name="E05LCTAMT" size="20"maxlength="15" value="<%=msgLC.getE05LCTAMT()%>">
            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></td>
            <td align="right">Reference :</td>
            <td><input type="text" name="E05LCTREF" size="20"maxlength="15" value="<%=msgLC.getE05LCTREF()%>"></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <h4>Credit Information</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td align="right">Issuing Date:</td>
            <td align="left"><input type="text" name="E05LCMID12" size="2" maxlength="2" readonly
			value='<%=(msgLC.getE05LCMID1().trim().equals("0") ? "" : msgLC.getE05LCMID1().trim())%>' onKeyPress="enterInteger()">
              <input type="text" name="E05LCMID22" size="2" maxlength="2" readonly
			value='<%=(msgLC.getE05LCMID2().trim().equals("0") ? "" : msgLC.getE05LCMID2().trim())%>' onKeyPress="enterInteger()">
              <input type="text" name="E05LCMID32" size="2" maxlength="2" readonly
			value='<%if (msgLC.getE05LCMID3().length() < 2 && !msgLC.getE05LCMID3().equals("0"))
	out.print("0");
out.print(
	(msgLC.getE05LCMID3().trim().equals("0")
		? ""
		: msgLC.getE05LCMID3().trim()));%>'
			onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E05LCMID1,document.forms[0].E05LCMID2,document.forms[0].E05LCMID3)"> <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" align="middle" border="0"></a></td>
            <td align="right">Expiration Date:</td>
            <td align="left"><input type="text" name="E05LCMEX12" size="2" maxlength="2"
			value='<%=(msgLC.getE05LCMEX1().trim().equals("0") ? "" : msgLC.getE05LCMEX1().trim())%>' onKeyPress="enterInteger()">
              <input type="text" name="E05LCMEX22" size="2" maxlength="2"
			value='<%=(msgLC.getE05LCMEX2().trim().equals("0") ? "" : msgLC.getE05LCMEX2().trim())%>' onKeyPress="enterInteger()">
              <input type="text" name="E05LCMEX32"
			size="2" maxlength="2"
			value='<%if (msgLC.getE05LCMEX3().length() < 2 && !msgLC.getE05LCMEX3().equals("0"))
	out.print("0");
out.print(
	(msgLC.getE05LCMEX3().trim().equals("0")
		? ""
		: msgLC.getE05LCMEX3().trim()));%>'
			onKeyPress="enterInteger()">
              <a
			href="javascript:DatePicker(document.forms[0].E05LCMEX1,document.forms[0].E05LCMEX2,document.forms[0].E05LCMEX3)"> <img src="<%=request.getContextPath()%>/images/calendar.gif"
			alt="Help" align="middle" border="0"></a></td>
          </tr>
          <tr>
            <td align="right">Original Amount:</td>
            <td align="left"><input type="text" name="E05LCMCCN2" size="9"
			maxlength="8" value="<%=msgLC.getE05LCMOAM().trim()%>"></td>
            <td align="right">Available Amount</td>
            <td><input type="text" name="E05LCMMEB" size="9" maxlength="8"
			value="<%=msgLC.getE05LCMMEB().trim()%>"></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <h4>Original Beneficiary</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tbody>
            <tr id="trdark">
              <td align="right">Customer or Account Number :
                <select name="E05LCMACF" disabled="disabled">
                  <option value=" " <%if (!(msgLC.getE05LCMACF().equals("C") || msgLC.getE05LCMACF().equals("A")))
	out.print("selected");%> selected></option>
                  <option value="C" <%if (msgLC.getE05LCMACF().equals("C"))
	out.print("selected");%>>Customer</option>
                  <option value="A" <%if (msgLC.getE05LCMACF().equals("A"))
	out.print("selected");%>>Account</option>
                </select>
              </td>
              <td><input type="text" name="E05LCMBAC" size="12" maxlength="12"
				value='<%=(!msgLC.getE05LCMBAC().trim().equals("0") ? msgLC.getE05LCMBAC() : "")%>'
				readonly></td>
            </tr>
            <tr>
              <td><div align="right">Name :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN1" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN1()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right">Address :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN2" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN2()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN3" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN3()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN4" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN4()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right">State :</div></td>
              <td align="left"><table>
                  <tbody>
                    <tr>
                      <td><input type="text" name="E05LCMBN5" size="2" maxlength="2" value="<%=msgLC.getE05LCMBN5()%>" readonly>
                        Zip Code :
                        <input type="text" name="E05LCMBN6" size="11" maxlength="10" value="<%=msgLC.getE05LCMBN6()%>" readonly>
                        Country :
                        <input type="text" name="E05LCMBN7" size="4" maxlength="4" value="<%=msgLC.getE05LCMBN7()%>" readonly></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    </tbody>
    
  </table>
  <h4>New Beneficiary</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tbody>
      <tr id="trdark">
        <td align="right" >Customer or Account Number:
          <select name="E05LCTACF">
            <option value=" "> </option>
            <option value="C"
					<%if (msgLC.getE05LCTACF().equals("C")) out.print("selected");%>>Customer</option>
            <option value="A"
					<%if (msgLC.getE05LCTACF().equals("A")) out.print("selected");%>>Account</option>
          </select></td>
        <td><input type="text" name="E05LCTBAC" size="12" maxlength="12"
				value='<%=(!msgLC.getE05LCTBAC().trim().equals("0") ? msgLC.getE05LCTBAC() : "")%>'>
          <a
				href="javascript: GetCustomerDetails('E05LCTBAC','E05LCTBN1','','','E05LCTBN7','E05LCTBN2','E05LCTBN3','E05LCTBN4','','E05LCTBN5','','','E05LCTBN6','','','','','')"><img
				src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 1"
				border="0"></a>Customer or <a
				href="javascript: GetAccByClient('E05LCTBAC','','RT','','E05LCTBN1')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 2"
				border="0"></a> Account</td>
      </tr>
      <tr>
        <td><div align="right">Name :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN1" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN1()%>">
            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" border="0"></div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right">Address :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN2" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN2()%>">
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN3" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN3()%>">
          </div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN4" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN4()%>">
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right">State :</div></td>
        <td align="left"><table>
            <tbody>
              <tr>
                <td><input type="text" name="E05LCTBN5" size="2" maxlength="2" value="<%=msgLC.getE05LCTBN5()%>">
	                <a href="javascript:GetCodeCNOFC('E05LCTBN5','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a> 
                  Zip Code :
                  <input type="text" name="E05LCTBN6" size="11" maxlength="10" value="<%=msgLC.getE05LCTBN6()%>">
                  Country :
                  <input type="text" name="E05LCTBN7" size="4" maxlength="4" value="<%=msgLC.getE05LCTBN7()%>">
                  <a href="javascript:GetCodeCNOFC('E05LCTBN7','03')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table></td></tr></table>

  <br>
  <div align="center">
    <input type="hidden" name="H02FLGWK1" value="">
    <input
	id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
