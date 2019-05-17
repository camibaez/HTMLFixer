<html>
<head>
<title>Front Office Input</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">
function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;
</script>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>


<body bgcolor="#FFFFFF">
<H3 align="center"> Treasury - Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fe_enter_inquiry,EFE0000"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000">
<input type=HIDDEN name="SCREEN" value="200">
<input type=HIDDEN name="E01FESTYP">
  <input type=HIDDEN name="E01FESREF">

<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Account Number :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="ACCOUNT" size="12" maxlength="12">
          (Leave it in blank for all accounts)

        </div>
      </td>
    </tr>

   <tr id="trclear">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=submit name="Submit1" value="Submit">
   </TD>

   </tr>
 </TABLE>
</div>





  <center>
    <table border="0" class="tableinfo" width="100%">
      <tr id="trdark">
        <td width="313">
          <div align="center"><b>Currency Inquiries</b></div>
        </td>
        <td width="350">
          <div align="center"></div>
          <div align="center"><b>Front Office Inquiries</b></div>
        </td>
        <td width="309">
          <div align="center"><b>Deals Inquiries</b></div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="313">
          <div align="left">
            <input type="radio" name="INPTOPT" value="65">
            Currency Rates </div>
        </td>
        <td width="350">
          <input type="radio" name="INPTOPT" value="68">
          Incomplete Deals </td>
        <td width="309">
          <div align="left"><b>
            <input type="radio" name="INPTOPT" value="110"
			onClick="ShowEnterCod()">
            </b>Foreign Exchange Accounts<b> </b></div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="313">
          <div align="left">
            <input type="radio" name="INPTOPT" value="66">
            Currency Positions </div>
        </td>
        <td width="350"><b>
          <input type="radio" name="INPTOPT" value="69">
          </b>Todays Deals</td>
        <td width="309">
          <div align="left">
            <input type="radio" name="INPTOPT" value="111"
			onClick="ShowEnterCod()">
            FRA / IRS Accounts </div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="313">&nbsp;</td>
        <td>&nbsp;</td>
        <td>
          <input type="radio" name="INPTOPT" value="112"
		  onClick="ShowEnterCod()">
          Money Market Accounts </td>
      </tr>
      <tr id="trdark">
        <td width="313">
          <div align="center"><b>General Inquiries</b></div>
        </td>
        <td colspan="2">
          <div align="center"><b>Customer Inquiries</b></div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="313">
          <div align="left"> <b>
            <input type="radio" name="INPTOPT" value="120">
            </b>Logs Inquiry <b><b>
            <input type="text" name="ACCNUM" size="12" maxlength="12">
            <a href="javascript:GetFexAcc('ACCNUM')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></b>
            </b></div>
        </td>
        <td width="350">
          <div align="left">
            <input type="radio" name="INPTOPT" value="61" checked>
            Customer Details </div>
        </td>
        <td>
          <div align="left">
            <input type="radio" name="INPTOPT" value="43">
            Customer Deals </div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="313">&nbsp; </td>
        <td width="350">
          <div align="left">
            <input type="radio" name="INPTOPT" value="62">
            Customer Limits </div>
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr id="trclear">
        <td width="313">&nbsp; </td>
        <td colspan="2">Counterparty :
          <input type="text" name="CUNCOD" size="9" maxlength="9">
          <input type="text" name="CUNDSC" size="25" maxlength="25">
          <a href="javascript:GetCustomerDescId('CUNCOD','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          , or select a customer below </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td width="33%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="33%">
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> </td>
      </tr>
    </table>

    <br>
  </center>
  <center>
    <table  id="mainTable" class="tableinfo" height="30" width="14%">
      <tr>
        <td nowrap valign="top" width="100%" height="60">
          <table id="headTable">
            <tbody>
            <tr id="trintrot">
              <th align="CENTER" nowrap></th>
              <th align="CENTER" nowrap>Number</th>
              <th align="CENTER" nowrap>Name</th>
              <th align="CENTER" nowrap>Id</th>
            </tr>
            </tbody>
          </table>
          <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:100">
            <table id="dataTable"  style="font-size:7pt">
              <%
                custList.initRow();
                int k=1;
                while (custList.getNextRow()) {
                    if (custList.getFlag().equals("")) {
                    		out.println(custList.getRecord());
                    k++;
                    }
                }
            %>
            </table>
          </div>
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </center>


<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
  <%
 }
%> <b>
  <input type=HIDDEN name="totalRow" value="1">
  </b>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="11";
     function resizeDoc() {
       //divResize2(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
     }
     showChecked("ACCNUM");
     resizeDoc();
     window.onresize = resizeDoc;
function divResize2() {
  var minValue= mainTable.offsetTop + dataDiv1.offsetTop + 30;
  var h = 400 - minValue ;
  var totalrow= parseInt(document.forms[0].totalRow.value);
  var maxHeight= totalrow * 20;

  if (totalrow > 6) {
     dataDiv1.style.height= maxHeight + "";
     dataDiv1.style.overflowY="scroll";
  } else {
	dataDiv1.style.height= maxHeight + "";
   	dataDiv1.style.overflowY="";
  }
}

</SCRIPT>
</form>
</body>
</html>
