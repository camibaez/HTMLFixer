<html>
<head>
<title>Collateral Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaMant" class= "datapro.eibs.beans.ERA001001Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

 <%
   if ( !userPO.getPurpose().equals("NEW") ) {
 %>
<SCRIPT Language="Javascript">
   
    builtNewMenu(colla_A_opt);
    
</SCRIPT>
  <%
   }
  %>
<SCRIPT Language="Javascript">

function hidePoliza(value){
 if (value) {
   Poliza.style.display="";}
 else{
   Poliza.style.display="none"; }
}

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%> 
<h3 align="center">Collaterals - Basic Information <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ERA0080_ga_maint.jsp"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010" >
<%
   if ( !userPO.getPurpose().equals("NEW") ) {
 %>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <%
   } else {
  %>
   <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
   <%
    }
    %>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="8%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E01ROCCUN" size="9" maxlength="9" readonly value="<%= gaMant.getE01ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="13%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" width="41%" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45"  readonly value="<%= gaMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Bank /Branch /Currency :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01ROCBNK" size="2" maxlength="2"  readonly value="<%= gaMant.getE01ROCBNK().trim()%>" >
              / 
              <input type="text" name="E01ROCBRN" size="4" maxlength="3" readonly value="<%= gaMant.getE01ROCBRN().trim()%>" >
              / 
              <input type="text" name="E01ROCCCY" size="4" maxlength="3" readonly value="<%= gaMant.getE01ROCCCY().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="23" > 
              <div align="right">G/L Account :</div>
            </td>
            <td nowrap colspan="3" height="23" > <a href="javascript:GetBranch('E01WLNBRN',document.forms[0].E01WLNBNK.value)"> 
              </a> 
              <input type="text" name="E01ROCGLN" size="16" maxlength="16" readonly value="<%= gaMant.getE01ROCGLN().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" height="23" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap colspan="3" height="23" ><a href="javascript:GetBranch('E01WLNBRN',document.forms[0].E01WLNBNK.value)"> 
              </a> 
              <input type="text" name="E01ROCREF" size="12" maxlength="12" value="<%= gaMant.getE01ROCREF().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="40" > 
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap colspan="3" height="40" ><a href="javascript:GetBranch('E01WLNBRN',document.forms[0].E01WLNBNK.value)"> 
              <input type="text" name="E01ROCTYP" size="4" maxlength="4" readonly value="<%= gaMant.getE01ROCTYP().trim()%>" >
              </a> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" height="23" > 
              <div align="right"> Collateral Owner :</div>
            </td>
            <td nowrap colspan="3" height="23" > 
              <input type="text" name="E01ROCOWN" size="4" maxlength="4" readonly value="<%= gaMant.getE01ROCOWN().trim()%>" >
              / 
              <input type="text" name="E01CUSNAM" size="35" maxlength="35" readonly value="<%= gaMant.getE01CUSNAM().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ROCDES" size="35" maxlength="35" readonly value="<%= gaMant.getE01ROCDES().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"> Location :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01ROCLOC" size="35" maxlength="35" readonly value="<%= gaMant.getE01ROCLOC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Summary</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Purchased Price / Unit:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCPPU" size="9" maxlength="2" readonly value="<%= gaMant.getE01ROCPPU().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Units / Value:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCNUN" size="10" maxlength="9" value="<%= gaMant.getE01ROCNUN().trim()%>" >
              / 
              <input type="text" name="E01ROCMPU" size="10" maxlength="9" value="<%= gaMant.getE01ROCMPU().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" height="34" > 
              <div align="right">Appraised Value:</div>
            </td>
            <td nowrap width="19%" height="34" > 
              <input type="text" name="E01ROCAPA" size="15" maxlength="15" value="<%= gaMant.getE01ROCAPA().trim()%>" >
            </td>
            <td nowrap width="20%" height="34" > 
              <div align="right">Exchange Rate:</div>
            </td>
            <td nowrap width="38%" height="34" > 
              <input type="text" name="E01ROCOFX" size="5" maxlength="5" readonly value="<%= gaMant.getE01ROCOFX().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Ineligible Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCINA" size="15" maxlength="15" readonly value="<%= gaMant.getE01ROCINA().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Appraised by :</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCABY" size="15" maxlength="9" readonly value="<%= gaMant.getE01ROCABY().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Eligible Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCLIV" size="15" maxlength="15" readonly value="<%= gaMant.getE01ROCLIV().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Last Appraisal:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCAP1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCAP1().trim()%>" >
              <input type="text" name="E01ROCAP2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCAP2().trim()%>" >
              <input type="text" name="E01ROCAP3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCAP3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Advance Rate Percent:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCRAT" size="10" maxlength="9" value="<%= gaMant.getE01ROCRAT().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">% Max Collateral:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCCPE" size="16" maxlength="16" value="<%= gaMant.getE01ROCCPE().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Face Value:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCFAA" size="15" maxlength="15" readonly value="<%= gaMant.getE01ROCFAA().trim()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Opening Date:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCOP1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCOP1().trim()%>" >
              <input type="text" name="E01ROCOP2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCOP2().trim()%>" >
              <input type="text" name="E01ROCOP3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCOP3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%" > 
              <div align="right">Insurance Policy: </div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCINF" size="3" maxlength="3" value="<%= gaMant.getE01ROCINF()%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Maturity Date:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCMT1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMT1().trim()%>" >
              <input type="text" name="E01ROCMT2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMT2().trim()%>" >
              <input type="text" name="E01ROCMT3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMT3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="right">Insurance Collaterals:</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ROCEND" size="3" maxlength="3" value="<%= gaMant.getE01ROCEND()%>" >
            </td>
            <td nowrap width="20%" >
              <div align="right">Revision Date:</div>
            </td>
            <td nowrap width="38%" >
              <input type="text" name="E01ROCRE1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCRE1().trim()%>" >
              <input type="text" name="E01ROCRE2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCRE2().trim()%>" >
              <input type="text" name="E01ROCRE3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCRE3().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  <div id="Poliza"> 
    <h4>Insurance Policy</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
                <div align="right"> Company:</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01ROCICN" size="10" maxlength="9" readonly value="<%= gaMant.getE01ROCICN().trim()%>" >
            </td>
            <td nowrap width="18%" > 
                <div align="right">Amount:</div>
            </td>
            <td nowrap width="37%" > 
              <input type="text" name="E01ROCIPA" size="10" maxlength="9"  readonly value="<%= gaMant.getE01ROCIPA().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
                <div align="right">Name :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01ROCICM" size="35" maxlength="35" readonly value="<%= gaMant.getE01ROCICM().trim()%>" >
            </td>
            <td nowrap width="18%" > 
                <div align="right">Policy Number:</div>
            </td>
              <td nowrap width="37%" >
                <input type="text" name="E01ROCCIN" size="10" maxlength="9"  readonly value="<%= gaMant.getE01ROCCIN().trim()%>" >
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
                <div align="right">Description :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01ROCIPD" size="35" maxlength="35" readonly  value="<%= gaMant.getE01ROCIPD().trim()%>" >
            </td>
            <td nowrap width="18%" > 
                <div align="right">Currency:</div>
            </td>
              <td nowrap width="37%" >
                <input type="text" name="E01ROCICY" size="4" maxlength="3" readonly value="<%= gaMant.getE01ROCICY().trim()%>" >
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
                <div align="right">Emision Date:</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01ROCEM1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCEM1().trim()%>" >
              <input type="text" name="E01ROCEM2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCEM2().trim()%>" >
              <input type="text" name="E01ROCEM3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCEM3().trim()%>" >
            </td>
            <td nowrap width="18%" > 
                <div align="right">Emited by:</div>
            </td>
              <td nowrap width="37%" >
                <input type="text" name="E01ROCEMB" size="10" maxlength="9" readonly value="<%= gaMant.getE01ROCEMB().trim()%>" >
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
                <div align="right">Maturity Date:</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01ROCMD1" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMD1().trim()%>" >
              <input type="text" name="E01ROCMD2" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMD2().trim()%>" >
              <input type="text" name="E01ROCMD3" size="2" maxlength="2" readonly value="<%= gaMant.getE01ROCMD3().trim()%>" >
            </td>
            <td nowrap width="18%" > 
                <div align="right">Exception:</div>
            </td>
              <td nowrap width="37%" >
                <input type="text" name="E01ROCRGK" size="3" maxlength="3" value="<%= gaMant.getE01ROCRGK()%>" >
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
                <div align="right">Advice of Maturity:</div>
            </td>
              <td nowrap width="28%" >
                <input type="text" name="E01ROCCLF" size="3" maxlength="3" value="<%= gaMant.getE01ROCCLF()%>" >
              </td>
            <td nowrap width="18%" > 
                <div align="right">User Code:</div>
            </td>
            <td nowrap width="37%" >
                <input type="text" name="E01ROCUSC" size="5" maxlength="5"  readonly value="<%= gaMant.getE01ROCUSC().trim()%>" >
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

<SCRIPT Language="Javascript">
	<% if(gaMant.getE01ROCINF().equals("Y")){ %>
 	 hidePoliza(true);
	<%} else { %>
 	 hidePoliza(false);
	<%}%>
</SCRIPT>

</form>
</body>
</html>
