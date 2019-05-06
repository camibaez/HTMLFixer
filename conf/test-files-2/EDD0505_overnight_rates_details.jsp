<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ovRates" class="datapro.eibs.beans.EDD050501Message"  scope="session" />
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
<H3 align="center">Overnight Rates<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="overnight_rate_details.jsp, EDD0505"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0505" >
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
              <div align="left"> <b> 
                <input type="text" name="E01ONRBNK" size="3" maxlength="2"  value="<%= ovRates.getE01ONRBNK().trim()%>" readonly>
                </b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01ONRCCY" size="4"  maxlength="3" value="<%= ovRates.getE01ONRCCY().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Table :</b></div>
            </td>
            <td nowrap width="20%" > <b> 
              <input type="text" name="E01ONRTBL" size="2" maxlength="1"  value="<%= ovRates.getE01ONRTBL().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
              </b></td>
            <td nowrap width="16%" > 
              <div align="right"><b>Effective Date :</b></div>
            </td>
            <td nowrap colspan="3" ><b> 
              <input type="text" name="E01ONREMM" size="3" maxlength="2" value="<%= ovRates.getE01ONREMM().trim()%>"  readonly>
              <input type="text" name="E01ONREDD" size="3" maxlength="2" value="<%= ovRates.getE01ONREDD().trim()%>"  readonly>
              <input type="text" name="E01ONREYY" size="3" maxlength="2" value="<%= ovRates.getE01ONREYY().trim()%>"  readonly>
              </b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="center"><b>Interest Rate per Amount</b></div>
            </td>
            <td nowrap> 
              <div align="center"><b>Rates</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Greater or Equal :</div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM1" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM1().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01ONRTE1" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Greater or Equal :</div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM2" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM2().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRTE2" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE2().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Greater or Equal :</div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM3" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM3().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRTE3" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE3().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Greater or Equal :</div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM4" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM4().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRTE4" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE4().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Greater or Equal :</div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM5" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM5().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRTE5" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE5().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2" height="19"> 
              <div align="right">Base used for calculation :</div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" size="4" maxlength="3" value="<%= ovRates.getE01ONRBAS().trim()%>" name="E01ONRBAS" >
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
