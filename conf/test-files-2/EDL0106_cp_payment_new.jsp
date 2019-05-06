<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">  
<%-- jsf:pagecode language="java" location="/JavaSource/pagecode/pages/e/EDL0106_cp_payment_new.java" --%><%-- /jsf:pagecode --%>
 <%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Payment Schedule</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="cdTrade" class="datapro.eibs.beans.EDL010601Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

 
 <SCRIPT Language="Javascript"> 
 
   builtNewMenu(cp_m_opt);
	
</SCRIPT>
    
 
</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
     
      out.println("<SCRIPT> initMenu();  </SCRIPT>");

 %>
  
<div align="center"> 
  <h3>New Payment Date <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_payment_new.jsp,EDL0106"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0106" >
  <h4> 
    <input type="hidden" name="SCREEN"  value="2" >
    Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="9%" >              
            <div align="left"> <%= userPO.getHeader1()%> </div>  
            </td>
            <td nowrap width="12%" > 
              <div align="right">Name :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= userPO.getHeader2()%> </div>
            </td>
         
          <td nowrap width="12%" > 
              <div align="right">Deal Type :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= userPO.getHeader5()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right">Account :</div>
            </td>
            <td nowrap width="9%">
              <div align="left"> <%= userPO.getIdentifier().trim()%> </div>               
            </td>
            <td nowrap width="12%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader3()%> </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Product :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader4()%> </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 

  <h4>Schedule Information </h4>
   <table  class="tableinfo">     
   <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="trdark"> 
              <td nowrap width="18%" > 
                <div align="right">Event Date :</div>
              </td>
              <td nowrap colspan="3" width="82%" > 
                <input type="text" name="E01SHDPAM" size="3" maxlength="2" onkeypress="enterInteger()" value="<%= cdTrade.getE01SHDPAM()%>">
                <input type="text" name="E01SHDPAD" size="3" maxlength="2" value="<%= cdTrade.getE01SHDPAD()%>">
                <input type="text" name="E01SHDPAY" size="3" maxlength="2" value="<%= cdTrade.getE01SHDPAY()%>">
                <a href="javascript:DatePicker(document.forms[0].E01SHDPAM,document.forms[0].E01SHDPAD,document.forms[0].E01SHDPAY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              </td>
          </tr>          
		      
          <tr id="trclear">
            <td nowrap width="18%" >
              <div align="right">Event Type :</div>
            </td>
            <td nowrap colspan="3" width="82%" >
              <div align="left">
                <input type="radio" name="E01SHDTYP" value="C" <% if (cdTrade.getE01SHDTYP().equals("C")) out.print("checked"); %> checked>
                Call 
                <input type="radio" name="E01SHDTYP" value="P" <% if (cdTrade.getE01SHDTYP().equals("P")) out.print("checked"); %>>
                Put
              </div> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
   </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>
  