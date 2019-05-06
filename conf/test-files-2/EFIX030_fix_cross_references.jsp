<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Fixed Asset</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX03001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<% 	String readonly = ""; 
	if(userPO.getPurpose().trim().equals("INQUIRY")){
		readonly = "readonly";
	} 
%>
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
<h3 align="center">Fixed Asset/Amortization Cross Reference<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fix_cross_references.jsp, FIX030">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX030" >
  <input type=HIDDEN name="SCREEN" value="400">
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">General Ledger Number :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" readonly value="<%= fix.getE01FIXBNK()%>">
                <input type="text" name="E01FIXCCY" size="4" maxlength="3" readonly value="<%= fix.getE01FIXCCY()%>">
                <input type="text" name="E01FIXGLN" size="17" maxlength="16" value="<%= fix.getE01FIXGLN()%>" readonly>
                <input type="text" name="E01GLNDSC" size="36" maxlength="35" value="<%= fix.getE01GLNDSC()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Accumulated Depreciation</h4>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td nowrap width="15%" >
              <div align="right">General Ledger Debit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXDRA" size="17" maxlength="12" value="<%= fix.getE01FIXDRA()%>" <%=readonly %>>
                <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
                <a href="javascript:GetLedger('E01FIXDRA',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <%} %>
                <input type="text" name="E01DRADSC" size="36" maxlength="35" value="<%= fix.getE01DRADSC()%>" <%=readonly %> >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">General Ledger Credit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXCRA" size="17" maxlength="12" value="<%= fix.getE01FIXCRA()%>" <%=readonly %> >
              <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
              <a href="javascript:GetLedger('E01FIXCRA',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <%} %>
              <input type="text" name="E01CRADSC" size="36" maxlength="35" value="<%= fix.getE01CRADSC()%>" <%=readonly %> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Inflation Adjustment for Original Cost </h4>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td nowrap width="15%" >
              <div align="right">General Ledger Debit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXDAI" size="17" maxlength="12" value="<%= fix.getE01FIXDAI()%>" <%=readonly %> >
                <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
                <a href="javascript:GetLedger('E01FIXDAI',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <%} %>
                <input type="text" name="E01DAIDSC" size="36" maxlength="35" value="<%= fix.getE01DAIDSC()%>" <%=readonly %> >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">General Ledger Credit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXCAI" size="17" maxlength="12" value="<%= fix.getE01FIXCAI()%>" <%=readonly %> >
              <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
              <a href="javascript:GetLedger('E01FIXCAI',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <%} %>
              <input type="text" name="E01CAIDSC" size="36" maxlength="35" value="<%= fix.getE01CAIDSC()%>" <%=readonly %> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Inflation Adjustment for Account Depreciation </h4>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td nowrap width="15%" >
              <div align="right">General Ledger Debit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXADD" size="17" maxlength="12" value="<%= fix.getE01FIXADD()%>" <%=readonly %> >
                <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
                <a href="javascript:GetLedger('E01FIXADD',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <%} %>
                <input type="text" name="E01ADDDSC" size="36" maxlength="35" value="<%= fix.getE01ADDDSC()%>" <%=readonly %> >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">General Ledger Credit Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXADC" size="17" maxlength="12" value="<%= fix.getE01FIXADC()%>" <%=readonly %> >
              <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
              <a href="javascript:GetLedger('E01FIXADC',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <%} %>
              <input type="text" name="E01ADCDSC" size="36" maxlength="35" value="<%= fix.getE01ADCDSC()%>" <%=readonly %> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Lease-Out Assets</h4>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td nowrap width="15%" >
              <div align="right">Offset Assets Account :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left">
                <input type="text" name="E01FIXALD" size="17" maxlength="12" value="<%= fix.getE01FIXALD()%>" <%=readonly %> >
                <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
                <a href="javascript:GetLedger('E01FIXALD',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <%} %>
                <input type="text" name="E01ALDDSC" size="36" maxlength="35" value="<%= fix.getE01ALDDSC()%>" <%=readonly %> >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right">Offset Assets Depreciation :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="E01FIXALC" size="17" maxlength="12" value="<%= fix.getE01FIXALC()%>" <%=readonly %> >
              <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>
              <a href="javascript:GetLedger('E01FIXALC',document.forms[0].E01FIXBNK.value,'document.forms[0].E01FIXCCY.value','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <%} %>
              <input type="text" name="E01ALCDSC" size="36" maxlength="35" value="<%= fix.getE01ALCDSC()%>" <%=readonly %> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">
   <%if(!userPO.getPurpose().trim().equals("INQUIRY")){ %>   
 <div align="center">
	      <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>  
  <%} %>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
