<html>
<head>
<title>Parameters Options</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<body bgcolor="#FFFFFF">
<H3 align="center"> Portfolio Management System - Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_enter_param,EIV0000"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIV0000">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
  <p> 
    <input type=HIDDEN name="SCREEN" value="200">
    <input type=HIDDEN name="INPTOPT" value="1">
  </p>
  <table class="tbenter" width=100% height=50%>
    <tr> 
      <td> 
        <div align="center"> <font size="3"><b> </b></font>
          <table class="tableinfo" width="75%">
            <tr id="trdark"> 
              <td colspan="3" height="10">Select one of the following options 
                : </td>
            </tr>
            <tr id="trclear"> 
              <td width="30%" height="10">&nbsp;</td>
              <td width="44%" height="10"> 
                <div align="left"> 
                  <input type="radio" name="CINPTOPT" value="1"
		  		  onClick="document.forms[0].INPTOPT.value = '1'"
		   checked>
                  Commissions</div>
              </td>
              <td width="26%" height="10">&nbsp;</td>
            </tr>
            <tr id="trclear"> 
              <td width="30%" height="24">&nbsp;</td>
              <td width="44%" height="24"> 
                <div align="left"> 
                  <input type="radio" name="CINPTOPT" value="2"
		  		  onClick="document.forms[0].INPTOPT.value = '2'"
		   >
                  Brokers </div>
              </td>
              <td width="26%" height="24">&nbsp;</td>
            </tr>
            <tr id="trclear"> 
              <td width="30%" height="24">&nbsp;</td>
              <td width="44%" height="24"> 
                <div align="left"> 
                  <input type="radio" name="CINPTOPT" value="6"
				 onClick="document.forms[0].INPTOPT.value = '6'"
			>
                  Agents of Custody</div>
              </td>
              <td width="26%" height="24">&nbsp;</td>
            </tr>
            <tr id="trclear"> 
              <td width="30%" height="24">&nbsp;</td>
              <td width="44%" height="24"> 
                <div align="left"> 
                  <input type="radio" name="CINPTOPT" value="3"
		  		  onClick="document.forms[0].INPTOPT.value = '3'"
			>
                  Issuers </div>
              </td>
              <td width="26%" height="24">&nbsp;</td>
            </tr>
            <tr id="trclear"> 
              <td width="30%" height="24">&nbsp;</td>
              <td width="44%" height="24"> 
                <input type="radio" name="CINPTOPT" value="5"
		  		  onClick="document.forms[0].INPTOPT.value = '5'"
			>
                Investment Parameters</td>
              <td width="26%" height="24">&nbsp;</td>
            </tr>
            <tr id="trclear"> 
              <td colspan="3">&nbsp;</td>
            </tr>
          </table>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
            <tr bgcolor="#FFFFFF"> 
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="33%"> 
                <div align="center"> 
                  <input id="EIBSBTN" type=submit name="Submit" value="Submit">
                </div>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp; </p>
  <center>
  </center>
  
      
  
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
  <%
 }
%> 
</form>
</body>
</html>
