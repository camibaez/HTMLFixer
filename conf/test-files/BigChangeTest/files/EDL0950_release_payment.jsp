<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Release Partial Early Paymen</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="lnRelease" class="datapro.eibs.beans.EDL095004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center">Release Partial Early Payment<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="release_payment, EDL0950"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="32">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E04DEACUN" size="9" maxlength="9" value="<%= lnRelease.getE04DEACUN().trim()%>" readonly>
			  </div>
			</td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E04CUSNA1" size="45" maxlength="45" readonly value="<%= lnRelease.getE04CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E04DEAACC" size="12" maxlength="9" value="<%= lnRelease.getE04DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E04DEACCY" size="3" maxlength="3" value="<%= lnRelease.getE04DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E04DEAPRO" size="4" maxlength="4" readonly value="<%= lnRelease.getE04DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Partial Early Payment :</div>
            </td>
            <td>
 			  <input type="text" name="E04PAGANT" size="17" maxlength="16" value="<%= lnRelease.getE04PAGANT().trim()%>" readonly>
 			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Release Amount :</div>
            </td>
            <td nowrap width="71%"> 
				<input type="text" name="E04TRAAMT" size="17" maxlength="16" value="<%= lnRelease.getE04TRAAMT().trim()%>" onkeypress="enterDecimal()">				            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="71%"> 
              <input type="text" name="E04TRAVD1" size="2" maxlength="2" value="<%= lnRelease.getE04TRAVD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E04TRAVD2" size="2" maxlength="2" value="<%= lnRelease.getE04TRAVD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E04TRAVD3" size="2" maxlength="2" value="<%= lnRelease.getE04TRAVD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E04TRAVD1,document.forms[0].E04TRAVD2,document.forms[0].E04TRAVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>  
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
