<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0002DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="JavaScript">
function validate() {
	var plastic = document.forms[0].E02CDRTPL.value;
	var lblOriginalBranch = document.getElementById("lblOriginalBranch");
	var txtOriginalBranch = document.getElementById("txtOriginalBranch");
	var lblVendor = document.getElementById("lblVendor");
	var txtVendor = document.getElementById("txtVendor");
	var lblDestinyBranch = document.getElementById("lblDestinyBranch");
	var txtDestinyBranch = document.getElementById("txtDestinyBranch");
	var lblQuantity = document.getElementById("lblQuantity");
	var txtQuantity = document.getElementById("txtQuantity");
	var lblStartingCard = document.getElementById("lblStartingCard");
	var txtStartingCard = document.getElementById("txtStartingCard");
	var lblEndingCard = document.getElementById("lblEndingCard");
	var txtEndingCard = document.getElementById("txtEndingCard");
	if (plastic == "50" ||
		plastic == "51" ||
		plastic == "52" ||
		plastic == "53" ||
		plastic == "54" ||
		plastic == "55" ||
		plastic == "56" ||
		plastic == "57" ||
		plastic == "58" ||
		plastic == "59" ||
		plastic == "60" ||
		plastic == "61" ||
		plastic == "62" ||
		plastic == "63" ||
		plastic == "64" ||
		plastic == "65" ||
		plastic == "66" ||
		plastic == "67" ||
		plastic == "68" ||
		plastic == "69" ||
		plastic == "70" ||
		plastic == "71" ||
		plastic == "72" ||
		plastic == "73" ||
		plastic == "74" ||
		plastic == "75" ||
		plastic == "76" ||
		plastic == "77" ||
		plastic == "78" ||
		plastic == "79" ||
		plastic == "80" ||
		plastic == "81" ||
		plastic == "82" ||
		plastic == "83" ||
		plastic == "84" ||
		plastic == "85" ||
		plastic == "86" ||
		plastic == "87" ||
		plastic == "88" ||
		plastic == "89" ||
		plastic == "90" ||
		plastic == "91" ||
		plastic == "92" ||
		plastic == "93" ||
		plastic == "94" ||
		plastic == "95" ||
		plastic == "96" ||
		plastic == "97" ||
		plastic == "98" ||
		plastic == "99") {
	 	setVisibility(lblOriginalBranch,"hidden");
	 	setVisibility(txtOriginalBranch,"hidden");
	 	setVisibility(lblVendor,"visible");
	 	setVisibility(txtVendor,"visible");
	 	setVisibility(lblDestinyBranch,"hidden");
	 	setVisibility(txtDestinyBranch,"hidden");
	 	setVisibility(lblQuantity,"visible");
	 	setVisibility(txtQuantity,"visible");
	 	setVisibility(lblStartingCard,"hidden");
	 	setVisibility(txtStartingCard,"hidden");
	 	setVisibility(lblEndingCard,"hidden");
	 	setVisibility(txtEndingCard,"hidden");
	}
	else {
	 	setVisibility(lblOriginalBranch,"visible");
	 	setVisibility(txtOriginalBranch,"visible");
	 	setVisibility(lblVendor,"hidden");
	 	setVisibility(txtVendor,"hidden");
	 	setVisibility(lblDestinyBranch,"visible");
	 	setVisibility(txtDestinyBranch,"visible");
	 	setVisibility(lblQuantity,"hidden");
	 	setVisibility(txtQuantity,"hidden");
	 	setVisibility(lblStartingCard,"visible");
	 	setVisibility(txtStartingCard,"visible");
	 	setVisibility(lblEndingCard,"visible");
	 	setVisibility(txtEndingCard,"visible");
	}
}
</SCRIPT>  



</head>
<body>
<h3 align="center">Send &amp; Receipt<BR>New
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_dist_recep_new.jsp, ECD0002"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="CONFIRM" VALUE="0">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Request # :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="hidden" name="E02CDRNUM" size="15" maxlength="13" value="<%= msgCD.getE02CDRNUM() %>">
                <input type="text" name="E02CDRNUMNEW" size="15" maxlength="13" readonly value="NEW">
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Card Type :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRTPL" size="3" maxlength="2" value="<%= msgCD.getE02CDRTPL() %>" onFocus="validate()">
				<a href="javascript:GetDescATMCard('E02CDRTPL','','D')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div id="lblOriginalBranch" align="right">Source Branch : </div>              
            </td>
            <td nowrap width="20%" > 
              <div id="txtOriginalBranch" align="left"> 
                <input type="text" name="E02CDRBRN" size="5" maxlength="4" value="<%= msgCD.getE02CDRBRN() %>" readonly="readonly" >
                <!-- 
				<a href="javascript:GetBranch('E02CDRBRN','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"  ></a> 
				 -->
              </div>
            </td>
            <td nowrap width="16%"> 
              <div id="lblDestinyBranch" align="right">Destiny Branch :</div>
            </td>
            <td nowrap width="16%"> 
              <div id="txtDestinyBranch" align="left">               
                <input type="text" name="E02CDRBRD" size="5" maxlength="4" value="<%= msgCD.getE02CDRBRD() %>">
				<a href="javascript:GetBranch('E02CDRBRD','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"  ></a>
                 </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div id="lblStartingCard" align="right">Initial Card : </div>              
            </td>
            <td nowrap width="20%"> 
              <div id="txtStartingCard" align="left">               
                <input type="text" name="E02CDRINI" size="20" maxlength="16" value="<%= msgCD.getE02CDRINI() %>">
				<a href="javascript:GetPlastic3('E02CDRINI', document.forms[0].E02CDRTPL.value,document.forms[0].E02CDRBRN.value, '','1')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div id="lblEndingCard" align="right">Ending Card : </div>              
            </td>
            <td nowrap width="20%" > 
              <div id="txtEndingCard" align="left">               
                <input type="text" name="E02CDREND" size="20" maxlength="16" value="<%= msgCD.getE02CDREND() %>">
				<a href="javascript:GetPlastic3('E02CDREND', document.forms[0].E02CDRTPL.value, document.forms[0].E02CDRBRN.value, '', '1')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a>
			  </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" valign="middle"> 
              <div id="lblVendor" align="right">Vendor : </div>
            </td>
            <td nowrap width="20%" valign="middle"> 
              <div id="txtVendor" align="left"> 
                <input type="text" name="E02CDRVEN" size="11" maxlength="10" value="<%= msgCD.getE02CDRVEN() %>" readonly="readonly" >
            	<a href="javascript:GetVendor('E02CDRVEN','1','')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0" ></a> 
              </div>
            </td>
            <td nowrap width="16%" valign="middle"> 
              <div id="lblQuantity" align="right">Amount : </div>
            </td>
            <td nowrap width="20%" valign="middle"> 
              <div id="txtQuantity" align="left"> 
                <input type="text" name="E02CDRQTY" size="5" maxlength="4" value="<%= msgCD.getE02CDRQTY() %>">
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
