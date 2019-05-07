<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Checks Issuance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "offBasic" class= "datapro.eibs.beans.EOF011501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if(userPO.getPurpose().equals("MAINTENANCE")) {
%>
<%
if(userPO.getHeader19().equals("0")) {
%>
	 builtNewMenu(of_p_opt);
<%
}
else {
%>
	 builtNewMenu(of_np_opt);
<%
}
%>
<%
}
%>
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
if(userPO.getPurpose().equals("MAINTENANCE")) {
  out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%>

<H3 align="center">Official Checks Issuance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="of_chk_basic,EOF0115"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Format :</b></div>
            </td>
            <td nowrap width="7%" >
              <div align="left">
                <input type="text" size="9" maxlength="9" name="E01OFMFTY" value="<%= offBasic.getE01OFMFTY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap colspan="3" width="77%" >
              <div align="left">
                <input type="text" size="45" maxlength="35" name="E01OFMDSC" value="<%= offBasic.getE01OFMDSC().trim()%>" readonly>
                </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
 <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="26%">
              <div align="right">Check Number :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01OFMCKN" size="9" maxlength="9" value="<%= offBasic.getE01OFMCKN().trim()%>" readonly>
            </td>
            <td nowrap width="24%">
              <div align="right">Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01OFMEM1" size="2" maxlength="2" value="<%= offBasic.getE01OFMEM1().trim()%>" readonly>
              <input type="text" name="E01OFMEM2" size="2" maxlength="2" value="<%= offBasic.getE01OFMEM2().trim()%>" readonly>
              <input type="text" name="E01OFMEM3" size="2" maxlength="2" value="<%= offBasic.getE01OFMEM3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%">
              <div align="right">Bank / Branch : </div>
            </td>
            <td nowrap>
              <input type="text" name="E01OFMBNK" size="3" maxlength="2" value="<%= offBasic.getE01OFMBNK().trim()%>" readonly>
              /
              <input type="text" name="E01OFMBRN" size="3" maxlength="3" value="<%= offBasic.getE01OFMBRN().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right">Currency : </div>
            </td>
            <td nowrap>
              <input type="text" name="E01OFMCCY" size="3" maxlength="3" value="<%= offBasic.getE01OFMCCY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="26%">
              <div align="right">Pay to the Order of :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMBNF" size="45" maxlength="30" value="<%= offBasic.getE01OFMBNF().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" height="23">
              <div align="right"></div>
            </td>
            <td nowrap height="23" colspan="3">
              <input type="text" name="E01OFMBN1" size="45" maxlength="30" value="<%= offBasic.getE01OFMBN1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%">
              <div align="right">Address :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMAD1" size="70" maxlength="70" value="<%= offBasic.getE01OFMAD1().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="18%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMAD2" size="70" maxlength="70" value="<%= offBasic.getE01OFMAD2().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMAD3" size="70" maxlength="70" value="<%= offBasic.getE01OFMAD3().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="26%" height="19">
              <div align="right">The amount of :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="text" name="E01OFMAMT" size="15" maxlength="15" value="<%= offBasic.getE01OFMAMT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <h4>Transaction Information</h4>
<table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="18%">
              <div align="right">Aplicant :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01OFMAPL" size="35" maxlength="30" value="<%= offBasic.getE01OFMAPL().trim()%>">
            </td>
            <td nowrap width="18%">
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="41%">
              <input type="text" name="E01OFMCUN" size="9" maxlength="9" value="<%= offBasic.getE01OFMCUN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCustomerDescId('E01OFMCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMAP1" size="35" maxlength="30" value="<%= offBasic.getE01OFMAP1().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="18%">
              <div align="right"> Remarks :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMCO1" size="70" maxlength="70" value="<%= offBasic.getE01OFMCO1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="18%">
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01OFMCO2" size="70" maxlength="70" value="<%= offBasic.getE01OFMCO2().trim()%>">
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">Payment Account :</div>
            </td>
            <td nowrap colspan="3">
        	  <table class="tableinfo" style="filter:''">
          		<tr id="trdark">
            		<td nowrap width="32%">
              			<div align="center">Concept</div>
           			 </td>
           			 <td nowrap width="14%">
              			<div align="center">Bank</div>
            		 </td>
            		<td nowrap width="17%">
              			<div align="center">Branch</div>
            		</td>
            		<td nowrap width="22%">
              			<div align="center">Currency</div>
            		</td>
            		<td nowrap width="15%">
             			 <div align="center">Reference</div>
            		</td>
          		</tr>
          		<tr id="trclear">
           			 <td nowrap width="32%" >
              			<div align="center">
                		<input type="text" name="E01DEBOPC" value="<%= offBasic.getE01DEBOPC().trim()%>" size="2" maxlength="2">
                		<input type="hidden" name="E01DEBGLN" value="<%= offBasic.getE01DEBGLN().trim()%>">
                		<input type="text" name="E01DEBCON" size="25" maxlength="25" readonly value="<%= offBasic.getE01DEBCON().trim()%>"
                 		 oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01DEBBNK.value,'','E01DEBGLN','E01DEBOPC','OF')">
						</div>
            		</td>
            		<td nowrap width="14%" >
              			<div align="center">
                		<input type="text" name="E01DEBBNK" size="2" maxlength="2" value="<%= offBasic.getE01DEBBNK().trim()%>" onkeypress="enterInteger()">
              			</div>
            		</td>
            		<td nowrap width="17%" >
              			<div align="center">
                		<input type="text" name="E01DEBBRN" size="3" maxlength="3" value="<%= offBasic.getE01DEBBRN().trim()%>" onkeypress="enterInteger()"
                		oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01DEBBNK.value,'','','','')">
						</div>
            		</td>
            		<td nowrap width="22%" >
              			<div align="center">
                		<input type="text" name="E01DEBCCY" size="3" maxlength="3" value="<%= offBasic.getE01DEBCCY().trim()%>"
               			 oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01DEBBNK.value,'','','','')">
						</div>
            		</td>
            		<td nowrap width="15%" >
              			<div align="center">
                		<input type="text" name="E01DEBACC" size="12" maxlength="12"  value="<%= offBasic.getE01DEBACC().trim()%>" onkeypress="enterInteger()"
                		oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E01DEBBNK.value,'','','','RT')" >
						</div>
            		</td>
          		</tr>
        	  </table>
            </td>
    	 </tr>
        </table>

      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
