<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>
Others Documents
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="dvDocDet" class= "datapro.eibs.beans.ETL051002Message"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</HEAD>

<BODY>

<form>

  <h3 align="center">Miscelaneous Document Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="dv_inq_doc_det,ETL0510"></h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="28%" height="23" > 
              <div align="right">Document Number :</div>
            </td>
            <td nowrap width="20%" height="23" > 
              <div align="right"><%= dvDocDet.getE02OFMNCH().trim()%></div>
            </td>
            <td nowrap width="28%" height="23" > 
              <div align="right">Document Type :</div>
            </td>
            <td nowrap height="23" width="24%" > 
              <div align="right"><%= dvDocDet.getE02OFMDTY().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right">Reference / Account :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= dvDocDet.getE02OFMACC().trim()%></div>
            </td>
            <td nowrap width="28%" > 
              <div align="right">Document Status :</div>
            </td>
            <td nowrap width="24%" > 
              <div align="right"><%= dvDocDet.getE02OFMSCH().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="10" > 
              <div align="right">Name / Customer :</div>
            </td>
            <td nowrap width="20%" height="10" > 
              <div align="right"><%= dvDocDet.getE02CUSNA1().trim()%></div>
            </td>
            <td nowrap width="28%" height="10" > 
              <div align="right">Document Origin :</div>
            </td>
            <td nowrap width="24%" height="10" > 
              <div align="right"><%= dvDocDet.getE02OFMORI().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" height="18" > 
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="right"><%= dvDocDet.getE02OFMBNK().trim()%> / <%= dvDocDet.getE02OFMBRN().trim()%></div>
            </td>
            <td nowrap width="28%" height="18" > 
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap height="18" width="24%" > 
              <div align="right"><%= dvDocDet.getE02OFMGLN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="18" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="right"><%= dvDocDet.getE02OFMCCY().trim()%></div>
            </td>
            <td nowrap width="28%" height="18" > 
              <div align="right">Value :</div>
            </td>
            <td nowrap height="18" width="24%" > 
              <div align="right"><%= Util.fcolorCCY(dvDocDet.getE02OFMMCH().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="120"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="28%" height="23" > 
              <div align="right">Aplicant :</div>
            </td>
            <td nowrap width="20%" height="23" > 
              <div align="right"><%= dvDocDet.getE02OFMAPL().trim()%></div>
            </td>
            <td nowrap width="26%" height="23" > 
              <div align="right">Beneficiary :</div>
            </td>
            <td nowrap height="23" width="26%" > 
              <div align="right"><%= dvDocDet.getE02OFMBNF().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right">Payment Detail :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= dvDocDet.getE02OFMAP1().trim()%></div>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Payment Type :</div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="10" >&nbsp;</td>
            <td nowrap width="20%" height="10" >
              <div align="right"><%= dvDocDet.getE02OFMAP2().trim()%></div>
            </td>
            <td nowrap width="26%" height="10" > 
              <div align="right">Payment Branch :</div>
            </td>
            <td nowrap width="26%" height="10" >
              <div align="right"><%= dvDocDet.getE02PMTBRN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="10" > 
              <div align="right">Issued By :</div>
            </td>
            <td nowrap width="20%" height="10" > 
              <div align="right"><%= dvDocDet.getE02OFMUSR().trim()%></div>
            </td>
            <td nowrap width="26%" height="10" > 
              <div align="right">Issue Date :</div>
            </td>
            <td nowrap width="26%" height="10" > 
              <div align="right"> <%= Util.formatDate(dvDocDet.getE02OFMED1(),dvDocDet.getE02OFMED2(),dvDocDet.getE02OFMED3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" height="18" > 
              <div align="right">Paid By :</div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="right"><%= dvDocDet.getE02OFMUCN().trim()%></div>
            </td>
            <td nowrap width="26%" height="18" > 
              <div align="right">Payment Date :</div>
            </td>
            <td nowrap height="18" width="26%" > 
              <div align="right"><%= Util.formatDate(dvDocDet.getE02OFMMD1(),dvDocDet.getE02OFMMD2(),dvDocDet.getE02OFMMD3())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <!--<p align="center">
     <input id="EIBSBTN" type=button name="Submit" value="Close" onclick="top.close()">
   </p>-->
  </FORM>

</BODY>
</HTML>
