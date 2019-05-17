<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Treasury Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00001Message"  scope="session" />

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
     
 out.println("<SCRIPT> initMenu();  </SCRIPT>");     

%>
<h3 align="center">Fixed Assets / Amortizations Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fix_inq.jsp, EFIX000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000" >
  <input type=HIDDEN name="SCREEN" value="900">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right">Fixed Assets / Amortizations I.D. :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" value="<%= fix.getE01FIXBNK()%>" readonly>
                <input type="text" name="E01FIXBRN" size="4" maxlength="3" value="<%= fix.getE01FIXBRN()%>" readonly>
                <input type="text" name="E01FIXASN" size="10" maxlength="9" value="<%= fix.getE01FIXASN()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" >
              <div align="right">General Ledger Number :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXGLN" size="17" maxlength="16" value="<%= fix.getE01FIXGLN()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Cost Center :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXCCN" size="9" maxlength="8" readonly value="<%= fix.getE01FIXCCN()%>">
                
            </td>
            <td nowrap > 
              <div align="right">Asset Status :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXEST" size="9" maxlength="8" readonly value="<%= fix.getE01FIXEST()%>">
                 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Brand Description :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXMAR" size="21" maxlength="20" readonly value="<%= fix.getE01FIXMAR()%>">
            </td>
            <td nowrap width="23%" > 
              <div align="right">Model :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXMOD" size="16" maxlength="15" readonly value="<%= fix.getE01FIXMOD()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Location (&quot;AMO&quot; Amortization) 
                :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXLOC" size="4" maxlength="3" readonly value="<%= fix.getE01FIXLOC()%>" >
			  
            </td>
            <td nowrap width="23%" > 
              <div align="right">Serial Number :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left">
                <input type="text" name="E01FIXSER" size="15" maxlength="15" readonly value="<%= fix.getE01FIXSER().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase. Price / Amortization Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPPR" size="16" maxlength="15" readonly value="<%= fix.getE01FIXPPR().trim()%>" 
			  >
            </td>
            <td nowrap width="23%" > 
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXTIC" size="12" maxlength="11" readonly value="<%= fix.getE01FIXTIC().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase Price :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPUS" size="16" maxlength="15" readonly value="<%= fix.getE01FIXPUS().trim()%>" 
			  >
            </td>
            <td nowrap width="23%" > 
              <div align="right">Classification :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left">
                <input type="text" name="E01FIXCLS" size="4" maxlength="3" readonly value="<%= fix.getE01FIXCLS()%>" >
			  
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Depreciation Percent :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FIXPRT" size="5" maxlength="4" readonly value="<%= fix.getE01FIXPRT().trim()%>" 
			  >
            </td>
            <td nowrap > 
              <div align="right">Number of Months :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXMTH" size="4" maxlength="3" readonly value="<%= fix.getE01FIXMTH().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase / Initiation Date :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXPDM" size="3" maxlength="2" readonly value="<%= fix.getE01FIXPDM().trim()%>" 
			  >
                <input type="text" name="E01FIXPDD" size="3" maxlength="2" readonly value="<%= fix.getE01FIXPDD().trim()%>" 
			  >
                <input type="text" name="E01FIXPDY" size="3" maxlength="2" readonly value="<%= fix.getE01FIXPDY().trim()%>" 
			  >
			  
              </div>
            </td>
            <td nowrap > 
              <div align="right">Depreciation / Amortization Type 
                :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXDTY" size="2" maxlength="1" readonly value="<%= fix.getE01FIXDTY().trim()%>">
                
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Vendor Number (Fixed Asstes) :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" readonly value="<%= fix.getE01FIXPIN().trim()%>">
			  
            </td>
            <td nowrap > 
              <div align="right">Residual Value (Fixed Asstes) :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXRVA" size="16" maxlength="15" readonly value="<%= fix.getE01FIXRVA().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="right"></div>
              <div align="left">
                <input type="text" name="E01FIXRMK" size="26" maxlength="25" readonly value="<%= fix.getE01FIXRMK().trim()%>" 
			  >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"><b>Depreciation / <br>
                Monthly Amortization</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Depreciation / <br>
                Accumulated Amortization</b></div>
            </td>
            <td nowrap ><b>Book Value</b></td>
            <td nowrap > 
              <div align="center"><b>Depreciation / <br>
                Amortization <br>
                Last Date</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Accumulated VAT<br>
                YTD</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Accumulated VAT<br>
                LTD</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right"><%= Util.fcolorCCY(fix.getE01FIXMDP())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(fix.getE01FIXADP())%></div>
            </td>
            <td nowrap >
              <div align="right"><%= Util.fcolorCCY(fix.getE01FIXBKV())%></div>
            </td>
            <td nowrap > 
              <div align="right"><b><%= Util.formatDate(fix.getE01FIXLDM(),fix.getE01FIXLDD(),fix.getE01FIXLDY())%></b></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(fix.getE01FIXVYD())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(fix.getE01FIXVLD())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
 
  </form>
</body>
</html>
