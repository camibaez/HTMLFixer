<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language = "javascript">
function doPrint(){
	if(!window.print){
       var msg ="This browser doesn't allow print";
	   alert(msg);
	   return;}
	
    window.focus();
	window.print();

	return;
}
function search(){
  document.forms[0].SCREEN.value = 34;
  document.forms[0].submit();
}
</SCRIPT>

</head>

<body>

 
<h3 align="center"> Operation Finished</h3>
<hr size="4">
<table border="0" class="tableinfo" width="100%">
  <tr> 
    <td colspan="3">
      <div align="center"> This page is not valid as official receipt</div>
    </td>
  </tr>
</table>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050">
  <h4>Basic Information 
      <input type="hidden" name="SCREEN"  value="400" >
    </h4>
    <table  class="tableinfo" width="715">
      <tr > 
        <td nowrap> 
          
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Code / Description :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIIIC" size="5" maxlength="3" value="<%= invInst.getE01ISIIIC()%>" >
              <input type="text" readonly  name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Internal Status :</div>
            </td>
            <td nowrap width="33%" > <% if(invInst.getE01ISISTS().equals("P")) out.print("Pending");
				 else if(invInst.getE01ISISTS().equals("R")) out.print("Redeem");
				 else if(invInst.getE01ISISTS().equals("A")) out.print("Active");
				 else if(invInst.getE01ISISTS().equals("C")) out.print("Cancel");
				 else out.print("Active");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICCY" size="5" maxlength="3" value="<%= invInst.getE01ISICCY()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Bloomberg Currency :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISIBCY" size="5" maxlength="3" value="<%= invInst.getE01ISIBCY()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Type :</div>
            </td>
            <td nowrap width="36%" ><% if(invInst.getE01ISIPTY().equals("BND")) out.print("Bonds");
				 else if(invInst.getE01ISIPTY().equals("EQT")) out.print("Equity");
				 else if(invInst.getE01ISIPTY().equals("MUT")) out.print("Mutual Funds");
				 else if(invInst.getE01ISIPTY().equals("PFS")) out.print("Preferred Stocks");
                 else if(invInst.getE01ISIPTY().equals("ACD")) out.print("Commodities");				 
			  %> 
              <input type="hidden" name="E01ISIPTY"  value="<%= invInst.getE01ISIPTY()%>" >
            </td>
            <td nowrap width="14%" > 
              <div align="right">Symbol :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISISYM" size="20" maxlength="15" value="<%= invInst.getE01ISISYM()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Issuer Name :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIENM" size="50" maxlength="45" value="<%= invInst.getE01ISIENM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">ISIN Number / Serie :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISINUM" size="12" maxlength="12" value="<%= invInst.getE01ISINUM()%>">
              / 
              <input type="text" readonly  name="E01ISISER" size="3" maxlength="2" value="<%= invInst.getE01ISISER()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Mark as Complex :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01ISIPRE" value="<%= invInst.getE01ISIPRE()%>">
              <input type="radio" disabled  name="CE01ISIPRE" value="Y" onClick="document.forms[0].E01ISIPRE.value='Y'"
			  <%if(invInst.getE01ISIPRE().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" disabled  name="CE01ISIPRE" value="N" onClick="document.forms[0].E01ISIPRE.value='N'"
			  <%if(invInst.getE01ISIPRE().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="14%" > 
              <div align="right">Common Code/CUSIP :</div>
            </td>
            <td nowrap width="33%" >  <INPUT type="text" readonly name="E01ISIFL4" size="16" maxlength="15" value="<%= invInst.getE01ISIFL4()%>">
              <input type="text" readonly  name="E01ISICUS" size="12" maxlength="12" value="<%= invInst.getE01ISICUS()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Country Code :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICTC" size="5" maxlength="3" value="<%= invInst.getE01ISICTC()%>">
              <a href="javascript:GetCodeCNOFC('E01ISICTC','03')"> </a> </td>
            <td nowrap width="14%" > 
              <div align="right">Country Name :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISICTR" size="30" maxlength="30" value="<%= invInst.getE01ISICTR()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Rating 'Standard &amp; Poor':</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIRSP" size="10" maxlength="10" value="<%= invInst.getE01ISIRSP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Rating 'Moodys' :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIRMD" size="10" maxlength="10" value="<%= invInst.getE01ISIRMD()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Range Note :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ISIRGN" size="45" maxlength="45" value="<%= invInst.getE01ISIRGN()%>">
            </td>
            <td nowrap > 
              <div align="right">Price in Percent :</div>
            </td>
            <td nowrap > 
              <input type="hidden" name="E01ISIPER" value="<%= invInst.getE01ISIPER()%>">
              <input type="radio" disabled  name="CE01ISIPER " value="Y" onClick="document.forms[0].E01ISIPER .value='Y'"
			  <%if(invInst.getE01ISIPER ().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" disabled  name="CE01ISIPER " value="N" onClick="document.forms[0].E01ISIPER .value='N'"
			  <%if(invInst.getE01ISIPER ().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Issued Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISISD1" size="3" maxlength="2" value="<%= invInst.getE01ISISD1()%>">
              <input type="text" readonly  name="E01ISISD2" size="3" maxlength="2" value="<%= invInst.getE01ISISD2()%>">
              <input type="text" readonly  name="E01ISISD3" size="3" maxlength="2" value="<%= invInst.getE01ISISD3()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Update Mode :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="hidden" name="E01ISIMOD" value="<%= invInst.getE01ISIMOD()%>">
              <input type="radio" disabled  name="CE01ISIMOD" value="M" onClick="document.forms[0].E01ISIMOD.value='M'"
			  <%if(invInst.getE01ISIMOD().equals("M")) out.print("checked");%>>
              Manual 
              <input type="radio" disabled  name="CE01ISIMOD" value="B" onClick="document.forms[0].E01ISIMOD.value='B'"
			  <%if(invInst.getE01ISIMOD().equals("B")) out.print("checked");%>>
              Bloomberg </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Calculation Type :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICTP" size="7" maxlength="6" value="<%= invInst.getE01ISICTP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Calculation Type Description :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISICTD" size="35" maxlength="35" value="<%= invInst.getE01ISICTD()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Yield :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIYLD" size="11" maxlength="9" value="<%= invInst.getE01ISIYLD()%>" readonly>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Instrument Market Status :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIMKS" size="15" maxlength="10" value="<%= invInst.getE01ISIMKS()%>" >
            </td>
          </tr>
          	<tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Zero Coupon :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIFL1" size="5" maxlength="3" 
				value="<% if (invInst.getE01ISIFL1().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIFL1().equals("N")) out.print(" NO");
							else out.print("");%>" >
            </td>
            <td nowrap width="34%" >
               <div align="right">Accepted for Trade in Europe :</div>
            </td>
            <td nowrap width="66%" >
            	<input type="text" readonly  name="E01ISIF61" size="2" maxlength="1" 
				value="<% if (invInst.getE01ISIF61().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIF61().equals("N")) out.print(" NO");
							else out.print("");%>">
            </td>
          </tr><tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Unit of measurement:</div>
            </td>
            <td nowrap width="34%" >
              <INPUT type="text" name="E01ISIF67" size="6" maxlength="6" value="<%= invInst.getE01ISIF67()%>" readonly>
            </td>
                        
            <td nowrap width="14%" > 
              <div align="right">Pool Factor :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIFL8" size="11" maxlength="11" value="<%= invInst.getE01ISIFL8()%>">
              </div>
            </td>
             
          </tr>
        </table>
        </td>
      </tr>
    </table>
    <h4>Fiscal Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">US Security IRS :</div>
            </td>
            <td nowrap width="36%" >            
                 <INPUT type="text" readonly name="E01ISIFL3" size="5" maxlength="3"
					value='<% if (invInst.getE01ISIFL3().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIFL3().equals("N")) out.print(" NO");
							else out.print("");%>'>
			</td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate at Source :</div>
            </td>
            <td nowrap > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIFL7" size="11" maxlength="11" value="<%= invInst.getE01ISIFL7()%>">
                </div>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Income Code :</div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" readonly  name="D01INCOME" size="50" maxlength="50" value="<%= invInst.getD01INCOME()%>">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <% if(invInst.getE01ISIPTY().equals("BND") || invInst.getE01ISIPTY().equals("PFS")) { %> 
    <h4>Additional Information</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Maturity Date :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIMA1" size="3" maxlength="2" value="<%= invInst.getE01ISIMA1()%>">
                <input type="text" readonly  name="E01ISIMA2" size="3" maxlength="2" value="<%= invInst.getE01ISIMA2()%>">
                <input type="text" readonly  name="E01ISIMA3" size="3" maxlength="2" value="<%= invInst.getE01ISIMA3()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="66%" >&nbsp; </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Interest Rate :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIRTE" size="11" maxlength="11" value="<%= invInst.getE01ISIRTE()%>">
                </div>
              </td>
              <td nowrap > 
                <div align="right">Accrual Type :</div>
              </td>
              <td nowrap > 
                <select disabled  name="E01ISIATY">
                  <option value="1" <%if (invInst.getE01ISIATY().equals("1")) { out.print("selected"); }%>>Actual/Actual</option>
                  <option value="2" <%if (invInst.getE01ISIATY().equals("2")) {  out.print("selected"); }%>>Actual/365</option>
                  <option value="3" <%if (invInst.getE01ISIATY().equals("3")) {  out.print("selected"); }%>>Actual/365(366 
                  Leap Year)</option>
                  <option value="4" <%if (invInst.getE01ISIATY().equals("4")) {  out.print("selected"); }%>>Actual/360</option>
                  <option value="5" <%if (invInst.getE01ISIATY().equals("5")) {  out.print("selected"); }%>>30/360</option>
                  <option value="6" <%if (invInst.getE01ISIATY().equals("6")) {  out.print("selected"); }%>>30E/360</option>
                  <option value="7" <%if (invInst.getE01ISIATY().equals("7")) {  out.print("selected"); }%>>22/252</option>
                                  
                </select>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Calculation Base :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIBAS" size="5" maxlength="3" value="<%= invInst.getE01ISIBAS()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Calculation Days :</div>
              </td>
              <td nowrap width="66%" > 
                <select disabled  name="E01ISIICT">
                  <option value="1" <%if (invInst.getE01ISIICT().equals("1")) { out.print("selected"); }%>>Calendar 
                  Days</option>
                  <option value="2" <%if (invInst.getE01ISIICT().equals("2")) {  out.print("selected"); }%>>Commercial 
                  Days</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Floating Rate Table :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIFTB" size="2" maxlength="2" value="<%= invInst.getE01ISIFTB().trim()%>">
                <select disabled  name="E01ISIFTY">
                  <option value="1" <%if (invInst.getE01ISIFTY().equals("FP")) { out.print("selected"); }%>> 
                  Primary</option>
                  <option value="2" <%if (invInst.getE01ISIFTY().equals("FS")) {  out.print("selected"); }%>> 
                  Secondary</option>
                </select>
              </td>
              <td nowrap width="34%" > 
                <div align="right">Floating Rate :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIFRT" size="11" maxlength="11" value="<%= invInst.getE01ISIFRT()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Days / Date T + N :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIDTN" size="11" maxlength="11" value="<%= invInst.getE01ISIDTN()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Payment Frequency :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIPFV" size="4" maxlength="4" value="<%= invInst.getE01ISIPFV().trim()%>" onKeyPress="enterInteger()">
                <select disabled  name="E01ISIPFC">
                  <option value="D" <% if(invInst.getE01ISIPFC().equals("D")) out.print("selected");%>>Day(s)</option>
                  <option value="M" <% if(invInst.getE01ISIPFC().equals("M")) out.print("selected");%>>Month(s)</option>
                  <option value="Q" <% if(invInst.getE01ISIPFC().equals("Q")) out.print("selected");%>>Quarter</option>
                  <option value="S" <% if(invInst.getE01ISIPFC().equals("S")) out.print("selected");%>>Semianually</option>
                  <option value="Y" <% if(invInst.getE01ISIPFC().equals("Y")) out.print("selected");%>>Anually</option>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <%
     
    }
  %> 
    <h4>Dates</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">Last Interest Payment Date :</div>
              </td>
              <td nowrap width="18%" > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIIN1" size="3" maxlength="2" value="<%= invInst.getE01ISIIN1()%>">
                  <input type="text" readonly  name="E01ISIIN2" size="3" maxlength="2" value="<%= invInst.getE01ISIIN2()%>">
                  <input type="text" readonly  name="E01ISIIN3" size="3" maxlength="2" value="<%= invInst.getE01ISIIN3()%>">
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right">Next Interest Payment Date :</div>
              </td>
              <td nowrap width="19%" > 
                <div align="left"> 
                  	<input type="text" readonly  name="E01ISINI1" size="3" maxlength="2" value="<%= invInst.getE01ISINI1()%>">
                	<input type="text" readonly  name="E01ISINI2" size="3" maxlength="2" value="<%= invInst.getE01ISINI2()%>">
              		<input type="text" readonly  name="E01ISINI3" size="3" maxlength="2" value="<%= invInst.getE01ISINI3()%>">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">Last Dividends Payment Date :</div>
              </td>
              <td nowrap width="18%" > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIDI1" size="3" maxlength="2" value="<%= invInst.getE01ISIDI1()%>">
                  <input type="text" readonly  name="E01ISIDI2" size="3" maxlength="2" value="<%= invInst.getE01ISIDI2()%>">
                  <input type="text" readonly  name="E01ISIDI3" size="3" maxlength="2" value="<%= invInst.getE01ISIDI3()%>">
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right">Next Dividends Payment Date </div>
              </td>
              <td nowrap width="19%" > 
                <div align="left">
                <input type="text" readonly  name="E01ISIND1" size="3" maxlength="2" value="<%= invInst.getE01ISIND1()%>">
                <input type="text" readonly  name="E01ISIND2" size="3" maxlength="2" value="<%= invInst.getE01ISIND2()%>">
                <input type="text" readonly  name="E01ISIND3" size="3" maxlength="2" value="<%= invInst.getE01ISIND3()%>">
                	
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">Last Capital Payment Date :</div>
              </td>
              <td nowrap width="18%" > 
              	  <input type="text" readonly  name="E01ISICA1" size="3" maxlength="2" value="<%= invInst.getE01ISICA1()%>">
                  <input type="text" readonly  name="E01ISICA2" size="3" maxlength="2" value="<%= invInst.getE01ISICA2()%>">
                  <input type="text" readonly  name="E01ISICA3" size="3" maxlength="2" value="<%= invInst.getE01ISICA3()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">Next Capital Payment Date :</div>
              </td>
              <td nowrap width="19%" > 
           		  <input type="text" readonly  name="E01ISINC1" size="3" maxlength="2" value="<%= invInst.getE01ISINC1()%>">
                  <input type="text" readonly  name="E01ISINC2" size="3" maxlength="2" value="<%= invInst.getE01ISINC2()%>">
                  <input type="text" readonly  name="E01ISINC3" size="3" maxlength="2" value="<%= invInst.getE01ISINC3()%>">     
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">First Accrual Date :</div>
              </td>
              <td nowrap width="18%" > 
                <div align="left"> 
                	<input type="text" readonly  name="E01ISIFA1" size="3" maxlength="2" value="<%= invInst.getE01ISIFA1()%>">
               		<input type="text" readonly  name="E01ISIFA2" size="3" maxlength="2" value="<%= invInst.getE01ISIFA2()%>">
                	<input type="text" readonly  name="E01ISIFA3" size="3" maxlength="2" value="<%= invInst.getE01ISIFA3()%>">  
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right"> Next Call Date :</div>
              </td>
              <td nowrap width="19%" > 
                <input type="text" readonly  name="E01ISICL1" size="3" maxlength="2" value="<%= invInst.getE01ISICL1()%>">
                <input type="text" readonly  name="E01ISICL2" size="3" maxlength="2" value="<%= invInst.getE01ISICL2()%>">
                <input type="text" readonly  name="E01ISICL3" size="3" maxlength="2" value="<%= invInst.getE01ISICL3()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">First Coupon Date ::</div>
              </td>
              <td nowrap width="18%" > 
              	<input type="text" readonly  name="E01ISIFI1" size="3" maxlength="2" value="<%= invInst.getE01ISIFI1()%>">
              	<input type="text" readonly  name="E01ISIFI2" size="3" maxlength="2" value="<%= invInst.getE01ISIFI2()%>">
                <input type="text" readonly  name="E01ISIFI3" size="3" maxlength="2" value="<%= invInst.getE01ISIFI3()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">Next Put Date :</div>
              </td>
              <td nowrap width="19%" > 
                <input type="text" readonly  name="E01ISIPU1" size="3" maxlength="2" value="<%= invInst.getE01ISIPU1()%>">
                <input type="text" readonly  name="E01ISIPU2" size="3" maxlength="2" value="<%= invInst.getE01ISIPU2()%>">
                <input type="text" readonly  name="E01ISIPU3" size="3" maxlength="2" value="<%= invInst.getE01ISIPU3()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">First Settlement Date :</div>
              </td>
              <td nowrap width="18%" > 
                <input type="text" readonly  name="E01ISIFS1" size="3" maxlength="2" value="<%= invInst.getE01ISIFS1()%>">
                <input type="text" readonly  name="E01ISIFS2" size="3" maxlength="2" value="<%= invInst.getE01ISIFS2()%>">
                <input type="text" readonly  name="E01ISIFS3" size="3" maxlength="2" value="<%= invInst.getE01ISIFS3()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">:</div>
              </td>
              <td nowrap width="19%" > 
                
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
 
    <h4>Issue Size</h4>
    <table  class="tableinfo" width="546">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Amount Issued :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIAMT" size="17" maxlength="16" value="<%= invInst.getE01ISIAMT()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Issued Price :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIIPR" size="17" maxlength="16" value="<%= invInst.getE01ISIIPR()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Minimum Piece Amount :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIMIA" size="17" maxlength="16" value="<%= invInst.getE01ISIMIA()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Maturity Price :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIMPR" size="17" maxlength="16" value="<%= invInst.getE01ISIMPR()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Increment Amount :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIINA" size="17" maxlength="16" value="<%= invInst.getE01ISIINA()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Monthly Average Price :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIMAP" size="17" maxlength="16" value="<%= invInst.getE01ISIMAP()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Par. Amount :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIPAR" size="17" maxlength="16" value="<%= invInst.getE01ISIPAR()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="66%" >&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Audit  Information</h4>
    <table  class="tableinfo" width="546">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Last User Update Date :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIUP1" size="3" maxlength="2" value="<%= invInst.getE01ISIUP1()%>" >
                <input type="text" readonly  name="E01ISIUP2" size="3" maxlength="2" value="<%= invInst.getE01ISIUP2()%>" >
                <input type="text" readonly  name="E01ISIUP3" size="3" maxlength="2" value="<%= invInst.getE01ISIUP3()%>" >
              </td>
              <td nowrap width="34%" > 
                <div align="right">User Profile :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIUSR" size="11" maxlength="10" value="<%= invInst.getE01ISIUSR()%>" >
              </td>
            </tr>
            <tr id="trclear">  
              <td nowrap width="34%" > 
                <div align="right">Last Bloomberg Update Date :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIBL1" size="3" maxlength="2" value="<%= invInst.getE01ISIBL1()%>" >
                <input type="text" readonly  name="E01ISIBL2" size="3" maxlength="2" value="<%= invInst.getE01ISIBL2()%>" >
                <input type="text" readonly  name="E01ISIBL3" size="3" maxlength="2" value="<%= invInst.getE01ISIBL3()%>" >
              </td>
              <td nowrap width="34%" > 
                <div align="right">Process Status :</div>
              </td>
              <td nowrap width="66%" >
              	<% 
              		if(invInst.getE01ISIMOD().equals("M")) { out.print("N/A");}
	            	else if(invInst.getE01ISIUST().equals("0")) { out.print("OK");}
    	        	else if(invInst.getE01ISIUST().equals("1")) { out.print("Error-Not Included in Request File");}
					else out.print(" ");
				%> 
			  </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit3" value="Search" onClick="search()">
        </div>
      </td>
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit" value="Print" onClick="doPrint()">
        </div>
      </td>
      <td width="33%"> 
        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit2" value="Continue">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
