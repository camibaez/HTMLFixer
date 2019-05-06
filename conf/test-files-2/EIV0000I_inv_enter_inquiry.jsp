<html>
<head>
<title>Investment Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
   	  enterINST.filters[0].apply();
      enterINST.style.visibility="hidden";
      enterINST.filters[0].Play();
	  enterEvent.filters[0].apply();
      enterEvent.style.visibility="hidden";
      enterEvent.filters[0].Play();
      enterEventNew.filters[0].apply();
      enterEventNew.style.visibility="hidden";
      enterEventNew.filters[0].Play();

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

function ShowEnterInstCod() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterINST.style.pixelTop=' + y);
     eval('enterINST.style.pixelLeft=' + x);
	 enterINST.filters[0].apply();
     enterINST.style.visibility="visible";
     enterINST.filters[0].Play();

}

function ShowEvent() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterEvent.style.pixelTop=' + y);
     eval('enterEvent.style.pixelLeft=' + x);
	 enterEvent.filters[0].apply();
     enterEvent.style.visibility="visible";
     enterEvent.filters[0].Play();

}

function ShowEventNew() {
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterEventNew.style.pixelTop=' + y);
     eval('enterEventNew.style.pixelLeft=' + x);
	 enterEventNew.filters[0].apply();
     enterEventNew.style.visibility="visible";
     enterEventNew.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

function Validate(){
  if(document.forms[0].CUSTOMER.value.length <1){

      if(document.forms[0].OPT.value=="1" || document.forms[0].OPT.value=="5"){
      alert("A valid customer number must be enter");
	  document.forms[0].CUSTOMER.focus();
      return;
   	  }
  }
  document.forms[0].submit();
}

function subInst(){
  document.forms[0].OPT.value = '9';
  document.forms[0].submit();
}

function subEvent(){
  document.forms[0].OPT.value = '10';
  document.forms[0].submit();
}



function subEventNew(){
  document.forms[0].OPT.value = '15';
  document.forms[0].submit();
}

</SCRIPT>

<H3 align="center"> Investment - Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_enter_inquiry,EIV0000I"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIV0000I">

<input type=HIDDEN name="SCREEN" value="200">
  <input type=HIDDEN name="OPT" value="1">
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Portfolio :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="PORTFOLIO" size="9" maxlength="9" >
         <a href="javascript:GetPortfolioNumDesc('PORTFOLIO','',document.forms[0].CUSTOMER.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" >
		 </a>
	  </div>
      </td>
    </tr>
    <tr id="trclear">
      <td align=CENTER width="18%">
        <div align="right">Cash Account :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="CURRENCY" size="3" maxlength="3"
                readonly >
        <input type="text" name="ACCOUNT" size="12" maxlength="9">
        <a href="javascript:GetCashAccount('CURRENCY','ACCOUNT','MEMBAL',document.forms[0].CUSTOMER.value,document.forms[0].PORTFOLIO.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>
		<input type="text" name="MEMBAL" size="15" maxlength="15"
                readonly >
	  </div>
      </td>
    </tr>
   <tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Settlement Date :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="DATE1" size="3" maxlength="2" >
         <input type="text" name="DATE2" size="3" maxlength="2" >
		 <input type="text" name="DATE3" size="3" maxlength="2" >
		 <a href="javascript:DatePicker(document.forms[0].DATE1,document.forms[0].DATE2,document.forms[0].DATE3)">
			<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0">
		 </a>
	  </div>
      </td>
    </tr>
   <tr id="trclear">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=submit name="Submit3" value="Submit" >
   </TD>

   </tr>
 </TABLE>
</div>

  <div id="enterINST" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Instrument :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="CODE" size="9" maxlength="9" >
         <a href="javascript:GetInstrumentParams('CODE','','','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0">
		</a>
	  </div>
      </td>
    </tr>
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Record Date :</div>
      </td>
      <td align=CENTER width="34%">
        <div align="left">
         <input type="text" name="RECDT1" size="2" maxlength="2" onKeyPress="enterInteger()">
 		 <input type="text" name="RECDT2" size="2" maxlength="2" onKeyPress="enterInteger()">
		 <input type="text" name="RECDT3" size="2" maxlength="2" onKeyPress="enterInteger()">
		 <A href="javascript:DatePicker(document.forms[0].RECDT1,document.forms[0].RECDT2,document.forms[0].RECDT3)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt=". . ."
			align="bottom" border="0"></A>
	  </div>
      </td>
    </tr>

   <tr id="trdark">

   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit3" value="Submit" onClick="subInst()">
   </TD>

   </tr>
 </TABLE>
</div>

  <div id="enterEvent" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Show Event :</div>
      </td>
      <td align=LEFT width="34%">
       <select name="EVENT">
                <option value=" ">All </option>
                <option value="1">Interest</option>
                <option value="2">Maturity</option>
                <option value="3">Call</option>
                <option value="4">Put</option>
				<option value="5">Dividends</option>
          </select>
      </td>
    </tr>
    <tr id="trclear">
      <td align=CENTER width="18%">
        <div align="right">Portfolio Type :</div>
      </td>
      <td align=LEFT width="34%">
       <select name="PRFTYPE">
                <option value=""></option>
                <option value="D">Discretionary </option>
                <option value="N">Non Discretionary</option>
          </select>
      </td>
    </tr>
   <tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">From Date  :</div>
      </td>
      <td align=LEFT width="34%">
       <input type="text" size="2" maxlength="2" name="DATEF1"
					  >
                      <input type="text" size="2" maxlength="2" name="DATEF2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="DATEF3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].DATEF1,document.forms[0].DATEF2,document.forms[0].DATEF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
                      To
                      <input type="text" size="2" maxlength="2" name="DATET1"
					  >
                      <input type="text" size="2" maxlength="2" name="DATET2" onKeyPress="enterInteger()">
                      <input type="text" size="2" maxlength="2" name="DATET3" onKeyPress="enterInteger()">
                      <a href="javascript:DatePicker(document.forms[0].DATET1,document.forms[0].DATET2,document.forms[0].DATET3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
      </td>
    </tr>

   <tr id="trclear">
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit3" value="Submit" onClick="subEvent()">
   </TD>

   </tr>
 </TABLE>
</div>


 <div id="enterEventNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Event :</div>
      </td>
      <td align=LEFT width="34%">
       <select name="EVENTC">
                <option value=" "> </option>
                <option value="1">Interest</option>
                <option value="2">Maturity</option>
                <option value="3">Call</option>
                <option value="4">Put</option>
				<option value="5">Dividends</option>

          </select>
          Blank for All
      </td>
    </tr>

    <tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">Hold by :</div>
      </td>
      <td align=LEFT width="34%">
       <select name="HELDBY">
                <option value=" "> </option>
                <option value="1">Bank</option>
                <option value="2">Third Party</option>

          </select>
          Blank for All
      </td>
    </tr>

   <tr id="trdark">
      <td align=CENTER width="18%">
        <div align="right">From Date  :</div>
      </td>
      <td align=LEFT width="34%">
          <input type="text" size="2" maxlength="2" name="DATECF1">
          <input type="text" size="2" maxlength="2" name="DATECF2" onKeyPress="enterInteger()">
          <input type="text" size="2" maxlength="2" name="DATECF3" onKeyPress="enterInteger()">
          <a href="javascript:DatePicker(document.forms[0].DATECF1,document.forms[0].DATECF2,document.forms[0].DATECF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
           To
          <input type="text" size="2" maxlength="2" name="DATECT1">

          <input type="text" size="2" maxlength="2" name="DATECT2" onKeyPress="enterInteger()">
          <input type="text" size="2" maxlength="2" name="DATECT3" onKeyPress="enterInteger()">
          <a href="javascript:DatePicker(document.forms[0].DATECT1,document.forms[0].DATECT2,document.forms[0].DATECT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
      </td>
    </tr>

   <tr id="trclear">
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit15" value="Submit" onClick="subEventNew()">
   </TD>

   </tr>
 </TABLE>
</div>


  <center>
    <table border="0" class="tableinfo" width="100%">
      <tr id="trdark">
        <td colspan="3">
          <div align="center"><b> Inquiries by Customer </b></div>
        </td>
      </tr>
      <tr id="trclear">
        <td colspan="3">
          <div align="center">Customer :
            <input type="text" name="CUSTOMER" size="9" maxlength="9">
            <input type="text" name="CUNDSC" size="25" maxlength="25">
            <a href="javascript:GetCustomerDescId('CUSTOMER','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <div align="left">
            <input type="radio" name="INPTOPT" value="1"
			onClick="document.forms[0].OPT.value ='1'" checked>
            Outstanding Open Position </div>
        </td>
        <td width="47%">
          <input type="radio" name="INPTOPT" value="2"
			 onClick="ShowEnterCod()">
          Holds and Uncollected </td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <input type="radio" name="INPTOPT" value="12"
			onClick="document.forms[0].OPT.value ='12'">
          Historical Position </td>
        <td width="47%">
          <input type="radio" name="INPTOPT" value="5"
		  onClick="document.forms[0].OPT.value ='5'">
          Customer Information</td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <div align="left">
            <input type="radio" name="INPTOPT" value="3"
		    onClick="document.forms[0].OPT.value ='3'">
            Customer Portfolio </div>
        </td>
        <td width="47%">&nbsp; </td>
      </tr>
      <tr id="trdark">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <div align="center"><b>General Inquiries</b></div>
        </td>
        <td width="47%">
          <div align="center"><b>Instruments Inquiries</b></div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <input type="radio" name="INPTOPT" value="15"
		   onClick="ShowEventNew()">
          Coupon Security Events </td>

          <!-- <input type="radio" name="INPTOPT" value="10"
		   onClick="ShowEvent()">
          Coupon Payment Next Event </td>  -->



        <td width="47%">
          <input type="radio" name="INPTOPT" value="9"

		  onClick="ShowEnterInstCod()">
          Customer Open Position by Instrument</td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>
        <td width="40%">
          <input type="radio" name="INPTOPT" value="6"
		  onClick="document.forms[0].OPT.value ='6'">
          Trade Tickets </td>
        <td width="47%">
          <div align="left">
            <input type="radio" name="INPTOPT" value="8"
		  onClick="document.forms[0].OPT.value ='8'">
            Generated Coupons</div>
        </td>
      </tr>
      <tr id="trclear">
        <td width="13%">&nbsp;</td>

        <td width="40%">&nbsp; </td>




        <td width="47%">
          <input type="radio" name="INPTOPT" value="7"
		  onClick="document.forms[0].OPT.value ='7'">
          Instruments Information </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td width="33%">
		  <br>
          <div align="center">
            <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="Validate()">
          </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td> </td>
      </tr>
    </table>

    <br>
  </center>
  <center>
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

  </b>

</form>
</body>
</html>
