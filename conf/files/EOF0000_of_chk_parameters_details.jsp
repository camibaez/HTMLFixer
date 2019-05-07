<html>
<head>
<title>Official Checks Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="checksParam" class="datapro.eibs.beans.EOF000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

%>


<H3 align="center">Official Checks Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="check_parameter_details.jsp, EOF0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEOF0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Format :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left"> <b>
                <input type="text" name="E01OFCFTY" size="2" maxlength="1"  value="<%= checksParam.getE01OFCFTY().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
                </b></div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Description :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01OFCDSC" size="36"  maxlength="35" value="<%= checksParam.getE01OFCDSC().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Bank :</b></div>
            </td>
            <td nowrap width="20%" ><b>
              <input type="text" name="E01OFCBNK" size="3" maxlength="2"  value="<%= checksParam.getE01OFCBNK().trim()%>" readonly>
              </b></td>
            <td nowrap width="16%" >
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01OFCCCY" size="4" maxlength="3" value="<%= checksParam.getE01OFCCCY().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right">General Ledger Checks to be Printed :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E01OFCXPR" size="17" maxlength="16" value="<%= checksParam.getE01OFCXPR().trim()%>">
                <a href="javascript:GetLedger('E01OFCXPR',document.forms[0].E01OFCBNK.value,document.forms[0].E01OFCCCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
            <td nowrap>
              <div align="right">General Ledger Printed Checks :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E01OFCPRT" size="17" maxlength="16" value="<%= checksParam.getE01OFCPRT().trim()%>">
                <a href="javascript:GetLedger('E01OFCPRT',document.forms[0].E01OFCBNK.value,document.forms[0].E01OFCCCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="right">General Ledger Tax Withholding :</div>
            </td>
            <td nowrap height="23">
              <div align="left">
                <input type="text" name="E01OFCWTH" size="17" maxlength="16" value="<%= checksParam.getE01OFCWTH().trim()%>">
                <a href="javascript:GetLedger('E01OFCWTH',document.forms[0].E01OFCBNK.value,document.forms[0].E01OFCCCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div>
            </td>
            <td nowrap height="23">
              <div align="right">Withholding Percentage :</div>
            </td>
            <td nowrap height="23">
              <div align="left">
                <input type="text" name="E01OFCWTP" size="12" maxlength="11" value="<%= checksParam.getE01OFCWTP().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">Number of Days in Advance to Generate Payments
                :</div>
            </td>
            <td nowrap height="19">
              <div align="left">
                <input type="text" name="E01OFCVYS" maxlength="3" size="4" value="<%= checksParam.getE01OFCVYS().trim()%>" >
              </div>
            </td>
            <td nowrap height="19">
              <div align="right">Numbers per Office :</div>
            </td>
            <td nowrap height="19">
              <div align="left">
				  <select name="E01OFCNXO">
				    <option value=" "
			           <% if (!(checksParam.getE01OFCNXO().equals("Y") || checksParam.getE01OFCNXO().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01OFCNXO().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01OFCNXO().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="right">Various Payments in one Check :</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="left">
                <input type="text" name="E01OFCPCK" maxlength="2" size="3" value="<%= checksParam.getE01OFCPCK().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="right"></div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="left"></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">Inactive Days 1 General Ledger :</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01OFCGI1" size="17" maxlength="16" value="<%= checksParam.getE01OFCGI1().trim()%>">
                <a href="javascript:GetLedger('E01OFCGI1',document.forms[0].E01OFCBNK.value,document.forms[0].E01OFCCCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></font></font></font></b>
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="right">Inactive Days 1 :</div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="left">
                <input type="text" name="E01OFCDI1" maxlength="3" size="4" value="<%= checksParam.getE01OFCDI1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="right">Inactive Days 2 General Ledger :</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01OFCGI2" size="17" maxlength="16" value="<%= checksParam.getE01OFCGI2().trim()%>">
                <a href="javascript:GetLedger('E01OFCGI2',document.forms[0].E01OFCBNK.value,document.forms[0].E01OFCCCY.value,'')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></font></font></font></b>
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="right">Inactive Days 2 :</div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="left">
                <input type="text" name="E01OFCDI2" maxlength="3" size="4" value="<%= checksParam.getE01OFCDI2().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="right">eIBS Address Forms :</div>
            </td>
            <td nowrap colspan="3" height="19">
              <input type="text" name="E01OFCPTH" maxlength="80" size="81" value="<%= checksParam.getE01OFCPTH().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Accounts</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="6%">
              <div align="center">Seq</div>
            </td>
            <td nowrap>
              <div align="center">Charges</div>
            </td>
            <td nowrap>
              <div align="center">Factor</div>
            </td>
            <td nowrap>
              <div align="center">Tax</div>
            </td>
            <td nowrap>
              <div align="center">Income Account</div>
            </td>
            <td nowrap>
              <div align="center">Description</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="23">
              <div align="center"> 1</div>
            </td>
            <td nowrap height="23">
              <div align="center">
                <input type="text" name="E01BAFA01" value="<%= checksParam.getE01BAFA01().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap height="23">
              <div align="center">
				  <select name="E01BAF201">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF201().equals("F") || checksParam.getE01BAF201().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF201().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF201().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap height="23">
              <div align="center">
				  <select name="E01BAFI01">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI01().equals("Y") || checksParam.getE01BAFI01().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI01().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI01().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap height="23">
              <div align="center">
                <input type="text" name="E01BAFG01" size="17" maxlength="16" value="<%= checksParam.getE01BAFG01().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap height="23">
              <div align="center">
                <input type="text" name="F01BAFD01" value="<%= checksParam.getF01BAFD01().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="center"> 2</div>
            </td>
            <td nowrap height="19">
              <div align="center">
                <input type="text" name="E01BAFA02" value="<%= checksParam.getE01BAFA02().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap height="19">
              <div align="center">
				  <select name="E01BAF202">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF202().equals("F") || checksParam.getE01BAF202().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF202().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF202().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap height="19">
              <div align="center">
				  <select name="E01BAFI02">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI02().equals("Y") || checksParam.getE01BAFI02().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI02().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI02().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap height="19">
              <div align="center">
                <input type="text" name="E01BAFG02" size="17" maxlength="16" value="<%= checksParam.getE01BAFG02().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap height="19">
              <div align="center">
                <input type="text" name="F01BAFD02" value="<%= checksParam.getF01BAFD02().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="center"> 3</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA03" value="<%= checksParam.getE01BAFA03().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF203">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF203().equals("F") || checksParam.getE01BAF203().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF203().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF203().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI03">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI03().equals("Y") || checksParam.getE01BAFI03().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI03().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI03().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG03" size="17" maxlength="16" value="<%= checksParam.getE01BAFG03().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD03" value="<%= checksParam.getF01BAFD03().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="center"> 4</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA04" value="<%= checksParam.getE01BAFA04().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF204">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF204().equals("F") || checksParam.getE01BAF204().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF204().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF204().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI04">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI04().equals("Y") || checksParam.getE01BAFI04().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI04().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI04().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG04" size="17" maxlength="16" value="<%= checksParam.getE01BAFG04().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD04" value="<%= checksParam.getF01BAFD04().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="center"> 5</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA05" value="<%= checksParam.getE01BAFA05().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF205">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF205().equals("F") || checksParam.getE01BAF205().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF205().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF205().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI05">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI05().equals("Y") || checksParam.getE01BAFI05().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI05().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI05().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG05" size="17" maxlength="16" value="<%= checksParam.getE01BAFG05().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD05" value="<%= checksParam.getF01BAFD05().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="center"> 6</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA06" value="<%= checksParam.getE01BAFA06().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF206">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF206().equals("F") || checksParam.getE01BAF206().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF206().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF206().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI06">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI06().equals("Y") || checksParam.getE01BAFI06().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI06().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI06().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG06" size="17" maxlength="16" value="<%= checksParam.getE01BAFG06().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD06" value="<%= checksParam.getF01BAFD06().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="center"> 7</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA07" value="<%= checksParam.getE01BAFA07().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF207">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF207().equals("F") || checksParam.getE01BAF207().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF207().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF207().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI07">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI07().equals("Y") || checksParam.getE01BAFI07().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI07().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI07().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG07" size="17" maxlength="16" value="<%= checksParam.getE01BAFG07().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD07" value="<%= checksParam.getF01BAFD07().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="center"> 8</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA08" value="<%= checksParam.getE01BAFA08().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF208">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF208().equals("F") || checksParam.getE01BAF208().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF208().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF208().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI08">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI08().equals("Y") || checksParam.getE01BAFI08().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI08().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI08().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG08" size="17" maxlength="16" value="<%= checksParam.getE01BAFG08().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD08" value="<%= checksParam.getF01BAFD08().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="19">
              <div align="center"> 9</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA09" value="<%= checksParam.getE01BAFA09().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF209">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF209().equals("F") || checksParam.getE01BAF209().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF209().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF209().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI09">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI09().equals("Y") || checksParam.getE01BAFI09().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI09().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI09().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG09" size="17" maxlength="16" value="<%= checksParam.getE01BAFG09().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD09" value="<%= checksParam.getF01BAFD09().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19">
              <div align="center"> 10</div>
            </td>
            <td nowrap width="40%" height="19">
              <div align="center">
                <input type="text" name="E01BAFA10" value="<%= checksParam.getE01BAFA10().trim()%>" size="17" maxlength="15">
              </div>
            </td>
            <td nowrap width="16%" height="19">
              <div align="center">
				  <select name="E01BAF210">
				    <option value=" "
			           <% if (!(checksParam.getE01BAF210().equals("F") || checksParam.getE01BAF210().equals("%"))) out.print("selected"); %>>
		            </option>
		            <option value="F" <%if (checksParam.getE01BAF210().equals("F"))  out.print("selected");%>>Fixed</option>
				    <option value="%" <%if (checksParam.getE01BAF210().equals("%"))  out.print("selected");%>>Percentage</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
				  <select name="E01BAFI10">
				    <option value=" "
			           <% if (!(checksParam.getE01BAFI10().equals("Y") || checksParam.getE01BAFI10().equals("N"))) out.print("selected"); %>>
		            </option>
		            <option value="Y" <%if (checksParam.getE01BAFI10().equals("Y"))  out.print("selected");%>>Yes</option>
				    <option value="N" <%if (checksParam.getE01BAFI10().equals("N"))  out.print("selected");%>>No</option>
				  </select>
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="E01BAFG010" size="17" maxlength="16" value="<%= checksParam.getE01BAFG10().trim()%>"
                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01OFCBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="28%" height="19">
              <div align="center">
                <input type="text" name="F01BAFD010" value="<%= checksParam.getF01BAFD10().trim()%>" size="36" maxlength="35">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
