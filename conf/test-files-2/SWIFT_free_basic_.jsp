<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Foreign Exchange Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fex" class="datapro.eibs.beans.EFE0120DSMessage"  scope="session" />

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
<h3 align="center"> SWIFT Free Formats<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120P" >
  <p>
    <input type=HIDDEN name="SCREEN" value="14">
  </p>
  <h4>Basic Information</h4>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Upper Threshold :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMUPTT" size="10" maxlength="9" value="<%= fex.getE01CAMUPTT()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Primary Account Min/Bal :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01MINBAL2" size="10" maxlength="9" value="<%= userPO.getHeader3()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">End Relation On :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMER1T" size="2" maxlength="2" value="<%= fex.getE01CAMER1T().trim()%>" onKeyPress="enterInteger()">
                <input type="text" name="E01CAMER2T" size="2" maxlength="2" value="<%= fex.getE01CAMER2T().trim()%>" onKeyPress="enterInteger()">
                <input type="text" name="E01CAMER3T" size="2" maxlength="2" value="<%= fex.getE01CAMER3T().trim()%>" onKeyPress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E01CAMER1T,document.forms[0].E01CAMER2T,document.forms[0].E01CAMER3T)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
            <td nowrap > 
              <div align="right">Relation Status :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select name="E01CAMRSTT">
                  <option value="" <% if (fex.getE01CAMRSTT().equals("")) out.print("selected"); %>></option>
                  <option value="A" <% if (fex.getE01CAMRSTT().equals("A")) out.print("selected"); %>>Active</option>
                  <option value="H" <% if (fex.getE01CAMRSTT().equals("H")) out.print("selected"); %>>Held</option>
                  <option value="E" <% if (fex.getE01CAMRSTT().equals("E")) out.print("selected"); %>>Ended</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Minimum Investment Amount :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMITAT" size="10" maxlength="9" value="<%= fex.getE01CAMITAT()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">In Multiples of :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMTMOT" size="8" maxlength="7" value="<%= fex.getE01CAMTMOT()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">CD Investment Spread Rate :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMCDRTR" size="12" maxlength="11" value="<%= fex.getE01CAMCDRTR()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">CD Investment Spread Rate Sign :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CAMPOMT" size="2" maxlength="1" value="<%= fex.getE01CAMPOMT()%>">
                (+/-)</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">CD Investment Days :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01CAMCDDT" size="4" maxlength="3" value="<%= fex.getE01CAMCDDT()%>">
            </td>
            <td nowrap > 
              <div align="right">CD Investment Rate Table :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01CAMCDTT" size="3" maxlength="1" value="<%= fex.getE01CAMCDTT()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Corporation / Personal :</div>
            </td>
            <td nowrap ><select name="E01CAMCOPT">
                  <option value="" <% if (fex.getE01CAMCOPT().equals("")) out.print("selected"); %>></option>
                  <option value="C" <% if (fex.getE01CAMCOPT().equals("A")) out.print("selected"); %>>Corporate</option>
                  <option value="P" <% if (fex.getE01CAMCOPT().equals("H")) out.print("selected"); %>>Personal</option>
                </select></td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CAMRK1T" size="71" maxlength="70" value="<%= fex.getE01CAMRK1T()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CAMRK2T" size="71" maxlength="70" value="<%= fex.getE01CAMRK2T()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <div align="left"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><BR>
  </p>
</form>
</body>
</html>
