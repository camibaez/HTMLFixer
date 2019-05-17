<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<TITLE>
Checks Viewer
</TITLE>


	  <%  String param = "";
	      String val = "";	      
	      val = (request.getParameter("ACC") != null) ? request.getParameter("ACC") : "" ; 
	      param = param + "ACC=" +  val;
	      val = (request.getParameter("CKN") != null) ? request.getParameter("CKN") : "" ; 
	      param = param + "&CKN=" +  val;
	      val = (request.getParameter("DATEM") != null) ? request.getParameter("DATEM") : "" ; 
	      param = param + "&DATEM=" +  val;
	      val = (request.getParameter("DATED") != null) ? request.getParameter("DATED") : "" ; 
	      param = param + "&DATED=" +  val;
	      val = (request.getParameter("DATEY") != null) ? request.getParameter("DATEY") : "" ; 
	      param = param + "&DATEY=" +  val;
	      val = (request.getParameter("AMT") != null) ? request.getParameter("AMT") : "" ; 
	      param = param + "&AMT=" +  val;
	      val = (request.getParameter("ROW") != null) ? request.getParameter("ROW") : "" ; 
	      param = param + "&ROW=" +  val;
	  %>
	  
<SCRIPT language="javascript">
	function showCheck(side) {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSCheckImage?<%= param %>&SIDE=" + side;
		document.all.CHECKVIEW.src = page;
	}
	
	function restoreSettings(){
	   document.all.btns.style.display ="";
	   document.all.CHECKVIEW.scrolling="YES"
	   document.all.CHECKVIEW.frameBorder="1";
	}
	
	function clearSettings(){
	   document.all.btns.style.display ="none";
	   document.all.CHECKVIEW.scrolling="NO"
	   document.all.CHECKVIEW.frameBorder="0";
	}
	
	function printCheck() {
		
		window.onafterprint=restoreSettings;
		window.onbeforeprint=clearSettings;
	    window.print();
		

	}
</SCRIPT>
</HEAD>
<body>
<h3 align="center">Check Viewer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rejection_chk_nsf_list.jsp,EDD0924"></h3>
<hr size="4">	  
  <form>
  
	<IFRAME NAME=CHECKVIEW SCROLLING=YES FRAMEBORDER=1 WIDTH=100% HEIGHT=70% SRC="<%=request.getContextPath()%>/pages/e/EWD0005_client_help_blank.jsp"></IFRAME>
	<br>
  	<table class="tbenter" id="btns">
  	    <tr>
  	      <td align="center" width ="33%">
  	      	<input id="EIBSBTN" type=button name="front" value="front" onClick="showCheck('F')">
  	      </td>
  	      <td align="center" width ="33%">
  	        <input id="EIBSBTN" type=button name="rear" value="back" onClick="showCheck('R')">
  	      </td>
  	      <td align="center" width ="33%">
  	      	<input id="EIBSBTN" type=button name="print" value="print" onClick="printCheck()">
  	      </td>
  	    </tr>
  	</table>
  </form>
  <SCRIPT language="javascript">
	 showCheck("F");	
  </SCRIPT>
</body>
</HTML>