<html>
<head>
<title>Reference Code</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

 function  checkValues(){
 		document.forms[0].E02CNOCPC.value = document.forms[0].SEQ1.value + document.forms[0].SEQ2.value;
		document.forms[0].E02CNODCC.value = document.forms[0].PAG1.value + document.forms[0].SECPAG.value;
		document.forms[0].E02CNOSCY.value = "." + document.forms[0].PAG2.value + document.forms[0].SECPAG2.value;
		document.forms[0].submit();
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


<H3 align="center">System Reference Codes - Country Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_country_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
   <INPUT TYPE=HIDDEN NAME="E02CNOCPC" >
   <INPUT TYPE=HIDDEN NAME="E02CNODCC" >
   <INPUT TYPE=HIDDEN NAME="E02CNOSCY" >
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Classification :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOCFL" size="2" maxlength="1" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%" >
              <div align="right">Code :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" name="E02CNORCD" size="4" maxlength="3" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">FED Report BL/BC Code :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOFRP" size="6" maxlength="5" value="<%= refCodes.getE02CNOFRP().trim()%>" >
                *</div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Total Line # By Group/Seq/Pag :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOMXC" size="5" maxlength="4" value="<%= refCodes.getE02CNOMXC()%>" >
                /
                <input type="text" name="SEQ1" size="3" maxlength="2" value="<%= userPO.getHeader15()%>" >
                /
                <input type="text" name="PAG1" size="2" maxlength="1" value="<%= userPO.getHeader16()%>" >
                -
                <input type="text" name="SECPAG" size="2" maxlength="1" value="<%= userPO.getHeader17()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Other Country Detail/Seq/Pag :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOMNC" size="5" maxlength="4" value="<%= refCodes.getE02CNOMNC()%>" >
                /
                <input type="text" name="SEQ2" size="3" maxlength="2" value="<%= userPO.getHeader18()%>" >
                /
                <input type="text" name="PAG2" size="2" maxlength="1" value="<%= userPO.getHeader19()%>" >
                -
                <input type="text" name="SECPAG2" size="2" maxlength="1" value="<%= userPO.getHeader20()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Country Risk Percentage :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E02CNOMIC" size="4" maxlength="3" value="<%= refCodes.getE02CNOMIC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Residence Code :</div>
            </td>
            <td nowrap>
              <div align="left"><select name="E02CNOF01">
                  <option value="" <%if (refCodes.getE02CNOF01().equals("")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOF01().equals("1")) { out.print("selected"); }%>>United States</option>
				  <option value="2" <%if (refCodes.getE02CNOF01().equals("2")) { out.print("selected"); }%>>Chile</option>
				  <option value="4" <%if (refCodes.getE02CNOF01().equals("4")) { out.print("selected"); }%>>European Union</option>
				  <option value="5" <%if (refCodes.getE02CNOF01().equals("5")) { out.print("selected"); }%>>Grand Cayman</option>
                  <option value="3" <%if (refCodes.getE02CNOF01().equals("3")) { out.print("selected"); }%>>Other</option>

                </select></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">VAT (Value Added Tax) Rate :</div>
            </td>
            <td nowrap>
              <div align="left">
              	<input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">IRS Country Code :</div>
            </td>
            <td nowrap>
              <div align="left">
              	<input type="text" name="E02CNDBNK" size="3" maxlength="2" value="<%= refCodes.getE02CNDBNK()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Risk Level :</div>
            </td>
            <td nowrap>
              <div align="left"><select name="E02CNOTCF">
                  <option value="" <%if (refCodes.getE02CNOTCF().equals("")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOTCF().equals("1")) { out.print("selected"); }%>>Low</option>
				  <option value="2" <%if (refCodes.getE02CNOTCF().equals("2")) { out.print("selected"); }%>>Medium</option>
                  <option value="3" <%if (refCodes.getE02CNOTCF().equals("3")) { out.print("selected"); }%>>High</option>
                </select></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Zone Code :</div>
            </td>
            <td nowrap>
              <div align="left"><select name="E02CNOADI">
                  <option value="" <%if (refCodes.getE02CNOADI().equals("")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOADI().equals("1")) { out.print("selected"); }%>>Luxembourg</option>
				  <option value="2" <%if (refCodes.getE02CNOADI().equals("2")) { out.print("selected"); }%>>Euro Zone (Except Lux)</option>
				  <option value="3" <%if (refCodes.getE02CNOADI().equals("3")) { out.print("selected"); }%>>Other Zone A</option>
                  <option value="4" <%if (refCodes.getE02CNOADI().equals("4")) { out.print("selected"); }%>>Zone B</option>
                </select></div>
            </td>

          </tr>

          <tr id="trclear">
          	<td nowrap colspan="2">&nbsp;</td>
          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">European Saving Tax Directive :</div>
            </td>
            <td nowrap>
              <div align="left"><INPUT type="text" name="E02CNOCHG"
					size="9" maxlength="9" value="<%= refCodes.getE02CNOCHG()%>"></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">ESTD General Ledger :</div>
            </td>
            <td nowrap>
              <div align="left">
               	<input type="text" name="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>">
              	<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">(*) Example : (Forms BL1/BC) : </div>
            </td>
            <td nowrap>EUROPE</td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Austria :</div>
            </td>
            <td nowrap>1018-9 (Enter 10189)</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=button name="Button" value="Submit" onClick="checkValues()">
  </p>
  </form>
</body>
</html>
