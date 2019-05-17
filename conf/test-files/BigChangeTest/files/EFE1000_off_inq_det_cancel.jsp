<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>
Official Checks
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="dvDocDet" class= "datapro.eibs.beans.ETL051002Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <input type=HIDDEN name="SCREEN" value="14">


  <h3 align="center">Official Checks - Cancellation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="off_inq_det.jsp, EFE1000"></h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right">Check Number:</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"> 
                <input type="hidden" name="E02OFMNCH"  value="<%= dvDocDet.getE02OFMNCH()%>" readonly>
                <%= dvDocDet.getE02OFMNCH().trim()%></div>
            </td>
            <td nowrap width="28%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" height="18" > 
              <div align="right">Bank / Branch :</div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="right">
                <input type="hidden" name="E02OFMBNK"  value="<%= dvDocDet.getE02OFMBNK()%>" readonly>
                <%= dvDocDet.getE02OFMBNK().trim()%> /
                <input type="hidden" name="E02OFMBRN"  value="<%= dvDocDet.getE02OFMBRN()%>" readonly>
                <%= dvDocDet.getE02OFMBRN().trim()%></div>
            </td>
            <td nowrap width="28%" height="18" > 
              <div align="right">General Ledger :</div>
            </td>
            <td nowrap height="18" width="24%" > 
              <div align="right">
                <input type="hidden" name="E02OFMGLN"  value="<%= dvDocDet.getE02OFMGLN()%>" readonly>
                <%= dvDocDet.getE02OFMGLN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="18" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="right">
                <input type="hidden" name="E02OFMCCY"  value="<%= dvDocDet.getE02OFMCCY()%>" readonly>
                <%= dvDocDet.getE02OFMCCY().trim()%></div>
            </td>
            <td nowrap width="28%" height="18" > 
              <div align="right">Amount :</div>
            </td>
            <td nowrap height="18" width="24%" > 
              <div align="right">
                <input type="hidden" name="E02OFMMCH"  value="<%= dvDocDet.getE02OFMMCH()%>" readonly>
                <%= Util.fcolorCCY(dvDocDet.getE02OFMMCH().trim())%></div>
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
              <div align="right">
                <input type="hidden" name="E02OFMAPL"  value="<%= dvDocDet.getE02OFMAPL()%>" readonly>
                <%= dvDocDet.getE02OFMAPL().trim()%></div>
            </td>
            <td nowrap width="26%" height="23" > 
              <div align="right">Beneficiary :</div>
            </td>
            <td nowrap height="23" width="26%" > 
              <div align="right">
                <input type="hidden" name="E02OFMBNF"  value="<%= dvDocDet.getE02OFMAPL()%>" readonly>
                <%= dvDocDet.getE02OFMBNF().trim()%></div>
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
              <div align="right">Payment Branch :</div>
            </td>
            <td nowrap width="26%" > 
              <div align="right"><%= dvDocDet.getE02PMTBRN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" height="10" >&nbsp;</td>
            <td nowrap width="20%" height="10" >
              <div align="right"><%= dvDocDet.getE02OFMAP2().trim()%></div>
            </td>
            <td nowrap width="26%" height="10" > 
              <div align="right"></div>
            </td>
            <td nowrap width="26%" height="10" >
              <div align="right"></div>
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
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Cancel Check">
  </p>
  </FORM>

</BODY>
</HTML>
