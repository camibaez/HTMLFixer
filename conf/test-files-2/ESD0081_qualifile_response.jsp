<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Qualifile</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ESD008101Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1">
  function showQualified(){
    document.forms[0].SCREEN.value = 3;
	document.forms[0].submit();
	
  }
</script>

</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>

<h3 align="center">Qualifile - Individual Customer <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="qualifile_personal_basic, ESD0081" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="1">
    <input type=hidden name="E81LGT" value="<%= client.getE81LGT()%>">
  </p>
  <h4>Customer Information (as Entered)</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap width="70%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81FRN" size="13" maxlength="12" value="<%= client.getE81FRN().trim()%>">
                <input type="text" readonly  name="E81MDI" size="2" maxlength="1" value="<%= client.getE81MDI().trim()%>">
                <input type="text" readonly  name="E81LSN" size="21" maxlength="20" value="<%= client.getE81LSN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81ADR" size="26" maxlength="25" value="<%= client.getE81ADR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81CTY" size="21" maxlength="20" value="<%= client.getE81CTY().trim()%>">
                <input type="text" readonly  name="E81STE" size="3" maxlength="2" value="<%= client.getE81STE().trim()%>">
                <input type="text" readonly  name="E81ZPC" size="10" maxlength="9" value="<%= client.getE81ZPC().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
      
  <h4>Identification Information</h4>
    
  <table  class="tableinfo">
    <tr> 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Social Security :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81SSN" size="10" maxlength="9" value="<%= client.getE81SSN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Driver License :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81DRL" size="26" maxlength="25" value="<%= client.getE81DRL().trim()%>">
                State : 
                <input type="text" readonly  name="E81DRS" size="3" maxlength="2" value="<%= client.getE81DRS().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
	<br>
	<center>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
              <td nowrap  width="30%" bgcolor="#FFFFFF"> 
                <div align="center"><b>Your request can not be process at this 
                  time, please try again later or consult your network administrator</b></div>
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </center>
  <br>
  <table  class="tableinfo">
    <tr> 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">System Reference Number :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" readonly  name="E81SSN2" size="15" maxlength="9" value="2004052512401">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td>&nbsp;</td>
    </tr>
  </table>
 
  </form>
</body>
</html>

