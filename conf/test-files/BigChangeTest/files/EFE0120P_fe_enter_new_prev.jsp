<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="JavaScript">

function showGInfo(idxRow){
  var i= parseInt(document.forms[0].ActGRow.value);
  var j= parseInt(document.forms[0].ActSGRow.value);
  var maxRow=0;
  gTable.rows[i].className="trnormal";
  gTable.rows[idxRow].className="trhighlight";
  document.forms[0].ActGRow.value=""+idxRow;
  document.all["sgTable"+i].style.display="none";
  document.all["sgTable"+idxRow].style.display="";
  document.all["ccTable"+i+"_"+j].style.display="none";
  document.all["ccTable"+idxRow+"_0"].style.display="";
  maxRow=document.all["sgTable"+idxRow].rows.length;
  for(k=0;k<maxRow;k++){
	document.all["sgTable"+idxRow].rows[k].className="trnormal";
  }
  document.all["sgTable"+idxRow].rows[0].className="trhighlight";
  document.forms[0].ActGRow.value=""+idxRow;
  document.forms[0].ActSGRow.value="0";
  document.forms[0].ActCCRow.value="0";
}

function showSGInfo(idxRow){
  var i= parseInt(document.forms[0].ActGRow.value);
  var j= parseInt(document.forms[0].ActSGRow.value);

  document.all["sgTable"+i].rows[j].className="trnormal";
  document.all["sgTable"+i].rows[idxRow].className="trhighlight";
  document.all["ccTable"+i+"_"+j].style.display="none";
  document.all["ccTable"+i+"_"+idxRow].style.display="";
  document.forms[0].ActSGRow.value=""+idxRow;
}

function clickSGckBox(val,idxRow){
  showSGInfo(idxRow);
  var i= parseInt(document.forms[0].ActGRow.value);
  var j= parseInt(document.forms[0].ActSGRow.value);

  var oObject = document.all.item("chkCCenter"+i+"_"+j);
   if (oObject != null){
     if (oObject.length != null){
      for(k=0;k>oObject.length;k++){
       oObject(k).checked=val;}
     }
     else{
      oObject.checked=val;
     }
   }
}

function clickGckBox(val,idxRow){
  showGInfo(idxRow);
  var oObject = document.all.item("chkSGroup"+idxRow);
   if (oObject != null){
     if (oObject.length != null){
      for(j=0;j < oObject.length;j++){
       oObject(j).checked=val;
	   var oObject1 = document.all.item("chkCCenter"+idxRow+"_"+j);
   		if (oObject1 != null){
     		if (oObject1.length != null){
      		for(k=0;k<oObject1.length;k++){
       			oObject1(k).checked=val;}
     		}
     		else{
     		 oObject1.checked=val;
     		}
   		}
	   }
     }
     else{
      oObject.checked=val;
	  clickSGckBox(val,0);
     }
   }
//  showGInfo(idxRow);
}
</SCRIPT>



</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "blGroup" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "blSGroup" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "fex" class= "datapro.eibs.beans.EFE0120DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Foreign Exchange - Dealer Slip Input<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fe_enter_new,EFE0120P"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFE0120P">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <input type=HIDDEN name="OPTION" value="1">
  </p>
  <table width="100%" border="0" class="tableinfo">
    <%
 if ( blGroup.getNoResult() ) {
%> <%
 }
 else {
%>
    <tr id="trdark">
      <td width="33%">
        <div align=center><b>Group</b></div>
      </td>
      <td width="33%">
        <div align=center><b>Sub-Group</b></div>
      </td>
      <td width="33%">
        <div align=center><b>Cost Center</b></div>
      </td>
    </tr>
    <tr id="trclear">
      <td width="33%">
        <div id="gDiv" class="scbarcolor" style="border-top : 1 solid black; border-left : 1 solid black;">
          <table id="gTable" width="100%" border="0">
            <%
                blGroup.initRow();
                while (blGroup.getNextRow()) {
    		%>
            <tr>
              <td>
                <div align="left">
                  <input type="checkbox" id="chkGroup" name="G_<%= blGroup.getRecord(1) %>" value="<%= blGroup.getRecord(1) %>" onClick="clickGckBox(this.checked,<%=blGroup.getCurrentRow()%>)">
                  <a href="javascript:showGInfo(<%=blGroup.getCurrentRow()%>)"><%= blGroup.getRecord(1) %>
                  - <%= blGroup.getRecord(2) %></a> </div>
              </td>
            </tr>
            <%
                }
    		%>
          </table>
        </div>
      </td>
      <td width="33%">
        <div id="sgDiv" class="scbarcolor" style="border-top : 1 solid black; border-left : 1 solid black;">
          <%
                String mf = "";
		  int j = 0;
          int k = 0;
		  blSGroup.initRow();
                while (blSGroup.getNextRow()) {
                    if (!blSGroup.getFlag().equals(mf)) {
			  mf = blSGroup.getFlag();
			  k = 0;
			  if (j > 0) {
    		%> </div>
  </table>
  <%
                    	  }
    		%>
  <table id="sgTable<%=j%>" style="display:none;" width="100%" border="0">
    <%
			  j++;
                    }
    		%>
    <tr valign=top>
      <td>
        <div align="left">
          <input type="checkbox" id="chkSGroup<%=j-1%>" name="S_<%= blSGroup.getRecord(1) %>" value="<%= blSGroup.getRecord(1) %>" onClick="clickSGckBox(this.checked,<%=k%>)">
          <a href="javascript:showSGInfo(<%=k%>)"><%= blSGroup.getRecord(1) %>
          - <%= blSGroup.getRecord(2) %></a> </div>
      </td>
    </tr>
    <%
			k++;
                }
    		%>
  </table>
  <%
 }
%>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr id="trdark">
      <td width="4%">&nbsp;</td>
      <td width="40%">&nbsp;</td>
      <td width="3%">&nbsp;</td>
      <td width="8%">
        <div align="center">Type</div>
      </td>
      <td width="20%">
        <div align="center">Description</div>
      </td>
      <td width="8%">
        <div align="center">Currency</div>
      </td>
      <td width="17%">
        <div align="center">Classification</div>
      </td>
    </tr>
    <tr id="trclear">
      <td width="4%">&nbsp;</td>
      <td width="40%">
        <input type="hidden" name="E01FESTYP" value="<%= fex.getE01FESTYP()%>">
        <input type="radio" name="OPTPRD" value="SPT"  <%if (fex.getE01FESTYP().equals("SPT")) out.print("checked"); %>
			  onClick="document.forms[0].E01FESTYP.value='SPT'">
        Spot </td>
      <td rowspan="4" width="3%"></td>
      <td rowspan="4" width="8%"></td>
      <td rowspan="4" width="20%"></td>
      <td rowspan="4" width="8%"></td>
      <td rowspan="4" width="17%"></td>
    </tr>
    <tr id="trdark">
      <td width="4%">&nbsp;</td>
      <td width="40%">
        <input type="radio" name="OPTPRD" value="FWR"  <%if (fex.getE01FESTYP().equals("FWR")) out.print("checked"); %>
			  onClick="document.forms[0].E01FESTYP.value='FWR'">
        Forward</td>
    </tr>
    <tr id="trclear">
      <td width="4%" height="2">&nbsp;</td>
      <td width="40%" height="2">
        <input type="radio" name="OPTPRD" value="OPT"  <%if (fex.getE01FESTYP().equals("OPT")) out.print("checked"); %>
			  onClick="document.forms[0].E01FESTYP.value='OPT'">
        Option</td>
    </tr>
    <tr id="trdark">
      <td width="4%" height="27">&nbsp;</td>
      <td width="40%" height="27">
        <input type="radio" name="OPTPRD" value="FRA"  <%if (fex.getE01FESTYP().equals("FRA")) out.print("checked"); %>
			  onClick="document.forms[0].E01FESTYP.value='FRA'">
        Foreign Rate Agreement</td>
    </tr>
    <tr id="trclear">
      <td width="4%">&nbsp;</td>
      <td colspan="6">&nbsp;</td>
    </tr>
    <tr id="trdark">
      <td width="4%">&nbsp;</td>
      <td colspan="6">Counterparty Name :
        <input type="text" name="E01FESCUN" size="9" maxlength="9">
        <input type="text" name="E01FESNA1" size="45" maxlength="45">
        <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
    </tr>
  </table>
  <p align="center">
    <input type=image class="imgfilter" name="Submit" src="<%=request.getContextPath()%>/images/e/bt_submit.gif"
  		onMouseDown="this.className='imgfilterpress'" onMouseUp="this.className='imgfilter'">
  </p>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
