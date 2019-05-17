<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Fixed Assets</title>
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

%>
<h3 align="center">Fixed Assets / Amortizations New <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fix_new.jsp, EFIX000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000" >
  <input type=HIDDEN name="SCREEN" value="600">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right">Asset/ Amortization I.D. :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" value="<%= fix.getE01FIXBNK()%>" >
                <input type="text" name="E01FIXBRN" size="4" maxlength="3" value="<%= fix.getE01FIXBRN()%>" >
				<a href="javascript:GetBranch('E01FIXBRN',document.forms[0].E01FIXBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absmiddle" border="0" ></a> 
                <input type="text" name="E01FIXASN" size="10" maxlength="9" value="<%= fix.getE01FIXASN()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" >
              <div align="right">General Ledger Number :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXGLN" size="14" maxlength="12" value="<%= fix.getE01FIXGLN()%>" >
			  <a href="javascript:GetLedger('E01FIXGLN',document.forms[0].E01FIXBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a></td>
            
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
                <input type="text" name="E01FIXCCN" size="9" maxlength="8" value="<%= fix.getE01FIXCCN()%>">
                <a href="javascript:GetCostCenter('E01FIXCCN',document.forms[0].E01FIXBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Cost Center" align="absmiddle" border="0" ></a></div>
            </td>
            <td nowrap > 
              <div align="right">Asset Status :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select name="E01FIXEST">
                  <option value=" " ></option>
                  <option value="A" <%if (fix.getE01FIXEST().equals("A")) {out.print("selected"); }%>>Asset</option>
                  <option value="D" <%if (fix.getE01FIXEST().equals("D")) { out.print("selected"); }%>>Total Depreciate</option>
                  <option value="R" <%if (fix.getE01FIXEST().equals("R")) { out.print("selected"); }%>>Damage</option>
                  <option value="M" <%if (fix.getE01FIXEST().equals("M")) { out.print("selected"); }%>>Stole</option>
                  <option value="V" <%if (fix.getE01FIXEST().equals("V")) { out.print("selected"); }%>>Sold</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Brand Description :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXMAR" size="21" maxlength="20" value="<%= fix.getE01FIXMAR()%>">
            </td>
            <td nowrap width="23%" > 
              <div align="right">Model :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXMOD" size="16" maxlength="15" value="<%= fix.getE01FIXMOD()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Location (&quot;AMO&quot; Amortization) 
                :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXLOC" size="4" maxlength="3" value="<%= fix.getE01FIXLOC()%>" 
			  >
              <a href="javascript:GetLoc('E01FIXLOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
            </td>
            <td nowrap width="23%" > 
              <div align="right">Serial Number :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXSER" size="15" maxlength="15" value="<%= fix.getE01FIXSER().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase. Price / Amortization Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPPR" size="16" maxlength="15" value="<%= fix.getE01FIXPPR().trim()%>" 
			  >
            </td>
            <td nowrap width="23%" > 
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXTIC" size="12" maxlength="11" value="<%= fix.getE01FIXTIC().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase Price :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPUS" size="16" maxlength="15" value="<%= fix.getE01FIXPUS().trim()%>" 
			  >
            </td>
            <td nowrap width="23%" > 
              <div align="right">Classification :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXCLS" size="4" maxlength="3" value="<%= fix.getE01FIXCLS()%>" 
			  >
                <a href="javascript:GetAct('E01FIXCLS')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Depreciation Percent :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FIXPRT" size="5" maxlength="4" value="<%= fix.getE01FIXPRT().trim()%>" 
			  >
            </td>
            <td nowrap > 
              <div align="right">Number of Months :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXMTH" size="4" maxlength="3" value="<%= fix.getE01FIXMTH().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Purchase / Iniciation Date :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXPDM" size="3" maxlength="2" value="<%= fix.getE01FIXPDM().trim()%>" 
			  >
                <input type="text" name="E01FIXPDD" size="3" maxlength="2" value="<%= fix.getE01FIXPDD().trim()%>" 
			  >
                <input type="text" name="E01FIXPDY" size="3" maxlength="2" value="<%= fix.getE01FIXPDY().trim()%>" 
			  >
                <a href="javascript:DatePicker(document.forms[0].E01FIXPDM,document.forms[0].E01FIXPDD,document.forms[0].E01FIXPDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
            <td nowrap > 
              <div align="right">Depreciation / Amortization Type 
                :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXDTY" size="2" maxlength="1" value="<%= fix.getE01FIXDTY().trim()%>">
                <a href="javascript:GetDepTyp('E01FIXDTY','STATIC_ln_dep_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a> 
                * </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Vendor Number (Fixed Asset) :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" value="<%= fix.getE01FIXPIN().trim()%>" onkeypress="enterInteger()">
			  <a href="javascript:GetVendor('E01FIXPIN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a> 			  
            </td>
            <td nowrap > 
              <div align="right">Residual Value (Fixed Asset) :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01FIXRVA" size="16" maxlength="15" value="<%= fix.getE01FIXRVA().trim()%>" 
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
                <input type="text" name="E01FIXRMK" size="26" maxlength="25" value="<%= fix.getE01FIXRMK().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >
              <div align="left">(*) Depreciation Type (Amortization 
                should always be &quot;S&quot;)</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
	      <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
