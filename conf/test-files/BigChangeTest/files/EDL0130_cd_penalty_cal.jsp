<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Penalty Calculator</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcPty" class="datapro.eibs.beans.EDL016007Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_i_opt);

</SCRIPT>
</head>

<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 
%> 
<div align="center"></div>
<h3 align="center"> Penalty Calculator<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_penalty_calc.jsp, EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I" >
  <input type=HIDDEN name="SCREEN" value="53">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Portfolio/Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E07CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E07NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E07PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E07DEAACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E07TRNTOT" size="15" maxlength="13" value="<%= calcPty.getE07TRNTOT().trim()%>"  onkeypress="enterDecimal()">
            </td>
			<td nowrap > 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E07TRNVD1" size="2" maxlength="2" value="<%= calcPty.getE07TRNVD1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E07TRNVD2" size="2" maxlength="2" value="<%= calcPty.getE07TRNVD2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E07TRNVD3" size="2" maxlength="2" value="<%= calcPty.getE07TRNVD3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E07TRNVD1,document.forms[0].E07TRNVD2,document.forms[0].E07TRNVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">Penalty :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E07TRNPEN" size="15" maxlength="13" value="<%= calcPty.getE07TRNPEN().trim()%>"  readonly >
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
