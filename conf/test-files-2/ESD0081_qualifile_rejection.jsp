<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Personal Client</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ESD008001Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="javascript">

function showInqOFAC(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }
</script>

<%
 if ( !userPO.getPurpose().equals("NEW") ) {
%>

   <SCRIPT Language="Javascript">
       
      builtNewMenu(client_personal_opt);
       
   </SCRIPT>

<%
}
%>

</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">Customer Information Response - Rejection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_personal_basic, ESD0080" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <input type=hidden name="E81LGT" value="<%= client.getE81LGT()%>">
  </p>
  <h4>Customer Information (As Entered)</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Name :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81FRN" size="13" maxlength="12" value="<%= client.getE81FRN().trim()%>">
                <input type="text" name="E81MDI" size="2" maxlength="1" value="<%= client.getE81MDI().trim()%>">
                <input type="text" name="E81LSN" size="21" maxlength="20" value="<%= client.getE81LSN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Address :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81ADR" size="26" maxlength="25" value="<%= client.getE81ADR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81CTY" size="21" maxlength="20" value="<%= client.getE81CTY().trim()%>">
                <input type="text" name="E81STE" size="3" maxlength="2" value="<%= client.getE81STE().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81ZPC" size="10" maxlength="9" value="<%= client.getE81ZPC().trim()%>" onKeyPress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Social Security :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81SSN" size="16" maxlength="9" value="<%= client.getE81SSN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Driver License :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E81DRL" size="26" maxlength="25" value="<%= client.getE81DRL().trim()%>">
                <input type="text" name="E81DRS" size="3" maxlength="2" value="<%= client.getE01PID().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Date of Birth :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="EFUBDD" size="3" maxlength="2" value="<%= client.getEFUBDD().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    
  <h4>Account Actions</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Action :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="E81ACT" size="11" maxlength="10" value="<%= client.getE81ACT().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Reference Details</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Debit Bureau Reference :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="E81DBR" size="13" maxlength="12" value="<%= client.getE81DBR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Credit Bureau ID :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="E81CBI" size="5" maxlength="4" value="<%= client.getE81CBI().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Credit Bureau Reference :</div>
            </td>
            <td nowrap width="68%" > 
              <input type="text" name="E81BRF" size="20" maxlength="19" value="<%= client.getE81BRF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Transaction Tracking ID :</div>
            </td>
            <td nowrap width="68%" >
              <input type="text" name="E81TTI" size="50" maxlength="48" value="<%= client.getE81TTI().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

