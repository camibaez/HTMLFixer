<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE007001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
       
      builtNewMenu(inst_basic_opt);
 
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
  <h3>Instrument Payment Schedule Inquiry <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_payment_inq.jsp,EIE0070"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0070" >
  <h4> 
    <input type="hidden" name="SCREEN"  value="4" >
    Instrument Information</h4>
  <table  class="tableinfo">
    <tr id="trdark"> 
      <td nowrap width="29%" > 
        <div align="right"> 
          Instrument :
        </div>
      </td>
      <td nowrap width="71%" > 
        <input type="text" name="E01SCHIIC" size="9" maxlength="9" value="<%=invTrade.getE01SCHIIC()%>" readonly>
        <input type="text" name="D01ISIDSC" size="35" maxlength="30" value="<%= invTrade.getD01ISIDSC()%>" readonly>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="29%" > 
        <div align="right">Instrument Type : </div>
      </td>
      <td nowrap width="71%" > 
        <input type="text" name="D01ISIPTY" size="5" maxlength="3" value="<%=invTrade.getD01ISIPTY()%>" readonly>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap width="29%" > 
        <div align="right">Instrument Currency :</div>
      </td>
      <td nowrap width="71%" > 
        <div align="left"> 
          <input type="text" name="D01ISICCY" size="4" maxlength="3" value="<%= invTrade.getD01ISICCY()%>" readonly>
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="29%" > 
        <div align="right">
          Symbol :</div>
      </td>
      <td nowrap width="71%" > 
        <div align="left"> 
          <input type="text" name="D01ISISYM" size="17" maxlength="15" value="<%= invTrade.getD01ISISYM()%>"readonly>
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap width="29%" > 
        <div align="right">ISIN :</div>
      </td>
      <td nowrap width="71%" > 
        <div align="left"> 
          <input type="text" name="D01ISINUM" size="14" maxlength="12" value="<%= invTrade.getD01ISINUM()%>"readonly>
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="29%" > 
        <div align="right">CUSIP :</div>
      </td>
      <td nowrap width="71%" > 
        <div align="left"> 
          <input type="text" name="D01ISICUS" size="14" maxlength="12" value="<%= invTrade.getD01ISICUS()%>"readonly>
        </div>
      </td>
    </tr>
  </table>
  <h4>Coupon Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap colspan="3" width="82%"> 
             <input type="text" readonly name="D01PAYDSC" size="15" maxlength="15" value="<%= invTrade.getD01PAYDSC()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" readonly name="E01SCHAM1" size="15" maxlength="15" value="<%= invTrade.getE01SCHAM1()%>" 
				onKeyPress="enterDecimal()">
              <input type="radio" name="E01SCHPFO" disabled value="F" <% if (invTrade.getE01SCHPFO().equals("F")) out.print("checked"); %>>
              Fixed 
              <input type="radio" name="E01SCHPFO" disabled value="%" <% if (invTrade.getE01SCHPFO().equals("%")) out.print("checked"); %>>
              Percentage </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Payment  Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHPA1" size="3" maxlength="2" value="<%= invTrade.getE01SCHPA1()%>"readonly>
              <input type="text" name="E01SCHPA2" size="3" maxlength="2" value="<%= invTrade.getE01SCHPA2()%>"readonly>
              <input type="text" name="E01SCHPA3" size="3" maxlength="2" value="<%= invTrade.getE01SCHPA3()%>"readonly>
            </td>
          </tr>
          <%
          if ((invTrade.getD01ISIPTY().equals("EQT")) || (invTrade.getD01ISIPTY().equals("MUT")) || (invTrade.getD01ISIPTY().equals("ACD")));
          {%> 

          <tr id="trclear"> 
            <td nowrap width="18%" > 
            <div align="right">Declared Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
        	   	<input type="text" name="E01SCHDE1" size="3" maxlength="2" value="<%= invTrade.getE01SCHDE1()%>"readonly>
    	        <input type="text" name="E01SCHDE2" size="3" maxlength="2" value="<%= invTrade.getE01SCHDE2()%>"readonly>
	            <input type="text" name="E01SCHDE3" size="3" maxlength="2" value="<%= invTrade.getE01SCHDE3()%>"readonly>
            	<a href="javascript:DatePicker(document.forms[0].E01SCHDE1,document.forms[0].E01SCHDE2,document.forms[0].E01SCHDE3)"></a>
            </td>  
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Record Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHRE1" size="3" maxlength="2" value="<%= invTrade.getE01SCHRE1()%>">
              <input type="text" name="E01SCHRE2" size="3" maxlength="2" value="<%= invTrade.getE01SCHRE2()%>">
              <input type="text" name="E01SCHRE3" size="3" maxlength="2" value="<%= invTrade.getE01SCHRE3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01SCHRE1,document.forms[0].E01SCHRE2,document.forms[0].E01SCHRE3)"></a> 
            </td>
          </tr>
		   <%}%> 
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Event Type :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="radio" name="E01SCHFL0" disabled value="" <% if (invTrade.getE01SCHFL0().equals("")) out.print("checked"); %> checked>
              Normal Payment 
              <input type="radio" name="E01SCHFL0" disabled value="M" <% if (invTrade.getE01SCHFL0().equals("M")) out.print("checked"); %>>
              Maturity 
              <input type="radio" name="E01SCHFL0" disabled value="C" <% if (invTrade.getE01SCHFL0().equals("C")) out.print("checked"); %>>
              Call</td>
          </tr>
         
        </table>
      </td>
    </tr>
  </table>
  <h4>Transaction Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <%if (invTrade.getD01ISIPTY().equals("EQT")){%> <%}%> 
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Status :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" readonly name="D01STSDSC" size="15" maxlength="15" value="<%= invTrade.getD01STSDSC()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Amount of Payments Posted :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHNPA" size="7" maxlength="5" value="<%= invTrade.getE01SCHNPA()%>" 
				READONLY>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Total Paid Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHAM2" size="15" maxlength="15" value="<%= invTrade.getE01SCHAM2()%>" 
				READONLY>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
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
