<html>
<head>
<title>Special Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="rtCodes" class="datapro.eibs.beans.ESD000002Message"   scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean  id="userPO" class="datapro.eibs.beans.UserPos"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

</SCRIPT>

<body bgcolor="#FFFFFF">

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

<h3 align="center">Special Codes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_codes,EDD1000"></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <p>
    <INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="14">
  </p>
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
                <input type="text"  readonly name="E02CUN" size="9" maxlength="9"  value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  readonly name="E02NA1" size="45" maxlength="45"  value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  readonly name="E02ACC" size="12" maxlength="12" value="<%= rtCodes.getE02ACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  readonly name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  readonly name="E02PRO" size="4" maxlength="4"  value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Special Codes</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" height="118">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Officer 1 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02OFC" size="5" maxlength="4" <% if (rtCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02OFC().trim()%>">
              <input type="text"  readonly name="D02OFC" size="40" maxlength="35" <% if (rtCodes.getF02OFC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02OFC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="37"> 
              <div align="right">Substitute Officer:</div>
            </td>
            <td nowrap width="70%" height="37"> 
              <input type="text"  readonly name="E02OF2" size="5" maxlength="4" <% if (rtCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02OF2().trim()%>">
              <input type="text"  readonly name="D02OF2" size="40" maxlength="35" <% if (rtCodes.getF02OF2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02OF2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02INC" size="5" maxlength="4" <% if (rtCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02INC().trim()%>">
              <input type="text"  readonly name="D02INC" size="40" maxlength="35" <% if (rtCodes.getF02INC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02INC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Line of Business :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02BUC" size="5" maxlength="4" <% if (rtCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02BUC().trim()%>">
              <input type="text"  readonly name="D02BUC" size="40" maxlength="35" <% if (rtCodes.getF02BUC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02BUC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Residence Country Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02GEC" size="5" maxlength="4" <% if (rtCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02GEC().trim()%>">
              <input type="text"  readonly name="D02GEC" size="40" maxlength="35" <% if (rtCodes.getF02GEC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02GEC().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Risk Country Code :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02GRC" size="5" maxlength="4" <% if (rtCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02GRC().trim()%>">
              <input type="text"  readonly name="D02GRC" size="40" maxlength="35" <% if (rtCodes.getF02GRC().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02GRC().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02UC" size="5" maxlength="6" <% if (rtCodes.getF02UC1().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02UC1().trim()%>">
              <input type="text"  readonly name="D02UC1" size="40" maxlength="35" <% if (rtCodes.getF02UC1().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02UC1().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02UC2" size="5" maxlength="4" <% if (rtCodes.getF02UC2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02UC2().trim()%>">
              <input type="text"  readonly name="D02UC2" size="40" maxlength="35" <% if (rtCodes.getF02UC2().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02UC2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02UC3" size="5" maxlength="4" <% if (rtCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02UC3().trim()%>">
              <input type="text"  readonly name="D02UC3" size="40" maxlength="35" <% if (rtCodes.getF02UC3().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02UC3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Call Report :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text"  readonly name="E02UC4" size="7" maxlength="6" <% if (rtCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getE02UC4().trim()%>">
              <input type="text"  readonly name="D02UC4" size="40" maxlength="35" <% if (rtCodes.getF02UC4().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= rtCodes.getD02UC4().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

