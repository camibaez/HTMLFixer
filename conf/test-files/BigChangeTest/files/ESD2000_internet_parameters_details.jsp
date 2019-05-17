<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.ESD200001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

%>


<H3 align="center">Internet Banking Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="internet_parameters_details.jsp, ESD2000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESD2000" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
<INPUT TYPE=HIDDEN NAME="E01INTCCY" VALUE="USD">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Bank :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01INTBNK" size="3" maxlength="2"  value="<%= prevDetails.getE01INTBNK().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Description :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01INTDSC" size="35"  maxlength="30" value="<%= prevDetails.getE01INTDSC().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Number of Days for Password Expiration.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTEXP" maxlength="3" size="5" value="<%= prevDetails.getE01INTEXP().trim()%>" ></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Number of Characters Required in Password.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTPSL" maxlength="2" size="5" value="<%= prevDetails.getE01INTPSL().trim()%>" ></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Number of Repeated Characters Permitted.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTRPC" maxlength="2" size="5" value="<%= prevDetails.getE01INTRPC().trim()%>" ></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Number of Letters Allowed.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTLET" maxlength="2" size="5" value="<%= prevDetails.getE01INTLET().trim()%>" ></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Number of times a Failing Access Allowed.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTETM" maxlength="2" size="5" value="<%= prevDetails.getE01INTETM().trim()%>" ></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Number of Days Password Inactive.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDPI" maxlength="3" size="5" value="<%= prevDetails.getE01INTDPI().trim()%>" ></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Default Branch/Batch Number.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDBR" maxlength="3" size="5" value="<%= prevDetails.getE01INTDBR().trim()%>" >/<input type="text" name="E01INTBTH" maxlength="4" size="5" value="<%= prevDetails.getE01INTBTH().trim()%>" ></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Default G/L Account ACH.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDGA" maxlength="12" size="15" value="<%= prevDetails.getE01INTDGA().trim()%>" >
                                                     <a href="javascript:GetLedger('E01INTDGA',document.forms[0].E01INTBNK.value,document.forms[0].E01INTCCY.value, '')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Default G/L Account Time Deposit.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDGC" maxlength="12" size="15" value="<%= prevDetails.getE01INTDGC().trim()%>" >
                                                    <a href="javascript:GetLedger('E01INTDGC',document.forms[0].E01INTBNK.value,document.forms[0].E01INTCCY.value, '')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Default G/L Account Letter of Credit.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDGL" maxlength="12" size="15" value="<%= prevDetails.getE01INTDGL().trim()%>" >
                                                     <a href="javascript:GetLedger('E01INTDGL',document.forms[0].E01INTBNK.value,document.forms[0].E01INTCCY.value, '')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Default G/L Official Check.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTDGO" maxlength="12" size="15" value="<%= prevDetails.getE01INTDGO().trim()%>" >
                                                     <a href="javascript:GetLedger('E01INTDGO',document.forms[0].E01INTBNK.value,document.forms[0].E01INTCCY.value, '')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Default Cost Center Number.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTCCN" maxlength="6" size="8" value="<%= prevDetails.getE01INTCCN().trim()%>" >
                                                     <a href="javascript:GetCostCenter('E01INTCCN',document.forms[0].E01INTBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> </div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Transfer Fees Table.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTPRF" maxlength="2" size="5" value="<%= prevDetails.getE01INTPRF().trim()%>" >
                                                     <a href="javascript:GetCNTRLPRF('E01INTPRF','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a>
                                                     </div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>L/C Tariff Code.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTLCF" maxlength="2" size="5" value="<%= prevDetails.getE01INTLCF().trim()%>" >
                                                     <a href="javascript:GetTariffLC('E01INTLCF','');"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a> </div></td>
          </tr>
          
          
          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Customer Profile.</b></div></td>
            <td nowrap width="50%"><div align="left"><SELECT NAME="E01INTCPR">
             <OPTION VALUE="0" <%if (prevDetails.getE01INTCPR().equals("0")) {out.print("selected"); }%>>CUSTOMER NOT ALLOWED CHG PROFILE</OPTION>
             <OPTION VALUE="1" <%if (prevDetails.getE01INTCPR().equals("1")) {out.print("selected"); }%>>ALLOWED CHANGE PROFILE</OPTION>
             <OPTION VALUE="2" <%if (prevDetails.getE01INTCPR().equals("2")) {out.print("selected"); }%>>ONLY WHEN STATUS IS PENDING ACTIVATION</OPTION>
             </SELECT></TD>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Maximum Acumulated Type.</b></div></td>
            <td nowrap width="50%"><div align="left"><SELECT NAME="E01INTMXT">
             <OPTION VALUE="0" <%if (prevDetails.getE01INTMXT().equals("0")) {out.print("selected"); }%>>DAILY MAXIMUM AMOUNT PERMITTED</OPTION>
             <OPTION VALUE="1" <%if (prevDetails.getE01INTMXT().equals("1")) {out.print("selected"); }%>>WEEKLY MAXMIMUN AMOUNT PERMITTED</OPTION>
             </SELECT></TD>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Maximum Amount Permitted by Transaction.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTMXA" maxlength="13" size="20" value="<%= prevDetails.getE01INTMXA().trim()%>" ></div></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Maximum Acumulated Amount Permitted.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTAMX" maxlength="13" size="20" value="<%= prevDetails.getE01INTAMX().trim()%>" ></div></td>
          </tr>

          <tr id="trdark">
            <td nowrap width="50%"><div align="right"><b>Flat Fee in Excess of Transactions Limit.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTSVG" maxlength="13" size="15" value="<%= prevDetails.getE01INTSVG().trim()%>" ></div></td>
          </tr>

          <tr id="trclear">
            <td nowrap width="50%"><div align="right"><b>Number of Free Transaction allowed.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" name="E01INTNFA" maxlength="3" size="5" value="<%= prevDetails.getE01INTNFA().trim()%>" ></div></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
  <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
  </form>
</body>
</html>
