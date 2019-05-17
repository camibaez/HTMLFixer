<html>
<head>
<title>Stop Payments Issuance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "stop" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "rtStop" class= "datapro.eibs.beans.EDD018001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">


</script>

</head>

<body>


<%
 if ( !error.getERRNUM().equals("0")  ) {
  	 error.setERRNUM("0");
   out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>


<H3 align="center">Stop Payments Issuance</H3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rt_stop_pay_det.jsp , EDD0180">
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >
  <input type=HIDDEN name="SCREEN" value="4">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

   <input type=HIDDEN name="E01STPBNK" value="<%= userPO.getHeader10().trim()%>">
  <input type=HIDDEN name="E01STPBRN" value="<%= userPO.getHeader11().trim()%>">
  <input type=HIDDEN name="E01STPGLN" value="<%= userPO.getHeader12().trim()%>">

    <%
        int row;
		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
		  stop.setCurrentRow(row);
    %>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left"><b>
                <input type="text" readonly name="E01STPCUN" size="9" maxlength="9" value="<%= userPO.getHeader1().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader5().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01STPACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01STPCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader6().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><b> </b></p>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap width="44%" height="31">
              <div align="right">Sequence :</div>
            </td>
            <td nowrap width="15%" height="31"><b>
              <input type="text" name="E01STPSEQ" size="4" readonly maxlength="3" value="<%= userPO.getHeader19().trim()%>">
              </b></td>
            <td nowrap width="16%" height="31">&nbsp;</td>
            <td nowrap width="25%" height="31">&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="31">
              <div align="right">From Check :</div>
            </td>
            <td nowrap width="15%" height="31">
              <div align="left">
                <input type="text" name="E01STPFCK" size="10" maxlength="9" value="<%= rtStop.getE01STPFCK().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" height="31">
              <div align="right">To Check :</div>
            </td>
            <td nowrap width="25%" height="31"> <font size="2">
              <input type="text" name="E01STPTCK" size="10" maxlength="9" value="<%= rtStop.getE01STPTCK().trim()%>">
              ( If Apply )</font></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="19">
              <div align="right">Check Date :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <div align="left">
                <input type="text" name="E01STPCK1" size="3" maxlength="2" value="<%= rtStop.getE01STPCK1().trim()%>">
                <input type="text" name="E01STPCK2" size="3" maxlength="2" value="<%= rtStop.getE01STPCK2().trim()%>">
                <input type="text" name="E01STPCK3" size="3" maxlength="2" value="<%= rtStop.getE01STPCK3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="19">
              <div align="right">Check Amount :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="text" name="E01STPAMT" size="15" maxlength="13" value="<%= rtStop.getE01STPAMT().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="19">
              <div align="right">Remarks :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <div align="left">
                <input type="text" name="E01STPRMK" size="35" maxlength="23" value="<%= rtStop.getE01STPRMK().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="19">
              <div align="right">ACH Type Transaction :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="hidden" name="E01STPPRF" value="<%= rtStop.getE01STPPRF().trim()%>">
              <input type="radio" name="CE01STPPRF" value="Y" onClick="document.forms[0].E01STPPRF.value='Y'"
			  <%if(rtStop.getE01STPPRF().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE01STPPRF" value="N" onClick="document.forms[0].E01STPPRF.value='N'"
			  <%if(rtStop.getE01STPPRF().equals("N")) out.print("checked");%>>
              No <font size="2"> (*)</font> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="28">
              <div align="right">Customer Charges :</div>
            </td>
            <td nowrap height="28" colspan="3">
              <input type="hidden" name="E01STPCCF" value="Y">
              <input type="radio" name="CE01STPCCF" value="Y" onClick="document.forms[0].E01STPCCF.value='Y'" checked>
              Yes
              <input type="radio" name="CE01STPCCF" value="" onClick="document.forms[0].E01STPCCF.value='N'">
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="19">
              <div align="right">Payable Through Sub Account :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="text" name="E01STPPTS" size="7" maxlength="5" value="<%= rtStop.getE01STPPTS().trim()%>">
              <a href="javascript:GetSubAcc('E01STPPTS',document.forms[0].E01STPACC.value )"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="19">
              <div align="right">Purge After 180 Days Cycle :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="hidden" name="E01STPF04" value="Y">
              <input type="radio" name="CE01STPF04" value="Y" onClick="document.forms[0].E01STPF04.value='Y'" checked >
              Yes
              <input type="radio" name="CE01STPF04" value="N" onClick="document.forms[0].E01STPF04.value='N'" >
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="19">
              <div align="right">Cause :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <input type="text" name="E01STPF02" size="16" maxlength="14" value="<%= rtStop.getE01STPF02().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="19">
              <div align="right"></div>
            </td>
            <td nowrap height="19" colspan="3">&nbsp; </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="44%" height="19"><font size="2">(*) = &quot;Y&quot;
              ACH Type Transaction will be rejected</font></td>
            <td nowrap height="19" colspan="3">&nbsp;</td>
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
