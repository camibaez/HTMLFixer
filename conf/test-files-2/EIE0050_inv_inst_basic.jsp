<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Management Portfolio System</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
 if (userPO.getPurpose().equals("M") ) {
%>

   <SCRIPT Language="Javascript">
       
      builtNewMenu(inst_basic_opt);
 	  initMenu();
   </SCRIPT>

<%
}
%>
 

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

<div align="center"> 
  <h3>Instruments <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_inst_basic.jsp, EIE0050"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050" >
  <h4>Basic Information 
    <input type="hidden" name="SCREEN"  value="2" >
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
              <input type="text" name="E01ISIIIC" size="5" maxlength="3" value="<%= invInst.getE01ISIIIC()%>" readonly>
              / 
              <input type="text" name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Internal Status :</div>
            </td>
            <td nowrap width="33%" >
				<select name="E01ISISTS">
         		<option value="A" <%if (invInst.getE01ISISTS().equals("A")) {  out.print("selected"); }%>>Active</option>
				<option value="I" <%if (invInst.getE01ISISTS().equals("I")) {  out.print("selected"); }%>>Inactive</option>
				<option value="P" <%if (invInst.getE01ISISTS().equals("P")) {  out.print("selected"); }%>>Pending</option>
              </select> 
				</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Instrument Currency :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICCY" size="5" maxlength="3" value="<%= invInst.getE01ISICCY()%>">
              <a href="javascript:GetCurrency('E01ISICCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Bloomberg Currency :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISIBCY" size="5" maxlength="3" value="<%= invInst.getE01ISIBCY()%>">
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
              <input type="text" name="E01ISISYM" size="20" maxlength="15" value="<%= invInst.getE01ISISYM()%>"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Issuer Name :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIENM" size="50" maxlength="45" value="<%= invInst.getE01ISIENM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">ISIN Number / Serie :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISINUM" size="16" maxlength="12" value="<%= invInst.getE01ISINUM()%>">
              / 
              <input type="text" name="E01ISISER" size="3" maxlength="2" value="<%= invInst.getE01ISISER()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Mark as Complex :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01ISIPRE" value="<%= invInst.getE01ISIPRE()%>">
              <input type="radio" name="CE01ISIPRE" value="Y" onClick="document.forms[0].E01ISIPRE.value='Y'"
			  <%if(invInst.getE01ISIPRE().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE01ISIPRE" value="N" onClick="document.forms[0].E01ISIPRE.value='N'"
			  <%if(invInst.getE01ISIPRE().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="14%" > 
              <div align="right">Common Code / CUSIP :</div>
            </td>
            <td nowrap width="33%" > 
               <INPUT type="text" name="E01ISIFL4" size="16"
					maxlength="15" value="<%= invInst.getE01ISIFL4()%>"> 
               <INPUT type="text" name="E01ISICUS" size="12" maxlength="12"
					value="<%= invInst.getE01ISICUS()%>">
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">IBS Country Code :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTC" size="5" maxlength="3" value="<%= invInst.getE01ISICTC()%>">
              <a href="javascript:GetCodeCNOFC('E01ISICTC','03')"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="14%" > 
              <div align="right">Country Name :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISICTR" size="30" maxlength="30" value="<%= invInst.getE01ISICTR()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Bloomberg Country Code :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTB" size="5" maxlength="4" value="<%= invInst.getE01ISICTB()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Update Mode :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="hidden" name="E01ISIMOD" value="<%= invInst.getE01ISIMOD()%>">
                <input type="radio" name="CE01ISIMOD" value="M" onClick="document.forms[0].E01ISIMOD.value='M'"
			  <%if(invInst.getE01ISIMOD().equals("M")) out.print("checked");%>>
                Manual 
                <input type="radio" name="CE01ISIMOD" value="B" onClick="document.forms[0].E01ISIMOD.value='B'"
			  <%if(invInst.getE01ISIMOD().equals("B")) out.print("checked");%>>
                Bloomberg <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Rating 'Standard &amp; Poor':</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIRSP" size="25" maxlength="23" value="<%= invInst.getE01ISIRSP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Rating 'Moodys' :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" name="E01ISIRMD" size="25" maxlength="23" value="<%= invInst.getE01ISIRMD()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Range Note :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01ISIRGN" size="45" maxlength="45" value="<%= invInst.getE01ISIRGN()%>">
            </td>
            <td nowrap > 
              <div align="right">Price in Percent :</div>
            </td>
            <td nowrap > 
              <input type="hidden" name="E01ISIPER" value="<%= invInst.getE01ISIPER()%>">
              <input type="radio" name="CE01ISIPER " value="Y" onClick="document.forms[0].E01ISIPER.value='Y'"
			  <%if(invInst.getE01ISIPER().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE01ISIPER " value="N" onClick="document.forms[0].E01ISIPER.value='N'"
			  <%if(invInst.getE01ISIPER().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Issued Date :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISISD1" size="3" maxlength="2" value="<%= invInst.getE01ISISD1()%>">
              <input type="text" name="E01ISISD2" size="3" maxlength="2" value="<%= invInst.getE01ISISD2()%>">
              <input type="text" name="E01ISISD3" size="3" maxlength="2" value="<%= invInst.getE01ISISD3()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Instrument Market Status :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISIMKS" size="15" maxlength="10" value="<%= invInst.getE01ISIMKS()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Calculation Type :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTP" size="7" maxlength="6" value="<%= invInst.getE01ISICTP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Calculation Type Description :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISICTD" size="35" maxlength="35" value="<%= invInst.getE01ISICTD()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Yield to Maturity :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIYLD" size="11" maxlength="9" value="<%= invInst.getE01ISIYLD()%>" >
            </td>
            <td nowrap width="34%" > 
              <div align="right">Yield to Call :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIYTC" size="11" maxlength="9" value="<%= invInst.getE01ISIYTC()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Industrial Group :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIIGR" size="35" maxlength="30" value="<%= invInst.getE01ISIIGR()%>">
            </td>
            <td nowrap width="34%" >
              <div align="right">Defaulted :</div>
            </td>
            <td nowrap width="66%" >
              <input type="hidden" name="E01ISIFL0" value="<%= invInst.getE01ISIFL0()%>">
              <input type="radio" name="CE01ISIFL0" value="Y" onClick="document.forms[0].E01ISIFL0.value='Y'"
			  <%if(invInst.getE01ISIFL0().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE01ISIFL0" value="N" onClick="document.forms[0].E01ISIFL0.value='N'"
			  <%if(invInst.getE01ISIFL0().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Zero Coupon :</div>
            </td>
            <td nowrap width="34%" >
              <input type="radio" name="E01ISIFL1" value="Y" <%if(invInst.getE01ISIFL1().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" name="E01ISIFL1" value="N" <%if(invInst.getE01ISIFL1().equals("N")) out.print("checked");%>>No
            </td>
            <td nowrap width="34%" >
               <div align="right">Accepted for Trade in Europe :</div>
            </td>
            <td nowrap width="66%" >
            	<input type="hidden" name="E01ISIF61" value="<%= invInst.getE01ISIF61()%>">
              <input type="radio" name="CE01ISIF61" value="Y" onClick="document.forms[0].E01ISIF61.value='Y'"
			  <%if(invInst.getE01ISIF61().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE01ISIF61" value="N" onClick="document.forms[0].E01ISIF61.value='N'">
              No</td>

          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Unit of measurement:</div>
            </td>
            <td nowrap width="34%" >
              <INPUT type="text" name="E01ISIF67" size="6" maxlength="6" value="<%= invInst.getE01ISIF67().trim()%>">
              <A href="javascript:GetSpecUsrTab('E01ISIF67','13')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"	align="absmiddle" border="0">
              </A>
            </td>
            
            <td nowrap width="14%" > 
              <div align="right">Pool Factor :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISIFL8" size="11" maxlength="11" value="<%= invInst.getE01ISIFL8()%>">
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
              <INPUT type="radio" name="E01ISIFL3"
					value="Y"
					<%if(invInst.getE01ISIFL3().equals("Y")) out.print("checked");%>>Yes 
              <INPUT type="radio" name="E01ISIFL3" value="N"
					<%if(invInst.getE01ISIFL3().equals("N")) out.print("checked");%>>No
			</td>
            <td nowrap width="14%" > 
              <div align="right">Tax Rate at Source :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISIFL7" size="11" maxlength="11" value="<%= invInst.getE01ISIFL7()%>"> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Income Code :</div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" name="E01ISIFL5" size="3" maxlength="2" value="<%= invInst.getE01ISIFL5()%>">
                <A href="javascript:GetSpecUsrTab('E01ISIFL5','11')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absmiddle" border="0"></A>
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
  <% if(invInst.getE01ISIPTY().equals("BND")||invInst.getE01ISIPTY().equals("PFS")) { %>
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
              <input type="text" name="E01ISIMA1" size="3" maxlength="2" value="<%= invInst.getE01ISIMA1()%>">
              <input type="text" name="E01ISIMA2" size="3" maxlength="2" value="<%= invInst.getE01ISIMA2()%>">
              <input type="text" name="E01ISIMA3" size="3" maxlength="2" value="<%= invInst.getE01ISIMA3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISIMA1,document.forms[0].E01ISIMA2,document.forms[0].E01ISIMA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="34%" > 
              <div align="right">SITME :</div>
            </td>
            <td nowrap width="66%" >
	            <div align="left">
	            	<input type="radio" name="E01ISIF69" value="Y" <%if(invInst.getE01ISIF69().equals("Y")) out.print("checked");%> >Yes
	            	<input type="radio" name="E01ISIF69" value="N" <%if(invInst.getE01ISIF69().equals("N")) out.print("checked");%> >No	            	 
	            </div>
	         </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISIRTE" size="11" maxlength="11" value="<%= invInst.getE01ISIRTE()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
              </div>
            </td>
            <td nowrap > 
              <div align="right">Accrual Type :</div>
            </td>
            <td nowrap > 
              <select name="E01ISIATY">
                <option value=" " <%if (invInst.getE01ISIATY().equals(" ")) { out.print("selected"); }%>></option> 
                <option value="1" <%if (invInst.getE01ISIATY().equals("1")) { out.print("selected"); }%>>Actual/Actual</option>
                <option value="2" <%if (invInst.getE01ISIATY().equals("2")) {  out.print("selected"); }%>>Actual/365</option>
                <option value="3" <%if (invInst.getE01ISIATY().equals("3")) {  out.print("selected"); }%>>Actual/365(366 
                Leap Year)</option>
                <option value="4" <%if (invInst.getE01ISIATY().equals("4")) {  out.print("selected"); }%>>Actual/360</option>
                <option value="5" <%if (invInst.getE01ISIATY().equals("5")) {  out.print("selected"); }%>>30/360</option>
                <option value="6" <%if (invInst.getE01ISIATY().equals("6")) {  out.print("selected"); }%>>30E/360</option>
                <option value="7" <%if (invInst.getE01ISIATY().equals("7")) {  out.print("selected"); }%>>22/252</option>
                               
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Calculation Base :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIBAS" size="5" maxlength="3" value="<%= invInst.getE01ISIBAS()%>">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Calculation Days :</div>
            </td>
            <td nowrap width="66%" > 
              <select name="E01ISIICT">
                <option value=" " <%if (invInst.getE01ISIICT().equals(" ")) { out.print("selected"); }%>></option> 
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
              <input type="text" name="E01ISIFTB" size="2" maxlength="2" value="<%= invInst.getE01ISIFTB().trim()%>">
              <a href="javascript:GetFloating('E01ISIFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <select name="E01ISIFTY">
                <option value=" " <%if (invInst.getE01ISIFTY().equals(" ")) { out.print("selected"); }%>></option>
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
              <input type="text" name="E01ISIFRT" size="11" maxlength="11" value="<%= invInst.getE01ISIFRT()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Days / Date T + N :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIDTN" size="11" maxlength="11" value="<%= invInst.getE01ISIDTN()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
            <td nowrap width="34%" > 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIPFV" size="4" maxlength="4" value="<%= invInst.getE01ISIPFV().trim()%>" onKeyPress="enterInteger()">
              <select name="E01ISIPFC">
				<option value=" " <% if(invInst.getE01ISIPFC().equals(" ")) out.print("selected");%>></option>
                <option value="D" <% if(invInst.getE01ISIPFC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(invInst.getE01ISIPFC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Q" <% if(invInst.getE01ISIPFC().equals("Q")) out.print("selected");%>>Quarter</option>
                <option value="S" <% if(invInst.getE01ISIPFC().equals("S")) out.print("selected");%>>Semianually</option>
                <option value="Y" <% if(invInst.getE01ISIPFC().equals("Y")) out.print("selected");%>>Anually</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
            </td>
          </tr>
		  <tr id="trclear">
    		<td nowrap>
    			<div align="right">
    				Calculation Method :
	    		</div>
    		</td>
    		<td nowrap colspan="3">
    			<SELECT name="E01ISIF68">
					<OPTION value=" "
						<%if (invInst.getE01ISIF68().equals(" ")) { out.print("selected"); }%>></OPTION>
					<OPTION value="N"
						<%if (invInst.getE01ISIF68().equals("N")) { out.print("selected"); }%>>None</OPTION>
					<OPTION value="1"
						<%if (invInst.getE01ISIF68().equals("1")) {  out.print("selected"); }%>>Semi-Annual Basis</OPTION>
				</SELECT>
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
                <input type="text" name="E01ISIIN1" size="3" maxlength="2" value="<%= invInst.getE01ISIIN1()%>">
                <input type="text" name="E01ISIIN2" size="3" maxlength="2" value="<%= invInst.getE01ISIIN2()%>">
                <input type="text" name="E01ISIIN3" size="3" maxlength="2" value="<%= invInst.getE01ISIIN3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ISIIN1,document.forms[0].E01ISIIN2,document.forms[0].E01ISIIN3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
              </div>
            </td>
            <td nowrap width="41%" >
              <div align="right">Next Interest Payment Date :</div>
            </td>
            <td nowrap width="19%" >
              <div align="left">
				<input type="text" name="E01ISINI1" size="3" maxlength="2" value="<%= invInst.getE01ISINI1()%>">
              	<input type="text" name="E01ISINI2" size="3" maxlength="2" value="<%= invInst.getE01ISINI2()%>">
              	<input type="text" name="E01ISINI3" size="3" maxlength="2" value="<%= invInst.getE01ISINI3()%>">
              	<a href="javascript:DatePicker(document.forms[0].E01ISINI1,document.forms[0].E01ISINI2,document.forms[0].E01ISINI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" >
              <div align="right">Last Dividends Payment Date :</div>
            </td>
            <td nowrap width="18%" >
              <div align="left">
                <input type="text" name="E01ISIDI1" size="3" maxlength="2" value="<%= invInst.getE01ISIDI1()%>">
                <input type="text" name="E01ISIDI2" size="3" maxlength="2" value="<%= invInst.getE01ISIDI2()%>">
                <input type="text" name="E01ISIDI3" size="3" maxlength="2" value="<%= invInst.getE01ISIDI3()%>">
				<a href="javascript:DatePicker(document.forms[0].E01ISIDI1,document.forms[0].E01ISIDI2,document.forms[0].E01ISIDI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              </div>
            </td>
            <td nowrap width="41%" >
              <div align="right">Next Dividends Payment Date :</div>
            </td>
            <td nowrap width="19%" >
              <div align="left">
              	<input type="text" name="E01ISIND1" size="3" maxlength="2" value="<%= invInst.getE01ISIND1()%>">
	            <input type="text" name="E01ISIND2" size="3" maxlength="2" value="<%= invInst.getE01ISIND2()%>">
    	        <input type="text" name="E01ISIND3" size="3" maxlength="2" value="<%= invInst.getE01ISIND3()%>">
        	    <a href="javascript:DatePicker(document.forms[0].E01ISIND1,document.forms[0].E01ISIND2,document.forms[0].E01ISIND3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Last Capital Payment Date :</div>
            </td>
            <td nowrap width="18%" > 
              <input type="text" name="E01ISICA1" size="3" maxlength="2" value="<%= invInst.getE01ISICA1()%>">
              <input type="text" name="E01ISICA2" size="3" maxlength="2" value="<%= invInst.getE01ISICA2()%>">
              <input type="text" name="E01ISICA3" size="3" maxlength="2" value="<%= invInst.getE01ISICA3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISICA1,document.forms[0].E01ISICA2,document.forms[0].E01ISICA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap width="41%" > 
              <div align="right">Next Capital Payment Date :</div>
            </td>
            <td nowrap width="19%" > 
	            <input type="text" name="E01ISINC1" size="3" maxlength="2" value="<%= invInst.getE01ISINC1()%>">
                <input type="text" name="E01ISINC2" size="3" maxlength="2" value="<%= invInst.getE01ISINC2()%>">
                <input type="text" name="E01ISINC3" size="3" maxlength="2" value="<%= invInst.getE01ISINC3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01ISINC1,document.forms[0].E01ISINC2,document.forms[0].E01ISINC3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">First Accrual Date :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
            	  <input type="text" name="E01ISIFA1" size="3" maxlength="2" value="<%= invInst.getE01ISIFA1()%>">
    	          <input type="text" name="E01ISIFA2" size="3" maxlength="2" value="<%= invInst.getE01ISIFA2()%>">
	              <input type="text" name="E01ISIFA3" size="3" maxlength="2" value="<%= invInst.getE01ISIFA3()%>">
        	      <a href="javascript:DatePicker(document.forms[0].E01ISIFA1,document.forms[0].E01ISIFA2,document.forms[0].E01ISIFA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
              </div>
            </td>
            <td nowrap width="41%" ><div align="right"><DIV align="right">Next Call Date :</DIV></div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01ISICL1" size="3" maxlength="2" value="<%= invInst.getE01ISICL1()%>">
              <input type="text" name="E01ISICL2" size="3" maxlength="2" value="<%= invInst.getE01ISICL2()%>">
              <input type="text" name="E01ISICL3" size="3" maxlength="2" value="<%= invInst.getE01ISICL3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISICL1,document.forms[0].E01ISICL2,document.forms[0].E01ISICL3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">First Coupon Date :</div>
            </td>
            <td nowrap width="18%" > 
              <input type="text" name="E01ISIFI1" size="3" maxlength="2" value="<%= invInst.getE01ISIFI1()%>">
              <input type="text" name="E01ISIFI2" size="3" maxlength="2" value="<%= invInst.getE01ISIFI2()%>">
              <input type="text" name="E01ISIFI3" size="3" maxlength="2" value="<%= invInst.getE01ISIFI3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISIFI1,document.forms[0].E01ISIFI2,document.forms[0].E01ISIFI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="41%" ><div align="right">Next Put Date :</div>
            </td>
            <td nowrap width="19%" > 
	            <INPUT type="text" name="E01ISIPU1" size="3" maxlength="2" value="<%= invInst.getE01ISIPU1()%>">
	            <INPUT type="text" name="E01ISIPU2" size="3" maxlength="2" value="<%= invInst.getE01ISIPU2()%>">
	            <INPUT type="text" name="E01ISIPU3" size="3" maxlength="2" value="<%= invInst.getE01ISIPU3()%>">
                <A href="javascript:DatePicker(document.forms[0].E01ISIPU1,document.forms[0].E01ISIPU2,document.forms[0].E01ISIPU3)"><IMG src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></A>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">
				<DIV align="right">
				<DIV align="right">First Settlement Date :</DIV>
				</DIV>
				</div>
            </td>
            <td nowrap width="18%" > 
           	  <input type="text" name="E01ISIFS1" size="3" maxlength="2" value="<%= invInst.getE01ISIFS1()%>">
              <input type="text" name="E01ISIFS2" size="3" maxlength="2" value="<%= invInst.getE01ISIFS2()%>">
              <input type="text" name="E01ISIFS3" size="3" maxlength="2" value="<%= invInst.getE01ISIFS3()%>">
              <a href="javascript:DatePicker(document.forms[0].E01ISIFS1,document.forms[0].E01ISIFS2,document.forms[0].E01ISIFS3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="41%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="19%" >
              <a href="javascript:DatePicker(document.forms[0].E01ISIPU1,document.forms[0].E01ISIPU2,document.forms[0].E01ISIPU3)"></a> 
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
              <input type="text" name="E01ISIAMT" size="22" maxlength="21" value="<%= invInst.getE01ISIAMT()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Issued Price :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIIPR" size="22" maxlength="21" value="<%= invInst.getE01ISIIPR()%>" onKeyPress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Minimum Piece Amount :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIMIA" size="22" maxlength="21" value="<%= invInst.getE01ISIMIA()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Maturity Price :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" name="E01ISIMPR" size="22" maxlength="21" value="<%= invInst.getE01ISIMPR()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Increment Amount :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIINA" size="22" maxlength="21" value="<%= invInst.getE01ISIINA()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Monthly Average Price :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" name="E01ISIMAP" size="22" maxlength="21" value="<%= invInst.getE01ISIMAP()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Par. Amount :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIPAR" size="22" maxlength="21" value="<%= invInst.getE01ISIPAR()%>" onKeyPress="enterDecimal()">
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
  <h4><% if(userPO.getPurpose().equals("M")) { %>Audit Information</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Last User Update Date :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIUP1" size="3" maxlength="2" value="<%= invInst.getE01ISIUP1()%>" readonly>
              <input type="text" name="E01ISIUP2" size="3" maxlength="2" value="<%= invInst.getE01ISIUP2()%>" readonly>
              <input type="text" name="E01ISIUP3" size="3" maxlength="2" value="<%= invInst.getE01ISIUP3()%>" readonly>
            </td>   
            <td nowrap width="34%" > 
              <div align="right">User Profile:</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIUSR" size="11" maxlength="10" value="<%= invInst.getE01ISIUSR()%>" readonly>
            </td>           
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Last Bloomberg Update Date :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIBL1" size="3" maxlength="2" value="<%= invInst.getE01ISIBL1()%>" readonly>
              <input type="text" name="E01ISIBL2" size="3" maxlength="2" value="<%= invInst.getE01ISIBL2()%>" readonly>
              <input type="text" name="E01ISIBL3" size="3" maxlength="2" value="<%= invInst.getE01ISIBL3()%>" readonly>
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
  <%
     
    }
  %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>
