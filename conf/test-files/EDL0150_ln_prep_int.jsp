<html>
<head>
<title>Prepaid Interest</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnIntPrep" class="datapro.eibs.beans.EDL015009Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

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
<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>
<h3 align="center">Prepaid Interest<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_prep_int.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="40">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" size="9" maxlength="9" name="E09DEACUN" value="<%= lnIntPrep.getE09DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" size="45" maxlength="45" name="E09CUSNA1" value="<%= lnIntPrep.getE09CUSNA1().trim()%>" readonly>
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="12" maxlength="12" name="E09DEAACC" value="<%= lnIntPrep.getE09DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E09DEAPRO" value="<%= lnIntPrep.getE09DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <h4>Financial Information</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td width="39%"> 
              <div align="right">Payment Interest :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E09TRNINT" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%" > 
              <div align="right">Deductions :</div>
            </td>
            <td width="61%" > 
              <input type="text" name="E09TRNDED" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNDED().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td width="39%">
              <div align="right">Taxes :</div>
            </td>
            <td width="61%">
              <input type="text" name="E09TRNIMP" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNIMP().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="39%">
              <div align="right">Charges :</div>
            </td>
            <td width="61%">
              <input type="text" name="E09TRNCOM" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNCOM().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="39%"> 
              <div align="right">Federal Taxes :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E09TRNIVA" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNIVA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%"> 
              <div align="right">Total :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E09TRNTOT" size="15" maxlength="15" value="<%= lnIntPrep.getE09TRNTOT().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Payment Via </h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellpadding= cellspacing=2 width="100%">
          <tr id="trdark"> 
            <td width="31%" > 
              <div align="center">Concept</div>
            </td>
            <td width="5%"  > 
              <div align="center">Bank</div>
            </td>
            <td width="13%" > 
              <div align="center">Branch</div>
            </td>
            <td width="12%"  > 
              <div align="center">Currency</div>
            </td>
            <td width="21%" > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="31%" > 
              <div align="center" nowrap> 
                <input type="text" name="E09TRNOPC" value="<%= lnIntPrep.getE09TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E09TRNGLN" value="<%= lnIntPrep.getE09TRNGLN().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E09TRNCON" value="<%= lnIntPrep.getE09TRNCON().trim()%>"
                        oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E09TRNBNK.value,'','E09TRNGLN','E09TRNOPC','10')">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= lnIntPrep.getE09TRNBNK().trim()%>" name="E09TRNBNK" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" value="<%= lnIntPrep.getE09TRNBRN().trim()%>" name="E09TRNBRN" onkeypress="enterInteger()"
                    oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','')" >
              </div>
            </td>
            <td width="12%"  > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E09TRNCCY" value="<%= lnIntPrep.getE09TRNCCY().trim()%>"
                      oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','')"> 
              </div>
            </td>
            <td width="21%"  > 
              <div align="center"> 
                <input type="text" size="16" maxlength="16" value="<%= lnIntPrep.getE09TRNACC().trim()%>" name="E09TRNACC" 
                                 oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','RT')"  onkeypress="enterInteger()">
					</div>
            </td>
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
