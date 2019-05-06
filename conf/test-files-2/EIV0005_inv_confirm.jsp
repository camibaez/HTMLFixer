<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0306P?SCREEN=1'">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invBrok" class="datapro.eibs.beans.EIE000501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


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


%>
<div align="center"> 
  <h3>Confirmation </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0005" >
  <table class="tableinfo" height="100%">
    <tr > 
      <td> 
        <table width="100%"  >
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="trdark"> 
                  <td nowrap width="17%" > 
                    <div align="right">Code :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBNUM()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">Tax ID :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBBID()%> </td>
                </tr>
                <tr id="trclear"> 
                  <td nowrap width="17%" > 
                    <div align="right">Name :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBNM1()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">Short Name :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBSNM()%> </td>
                </tr>
                <tr id="trdark"> 
                  <td nowrap width="17%" > 
                    <div align="right">Address :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBNM2()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">City :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBCTY()%> </td>
                </tr>
                <tr id="trclear"> 
                  <td nowrap width="17%" > 
                    <div align="right"> </div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBNM3()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">State :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBSTE()%> </td>
                </tr>
                <tr id="trdark"> 
                  <td nowrap width="17%" > 
                    <div align="right"></div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBNM4()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">Country :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBCTR()%> </td>
                </tr>
                <tr id="trclear"> 
                  <td nowrap width="17%" > 
                    <div align="right">P. O Box :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBZPC()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">Zip Code :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBZIP()%> </td>
                </tr>
                <tr id="trdark"> 
                  <td nowrap width="17%" > 
                    <div align="right">Phone Number 1 :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBPH1()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">Phone Number 2 :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBPH2()%> </td>
                </tr>
                <tr id="trclear"> 
                  <td nowrap width="17%" > 
                    <div align="right">Fax Number :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBFA1()%> </td>
                  <td nowrap width="14%" >&nbsp;</td>
                  <td nowrap width="33%" >&nbsp;</td>
                </tr>
                <tr id="trdark"> 
                  <td nowrap width="17%" > 
                    <div align="right">eMail Address 1 :</div>
                  </td>
                  <td nowrap width="36%" > <%= invBrok.getE01FEBIA1()%> </td>
                  <td nowrap width="14%" > 
                    <div align="right">eMail Address 2 :</div>
                  </td>
                  <td nowrap width="33%" > <%= invBrok.getE01FEBIA2()%> </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <p align="center">The operation has been finished successfully, please 
          wait ...</p>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
