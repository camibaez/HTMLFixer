<html>
<head>
<title>Prepayment Interests</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


</head>
<jsp:useBean id="cdIntPrep" class="datapro.eibs.beans.EDL013009Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"  scope="session" />

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
<h3 align="center">Prepayment Interests<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_prep_int.jsp, EDL0130B"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="40">
  <INPUT TYPE=HIDDEN NAME="E09DEABNK" VALUE="<%= cdIntPrep.getE09DEABNK().trim()%>">
  <input type=HIDDEN name="E09DEAACD" value="<%= cdIntPrep.getE09DEAACD().trim()%>">
 <table class="tableinfo">
    <tr > 
      <td>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td width="23%" > 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td width="32%" > 
              <input type="text" size="9" maxlength="9" name="E09DEACUN" value="<%= cdIntPrep.getE09DEACUN().trim()%>" readonly>
            </td>
            <td width="30%" > 
              <div align="right"><b>Account :</b></div>
            </td>
            <td width="15%" > 
              <input type="text" size="12" maxlength="9" name="E09DEAACC" value="<%= cdIntPrep.getE09DEAACC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="23%"> 
              <div align="right"><b>Name :</b></div>
            </td>
            <td width="32%"> 
              <input type="text" size="45" maxlength="45" name="E09CUSNA1" value="<%= cdIntPrep.getE09CUSNA1().trim()%>" readonly>
            </td>
            <td width="30%"> 
              <div align="right"> <b>Product :</b></div>
            </td>
            <td width="15%"> 
              <input type="text" size="4" maxlength="4" name="E09DEAPRO" value="<%= cdIntPrep.getE09DEAPRO().trim()%>" readonly>
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
              <div align="right">Paid Interest:</div>
            </td>
            <td width="61%">
              <input type="text" name="E09TRNINT" size="15" maxlength="13" value="<%= cdIntPrep.getE09TRNINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%" > 
              <div align="right">Withholding :</div>
            </td>
            <td width="61%" > 
              <input type="text" name="E09TRNWHL" size="15" maxlength="13" value="<%= cdIntPrep.getE09TRNWHL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="39%"> 
              <div align="right">Sales Taxes:</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E09TRNTAX" size="15" maxlength="13" value="<%= cdIntPrep.getE09TRNTAX().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%"> 
              <div align="right">Total :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E09TRNTOT" size="15" maxlength="13" value="<%= cdIntPrep.getE09TRNTOT().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Prepayment Account</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellpadding=0 cellspacing=2 width="100%" >
          <tr id="trdark"> 
            <td width="31%" > 
              <div align="center">Concept</div>
            </td>
            <td width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td width="13%" > 
              <div align="center">Branch</div>
            </td>
            <td width="12%"  > 
              <div align="center">Currency</div>
            </td>
            <td width="21%"  > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="31%" > 
              <div align="center" nowrap> 
                <input type="text" size="3" maxlength="3" name="E09TRNOPC" value="<%= cdIntPrep.getE09TRNOPC().trim()%>">
                <input type=HIDDEN name="E09TRNGLN" value="<%= cdIntPrep.getE09TRNGLN().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E09TRNCON" value="<%= cdIntPrep.getE09TRNCON().trim()%>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E09TRNBNK.value,'','E09TRNGLN','E09TRNOPC',document.forms[0].E09DEAACD.value)">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= cdIntPrep.getE09TRNBNK().trim()%>" name="E09TRNBNK" onkeypress="enterInteger()">
              </div>
            </td>
            <td width="13%" > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" value="<%= cdIntPrep.getE09TRNBRN().trim()%>" name="E09TRNBRN" onkeypress="enterInteger()" 
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','')" >
              </div>
            </td>
            <td width="12%"  > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E09TRNCCY" value="<%= cdIntPrep.getE09TRNCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','')">
              </div>
            </td>
            <td width="21%"  > 
              <div align="center"> 
                <input type="text" size="16" maxlength="12" value="<%= cdIntPrep.getE09TRNACC().trim()%>" name="E09TRNACC" onkeypress="enterInteger()"
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E09TRNBNK.value,'','','','RT')">
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
