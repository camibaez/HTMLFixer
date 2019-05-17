<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Deductions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="deduct" class="datapro.eibs.beans.EDL037001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
	builtNewMenu(ln_m_opt);
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
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<h3 align="center">Escrow Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ded_escrow_maint.jsp,EDL0370"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <input type=HIDDEN NAME="E01DLICDE"  value="<%= deduct.getE01DLICDE().trim()%>"> 
  
  <table class="tableinfo" id="headtable">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" >  
        <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" readonly value="<%= deduct.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Name : </b></div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left">                
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= deduct.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">                
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= deduct.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= deduct.getE01DEACCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
	            <input type="text" name="E01DEAPRO" size="4" maxlength="4" readonly value="<%= deduct.getE01DEAPRO().trim()%>">              
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
   <br></br>
   <h4></h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Beginning Balance : </div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01DLIBEG" size="17" maxlength="17" value="<%= deduct.getE01DLIBEG().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Next Escrow Deduction : </div>
            </td>
            <td nowrap>
              <input type="text" name="E01DLIPCL" size="17" maxlength="17" value="<%= deduct.getE01DLIPCL().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap > 
              <div align="right">Effective Date : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIDDM" size="2" maxlength="2" value="<%= deduct.getE01DLIDDM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLIDDD" size="2" maxlength="2" value="<%= deduct.getE01DLIDDD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLIDDY" size="2" maxlength="2" value="<%= deduct.getE01DLIDDY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLIDDM,document.forms[0].E01DLIDDD,document.forms[0].E01DLIDDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>                                    
        </table>
      </td>
    </tr>
  </table>
   

        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit" value="Submit">
        </div>
  <p>



</form>
</body>
</html>
