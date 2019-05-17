<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Operational Summary  by Customers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF01003Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<%@ page  import = "datapro.eibs.master.Util" %> 
<h3 align="center">Operational Summary by Customer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_totals_graph.jsp,ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <h4>Summary</h4>
  <table class="tableinfo" width="90%" height="65%">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" height="100%">
          <tr id="tbenter">
            <td nowrap colspan=2> 
              <div align="center"> <%
              		if ( !cifTotal.getE03TOTASS().equals("0.00") ) {
					   
              	%> <APPLET archive="eibs_applets.zip" code="datapro.eibs.applets.graph.PieChart.class" width="100%" height="100%" align="absmiddle" codebase="<%=request.getContextPath()%>/pages/e/">
                  <param name=title value="Assets">
                  <param name=showlabel   value="YES">
                  <param name=showpercent value="YES">
                  <param name=bgcolor value="#D1D1D1">
                  <param name=columns value="11">
                  <param name=Plabel1 value="Overdraft">
                  <param name=Pvalue1 value="<%= cifTotal.getP03OVDRFT().trim()%>">
                  <param name=Pcolor1 value="#0066FF">
                  <param name=Plabel2 value="Mortgages">
                  <param name=Pvalue2 value="<%= cifTotal.getP03LNSMOR().trim()%>">
                  <param name=Pcolor2 value="#CC99FF">
                  <param name=Plabel3 value="Leasing">
                  <param name=Pvalue3 value="<%= cifTotal.getP03LNSLSG().trim()%>">
                  <param name=Pcolor3 value="#00CCFF">
                  <param name=Plabel4 value="Consumption">
                  <param name=Pvalue4 value="<%= cifTotal.getP03LNSCON().trim()%>">
                  <param name=Pcolor4 value="#00C000">
                  <param name=Plabel5 value="Loans">
                  <param name=Pvalue5 value="<%= cifTotal.getP03LNSGRL().trim()%>">
                  <param name=Pcolor5 value="#00FFFF">
                  <param name=Plabel6 value="Discounted">
                  <param name=Pvalue6 value="<%= cifTotal.getP03DESDOC().trim()%>">
                  <param name=Pcolor6 value="#FFFF00">
                  <param name=Plabel7 value="Investment">
                  <param name=Pvalue7 value="<%= cifTotal.getP03INVERA().trim()%>">
                  <param name=Pcolor7 value="#00FF33">
                  <param name=Plabel8 value="Acceptances">
                  <param name=Pvalue8 value="<%= cifTotal.getP03ACEPTA().trim()%>">
                  <param name=Pcolor8 value="#FFCC33">
                  <param name=Plabel9 value="LC's">
                  <param name=Pvalue9 value="<%= cifTotal.getP03LCCONF().trim()%>">
                  <param name=Pcolor9 value="#FF3300">
                  <param name=Plabel10 value="Spot">
                  <param name=Pvalue10 value="<%= cifTotal.getP03SPTPUR().trim()%>">
                  <param name=Pcolor10 value="#99FF33">
                  <param name=Plabel11 value="Forward">
                  <param name=Pvalue11 value="<%= cifTotal.getP03FRWPUR().trim()%>">
                  <param name=Pcolor11 value="#FFFF99">
                  <param name=Plabel12 value="Option Purchased">
                  <param name=Pvalue12 value="<%= cifTotal.getP03OPTPUR().trim()%>">
                  <param name=Pcolor12 value="#99FF00">
                  <param name=Plabel13 value="FRA Purchased">
                  <param name=Pvalue13 value="<%= cifTotal.getP03FRAPUR().trim()%>">
                  <param name=Pcolor13 value="#FFFF22">
				  <param name=Plabel14 value="Financial Blocks">
                  <param name=Pvalue14 value="<%= cifTotal.getP03MMPPUR().trim()%>">
                  <param name=Pcolor14 value="#FFCC33">
                </APPLET><%
              		}
              	%> </div>
            </td>
            <td nowrap colspan=2> 
              <div align="center">
              	<%
              		if ( !cifTotal.getE03TOTLIA().equals("0.00") ) {
					   
              	%>
					<APPLET archive="eibs_applets.zip" code="datapro.eibs.applets.graph.PieChart.class" width="100%" height="100%" codebase="<%=request.getContextPath()%>/pages/e/">
                  <param name=title value="Liabilities">
                  <param name=showlabel   value="YES">
                  <param name=showpercent value="YES">
                  <param name=bgcolor value="#D1D1D1">
                  <param name=columns value="10">
                  <param name=Plabel1 value="DDA's">
                  <param name=Pvalue1 value="<%= cifTotal.getP03CTACTE().trim()%>">
                  <param name=Pcolor1 value="#00CCFF">
                  <param name=Plabel2 value="Savings">
                  <param name=Pvalue2 value="<%= cifTotal.getP03CTAAHO().trim()%>">
                  <param name=Pcolor2 value="#FFFF00">
                  <param name=Plabel3 value="Certificates">
                  <param name=Pvalue3 value="<%= cifTotal.getP03CDTDPO().trim()%>">
                  <param name=Pcolor3 value="#00FF33">
                  <param name=Plabel4 value="Investments">
                  <param name=Pvalue4 value="<%= cifTotal.getP03INVERP().trim()%>">
                  <param name=Pcolor4 value="#99FF33">
                  <param name=Plabel5 value="Participations">
                  <param name=Pvalue5 value="<%= cifTotal.getP03PARTIC().trim()%>">
                  <param name=Pcolor5 value="#FF3300">
                  <param name=Plabel6 value="Acceptances">
                  <param name=Pvalue6 value="<%= cifTotal.getP03ACEPTP().trim()%>">
                  <param name=Pcolor6 value="#CC99FF">
                  <param name=Plabel7 value="LC's">
                  <param name=Pvalue7 value="<%= cifTotal.getP03LCPROC().trim()%>">
                  <param name=Pcolor7 value="#0066FF">
                  <param name=Plabel8 value="Spot">
                  <param name=Pvalue8 value="<%= cifTotal.getP03SPTSAL().trim()%>">
                  <param name=Pcolor8 value="#FFCC33">
                  <param name=Plabel9 value="Forward">
                  <param name=Pvalue9 value="<%= cifTotal.getP03FRWSAL().trim()%>">
                  <param name=Pcolor9 value="#FF0000">
                  <param name=Plabel10 value="Money Market & Now">
                  <param name=Pvalue10 value="<%= cifTotal.getP03CTAMMK().trim()%>">
                  <param name=Pcolor10 value="#FF6600">
                  <param name=Plabel11 value="Option Sale">
                  <param name=Pvalue11 value="<%= cifTotal.getP03OPTSAL().trim()%>">
                  <param name=Pcolor11 value="#99FF00">
                  <param name=Plabel12 value="FRA Sale">
                  <param name=Pvalue12 value="<%= cifTotal.getP03FRASAL().trim()%>">
                  <param name=Pcolor12 value="#FFFF22">
                </APPLET>
              	<%
              		}
              	%>
				  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
		  <br>
		  <div align="center"> 
			   <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
		  </div>
  
</form>
</body>
</html>
