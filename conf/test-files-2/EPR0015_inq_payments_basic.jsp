<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="payments" class="datapro.eibs.beans.EPR0015DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> Payment Interface Details - Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inq_payments_basic.jsp,EPR0015"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0301" >
  <h4>
    <input type="hidden" name="SCREEN" value="1">
    Basic Information </h4>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Agreement Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRCAGR" size="12" maxlength="9" value="<%= payments.getE01PRCAGR()%>">
            </td>
            <td nowrap align="right">Reference :</td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRCREF" size="30" maxlength="30" value="<%= payments.getE01PRCREF()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Customer Account : </div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRCACC" size="15" maxlength="12" value="<%= payments.getE01PRCACC()%>">
            </td>
            <td nowrap > 
              <div align="right">Status :</div>
            </td>
            <td nowrap> 
              <input type="hidden" name="E01PRCSTS" value="<%= payments.getE01PRCSTS()%>">
              <input type="radio" name="CE01PRCSTS" value="A" 
			  <%if(payments.getE01PRCSTS().equals("A")) out.print("checked");%> disabled>
              Active 
              <input type="radio" name="CE01PRCSTS" value="C" 
			  <%if(payments.getE01PRCSTS().equals("C")) out.print("checked");%> disabled>
              Inactive </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Default G/L :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01PRCSDG" size="15" readonly maxlength="12" value="<%= payments.getE01PRCSDG()%>">
            </td>
            <td nowrap >&nbsp;</td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information </h4>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Customer :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01DESNA1" size="30" maxlength="30" value="<%= payments.getE01DESNA1()%>" >
            </td>
            <td nowrap align="right">Last Update :</td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRCTD1" size="3" maxlength="2" value="<%= payments.getE01PRCTD1()%>" >
              <input type="text" readonly  name="E01PRCTD2" size="3" maxlength="2" value="<%= payments.getE01PRCTD2()%>" >
              <input type="text" readonly  name="E01PRCTD3" size="3" maxlength="2" value="<%= payments.getE01PRCTD3()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Last Time Process :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRPLTM" size="10" maxlength="8" value="<%= payments.getE01PRPLTM()%>" >
            </td>
            <td nowrap > 
              <div align="right">Last Process :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01PRPLD1" size="3" maxlength="2" value="<%= payments.getE01PRPLD1()%>" readonly>
              <input type="text" name="E01PRPLD2" size="3" maxlength="2" value="<%= payments.getE01PRPLD2()%>" readonly>
              <input type="text" name="E01PRPLD3" size="3" maxlength="2" value="<%= payments.getE01PRPLD3()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Last Total Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRPAMT" size="17" maxlength="15" value="<%= payments.getE01PRPAMT()%>" >
            </td>
            <td nowrap > 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRPRCD" size="6" maxlength="4" value="<%= payments.getE01PRPRCD()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">User :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01PRPUSR" size="14" maxlength="12" value="<%= payments.getE01PRPUSR()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Back">
        </div>
      </td>
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
