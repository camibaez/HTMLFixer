<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE006001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0060?SCREEN=400'">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

 
<h3 align="center"> Quotes Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_del_confirm, EIV0000" ></h3>
<hr size="4">

  <table class="tableinfo" height="100%">
    <tr > 
      
    <td> 
      <table   width="100%" border="1">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Code :</div>
                </td>
                <td nowrap width="36%" > <%= invInst.getE01QUOIIC()%> - <%= invInst.getD01ISIDSC()%> 
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Symbol :</div>
                </td>
                <td nowrap width="33%" > <%= invInst.getD01ISISYM()%> </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Instrument Type :</div>
                </td>
                <td nowrap width="36%" > <%= invInst.getD01ISIPTY()%> </td>
                <td nowrap width="14%" > 
                  <div align="right">Currency :</div>
                </td>
                <td nowrap width="33%" ><%= invInst.getD01ISICCY()%> </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Date :</div>
                </td>
                <td nowrap width="36%" > <%= Util.formatDate(invInst.getE01QUOTE1(),invInst.getE01QUOTE2(), invInst.getE01QUOTE3())%> 
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Market Price :</div>
                </td>
                <td nowrap width="33%" > <%= Util.fcolorCCY(invInst.getE01QUOMKP())%> 
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Price Open :</div>
                </td>
                <td nowrap width="36%" > <%= Util.fcolorCCY(invInst.getE01QUOOPP())%> 
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Price Close :</div>
                </td>
                <td nowrap width="33%" > <%= Util.fcolorCCY(invInst.getE01QUOCLP())%> 
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Average Price Buy :</div>
                </td>
                <td nowrap width="36%" > <%= Util.fcolorCCY(invInst.getE01QUOAVP())%> 
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Average Price Sale :</div>
                </td>
                <td nowrap width="33%" > <%= Util.fcolorCCY(invInst.getE01QUOAVS())%> 
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    <table  class="tableinfo" width="715">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">52 Weeks High Price :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" name="E01QUOHIP" size="15" maxlength="13" value="<%= invInst.getE01QUOHIP()%>" 
				onKeyPress="enterDecimal()">
                </td>
                <td nowrap width="14%" > 
                  <div align="right">52 Weeks Low Price :</div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" name="E01QUOLOP" size="15" maxlength="13" value="<%= invInst.getE01QUOLOP()%>" 
				onKeyPress="enterDecimal()">
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="17%" > 
                  <div align="right">Prior Close Price Bid :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" name="E01QUOBIP" size="15" maxlength="13" value="<%= invInst.getE01QUOBIP()%>" 
				onKeyPress="enterDecimal()">
                </td>
                <td nowrap width="14%" > 
                  <div align="right">Prior Close Price Ask :</div>
                </td>
                <td nowrap width="33%" > 
                  <input type="text" name="E01QUOASP" size="15" maxlength="13" value="<%= invInst.getE01QUOASP()%>" 
				onKeyPress="enterDecimal()">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="17%" > 
                  <div align="right">Prior Close Price Mid :</div>
                </td>
                <td nowrap width="36%" > 
                  <input type="text" name="E01QUOMIP" size="15" maxlength="13" value="<%= invInst.getE01QUOMIP()%>" 
				onKeyPress="enterDecimal()">
                </td>
                <td nowrap width="14%" > 
                  <div align="right"></div>
                </td>
                <td nowrap width="33%" >&nbsp; </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
    </td>
    </tr>
  </table>

</body>
</html>
