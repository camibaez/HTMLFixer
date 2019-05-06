<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Split</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Refresh" CONTENT="7;url='<%=request.getContextPath()%>/pages/background.jsp'">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invSplit" class="datapro.eibs.beans.EIE022001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body nowrap>

<div align="center"> 
  <h3>Split Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_orders_input.jsp,EIE110"> 
  </h3>
</div>
<hr size="4">
  <table>  
  	<tr>
      <td nowrap colspan="3" > 
        <div align="center"><font size="2">This Split has been succesfully 
          processed. <BR>
		Go to Split Approval option to continue the process.
		</font></div>
      </td>    
    </tr> 
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp; 
  </table>    
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <TR id="trclear">
			<TD nowrap width="17%">
				<DIV align="right">Split Number :</DIV>
			</TD>
			<TD nowrap width="36%">
				<%= invSplit.getE01SPLNUM()%>
			</TD>
		</TR>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument :</div>
            </td>
            <td nowrap width="36%" >
              <%= invSplit.getE01ISIIIC()%>&nbsp;
              <%= invSplit.getE01ISIDSC()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">ISIN :</div>
            </td>
            <td nowrap width="36%" ><%= invSplit.getE01ISINUM()%>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="17%" >
              <div align="right">Instrument Type :</div>
            </td>
            <td nowrap width="36%" >
              <%= invSplit.getE01ISIPTY()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Quantity :</div>
            </td>
            <td nowrap width="36%" > 
              <%= invSplit.getE01QUANTY()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Unit Price :</div>
            </td>
            <td nowrap width="36%" >
              <%= invSplit.getE01UNTPRI()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nominal Value :</div>
            </td>
            <td nowrap width="36%" >
              <%= invSplit.getE01NOMVAL()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="36%" > 
              <%= invSplit.getE01SCRFAC()%>
            </td>
          </tr>
          <TR id="trclear">
            <td nowrap width="17%" > 
              <div align="left">Record   Date :</div>
            </td> 
            <td nowrap  width="36%" >
            	<%= invSplit.getE01RECDT1()%> 
            	<%= invSplit.getE01RECDT2()%> 
            	<%= invSplit.getE01RECDT3()%>              
            <td >
          </tr>
           <TR id="trclear">
            <td nowrap width="17%" > 
              <div align="left">Efecctive   Date :</div>
            </td> 
            <td nowrap  width="36%" >
            	<%= invSplit.getE01PAYDT1()%> 
            	<%= invSplit.getE01PAYDT2()%> 
            	<%= invSplit.getE01PAYDT3()%>              
            <td >
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
