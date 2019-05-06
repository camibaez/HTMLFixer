<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.EDL052201Message"  scope="session" />

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


<H3 align="center">Loan Losses Definition Tables Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="previsions_details.jsp, EDL0522"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0522" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Classification :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01PRVTBL" size="3" maxlength="2"  value="<%= prevDetails.getE01PRVTBL().trim()%>" <%if (userPO.getPurpose().equals("MAINTENANCE")){%>readonly<%}%>>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Description :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01PRVDSC" size="35"  maxlength="30" value="<%= prevDetails.getE01PRVDSC().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
		  <%if (userPO.getHeader21().equals("1")) {%>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Reserve % :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01PRVPP1" size="35"  maxlength="30" value="<%= prevDetails.getE01PRVPP1().trim()%>">
                </font></font></font></div>
            </td>
            <td nowrap width="16%" >&nbsp;</td>
            <td nowrap colspan="3" >&nbsp;</td> 
          </tr>
		  <%}%>
        </table>
      </td>
    </tr>
  </table>
  <%if (!userPO.getHeader21().equals("1")) {%>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="center"><b>Level</b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="center"><b>Past Due<br>Days</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"><b>% Provision<br>Principal</b></div>
            </td>
            <td nowrap width="28%"> 
              <div align="center"><b>% Provision<br>Interest</b></div>
            </td>
            <td nowrap width="28%"> 
              <div align="center"><b>Calification<br>Type</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="23"> 
              <div align="center"><b>1</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01PRVDY1" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY1().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" name="E01PRVPP1" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP1().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI1().trim()%>" name="E01PRVPI1" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>2</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY2" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY2().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP2" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP2().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI2().trim()%>" name="E01PRVPI2" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>3</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY3" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY3().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP3" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP3().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI3().trim()%>" name="E01PRVPI3" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>4</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY4" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY4().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP4" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP4().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI4().trim()%>" name="E01PRVPI4" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>5</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY5" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY5().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP5" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP5().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI5().trim()%>" name="E01PRVPI5" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
              </div>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>6</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY6" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY6().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP6" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP6().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI6().trim()%>" name="E01PRVPI6" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>7</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY7" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY7().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP7" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP7().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI7().trim()%>" name="E01PRVPI7" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
              </div>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>8</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY8" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY8().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP8" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP8().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI8().trim()%>" name="E01PRVPI8" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>9</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY9" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY9().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP9" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP9().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI9().trim()%>" name="E01PRVPI9" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="center"><b>10</b></div>
            </td>
            <td nowrap width="40%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVDY0" maxlength="4" size="5" value="<%= prevDetails.getE01PRVDY0().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="center">
                <input type="text" name="E01PRVPP0" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPP0().trim()%>" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="5" size="6" value="<%= prevDetails.getE01PRVPI0().trim()%>" name="E01PRVPI0" >
              </div>
            </td>
            <td nowrap width="28%" height="19"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA0().trim()%>" name="E01PRVCA0" >
              </div>
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                Classification Limit used to compute the Loan Losses regardless types : 
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVLMC().trim()%>" name="E01PRVLMC" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="3" >(If the provision is computed by individual Loans, 
            leave the filed blank;</b></td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="3" >if the classification is at Customer Level, 
            select the correspondent Classification Type</b>)</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <p><br>
  </p>
  <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
  </form>
</body>
</html>
