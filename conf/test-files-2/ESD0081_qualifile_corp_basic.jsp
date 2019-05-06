<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate Customer Basic Information</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008101Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

 function showQualified(){

	CenterNamedWindow('','efunds',600,500,4);
	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081EFUNDS';
	document.forms[0].target='efunds';
	clearZeros();
	document.forms[0].submit();

  }

  function goProcess(){

	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081';
	document.forms[0].target='';
	//clearZeros();
	document.forms[0].submit();

  }

  function goExit(){
    document.forms[0].SCREEN.value = '5';
	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081';
	document.forms[0].target='';
	document.forms[0].submit();
  }
</script>



</head>

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 %>


<h3 align="center">Qualifile - Corporate Customer <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_corp_basic, ESD0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <input type=hidden name="E81LGT" value="<%= client.getE81LGT()%>">
  <h4>Articles of Incorporation</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="39%" >
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E81CUN" size="10" maxlength="9" value="<%= client.getE81CUN()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" ></td>
            <td width="38%">&nbsp; </td>
          </tr>
          <tr id="teclear">
            <td nowrap width="39%">
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E81FRN" size="13" maxlength="12" value="<%= client.getE81FRN().trim()%>" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Address Information</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81ADR" size="26" maxlength="25" value="<%= client.getE81ADR().trim()%>" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%">
              <div align="right">City :</div>
            </td>
            <td nowrap width="68%">
              <input type="text" name="E81CTY" size="30" maxlength="30" value="<%= client.getE81CTY().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%">
              <div align="right">State :</div>
            </td>
            <td nowrap width="68%">
              <input type="text" name="E81STE" size="6" maxlength="4" value="<%= client.getE81STE().trim()%>">
              <a href="javascript:GetCodeCNOFC('E81STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%">
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="68%">
              <input type="text" name="E81ZPC" size="16" maxlength="15" value="<%= client.getE81ZPC().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81CCS" size="51" maxlength="50" value="<%= client.getE81CCS().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Identification </h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="21%">
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap colspan="5">
               <input type="text" name="E81SSN" size="10" maxlength="9" value="<%= client.getE81SSN().trim()%>" onkeypress="enterInteger()" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Additional Information</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap  width="30%">
              <div align="right">Time at this Address (Years/Month) :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81ADY" size="3" maxlength="2" value="<%= client.getE81ADY().trim()%>">
              <input type="text" name="E81ADM" size="4" maxlength="3" value="<%= client.getE81ADM().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Home Phone Number :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81HPN" size="11" maxlength="10" value="<%= client.getE81HPN().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Work Phone Number :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PHN" size="11" maxlength="10" value="<%= client.getE81PHN().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Foundation Date :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81BMM" size="3" maxlength="2" value="<%= client.getE81BMM().trim()%>">
              <input type="text" name="E81BDD" size="3" maxlength="2" value="<%= client.getE81BDD().trim()%>">
              <input type="text" name="E81BYY" size="5" maxlength="4" value="<%= client.getE81BYY().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Previous Address</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap  width="30%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PAD" size="26" maxlength="25" value="<%= client.getE81PAD().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">City :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PCT" size="21" maxlength="20" value="<%= client.getE81PCT().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">State :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PST" size="3" maxlength="2" value="<%= client.getE81PST().trim()%>">
              <a href="javascript:GetCodeCNOFC('E81PST','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PZP" size="10" maxlength="9" value="<%= client.getE81PZP().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" class="tbenter">
    <tr >
      <td width="33%">
        <div align="center">
			<input id="EIBSBTN" type=button name="Submit1" value="Save" onClick = "goProcess()">
        </div>
      </td>
      <td width="33%">
        <div align="center">
          	<input id="EIBSBTN" type=button name="Submit3" value="Decline" onClick="goExit()">
        </div>
      </td>
      <td width="34%">
        <div align="center">
          	<input id="EIBSBTN" type=button name="Submit2" value="Qualifile" onClick="if (FieldNotBlank()) showQualified();">
        </div>
      </td>
    </tr>
  </table>

  </form>
  <%
  	if (userPO.getRedirect().equals("QUALIFILE")) {
  	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       alert(\"Select QUALIFILE before this operation\")");
     out.println("</SCRIPT>");
  	}
  %>

</body>
</html>
