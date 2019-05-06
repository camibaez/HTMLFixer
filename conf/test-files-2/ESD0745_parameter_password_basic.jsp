<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Control Parameter for Password eIBS Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="pp" class="datapro.eibs.beans.ESD074501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Control Parameter for Password eIBS Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="parameter_password_basic, ESD0745" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0745" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
  </p>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Bank :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRBNK" size="3" maxlength="2" value="<%= pp.getE01EPRBNK().trim()%>" <% if (!userPO.getPurpose().equals("N")) out.print("readonly");%>>
             </td>  
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Description :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRDSC" size="40" maxlength="35" value="<%= pp.getE01EPRDSC().trim()%>" >
               
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Number of Days for Access to e-IBS :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPREXP" size="5" maxlength="4" value="<%= pp.getE01EPREXP().trim()%>" onkeypress="enterInteger()">
              <b>(0=Indefinite)</b>
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Number of Character in Password :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRPSL" size="4" maxlength="3" value="<%= pp.getE01EPRPSL().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Number of Repeated Characters Permitted :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRRPC" size="4" maxlength="3" value="<%= pp.getE01EPRRPC().trim()%>" onkeypress="enterInteger()">
              <b>(0=No Repetitions Allowed)</b>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Number of Letters Allowed :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRLET" size="4" maxlength="3" value="<%= pp.getE01EPRLET().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Number of Time a Failing Access Allowed :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRETM" size="4" maxlength="3" value="<%= pp.getE01EPRETM().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Number of Inactive for Change Status :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRDPI" size="5" maxlength="4" value="<%= pp.getE01EPRDPI().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Number of Days for Password Expiration :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRCHG" size="5" maxlength="4" value="<%= pp.getE01EPRCHG().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <h4>e-IBS and D-IBS Socket Number</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Initial e-IBS Port Number :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRSK1" size="12" maxlength="11" value="<%= pp.getE01EPRSK1().trim()%>" >
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Monitor Port Number for D-IBS :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRSk2" size="12" maxlength="11" value="<%= pp.getE01EPRSK2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Initial D-IBS Port Number :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRSK3" size="12" maxlength="11" value="<%= pp.getE01EPRSK3().trim()%>" >
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
 
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>

