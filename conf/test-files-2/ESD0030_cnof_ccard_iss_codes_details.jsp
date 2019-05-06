<html>
<head>
<title>Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />



<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
 
 
function setValues(){
	if(document.forms[0].E02CNOCFL.value == '<'){
		document.forms[0].E02CNOSCY.value = document.forms[0].E02CNOSCY1.value;
		document.forms[0].E02CNOCPF.value = document.forms[0].E02CNOCPF1.value;
	}
	if(document.forms[0].E02CNOCFL.value == '>'){
		document.forms[0].E02CNOSCY.value = document.forms[0].E02CNOSCY2.value;
		document.forms[0].E02CNOCPF.value = document.forms[0].E02CNOCPF2.value;
	}
		document.forms[0].submit();
}   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
</head>
<body>
<H3 align="center">System References Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_ccard_iss_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <input type=HIDDEN name="E02CNOSCY" >
  <input type=HIDDEN name="E02CNOCPF">
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Classification :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Code :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="4" maxlength="3" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%if (refCodes.getE02CNOCFL().equals("<")){%>
  <br>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right"> Colombia Classification :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOSCY1" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Collateral Type :</div>
            </td>
            <td nowrap> 
              <div align="left">
                <select name="E02CNOCPF1">
                  <option value="" <%if (refCodes.getE02CNOCPF().equals("")) { out.print("selected"); }%>></option>
                  <option value="0" <%if (refCodes.getE02CNOCPF().equals("0")) { out.print("selected"); }%>>Not Collaterized</option>
                  <option value="1" <%if (refCodes.getE02CNOCPF().equals("1")) { out.print("selected"); }%>>Collaterized</option>
                  
                </select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

    
  <%}%>
  <p>
    <%if (refCodes.getE02CNOCFL().equals(">")){%>
    <br>
  </p>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right"> USA Classification :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOSCY2" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Residence Code:</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <select name="E02CNOCPF2">
                  <option value="" <%if (refCodes.getE02CNOCPF().equals("")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOCPF().equals("1")) { out.print("selected"); }%>>USA</option>
                  <option value="3" <%if (refCodes.getE02CNOCPF().equals("3")) { out.print("selected"); }%>>Out of USA</option>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <p align="center">
    <input id="EIBSBTN" type=button name="Button" value="Submit" onClick="javascript:setValues()">
  </p>
  </form>
</body>
</html>
