<html>
<head>
<title>Certificates of Deposit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="cdRenov" class="datapro.eibs.beans.EDL013008Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_m_opt);


</SCRIPT>


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
<h3 align="center">Roll-Over Instructions <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_renov_options,EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="34">
  <INPUT TYPE=HIDDEN NAME="E08DEABNK" VALUE="<%= cdRenov.getE08DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E08DEACCY" VALUE="<%= cdRenov.getE08DEACCY().trim()%>">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Portfolio/Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" onkeypress="enterInteger()" name="E08DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" onkeypress="enterInteger()" name="E08CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" onkeypress="enterInteger()" name="E08DEAACC" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
                <input type="text" name="E08DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Roll-Over Instructions</h4>
  <table class="tableinfo">
    <tr >
      <td>
        <table cellpadding=2 cellspacing=0 align=center width=100% bordercolor="#000000">
          <tr id="trdark">
            <td width=39>&nbsp;</td>
            <td width="311">
              <div align="left" nowrap >Renewal Rate :
                <input type="text"  name="E08DEAROR" size="9" maxlength="9" value="<%= cdRenov.getE08DEAROR().trim()%>" >
                <select name="E08DEAHTM">
                  <option value="0" <% if (!(cdRenov.getE08DEAHTM().equals("1") || cdRenov.getE08DEAHTM().equals("2")||
					cdRenov.getE08DEAHTM().equals("3") || cdRenov.getE08DEAHTM().equals("4")))out.print("selected"); %>>None</option>
                  <option value="1" <% if (cdRenov.getE08DEAHTM().equals("1")) out.print("selected"); %>>Add to Base Rate</option>
                  <option value="2" <% if (cdRenov.getE08DEAHTM().equals("2")) out.print("selected"); %>>Substract from Base Rate</option>
                  <option value="3" <% if (cdRenov.getE08DEAHTM().equals("3")) out.print("selected"); %>>Replace Base Rate</option>
                  <option value="4" <% if (cdRenov.getE08DEAHTM().equals("4")) out.print("selected"); %>>Mantain Original Base Rate</option>
                </select>
              </div>
            </td>
            <td width="240">
              <div align="left" nowrap >Confirmation Via :
                <select name="E08DEAF02">
                  <option value="" <% if (!(cdRenov.getE08DEAF02().equals("S") || cdRenov.getE08DEAF02().equals("P")||
					cdRenov.getE08DEAF02().equals("N")))out.print("selected"); %>>
                  </option>
                  <option value="S" <% if (cdRenov.getE08DEAF02().equals("S")) out.print("selected"); %>>Swift</option>
                  <option value="P" <% if (cdRenov.getE08DEAF02().equals("P")) out.print("selected"); %>>Print</option>
                  <option value="N" <% if (cdRenov.getE08DEAF02().equals("N")) out.print("selected"); %>>None</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td width=39>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b> <b> </b>
              <input type="radio" name="E08DEAROC" value="A" checked <%if (!(cdRenov.getE08DEAROC().equals("B")||
				cdRenov.getE08DEAROC().equals("C")||cdRenov.getE08DEAROC().equals("D")||
				cdRenov.getE08DEAROC().equals("E")||cdRenov.getE08DEAROC().equals("F")||
				cdRenov.getE08DEAROC().equals("G")||cdRenov.getE08DEAROC().equals("H")||
				cdRenov.getE08DEAROC().equals("I")||cdRenov.getE08DEAROC().equals("J")||
				cdRenov.getE08DEAROC().equals("K")||cdRenov.getE08DEAROC().equals("P")||
				cdRenov.getE08DEAROC().equals("S"))) out.print("checked");%>>
              A</b></td>
            <td colspan="2"> Principal plus Interest will be roll-over for the
              same period of time. </td>
          </tr>
          <tr id="trclear">
            <td width=39>&nbsp;</td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39 height="32"><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="B"
			  <%if (cdRenov.getE08DEAROC().equals("B")) out.print("checked");%>>
              </b>B</b></td>
            <td height="32" colspan="2" > Interest will be paid to
              <input type="hidden" name="E08BBBFLG" value="">
              <input type="radio" name="CE08BBBFLG" value="1" onClick="document.forms[0].E08BBBFLG.value='1'"
			  <%if (cdRenov.getE08BBBFLG().equals("1")) out.print("checked");%>>
              Account (Retail, Savings, etc.) or to
              <input type="radio" name="CE08BBBFLG" value="2" onClick="document.forms[0].E08BBBFLG.value='2'"
			  <%if (cdRenov.getE08BBBFLG().equals("2")) out.print("checked");%>>
              other Certificate that will have as a number
              <input type="text" onkeypress="enterInteger()" name="E08BBBACC" size="12" maxlength="9" value="<%= cdRenov.getE08BBBACC().trim()%>">
              <a href="javascript:GetAccount('E08BBBACC',document.forms[0].E08DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              . Principal will be roll-over for the same period of time.</td>
          </tr>
          <tr id="trclear">
            <td width=39>&nbsp;</td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39 height="44"><b><b> </b><b> <b><b>
              <input type="radio" name="E08DEAROC" value="C"
			  <%if (cdRenov.getE08DEAROC().equals("C")) out.print("checked");%>>
              </b></b></b>C</b></td>
            <td height="44" colspan="2" > Interest will be paid to the General
              Ledger number
              <input type="text" onkeypress="enterInteger()" name="E08CCCGLN" size="16" maxlength="12" value="<%= cdRenov.getE08CCCGLN().trim()%>">
              <a href="javascript:GetLedger('E08CCCGLN',document.forms[0].E08DEABNK.value,document.forms[0].E08DEACCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              , generating an
              <input type="hidden" name="E08CCCFLV" value="">
              <input type="radio" name="CE08CCCFLV" value="C" onClick="document.forms[0].E08CCCFLV.value='C'"
			  <%if (cdRenov.getE08CCCFLV().equals("C")) out.print("checked");%>>
              Official Check, or generated for
              <input type="radio" name="CE08CCCFLV" value="V" onClick="document.forms[0].E08CCCFLV.value='V'"
			  <%if (cdRenov.getE08CCCFLV().equals("V")) out.print("checked");%>>
              via Funds Transfer
              <select name="E08CCCPVI">
                <option value="" <% if (!(cdRenov.getE08CCCPVI().equals("F") || cdRenov.getE08CCCPVI().equals("Q")||
				cdRenov.getE08CCCPVI().equals("T") ||cdRenov.getE08CCCPVI().equals("1")||cdRenov.getE08CCCPVI().equals("2")
				||cdRenov.getE08CCCPVI().equals("3")))out.print("selected"); %>>
                </option>
                <option value="F" <% if (cdRenov.getE08CCCPVI().equals("F")){out.print("selected");} %>>FED
                </option>
                <option value="Q" <% if (cdRenov.getE08CCCPVI().equals("Q")){out.print("selected");} %>>Cupons
                Emision </option>
                <option value="T" <% if (cdRenov.getE08CCCPVI().equals("T")){out.print("selected");} %>>Telex
                </option>
                <option value="1" <% if (cdRenov.getE08CCCPVI().equals("1")){out.print("selected");} %>>Swift
                Format MT-103</option>
                <option value="2" <% if (cdRenov.getE08CCCPVI().equals("2")){out.print("selected");} %>>Swift
                Format MT-200</option>
                <option value="3" <% if (cdRenov.getE08CCCPVI().equals("3")){out.print("selected");} %>>Swift
                Format MT-202</option>
              </select>
              . Principal will be roll-over for the same period of time.</td>
          </tr>
          <tr id="trclear">
            <td width=39>&nbsp;</td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39 height="46"><b><b> </b><b><b><b>
              <input type="radio" name="E08DEAROC" value="D"
			  <%if (cdRenov.getE08DEAROC().equals("D")) out.print("checked");%>>
              </b></b></b>D</b></td>
            <td height="46" colspan="2" > When Certificate matures cancel the
              Deposit plus Interest payable to the General Ledger number
              <input type="text" onkeypress="enterInteger()" name="E08DDDGLN" size="16" maxlength="12" value="<%= cdRenov.getE08DDDGLN().trim()%>">
              <a href="javascript:GetLedger('E08DDDGLN',document.forms[0].E08DEABNK.value,document.forms[0].E08DEACCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              , generating an
              <input type="hidden" name="E08DDDFLV" value="">
              <input type="radio" name="CE08DDDFLV" value="C" onClick="document.forms[0].E08DDDFLV.value='C'"
			  <%if (cdRenov.getE08DDDFLV().equals("C")) out.print("checked");%>>
              Official Check, or generated for
              <input type="radio" name="CE08DDDFLV" value="" onClick="document.forms[0].E08DDDFLV.value='V'"
			  <%if (cdRenov.getE08DDDFLV().equals("V")) out.print("checked");%>>
              via Funds Transfer
              <select name="E08DDDPVI">
                <option value="" <% if (!(cdRenov.getE08DDDPVI().equals("F") || cdRenov.getE08DDDPVI().equals("Q")||
				cdRenov.getE08DDDPVI().equals("T") ||cdRenov.getE08DDDPVI().equals("1")||cdRenov.getE08DDDPVI().equals("2")
				||cdRenov.getE08DDDPVI().equals("3")))out.print("selected"); %>>
                </option>
                <option value="F" <% if (cdRenov.getE08DDDPVI().equals("F")){out.print("selected");} %>>FED
                </option>
                <option value="Q" <% if (cdRenov.getE08DDDPVI().equals("Q")){out.print("selected");} %>>Cupons
                Emision</option>
                <option value="T" <% if (cdRenov.getE08DDDPVI().equals("T")){out.print("selected");} %>>Telex
                </option>
                <option value="1" <% if (cdRenov.getE08DDDPVI().equals("1")){out.print("selected");} %>>Swift
                Format MT-103</option>
                <option value="2" <% if (cdRenov.getE08DDDPVI().equals("2")){out.print("selected");} %>>Swift
                Format MT-200</option>
                <option value="3" <% if (cdRenov.getE08DDDPVI().equals("3")){out.print("selected");} %>>Swift
                Format MT-202</option>
              </select>
              . </td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39 height="36"><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="E"
			  <%if (cdRenov.getE08DEAROC().equals("E")) out.print("checked");%>>
              </b>E</b></td>
            <td height="36" colspan="2" >When Certificate matures cancel the Deposit
              crediting to the Account number
              <input type="text" onkeypress="enterInteger()" name="E08EEEACC" size="12" maxlength="9" value="<%= cdRenov.getE08EEEACC().trim()%>">
              <a href="javascript:GetAccount('E08EEEACC',document.forms[0].E08DEABNK.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>(Retail,
              Savings, etc.) . </td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="F"
			  <%if (cdRenov.getE08DEAROC().equals("F")) out.print("checked");%>>
              </b>F</b></td>
            <td colspan="2" > When Certificate matures roll-over the Deposit plus
              Interest,
              <input type="hidden" name="E08FFFRPT" value="">
              <input type="radio" name="CE08FFFRPT" value="DR" onClick="document.forms[0].E08FFFRPT.value='DR'"
			  <%if (cdRenov.getE08FFFRPT().equals("DR")) out.print("checked");%>>
              increasing it or
              <input type="radio" name="CE08FFFRPT" value="CR" onClick="document.forms[0].E08FFFRPT.value='CR'"
			  <%if (cdRenov.getE08FFFRPT().equals("CR")) out.print("checked");%>>
              decreasing it in
              <input type="text" onkeypress="enterInteger()" name="E08FFFROA" size="15" maxlength="13" value="<%= cdRenov.getE08FFFROA().trim()%>">
              against the Account number
              <input type="text" onkeypress="enterInteger()" name="E08FFFACC" size="12" maxlength="9" value="<%= cdRenov.getE08FFFACC().trim()%>">
              <a href="javascript:GetAccount('E08FFFACC',document.forms[0].E08DEABNK.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              (Retail, Savings, etc.) . </td>
          </tr>
          <tr id="trclear">
            <td width=39 height="19">&nbsp;</td>
            <td height="19" colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39 height="19"><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="G"
			  <%if (cdRenov.getE08DEAROC().equals("G")) out.print("checked");%>>
              </b>G</b></td>
            <td height="19" colspan="2" >When Certificate matures roll-over the
              Deposit plus Interest, by the same period of time, decreasing interests
              in
              <input type="text" onkeypress="enterInteger()" name="E08GGGROA" size="15" maxlength="13" value="<%= cdRenov.getE08GGGROA().trim()%>">
              and crediting to the Account number
              <input type="text" onkeypress="enterInteger()" name="E08GGGACC" size="12" maxlength="9" value="<%= cdRenov.getE08GGGACC().trim()%>">
              <a href="javascript:GetAccount('E08GGGACC',document.forms[0].E08DEABNK.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              (Retail, Savings, etc.) . </td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="H"
			  <%if (cdRenov.getE08DEAROC().equals("H")) out.print("checked");%>>
              </b>H</b></td>
            <td colspan="2" >
              <p>Interest will be paid in
                <input type="text" onkeypress="enterInteger()" name="E08HHHROY" size="3" maxlength="3" value="<%= cdRenov.getE08HHHROY().trim()%>">
                <select name="E08HHHODA">
                  <option value="" <% if (!(cdRenov.getE08HHHODA().equals("D") || cdRenov.getE08HHHODA().equals("M")||
                cdRenov.getE08HHHODA().equals("Q")||cdRenov.getE08HHHODA().equals("S")))out.print("selected"); %>>
                  </option>
                  <option value="D" <% if (cdRenov.getE08HHHODA().equals("D")){out.print("selected");} %>>Days</option>
                  <option value="M" <% if (cdRenov.getE08HHHODA().equals("M")){out.print("selected");} %>>Monthly</option>
                  <option value="Q" <% if (cdRenov.getE08HHHODA().equals("Q")){out.print("selected");} %>>Quarterly</option>
                  <option value="S" <% if (cdRenov.getE08HHHODA().equals("S")){out.print("selected");} %>>Semester</option>
                </select>
                to the
                <input type="hidden" name="E08HHHFLG" value="">
                <input type="radio" name="CE08HHHFLG" value="1" onClick="document.forms[0].E08HHHFLG.value='1'"
			  <%if (cdRenov.getE08HHHFLG().equals("1")) out.print("checked");%>>
                Account (Retail, Savings, etc.) , or to the
                <input type="radio" name="CE08HHHFLG" value="2" onClick="document.forms[0].E08HHHFLG.value='2'"
			  <%if (cdRenov.getE08HHHFLG().equals("2")) out.print("checked");%>>
                Certificate, will have as a number
                <input type="text" onkeypress="enterInteger()" name="E08HHHACC" size="12" maxlength="9" value="<%= cdRenov.getE08HHHACC().trim()%>">
                <a href="javascript:GetAccount('E08HHHACC',document.forms[0].E08DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                . Principal will be roll-over for the same period of time.</p>
            </td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="I"
			  <%if (cdRenov.getE08DEAROC().equals("I")) out.print("checked");%>>
              </b>I</b></td>
            <td colspan="2" > Interest will be paid in
              <input type="text" onkeypress="enterInteger()" name="E08IIIROY" size="3" maxlength="3" value="<%= cdRenov.getE08IIIROY().trim()%>">
              <select name="E08IIIODA">
                <option value="" <% if (!(cdRenov.getE08IIIODA().equals("D") || cdRenov.getE08IIIODA().equals("M")||
                cdRenov.getE08IIIODA().equals("Q")||cdRenov.getE08IIIODA().equals("S")))out.print("selected"); %>>
                </option>
                <option value="D" <% if (cdRenov.getE08IIIODA().equals("D")){out.print("selected");} %>>Days</option>
                <option value="M" <% if (cdRenov.getE08IIIODA().equals("M")){out.print("selected");} %>>Monthly</option>
                <option value="Q" <% if (cdRenov.getE08IIIODA().equals("Q")){out.print("selected");} %>>Quarterly</option>
                <option value="S" <% if (cdRenov.getE08IIIODA().equals("S")){out.print("selected");} %>>Semester</option>
              </select>
              to the General Ledger number
              <input type="text" onkeypress="enterInteger()" name="E08IIIGLN" size="16" maxlength="12" value="<%= cdRenov.getE08IIIGLN().trim()%>">
              <a href="javascript:GetLedger('E08IIIGLN',document.forms[0].E08DEABNK.value,document.forms[0].E08DEACCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              , generating an
              <input type="hidden" name="E08IIIFLV" value="">
              <input type="radio" name="CE08IIIFLV" value="C" onClick="document.forms[0].E08IIIFLV.value='C'"
			  <%if (cdRenov.getE08IIIFLV().equals("C")) out.print("checked");%>>
              Official Check, or generated for
              <input type="radio" name="CE08IIIFLV" value="" onClick="document.forms[0].E08IIIFLV.value='V'"
			  <%if (cdRenov.getE08IIIFLV().equals("V")) out.print("checked");%>>
              via Funds Transfer
              <select name="E08IIIPVI">
                <option value="" <% if (!(cdRenov.getE08IIIPVI().equals("F") || cdRenov.getE08IIIPVI().equals("Q")||
				cdRenov.getE08IIIPVI().equals("T") ||cdRenov.getE08IIIPVI().equals("1")||cdRenov.getE08IIIPVI().equals("2")
				||cdRenov.getE08IIIPVI().equals("3")))out.print("selected"); %>>
                </option>
                <option value="F" <% if (cdRenov.getE08IIIPVI().equals("F")){out.print("selected");} %>>FED
                </option>
                <option value="Q" <% if (cdRenov.getE08IIIPVI().equals("Q")){out.print("selected");} %>>Cupons
                Emision </option>
                <option value="T" <% if (cdRenov.getE08IIIPVI().equals("T")){out.print("selected");} %>>Telex
                </option>
                <option value="1" <% if (cdRenov.getE08IIIPVI().equals("1")){out.print("selected");} %>>Swift
                Format MT-103</option>
                <option value="2" <% if (cdRenov.getE08IIIPVI().equals("2")){out.print("selected");} %>>Swift
                Format MT-200</option>
                <option value="3" <% if (cdRenov.getE08IIIPVI().equals("3")){out.print("selected");} %>>Swift
                Format MT-202</option>
              </select>
              . Principal will be roll-over for the same period of time.</td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="J"
			  <%if (cdRenov.getE08DEAROC().equals("J")) out.print("checked");%>>
              </b>J</b></td>
            <td colspan="2" > Interest plus Principal will be paid to the Certificate
              of Deposit number
              <input type="text" onkeypress="enterInteger()" name="E08JJJACC" size="12" maxlength="12" value="<%= cdRenov.getE08JJJACC().trim()%>">
              <a href="javascript:GetAccount('E08JJJACC',document.forms[0].E08DEABNK.value,'CD','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              . There is no renovation in this option.</td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="K"
			  <%if (cdRenov.getE08DEAROC().equals("K")) out.print("checked");%>>
              </b>K</b></td>
            <td colspan="2" > Interest will be paid
              <input type="hidden" name="E08KKKFL1" value="">
              <input type="radio" name="CE08KKKFL1" value="1" onClick="document.forms[0].E08KKKFL1.value='1'"
			  <%if (cdRenov.getE08KKKFL1().equals("1")) out.print("checked");%>>
              by
              <select name="E08KKKODA">
                <option value="" <% if (!(cdRenov.getE08KKKODA().equals("D") || cdRenov.getE08KKKODA().equals("M")||
                cdRenov.getE08KKKODA().equals("Q")||cdRenov.getE08KKKODA().equals("S")))out.print("selected"); %>>
                </option>
                <option value="D" <% if (cdRenov.getE08KKKODA().equals("D")){out.print("selected");} %>>Day(s)</option>
                <option value="M" <% if (cdRenov.getE08KKKODA().equals("M")){out.print("selected");} %>>Monthly</option>
                <option value="Q" <% if (cdRenov.getE08KKKODA().equals("Q")){out.print("selected");} %>>Quarterly</option>
                <option value="S" <% if (cdRenov.getE08KKKODA().equals("S")){out.print("selected");} %>>Semester</option>
              </select>
              on day
              <input type="text" onkeypress="enterInteger()" name="E08KKKROY" size="3" maxlength="3" value="<%= cdRenov.getE08KKKROY().trim()%>">
              of the month or
              <input type="radio" name="CE08KKKFL1" value="2" onClick="document.forms[0].E08KKKFL1.value='2'"
			  <%if (cdRenov.getE08KKKFL1().equals("2")) out.print("checked");%>>
              at the end of the month to
              <input type="hidden" name="E08KKKFLG" value="">
              <input type="radio" name="CE08KKKFLG" value="1" onClick="document.forms[0].E08KKKFLG.value='1'"
			  <%if (cdRenov.getE08KKKFLG().equals("1")) out.print("checked");%>>
              Account(Retail, Savings, etc.) or to a
              <input type="radio" name="CE08KKKFLG" value="2" onClick="document.forms[0].E08KKKFLG.value='2'"
			  <%if (cdRenov.getE08KKKFLG().equals("2")) out.print("checked");%>>
              Certificate, will have as a number
              <input type="text" onkeypress="enterInteger()" name="E08KKKACC" size="12" maxlength="9" value="<%= cdRenov.getE08KKKACC().trim()%>">
              <a href="javascript:GetAccount('E08KKKACC',document.forms[0].E08DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              .</td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="P"
			  <%if (cdRenov.getE08DEAROC().equals("P")) out.print("checked");%>>
              </b>P</b></td>
            <td colspan="2" > Deposit has no renovations Instructions, it will
              be automatically roll-over after the waiting period. </td>
          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
    <%--  New rolover code "R" requested for Banco Bradesco. Added by Henry G.   --%>
          <tr id="trdark">
          	  <td width=39><b><b> </b><b>
              <input type="radio" name="E08DEAROC" value="R"
			  <%if (cdRenov.getE08DEAROC().equals("R")) out.print("checked");%>>
              </b>R</b></td>
            <td colspan="2" > Principal plus interest will be paid to the default cash account number <input type="text" onkeypress="enterInteger()" name="E08RRRACC" size="12" maxlength="9" value="<%= cdRenov.getE08RRRACC().trim()%>">
              <a href="javascript:GetAccount('E08RRRACC',document.forms[0].E08DEABNK.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>and  it will roll-over for the same period of time at the current rate debiting principal plus interest from the cash account.</td>

          </tr>
          <tr id="trclear">
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>

          <tr id="trdark">
            <td width=39><b><b> </b><b>
              <input id="typeS" type="radio" name="E08DEAROC" value="S"
			  <%if (cdRenov.getE08DEAROC().equals("S")) out.print("checked");%>>
              </b>S</b></td>
            <td colspan="2" >Principal and Interest will be paid based on schedule
              of payments <a href="javascript:document.forms[0].typeS.click();showCDPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" alt="Payment Plan" align="absmiddle" border="0" ></a>
              , and will be paid to the General Ledger number
              <input type="text" onKeyPress="enterInteger()" name="E08SSSGLN" size="16" maxlength="12" value="<%= cdRenov.getE08SSSGLN().trim()%>">
              <a href="javascript:GetLedger('E08SSSGLN',document.forms[0].E08DEABNK.value,document.forms[0].E08DEACCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              , or to the Retail Account
              <input type="text" onKeyPress="enterInteger()" name="E08SSSACC" size="12" maxlength="9" value="<%= cdRenov.getE08SSSACC().trim()%>">
              <a href="javascript:GetAccount('E08SSSACC',document.forms[0].E08DEABNK.value,'RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              , generating an
              <input type="hidden" name="E08SSSFLV" value="">
              <input type="radio" name="CE08SSSFLV" value="C" onClick="document.forms[0].E08SSSFLV.value='C'"
			  <%if (cdRenov.getE08SSSFLV().equals("C")) out.print("checked");%>>
              Official Check, or generated for
              <input type="radio" name="CE08SSSFLV" value="V" onClick="document.forms[0].E08SSSFLV.value='V'"
			  <%if (cdRenov.getE08SSSFLV().equals("V")) out.print("checked");%>>
              via Funds Transfer
              <select name="E08SSSPVI">
                <option value="" <% if (!(cdRenov.getE08SSSPVI().equals("F") || cdRenov.getE08SSSPVI().equals("Q")||
				cdRenov.getE08SSSPVI().equals("T") ||cdRenov.getE08SSSPVI().equals("1")||cdRenov.getE08SSSPVI().equals("2")
				||cdRenov.getE08SSSPVI().equals("3")))out.print("selected"); %>>
                </option>
                <option value="F" <% if (cdRenov.getE08SSSPVI().equals("F")){out.print("selected");} %>>FED
                </option>
                <option value="Q" <% if (cdRenov.getE08SSSPVI().equals("Q")){out.print("selected");} %>>Cupons
                Emision </option>
                <option value="T" <% if (cdRenov.getE08SSSPVI().equals("T")){out.print("selected");} %>>Telex
                </option>
                <option value="1" <% if (cdRenov.getE08SSSPVI().equals("1")){out.print("selected");} %>>Swift
                Format MT-103</option>
                <option value="2" <% if (cdRenov.getE08SSSPVI().equals("2")){out.print("selected");} %>>Swift
                Format MT-200</option>
                <option value="3" <% if (cdRenov.getE08SSSPVI().equals("3")){out.print("selected");} %>>Swift
                Format MT-202</option>
              </select>
              . </td>
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
