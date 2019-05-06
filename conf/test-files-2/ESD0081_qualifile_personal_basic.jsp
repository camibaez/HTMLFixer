<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Personal Client</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ESD008101Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1">
function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

  function clearZeros(){
    var formLength= document.forms[0].elements.length;

    for(n=0;n<formLength;n++){
       var elem = document.forms[0].elements[n];
       if (elem.type=="text") {
         if (elem.value.length > 0 ) {
         	if (elem.value == "0") elem.value = "";
         }
       }
     }
  }

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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0081" onSubmit="clearZeros()">
  <p>
    <input type=HIDDEN name="SCREEN" value="4">
    <input type=hidden name="E81LGT" value="<%= client.getE81LGT()%>">
  </p>

  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">User Id :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
			<input type="text" name="USERID" size="30" maxlength="30" >
        </div>
      </td>
    </tr>
	<tr id="trclear">
      <td align=CENTER width="18%">
        <div align="right">Password :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
			<input type="password" name="PASSWORD" size="30" maxlength="30" >
        </div>
      </td>
    </tr>

   <tr id="trdark">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:showQualified()">
   </TD>

   </tr>
 </TABLE>
</div>

  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap width="70%">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81CUN" size="10" maxlength="9" value="<%= client.getE81CUN()%>" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">First Name :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81FRN" size="13" maxlength="12" value="<%= client.getE81FRN().trim()%>" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Middle Initial :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81MDI" size="2" maxlength="1" value="<%= client.getE81MDI().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Last Name :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81LSN" size="21" maxlength="20" value="<%= client.getE81LSN().trim()%>" id="MANDATORY">
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
        <td nowrap width="70%">

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
            <td nowrap width="30%">
              <div align="right">City :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81CTY" size="21" maxlength="20" value="<%= client.getE81CTY().trim()%>" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">State :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81STE" size="3" maxlength="2" value="<%= client.getE81STE().trim()%>" id="MANDATORY">
              <a href="javascript:GetCodeCNOFC('E81STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81ZPC" size="10" maxlength="9" value="<%= client.getE81ZPC().trim()%>" onkeypress="enterInteger()" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
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

  <h4>Identification</h4>

  <table  class="tableinfo">
    <tr>
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Social Security :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81SSN" size="10" maxlength="9" value="<%= client.getE81SSN().trim()%>" onkeypress="enterInteger()" id="MANDATORY">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Driver License :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81DRL" size="26" maxlength="25" value="<%= client.getE81DRL().trim()%>">
              State :
              <input type="text" name="E81DRS" size="3" maxlength="2" value="<%= client.getE81DRS().trim()%>">
              <a href="javascript:GetCodeCNOFC('E81DRS','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
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
              <input type="text" name="E81ADM" size="3" maxlength="2" value="<%= client.getE81ADM().trim()%>">
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
              <div align="right">Date of Birth :</div>
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
              <a href="javascript:GetCodeCNOFC('E81PST','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E81PZP" size="10" maxlength="9" value="<%= client.getE81PZP().trim()%>" onkeypress="enterInteger()">
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
			<input id="EIBSBTN" type=button name="Submit1" value="Accept" onClick = "goProcess()">
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

