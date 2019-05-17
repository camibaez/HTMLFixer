<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fx G/L Cross Reference</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="msgBasic" class="datapro.eibs.beans.EFE010001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Foreign Exchange G/L Cross Reference<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fx_basic, EFE0100"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFE0100" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="5">
  <INPUT TYPE=HIDDEN NAME="BSECCY" value="<%= currUser.getE01BCU()%>">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right"><b>Bank :</b></div>
            </td>
            <td nowrap width="25%">
              <div align="left">
                <input type="text" name="E01FEGBNK" size="3" maxlength="2" readonly value="<%= msgBasic.getE01FEGBNK().trim()%>">
			  </div>
            </td>
            <td nowrap width="25%">
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="25%">
              <div align="left">
                <input type="text" name="E01FEGCCY" size="4" maxlength="3" readonly value="<%= msgBasic.getE01FEGCCY().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right"><b>Contract Type : </b></div>
            </td>
            <td nowrap width="25%">
              <div align="left">
                <input type="text" name="E01FEGTYP" size="4" maxlength="3" readonly value="<%= msgBasic.getE01FEGTYP().trim()%>">
              </div>
            </td>
            <td nowrap width="25%">
              <div align="right"><b>Classification :</b></div>
            </td>
            <td nowrap width="25%">
              <div align="left">
                <input type="text" name="E01FEGCLS" size="5" maxlength="4" readonly value="<%= msgBasic.getE01FEGCLS().trim()%>">
                 </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Basic Information</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGRVL" size="2" maxlength="1" value="<%= msgBasic.getE01FEGRVL().trim()%>" >
              <a href="javascript:GetCode('E01FEGRVL','STATIC_fe_bo_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </td>
            <td nowrap width="25%">
              <div align="right">Description :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGDSC" size="35" maxlength="30" value="<%= msgBasic.getE01FEGDSC().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Opening</H4>
 <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Purchase :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGPGL" size="13" maxlength="12" value="<%= msgBasic.getE01FEGPGL().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGPGL',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'51')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGPGL" size="35" maxlength="30" value="<%= msgBasic.getD01FEGPGL().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Contra :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGPCG" size="13" maxlength="12" value="<%= msgBasic.getE01FEGPCG().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGPCG',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGPCG" size="35" maxlength="30" value="<%= msgBasic.getD01FEGPCG().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Sale :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGSGL" size="13" maxlength="12" value="<%= msgBasic.getE01FEGSGL().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGSGL',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'51')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGSGL" size="35" maxlength="30" value="<%= msgBasic.getD01FEGSGL().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Contra :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGSCG" size="13" maxlength="12" value="<%= msgBasic.getE01FEGSCG().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGSCG',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGSCG" size="35" maxlength="30" value="<%= msgBasic.getD01FEGSCG().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Swap Forward Counter Value <%= currUser.getE01BCU()%> :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGX01" size="13" maxlength="12" value="<%= msgBasic.getE01FEGX01().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGX01',document.forms[0].E01FEGBNK.value,document.forms[0].BSECCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGX01" size="35" maxlength="30" value="<%= msgBasic.getD01FEGX01().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Swap Forward Position :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGX02" size="13" maxlength="12" value="<%= msgBasic.getE01FEGX02().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGX02',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGX02" size="35" maxlength="30" value="<%= msgBasic.getD01FEGX02().trim()%>" readonly>
            </td>
           </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Revaluation</H4>
 <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Gains in Revaluation :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGRVI" size="13" maxlength="12" value="<%= msgBasic.getE01FEGRVI().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGRVI',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGRVI" size="35" maxlength="30" value="<%= msgBasic.getD01FEGRVI().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Contra for Gains :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGRVC" size="13" maxlength="12" value="<%= msgBasic.getE01FEGRVC().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGRVC',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGRVC" size="35" maxlength="30" value="<%= msgBasic.getD01FEGRVC().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Losses in Revaluation :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGRLO" size="13" maxlength="12" value="<%= msgBasic.getE01FEGRLO().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGRLO',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGRLO" size="35" maxlength="30" value="<%= msgBasic.getD01FEGRLO().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Contra for Losses :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGRCL" size="13" maxlength="12" value="<%= msgBasic.getE01FEGRCL().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGRCL',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGRCL" size="35" maxlength="30" value="<%= msgBasic.getD01FEGRCL().trim()%>" readonly>
            </td>
           </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Profit & Loss</H4>
 <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Profit for Contracts :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGPAL" size="13" maxlength="12" value="<%= msgBasic.getE01FEGPAL().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGPAL',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGPAL" size="35" maxlength="30" value="<%= msgBasic.getD01FEGPAL().trim()%>" readonly>
            </td>
           </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Losses for Contracts :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01FEGLOS" size="13" maxlength="12" value="<%= msgBasic.getE01FEGLOS().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetLedger('E01FEGLOS',document.forms[0].E01FEGBNK.value,document.forms[0].E01FEGCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%">
              <input type="text" name="D01FEGLOS" size="35" maxlength="30" value="<%= msgBasic.getD01FEGLOS().trim()%>" readonly>
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
