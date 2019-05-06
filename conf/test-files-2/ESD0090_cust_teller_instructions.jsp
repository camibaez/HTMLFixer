<html>
<head>
<title>Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="instructions" class="datapro.eibs.beans.ESD009001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	
 <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>
	
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>


<H3 align="center">Teller Messages<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="Cust_Teller_intructions, ESD0090"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <INPUT TYPE=HIDDEN NAME="E01SPIACC" VALUE="<%= userPO.getHeader1()%>">
  <table class="tableinfo" width="222">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr> 
            <td nowrap  align="right"> Customer: </td>
            <td nowrap  align="left"> <%= userPO.getHeader1()%> </td>
            <td nowrap  align="right"> ID: </td>
            <td nowrap  align="left"> <%= userPO.getHeader2()%> </td>
            <td nowrap  align="right"> Name: </td>
            <td nowrap align="left"> <%= userPO.getHeader3()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Process Messages</H4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="10%"
> 
              <div align="center"><b>Proc.</b></div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"><b>Messages</b></div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"><b>Expire on </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"
> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG01" value="X" <%if(instructions.getE01SFLG01().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"><%= instructions.getE01SDOC01().trim()%></div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM1" value="<%= instructions.getE01SDTEM1().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED1" value="<%= instructions.getE01SDTED1().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY1" value="<%= instructions.getE01SDTEY1().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM1,document.forms[0].E01SDTED1,document.forms[0].E01SDTEY1)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%"
> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG02" value="X" <%if(instructions.getE01SFLG02().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"><%= instructions.getE01SDOC02().trim()%></div>
            </td>
            <td nowrap width="45%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM2" value="<%= instructions.getE01SDTEM2().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED2" value="<%= instructions.getE01SDTED2().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY2" value="<%= instructions.getE01SDTEY2().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM2,document.forms[0].E01SDTED2,document.forms[0].E01SDTEY2)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG03" value="X" <%if(instructions.getE01SFLG03().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC03().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM3" value="<%= instructions.getE01SDTEM3().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED3" value="<%= instructions.getE01SDTED3().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY3" value="<%= instructions.getE01SDTEY3().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM3,document.forms[0].E01SDTED3,document.forms[0].E01SDTEY3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG04" value="X" <%if(instructions.getE01SFLG04().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC04().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM4" value="<%= instructions.getE01SDTEM4().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED4" value="<%= instructions.getE01SDTED4().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY4" value="<%= instructions.getE01SDTEY4().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM4,document.forms[0].E01SDTED4,document.forms[0].E01SDTEY4)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG05" value="X" <%if(instructions.getE01SFLG05().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC05().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM5" value="<%= instructions.getE01SDTEM5().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED5" value="<%= instructions.getE01SDTED5().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY5" value="<%= instructions.getE01SDTEY5().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM5,document.forms[0].E01SDTED5,document.forms[0].E01SDTEY5)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG06" value="X" <%if(instructions.getE01SFLG06().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC06().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM6" value="<%= instructions.getE01SDTEM6().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED6" value="<%= instructions.getE01SDTED6().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY6" value="<%= instructions.getE01SDTEY6().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM6,document.forms[0].E01SDTED6,document.forms[0].E01SDTEY6)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG07" value="X" <%if(instructions.getE01SFLG07().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC07().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM7" value="<%= instructions.getE01SDTEM7().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED7" value="<%= instructions.getE01SDTED7().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY7" value="<%= instructions.getE01SDTEY7().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM7,document.forms[0].E01SDTED7,document.forms[0].E01SDTEY7)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG08" value="X" <%if(instructions.getE01SFLG08().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC08().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM8" value="<%= instructions.getE01SDTEM8().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED8" value="<%= instructions.getE01SDTED8().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY8" value="<%= instructions.getE01SDTEY8().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM8,document.forms[0].E01SDTED8,document.forms[0].E01SDTEY8)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="10%"
 height="23"> 
              <div align="center"> 
                <input type="checkbox" name="E01SFLG09" value="X" <%if(instructions.getE01SFLG09().equals("X")) out.print("checked");%>>
              </div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"><%= instructions.getE01SDOC09().trim()%></div>
            </td>
            <td nowrap width="45%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01SDTEM9" value="<%= instructions.getE01SDTEM9().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTED9" value="<%= instructions.getE01SDTED9().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01SDTEY9" value="<%= instructions.getE01SDTEY9().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01SDTEM9,document.forms[0].E01SDTED9,document.forms[0].E01SDTEY9)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Other Messages</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"><b>Messages</b></div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"><b>Expire on </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC01" value="<%= instructions.getE01MDSC01().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM1" value="<%= instructions.getE01MDTEM1().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED1" value="<%= instructions.getE01MDTED1().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY1" value="<%= instructions.getE01MDTEY1().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM1,document.forms[0].E01MDTED1,document.forms[0].E01MDTEY1)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC02" value="<%= instructions.getE01MDSC02().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM2" value="<%= instructions.getE01MDTEM2().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED2" value="<%= instructions.getE01MDTED2().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY2" value="<%= instructions.getE01MDTEY2().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM2,document.forms[0].E01MDTED2,document.forms[0].E01MDTEY2)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC03" value="<%= instructions.getE01MDSC03().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM3" value="<%= instructions.getE01MDTEM3().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED3" value="<%= instructions.getE01MDTED3().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY3" value="<%= instructions.getE01MDTEY3().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM3,document.forms[0].E01MDTED3,document.forms[0].E01MDTEY3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"><b>Messages</b></div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"><b>Expire on </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC04" value="<%= instructions.getE01MDSC04().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM4" value="<%= instructions.getE01MDTEM4().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED4" value="<%= instructions.getE01MDTED4().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY4" value="<%= instructions.getE01MDTEY4().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM4,document.forms[0].E01MDTED4,document.forms[0].E01MDTEY4)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC05" value="<%= instructions.getE01MDSC05().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM5" value="<%= instructions.getE01MDTEM5().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED5" value="<%= instructions.getE01MDTED5().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY5" value="<%= instructions.getE01MDTEY5().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM5,document.forms[0].E01MDTED5,document.forms[0].E01MDTEY5)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC06" value="<%= instructions.getE01MDSC06().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM6" value="<%= instructions.getE01MDTEM6().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED6" value="<%= instructions.getE01MDTED6().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY6" value="<%= instructions.getE01MDTEY6().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM6,document.forms[0].E01MDTED6,document.forms[0].E01MDTEY6)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"><b>Messages</b></div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"><b>Expire on </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC07" value="<%= instructions.getE01MDSC07().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM7" value="<%= instructions.getE01MDTEM7().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED7" value="<%= instructions.getE01MDTED7().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY7" value="<%= instructions.getE01MDTEY7().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM7,document.forms[0].E01MDTED7,document.forms[0].E01MDTEY7)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"
> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC08" value="<%= instructions.getE01MDSC08().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM8" value="<%= instructions.getE01MDTEM8().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED8" value="<%= instructions.getE01MDTED8().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY8" value="<%= instructions.getE01MDTEY8().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM8,document.forms[0].E01MDTED8,document.forms[0].E01MDTEY8)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01MDSC09" value="<%= instructions.getE01MDSC09().trim()%>" >
              </div>
            </td>
            <td nowrap width="30%"
 height="23"> 
              <div align="center"> 
                <input type="text" maxlength="2" size="2" name="E01MDTEM9" value="<%= instructions.getE01MDTEM9().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTED9" value="<%= instructions.getE01MDTED9().trim()%>" onKeyPress="enterInteger()">
                <input type="text" maxlength="2" size="2" name="E01MDTEY9" value="<%= instructions.getE01MDTEY9().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01MDTEM9,document.forms[0].E01MDTED9,document.forms[0].E01MDTEY9)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> 
          <div align="center"> </div>
        </td>
      </tr>
    </table>
  </div>
  </form>
</body>
</html>
