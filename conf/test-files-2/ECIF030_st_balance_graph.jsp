<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Statement Graphical Summary</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<%@ page import = "datapro.eibs.master.Util" %> 
<h3 align="center">Account Statement <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="st_balance_graph.jsp, ECIF030"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <h4>Summary</h4>

<table class="tableinfo" height="350">
    <tr> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" height="100%">
          <tr id="tbenter"> 
            <td nowrap colspan=2> 
              <div align="center">
				<APPLET archive="<%=request.getContextPath()%>/pages/e/eibs_applets.zip" code="MSBChart.ChartApplet.class" width="100%" height="100%" align="absmiddle" codebase="<%=request.getContextPath()%>/pages/e<%=request.getContextPath()%>/pages/e<%=request.getContextPath()%>/pages/e<%=request.getContextPath()%>/pages/e/">
				<PARAM NAME = "TITLECHART" VALUE = "Account Summary">
				<PARAM NAME = "LEGEND" VALUE = "TRUE">
				<PARAM NAME = "XLABEL" VALUE = "Date">
				<PARAM NAME = "YLABEL" VALUE = "Balance">
				<!--<PARAM NAME = "XAXIS_LABELS" VALUE = "<%= userPO.getHeader22().trim() %>">-->
				<PARAM NAME = "XAXIS_LABELS" VALUE = "June|July|Aug.|Sept.|Oct.|Nov.|Dec.|June|July|Aug.|Sept.|Oct.|Nov.|Dec.|June|July|Aug.|Sept.|Oct.|Nov.|Dec.">
				<PARAM NAME = "SERIE_1" VALUE = "Products">
				<PARAM NAME = "SERIE_TYPE_1" VALUE = "BAR3D">
				<PARAM NAME = "SERIE_STYLE_1" VALUE = "YELLOW">
				<PARAM NAME = "SERIE_FONT_1" VALUE = "Arial|BOLD|10">
				<PARAM NAME = "SERIE_DATA_1" VALUE = "<%= userPO.getHeader21().trim() %>">
				<!--<PARAM NAME = "SERIE_DATA_1" VALUE = "12|43|50|45|30|32|10">--> 
				<PARAM NAME = "CHART_BORDER" VALUE = "0.2|BLACK|LINE">
				<PARAM NAME = "BARCHART3D_DEPTH" VALUE = "15">
				<PARAM NAME = "BARCHART3D_FULL_DEPTH" VALUE = "TRUE">
				<PARAM NAME = "BARCHART3D_BACK" VALUE = "WHITE">
				<PARAM NAME = "CHART_FILL" VALUE = "LIGHTGRAY">
				<PARAM NAME = "BIG_TICK_INTERVALX" VALUE = "1">
				<PARAM NAME = "BIG_TICK_INTERVALY" VALUE = "10">
				<PARAM NAME = "YSCALE_MIN" VALUE = "-15">
				<PARAM NAME = "XSCALE_MIN" VALUE = "0">
				<PARAM NAME = "XSCALE_MAX" VALUE = "7">
				<PARAM NAME = "LEGEND_BORDER" VALUE = "0.2|BLACK|LINE">
				<PARAM NAME = "LEGEND_FILL" VALUE = "WHITE">
				<PARAM NAME = "SERIE_BORDER_TYPE_1" VALUE = "RAISED">
				<PARAM NAME = "XAXIS_GRID" VALUE = "0.2|LIGHTGRAY|DASHED">
				<PARAM NAME = "YAXIS_GRID" VALUE = "0.2|LIGHTGRAY|DASHED">
				<PARAM NAME = "BARCHART_BARSPACE" VALUE = "1">
				</APPLET>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=button name="Submit" OnClick="top.close()" value="Close"></p>
  </div>

  
</form>
</body>
</html>
