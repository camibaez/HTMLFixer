<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Calculator</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqLoans" class="datapro.eibs.beans.EDL029001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_i_opt);

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
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>
<div align="center"></div>
<h3 align="center"> Interest Calculator<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_calc.jsp, EDL0290"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I" >
  <input type=HIDDEN name="SCREEN" value="47">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="14%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" >
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b>
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="14%">
              <div align="right"><b>Contract :</b></div>
            </td>
            <td nowrap width="9%">
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%">
              <div align="right"><b>Officer :</b></div>
            </td>
            <td nowrap width="33%">
              <div align="left"><b>
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Optional Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="19%" >
              <div align="right">Contract Number :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01DEAACC" size="14" maxlength="9" value="<%= inqLoans.getE01DEAACC().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap colspan="2" >Customer Number :
              <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= inqLoans.getE01DEACUN().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetCustomerDescId('E01DEACUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="19%" >
              <div align="right">Name :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01CUMMA1" size="45" maxlength="45" value="<%= inqLoans.getE01CUMMA1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="19%" >
              <div align="right">Address :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01CUMMA2" size="45" maxlength="45" value="<%= inqLoans.getE01CUMMA2().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="19%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01CUMMA3" size="45" maxlength="45" value="<%= inqLoans.getE01CUMMA3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="19%" >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01CUMMA4" size="45" maxlength="45" value="<%= inqLoans.getE01CUMMA4().trim()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="19%" >
              <div align="right">City :</div>
            </td>
            <td nowrap width="28%" >
              <input type="text" name="E01CUMCTY" size="30" maxlength="30" value="<%= inqLoans.getE01CUMCTY().trim()%>" >
            </td>
            <td nowrap width="17%" > State :
              <input type="text" name="E01CUMSTE" size="5" maxlength="4" value="<%= inqLoans.getE01CUMSTE().trim()%>" >
            </td>
            <td nowrap width="36%" >Country :
              <input type="text" name="E01CUMCTR" size="20" maxlength="20" value="<%= inqLoans.getE01CUMCTR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="19%" >
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap colspan="3" >
              <input type="text" name="E01CUMZPC" size="15" maxlength="15" value="<%= inqLoans.getE01CUMZPC().trim()%>" >
              <input type="text" name="E01CUMPOB" size="10" maxlength="10" value="<%= inqLoans.getE01CUMPOB().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Principal :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPRI" size="15" maxlength="13" value="<%= inqLoans.getE01DEAPRI().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> Initial Date :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= inqLoans.getE01DEAOD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= inqLoans.getE01DEAOD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= inqLoans.getE01DEAOD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAOD1,document.forms[0].E01DEAOD2,document.forms[0].E01DEAOD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <div align="right">Final Date :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= inqLoans.getE01DEAMD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= inqLoans.getE01DEAMD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= inqLoans.getE01DEAMD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAMD1,document.forms[0].E01DEAMD2,document.forms[0].E01DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"> Terms :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= inqLoans.getE01DEATRM().trim()%>" onkeypress="enterInteger()">
              <select name="E01DEATRC">
                <option value=" " <% if (!(inqLoans.getE01DEATRC().equals("D") ||inqLoans.getE01DEATRC().equals("M")||inqLoans.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(inqLoans.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(inqLoans.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(inqLoans.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= inqLoans.getE01DEARTE().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= inqLoans.getE01DEABAS().trim()%>"  onkeypress="enterInteger()">
            </td>
            <td nowrap   >
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap   >
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= inqLoans.getE01DEAICT().trim()%>" >
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap  >&nbsp; </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"> Discounted Rate :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DSCRTE" size="10" maxlength="9" value="<%= inqLoans.getE01DSCRTE().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >
              <div align="right">Maturity :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DYSNME" size="10" maxlength="9" value="<%= inqLoans.getE01DYSNME().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Principal :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DEAPRI" size="15" maxlength="13" value="<%= inqLoans.getE01DEAPRI().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01VENCI1" size="2" maxlength="2" value="<%= inqLoans.getE01VENCI1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01VENCI2" size="2" maxlength="2" value="<%= inqLoans.getE01VENCI2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01VENCI3" size="2" maxlength="2" value="<%= inqLoans.getE01VENCI3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01VENCI1,document.forms[0].E01VENCI2,document.forms[0].E01VENCI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Interest :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01DEAINT" size="15" maxlength="13" value="<%= inqLoans.getE01DEAINT().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >&nbsp;</td>
            <td nowrap  >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Total :</div>
            </td>
            <td nowrap  >
              <input type="text" name="E01TOTDUE" size="15" maxlength="13" value="<%= inqLoans.getE01TOTDUE().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap  >&nbsp;</td>
            <td nowrap  >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <br>
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

</form>
</body>
</html>
