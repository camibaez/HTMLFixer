<html>
<head>
<title>Concentracion de Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 

<jsp:useBean id="rtConc" class="datapro.eibs.beans.EDD043002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Relationship Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_conc_det, EDD0430"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" value="4">
 <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02ACMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02ACMACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02ACMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="45%"> 
              <div align="right">Relationship Account  :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02INVRAC" size="12" maxlength="12" value="<%= rtConc.getE02INVRAC().trim()%>" onKeypress="enterInteger()" 
                oncontextmenu="showPopUp(accountHelp,this.name,'','','','','RT'); return false;">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Transfer in Multiples :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02INVMUL"  size="13" maxlength="13" value="<%= rtConc.getE02INVMUL().trim()%>" onKeypress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> Minimum Amount of Transfer :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02INVMIN"  size="13" maxlength="13" value="<%= rtConc.getE02INVMIN().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right"> Maximum Amount of Transfer :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02INVMAX"  size="12" maxlength="12" value="<%= rtConc.getE02INVMAX().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Minimum Balance Relationship Account :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02INVBLS" size="12" maxlength="12" value="<%= rtConc.getE02INVBLS().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Relationship Status :</div>
            </td>
            <td nowrap> 
               <div align="left">
                <select name="E02INVSTS">
                  <option value=" " <% if (!(rtConc.getE02INVSTS().equals("1") || rtConc.getE02INVSTS().equals("2") || rtConc.getE02INVSTS().equals("3"))) out.print("selected"); %>></option>
                  <option value="1" <% if (rtConc.getE02INVSTS().equals("1")) out.print("selected"); %>>Active</option>
                  <option value="2" <% if (rtConc.getE02INVSTS().equals("2")) out.print("selected"); %>>Suspended</option>
                  <option value="3" <% if (rtConc.getE02INVSTS().equals("3")) out.print("selected"); %>>Closed</option>
                </select> 
              </div>             
            </td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02INVSD1" size="2" maxlength="2" value="<%= rtConc.getE02INVSD1().trim()%>" onKeypress="enterInteger()">
              <input type="text" name="E02INVSD2" size="2" maxlength="2" value="<%= rtConc.getE02INVSD2().trim()%>" onKeypress="enterInteger()">
              <input type="text" name="E02INVSD3" size="2" maxlength="2" value="<%= rtConc.getE02INVSD3().trim()%>" onKeypress="enterInteger()">
 			  <a href="javascript:DatePicker(document.forms[0].E02INVSD1,document.forms[0].E02INVSD2,document.forms[0].E02INVSD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02INVMD1" size="2" maxlength="2" value="<%= rtConc.getE02INVMD1().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E02INVMD2" size="2" maxlength="2" value="<%= rtConc.getE02INVMD2().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E02INVMD3" size="2" maxlength="2" value="<%= rtConc.getE02INVMD3().trim()%>" onKeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E02INVMD1,document.forms[0].E02INVMD2,document.forms[0].E02INVMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
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
