<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>
Payment Details
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="header" class= "datapro.eibs.beans.EDL090001Message"  scope="session"/>


<jsp:useBean id= "list" class= "datapro.eibs.beans.JBListRec"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</HEAD>

<BODY>

<form>
  <p> 
    <input TYPE=HIDDEN name="SCREEN" value="500">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  </p>

  <h3 align="center">Payment Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_crn_pay_det.jsp , EDL0900"> 
  </h3>
  <hr size="4">

<h4></h4>
  <%
   int row = Integer.parseInt(request.getParameter("Row"));
   list.setCurrentRow(row);
 %> 
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
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
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
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" height="23" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="17%" height="23" > 
              <div align="right"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="23%" height="23" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="35%" height="23" > 
              <div align="right"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="35%" > 
              <div align="right"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" height="18" > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="17%" height="18" > 
              <div align="right"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="23%" height="18" > 
              <div align="right">Calculation Type :</div>
            </td>
            <td nowrap width="35%" height="18" > 
              <div align="right"><%= userPO.getHeader15().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="14%" height="23" >Payment Number : <%= list.getRecord(0) %></td>
            <td nowrap width="4%" height="23" >&nbsp;</td>
            <td nowrap width="31%" height="23" > 
              <div align="left">Pay Date : <%= list.getRecord(1) %></div>
            </td>
            <td nowrap width="4%" height="23" >&nbsp;</td>
            <td nowrap width="47%" height="23" > 
              <div align="left">Date Paid : <%= list.getRecord(9) %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>

  <table class="tableinfo">
    <tr id="trdark"> 
      <th align=CENTER nowrap width="11%" >Description</th>
      <th align=CENTER nowrap width="9%" >Pay Amount</th>
      <th align=CENTER nowrap width="7%" >Amount Paid</th>
    </tr>
    <% if (!(list.getRecord(31).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(11) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(31) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(51) %></div>
      </td>
    </tr>
    <%   } %> <% if (!(list.getRecord(32).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(12) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(32) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(52) %></div>
      </td>
    </tr>
    <% }  %> <% if (!(list.getRecord(33).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(13) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(33) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(53) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(34).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(14) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(34) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(54) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(35).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(15) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(35) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(55) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(36).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(16) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(36) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(56) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(37).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(17) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(37) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(57) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(38).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(18) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(38) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(58) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(39).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="25" ><%= list.getRecord(19) %></td>
      <td align=CENTER  nowrap width="9%" height="25" > 
        <div align="right"><%= list.getRecord(39) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="25" > 
        <div align="right"><%= list.getRecord(59) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(40).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="22" ><%= list.getRecord(20) %></td>
      <td align=CENTER  nowrap width="9%" height="22" > 
        <div align="right"><%= list.getRecord(40) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="22" > 
        <div align="right"><%= list.getRecord(60) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(41).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(21) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(41) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(61) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(42).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(22) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(42) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(62) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(43).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(23) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(43) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(63) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(44).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(24) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(44) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(64) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(45).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(25) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(45) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(65) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(46).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(26) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(46) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(66) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(47).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(27) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(47) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(67) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(48).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(28) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(48) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(68) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(49).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(29) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(49) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(69) %></div>
      </td>
    </tr>
    <% } %> <% if (!(list.getRecord(50).equals("0.00") ) ){  %> 
    <tr> 
      <td align=CENTER  nowrap width="11%" height="23" ><%= list.getRecord(30) %></td>
      <td align=CENTER  nowrap width="9%" height="23" > 
        <div align="right"><%= list.getRecord(50) %></div>
      </td>
      <td align=CENTER  nowrap width="7%" height="23" > 
        <div align="right"><%= list.getRecord(70) %></div>
      </td>
    </tr>
    <%  }%> 
  </table>
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="3%" height="18" >&nbsp;</td>
            <td nowrap width="37%" height="18" >Pay Amount :<%= list.getRecord(71) %></td>
            <td nowrap width="4%" height="18" >&nbsp;</td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Amount Paid :<%= list.getRecord(72) %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  </FORM>

</BODY>
</HTML>
