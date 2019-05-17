<html>
<head>
<title>Special Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ESD009501" class="datapro.eibs.beans.ESD009501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	
<%
	if(userPO.getOption().equals("RT")){
%>
    builtNewMenu(rt_m_opt);
<%
	}
	else if(userPO.getOption().equals("SV")){
%>
    builtNewMenu(sv_m_opt);
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


<H3 align="center">Return Deposit Checks Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="Return_Dep_Cheks, ESD0095"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
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
                <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages One</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI010" value="<%= ESD009501.getE01SPI010().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI011" value="<%= ESD009501.getE01SPI011().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI012" value="<%= ESD009501.getE01SPI012().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI013" value="<%= ESD009501.getE01SPI013().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Two</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI020" value="<%= ESD009501.getE01SPI020().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI021" value="<%= ESD009501.getE01SPI021().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI022" value="<%= ESD009501.getE01SPI022().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI023" value="<%= ESD009501.getE01SPI023().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Three</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI030" value="<%= ESD009501.getE01SPI030().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI031" value="<%= ESD009501.getE01SPI031().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI032" value="<%= ESD009501.getE01SPI032().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI033" value="<%= ESD009501.getE01SPI033().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Four</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI040" value="<%= ESD009501.getE01SPI040().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI041" value="<%= ESD009501.getE01SPI041().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI042" value="<%= ESD009501.getE01SPI042().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI043" value="<%= ESD009501.getE01SPI043().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Five</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI050" value="<%= ESD009501.getE01SPI050().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI051" value="<%= ESD009501.getE01SPI051().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI052" value="<%= ESD009501.getE01SPI052().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI053" value="<%= ESD009501.getE01SPI053().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Six</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI060" value="<%= ESD009501.getE01SPI060().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI061" value="<%= ESD009501.getE01SPI061().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI062" value="<%= ESD009501.getE01SPI062().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI063" value="<%= ESD009501.getE01SPI063().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Seven</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI070" value="<%= ESD009501.getE01SPI070().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI071" value="<%= ESD009501.getE01SPI071().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI072" value="<%= ESD009501.getE01SPI072().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI073" value="<%= ESD009501.getE01SPI073().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Eight</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI080" value="<%= ESD009501.getE01SPI080().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI081" value="<%= ESD009501.getE01SPI081().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI082" value="<%= ESD009501.getE01SPI082().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI083" value="<%= ESD009501.getE01SPI083().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Nine</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI090" value="<%= ESD009501.getE01SPI090().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI091" value="<%= ESD009501.getE01SPI091().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI092" value="<%= ESD009501.getE01SPI092().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI093" value="<%= ESD009501.getE01SPI093().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"><b>Messages Ten</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI100" value="<%= ESD009501.getE01SPI100().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI101" value="<%= ESD009501.getE01SPI101().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI102" value="<%= ESD009501.getE01SPI102().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="70%" height="23"> 
              <div align="center"> 
                <input type="text" maxlength="70" size="71" name="E01SPI103" value="<%= ESD009501.getE01SPI103().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

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
