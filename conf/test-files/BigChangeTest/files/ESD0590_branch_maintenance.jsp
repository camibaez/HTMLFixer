<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ESD059001Message"  scope="session" />
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


<H3 align="center">Branch Maintenance <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="branch_maintenance.jsp, ESD0590"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0590" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
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
                <input type="text" name="E01BRNBNK" size="3" maxlength="2"  value="<%= brnDetails.getE01BRNBNK().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Branch :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01BRNNUM" size="4"  maxlength="3" value="<%= brnDetails.getE01BRNNUM().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Branch Information</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="40%"> 
              <input type="text" name="E01BRNNME" maxlength="35" size="36" value="<%= brnDetails.getE01BRNNME().trim()%>" >
            </td>
            <td nowrap width="16%"> 
              <div align="right">&nbsp;</div>
            </td>
            <td nowrap width="28%"> 
              &nbsp;
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01BRNADR" size="36" maxlength="35" value="<%= brnDetails.getE01BRNADR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">City :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E01BRNCIT" maxlength="35" size="36" value="<%= brnDetails.getE01BRNCIT().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Phone :</div>
            </td>
            <td nowrap width="40%" height="19"> 
              <input type="text" name="E01BRNPHN" size="12" maxlength="11" value="<%= brnDetails.getE01BRNPHN().trim()%>" >
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="right">Destination ID :</div>
            </td>
            <td nowrap width="28%" height="19"> 
              <input type="text" name="E01BRNDID" size="11" maxlength="12" value="<%= brnDetails.getE01BRNDID().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Clearing Branch :</div>
            </td>
            <td nowrap width="40%" height="19"> 
              <input type="text" name="E01BRNCLB" size="5" maxlength="4" value="<%= brnDetails.getE01BRNCLB().trim()%>">
              <input type="text" name="E01CLRNME" size="36" maxlength="35" value="<%= brnDetails.getE01CLRNME().trim()%>">
              <a href="javascript:GetBranchDesc('E01BRNCLB',document.forms[0].E01BRNBNK.value,'E01CLRNME')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="right">IBAN Branch Code :</div>
            </td>
            <td nowrap width="28%" height="19">
				<input type="text" name="E01BRNF011" size="5" maxlength="4" value="<%= brnDetails.getE01BRNF011().trim()%>" >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Region :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E01BRNRGN" size="5" maxlength="4" value="<%= brnDetails.getE01BRNRGN().trim()%>">
              <input type="text" name="E01RGNNME" size="36" maxlength="35" readonly value="<%= brnDetails.getE01RGNNME().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01BRNRGN','E01RGNNME','07')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" height="19"> 
              <div align="right">State :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E01BRNSBR" size="5" maxlength="4" value="<%= brnDetails.getE01BRNSBR().trim()%>">
              <input type="text" name="E01SBRNME" size="36" maxlength="35" readonly value="<%= brnDetails.getE01SBRNME().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01BRNSBR','E01SBRNME','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 
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
