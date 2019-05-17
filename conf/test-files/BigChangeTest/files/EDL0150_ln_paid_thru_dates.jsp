<html>
<head>
<title>Loans Paid-Thru Dates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnPaidThru" class= "datapro.eibs.beans.EDL015401Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>


<body nowrap>



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Loans Paid-Thru Dates Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_xchg_rate.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0158" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="68">
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
                <input type="text" name="E01DEACUN" size="9" maxlength="9" readonly value="<%= lnPaidThru.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap  > 
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= lnPaidThru.getE01CUSNA1().trim()%>">
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= lnPaidThru.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" readonly value="<%= lnPaidThru.getE01DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Dates</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="39%" > 
              <div align="right">Paid Interest Thru Date :</div>
            </td>
            <td width="61%">
              <input type="text" name="E01DEAIT1" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAIT1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAIT2" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAIT2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAIT3" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAIT3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAIT1,document.forms[0].E01DEAIT2,document.forms[0].E01DEAIT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%" > 
              <div align="right">Paid Principal Thru Date :</div>
            </td>
            <td width="61%" > 
              <input type="text" name="E01DEAPT1" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAPT1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPT2" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAPT2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAPT3" size="2" maxlength="2" value="<%= lnPaidThru.getE01DEAPT3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAPT1,document.forms[0].E01DEAPT2,document.forms[0].E01DEAPT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
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
