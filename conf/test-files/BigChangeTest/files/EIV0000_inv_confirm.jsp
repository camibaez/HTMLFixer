<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Commissions Table</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="invComm" class="datapro.eibs.beans.EIE000001Message"  scope="session" />

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0312P?SCREEN=1'">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

 
<h3 align="center">Commissions Table Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_confirm, EIV0000" ></h3>
<hr size="4">

  
<table class="tableinfo" width="782" height="432">
 
  <tr >       
    <td> 
      <table   width="100%">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Table Number :</div>
                </td>
                <td nowrap width="66%" > <%= invComm.getE01COMTBL()%></td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Product Type :</div>
                </td>
                <td nowrap width="66%" > <%= invComm.getE01COMTYP()%> - <% if(invComm.getE01COMTYP().equals("BND")) out.print("BONDS");
              				else if(invComm.getE01COMTYP().equals("EQT")) out.print("EQUITY");
              				else if(invComm.getE01COMTYP().equals("ACD")) out.print("COMMODITIES");
							else out.print("MUTUAL FUNDS");%></td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Customer :</div>
                </td>
                <td nowrap width="66%" ><%= invComm.getE01COMCUN().trim()%> - 
                  <%= invComm.getD01DESCDE()%> </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Commission Currency :</div>
                </td>
                <td nowrap width="66%" ><%= invComm.getE01COMCCY()%> </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Table Description :</div>
                </td>
                <td nowrap width="66%" ><%= invComm.getE01COMDE0()%> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div align="center"></div>
      <p align="center">The operation has been finished successfully, please wait 
        ...</p>
    </td>
    </tr>
  </table>

</body>
</html>
