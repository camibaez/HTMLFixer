<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtOver" class="datapro.eibs.beans.EDD043005Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }

function restDecimal(val){
   var posi = val.indexOf(".");
   var rest = "0";
   if (posi != -1) {
 	 rest = val.substring(posi +1, val.length);
   }
   return rest;
}

function roundDecimal(val,maxlen){
   var posi = val.indexOf(".");
   var dec = val;
   var rest = "0";
   var intp ="0";
   var rnd;
   if (posi != -1) {
     intp = val.substring(0,posi + 1);
 	 rest = val.substring(posi +1, val.length);
 	 if (rest.length > maxlen) {
 	    rnd = parseInt(rest.substring(0, maxlen)) + 1;
 	    dec = intp + rnd;
 	 }
   }
   return dec;
}

function UpdateRate(){

    var total;
    var tmptotal;
    var FLT ;
    var DEA ;
    try {
      FLT = replaceAll(document.forms[0].E05FLTRTE.value,",");
    }catch(e){
      FLT = 0.00;
    }
    try {
      DEA = replaceAll(document.forms[0].E05DEARTE.value,",");
    }catch(e){
      DEA = 0.00;
    }

    total= parseFloat(FLT);
    total += parseFloat(DEA);

    tmptotal = "" + total;
    var lFLT = restDecimal(FLT).length;
    var lDEA = restDecimal(DEA).length;
	var ltotal = restDecimal(tmptotal).length;

    if (lFLT > lDEA) {
    	if (ltotal > lFLT) {
    	   tmptotal = roundDecimal(tmptotal,lFLT);
    	}
    } else {
    	if (ltotal > lDEA) {
    	   tmptotal = roundDecimal(tmptotal,lDEA);
    	}
    }

    document.forms[0].E05DLSRTE.value = tmptotal;

  }

function UpdateTotal(){

   var total = 0.00;
   var val = 0.00;

   for ( var i=1; i<=5; i++ ) {
    try{
     	val= parseFloat(replaceAll(document.forms[0]["E05DLAMT" + i].value,","));
    }
    catch(e){
     	val=0.00;
    }
    total=total + val;
   }

   document.forms[0].E05TOTAMT.value=formatCCY(""+total);

  }

function bloquea()
{
  if (document.forms[0].E05INVRTB.value == "1")
  {
  	  div1.style.display="";
   	  div2.style.display="";
  }
  else
  {
	  div1.style.display="none";
	  div2.style.display="none";
  }
}


function UpdateFlag(val) {
  document.forms[0].E05RCLFLC.value = (val==true)?"X":"";
 }

function setRecalculate() {
  document.forms[0].RECALC.checked = true;
  document.forms[0].RECALC.disabled = true;
  UpdateFlag(true);
 }

</SCRIPT>

</head>

<body>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Overdraft  Protection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_overd_ln, EDD0430"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" value="10">
  <input type=HIDDEN name="E05INVPRD" value="<%= rtOver.getE05INVPRD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCLFLC" VALUE="<%= rtOver.getE05RCLFLC().trim()%>">
  <input type=HIDDEN name="E05DLSRTE" value="<%= rtOver.getE05DLSRTE().trim()%>">

 <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap>
              <div align="right"><b>Customer:</b></div>
            </td>
            <td nowrap>
              <input type="text" name="E05ACMCUN" size="9" maxlength="9" value="<%= rtOver.getE05ACMCUN().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right"><b>Name:</b></div>
            </td>
            <td nowrap>
              <input type="text" name="E05CUSNA1" size="45" maxlength="45" value="<%= rtOver.getE05CUSNA1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right"><b>Account:</b></div>
            </td>
            <td nowrap>
              <input type="text" name="E05ACMACC" size="12" maxlength="12" value="<%= rtOver.getE05ACMACC().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right"><b>Product:</b></div>
            </td>
            <td nowrap>
              <input type="text" name="E05ACMPRO" size="4" maxlength="4" value="<%= rtOver.getE05ACMPRO().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <h4>Basic Loan Information</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
              <div align="right">Loan  Number :</div>
            </td>
            <td nowrap colspan=3>
              <div align="left">
              	<% if (rtOver.getE05INVRAC().trim().equals("999999999999")) out.print("New Loan"); else out.print(rtOver.getE05INVRAC().trim()); %>
                <!--<input type="text" name="E05INVRAC" size="12" maxlength="12" value="<%= rtOver.getE05INVRAC().trim()%>" onKeypress="enterInteger()"
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>oncontextmenu="showPopUp(accountHelp,this.name,'','','','','10'); return false;"<% } %>>-->
              </div>
            </td>
          </tr>
          <tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap>
              <input type="text" name="E05INVSD1" size="2" maxlength="2" value="<%= rtOver.getE05INVSD1().trim()%>" onKeypress="enterInteger()">
              <input type="text" name="E05INVSD2" size="2" maxlength="2" value="<%= rtOver.getE05INVSD2().trim()%>" onKeypress="enterInteger()">
              <input type="text" name="E05INVSD3" size="2" maxlength="2" value="<%= rtOver.getE05INVSD3().trim()%>" onKeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E05INVSD1,document.forms[0].E05INVSD2,document.forms[0].E05INVSD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
            <td nowrap>
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E05INVMD1" size="2" maxlength="2" value="<%= rtOver.getE05INVMD1().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E05INVMD2" size="2" maxlength="2" value="<%= rtOver.getE05INVMD2().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E05INVMD3" size="2" maxlength="2" value="<%= rtOver.getE05INVMD3().trim()%>" onKeypress="enterInteger()">
                <a href="javascript:DatePicker(document.forms[0].E05INVMD1,document.forms[0].E05INVMD2,document.forms[0].E05INVMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Loan Amount :</div>
            </td>
            <td nowrap>
              <input type="text" name="E05INVOAM" size="12" maxlength="12" value="<%= rtOver.getE05INVOAM().trim()%>" onKeypress="enterDecimal()" onchange="setRecalculate()" onblur="verifyNum(this)">
            </td>
           <td nowrap>
              <div align="right">Payment  Form :</div>
            </td>
            <td nowrap >
	    		<SELECT name="E05INVRTB" onChange="bloquea()">
	                    <OPTION value=" " <% if (!(rtOver.getE05INVRTB().equals("0") ||rtOver.getE05INVRTB().equals("1")||rtOver.getE05INVRTB().equals("2"))) out.print("selected"); %>>Daily Payment</OPTION>
	                    <OPTION value="0" <% if (rtOver.getE05INVRTB().equals("0")) out.print("selected"); %>="">Manual Payment</OPTION>
	                    <OPTION value="1" <% if (rtOver.getE05INVRTB().equals("1")) out.print("selected"); %>="">Automatic Monthly Payment</OPTION>
	                    <OPTION value="2" <% if (rtOver.getE05INVRTB().equals("2")) out.print("selected"); %>="">At Loan Maturity</OPTION>
	            </SELECT>
            </td>
          </tr>
         <tr id="trclear">
            <td nowrap>
              <div align="right">Loan Payment Amount/% :</div>
            </td>
            <td nowrap>
              <input type="text" name="E05INVPMT" size="12" maxlength="12" value="<%= rtOver.getE05INVPMT().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap>
              <div id="div1" align="right" display="none">Payment Day : </div>
			</td>
			<td nowrap>
              <div id="div2" align="left" display="none">
               <input type="text" name="E05PRIDAY" size="3" maxlength="2" value="<%= rtOver.getE05PRIDAY().trim()%>" onKeypress="enterInteger()">
               </div>
              </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Loan Payment Type :</div>
            </td>
            <td nowrap >
            	<SELECT name="E05INVPIF">
                    <OPTION value=" " <% if (!(rtOver.getE05INVPIF().equals("F")||rtOver.getE05INVPIF().equals("%"))) out.print("selected"); %>=""></OPTION>
                    <OPTION value="F" <% if (rtOver.getE05INVPIF().equals("F")) out.print("selected"); %>="">Fixed Amount</OPTION>
                    <OPTION value="%" <% if (rtOver.getE05INVPIF().equals("%")) out.print("selected"); %>="">Percentage</OPTION>
                </SELECT>
            </td>
            <td nowrap>
              <div align="right"> Interest Included :</div>
            </td>
            <td nowrap >
              <INPUT type="radio" name="E05INVIIP" value="Y" <%if(rtOver.getE05INVIIP().equals("Y")) out.print("checked");%>="">Yes
              <INPUT type="radio" name="E05INVIIP" value="N" <%if(!rtOver.getE05INVIIP().equals("Y")) out.print("checked");%>="">No
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td nowrap colspan=3>
              <div align="left">
                <input type="text" name="E05INVMIN" size="13" maxlength="13" value="<%= rtOver.getE05INVMIN().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
       </table>
      </td>
    </tr>
  </table>
  <br>
  <h4>Loan Pricing</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
           <td nowrap>
              <div align="right">VIR Table :</div>
            </td>
            <td nowrap>
              <input type="text" name="E05DEAFTB" readonly size="3" maxlength="2" value="<%= rtOver.getE05DEAFTB().trim()%>">
              &nbsp;Type :&nbsp;
              <input type="text" readonly name="E05DEAFTY" size="3" maxlength="2" value="<%= rtOver.getE05DEAFTY().trim()%>">
              <input type="text" name="E05FLTRTE" readonly size="12" maxlength="12" value="<%= rtOver.getE05FLTRTE().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap>
              <div align="right">Base Rate/Spread :</div>
            </td>
            <td nowrap>
              <input type="text" name="E05DEARTE" size="12" maxlength="12" value="<%= rtOver.getE05DEARTE().trim()%>" onKeypress="enterDecimal()" onChange="UpdateRate()" onblur="verifyNum(this)">
            </td>
           </tr>
         <tr id="trclear">
            <td nowrap>
              <div align="right">Rate Revision Cycle :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E05INVRPD" size="3" maxlength="3" value="<%= rtOver.getE05INVRPD().trim()%>">
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%> <a href="javascript:GetCode('E05INVRPD','STATIC_ln_rate_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a><% } %>
                /
                <select name="E05INVRFL">
                  <option value=" " <% if (!(rtOver.getE05INVRFL().equals("D") || rtOver.getE05INVRFL().equals("M") || rtOver.getE05INVRFL().equals("Y"))) out.print("selected"); %>></option>
                  <option value="D" <% if (rtOver.getE05INVRFL().equals("D")) out.print("selected"); %>>Daily</option>
                  <option value="M" <% if (rtOver.getE05INVRFL().equals("M")) out.print("selected"); %>>Monthly</option>
                  <option value="Y" <% if (rtOver.getE05INVRFL().equals("Y")) out.print("selected"); %>>Annually</option>
                </select>
              </div>
            </td>
            <td nowrap>
              <div align="right">Revision Date :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E05INVRD1" size="2" maxlength="2" value="<%= rtOver.getE05INVRD1().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E05INVRD2" size="2" maxlength="2" value="<%= rtOver.getE05INVRD2().trim()%>" onKeypress="enterInteger()">
                <input type="text" name="E05INVRD3" size="2" maxlength="2" value="<%= rtOver.getE05INVRD3().trim()%>" onKeypress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E05INVRD1,document.forms[0].E05INVRD2,document.forms[0].E05INVRD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
              </div>
            </td>
          </tr>
       </table>
      </td>
    </tr>
  </table>
  <br>
  <h4>Transfer Mode</h4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="trdark">
            <td nowrap>
              <div align="right">Transfer in Multiples :</div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E05INVMUL" size="13" maxlength="13" value="<%= rtOver.getE05INVMUL().trim()%>" onKeypress="enterInteger()">
              </div>
            </td>
            <td nowrap>
              <div align="right">Retail Minimum Balace:</div>
            </td>
            <td nowrap colspan=3>
              <input type="text" name="E05INVBLS" size="12" maxlength="12" value="<%= rtOver.getE05INVBLS().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Application Type :</div>
            </td>
            <td nowrap>
              <select name="E05INVGLT">
                <option value=" " <% if (!(rtOver.getE05INVGLT().equals("1")||rtOver.getE05INVGLT().equals("2"))) out.print("selected"); %>></option>
                <option value="1" <% if (rtOver.getE05INVGLT().equals("1")) out.print("selected"); %>>On Line</option>
                <option value="2" <% if (rtOver.getE05INVGLT().equals("2")) out.print("selected"); %>>Batch</option>
              </select>
            </td>
            <td nowrap>
              <div align="right">Relationship Status :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select name="E05INVSTS">
                  <option value=" " <% if (!(rtOver.getE05INVSTS().equals("1") || rtOver.getE05INVSTS().equals("2") || rtOver.getE05INVSTS().equals("3"))) out.print("selected"); %>></option>
                  <option value="1" <% if (rtOver.getE05INVSTS().equals("1")) out.print("selected"); %>>Active</option>
                  <option value="2" <% if (rtOver.getE05INVSTS().equals("2")) out.print("selected"); %>>Suspended</option>
                  <option value="3" <% if (rtOver.getE05INVSTS().equals("3")) out.print("selected"); %>>Closed</option>
                </select>
              </div>
            </td>
           </tr>
       </table>
      </td>
    </tr>
  </table>


  <% if (userPO.getPurpose().equals("APPROVAL_INQ")) {%>
 <SCRIPT Language="Javascript">
   var j=document.forms[0].elements.length;
    var felem=document.forms[0].elements;
    for(i=0;i< j;i++){
       if (felem[i].tagName!=="select"){
         if (felem[i].type=="text") felem[i].readOnly=true; else felem[i].disabled=true;
       }
       else { felem[i].disabled=true;}
    }

</SCRIPT>

 <% } else { %>

    <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
     </div>
 <% } %>
 <SCRIPT Language="Javascript">
   UpdateRate();
   bloquea();
 </SCRIPT>
  </form>
</body>
</html>
