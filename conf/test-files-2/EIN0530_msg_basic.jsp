<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>>Alarm Messages Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="iin" class="datapro.eibs.beans.EIN053001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

<H3 align="center">Alarm Messages Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="msg_basic, EIN0530"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSEIN0530">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap  width="50%"> 
              <div align="right"><b>Application Code :</b></div>
            </td>
            <td nowrap width="50%"> 
              <div align="left"> 
                <input type="text" name="E01IAMAPC" size="3" maxlength="2" value="<%= iin.getE01IAMAPC().trim()%>" readonly>
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  width="50%"> 
              <div align="right"><b>Alarm Code :</b></div>
            </td>
            <td nowrap width="50%"> 
              <div align="left"> 
                <input type="text" name="E01IAMCDE" size="5" maxlength="4" readonly value="<%= iin.getE01IAMCDE().trim()%>" readonly>
              </div>
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right"><b>User ID 1 :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01IAMUS1" size="11" maxlength="10" value="<%= iin.getE01IAMUS1().trim()%>" >
               </div>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>User ID 2 :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01IAMUS2" size="11" maxlength="10" value="<%= iin.getE01IAMUS2().trim()%>" >
               </div>
            </td>
          </tr>
         <tr id="trclear"> 
            <td nowrap  > 
              <div align="right"><b>User ID 3 :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01IAMUS3" size="11" maxlength="10" value="<%= iin.getE01IAMUS3().trim()%>" >
               </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </p>  
 
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%> 
</form>
</body>
</html>
