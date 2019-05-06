<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_m_opt);
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center"> Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_maint.jsp,EDL0130"></h3>
<hr size="4">
<%-- <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" onsubmit="javascript:this.disabled = true;"> --%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD"  value="<%= cdMant.getE01DEAACD().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Portfolio/Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
               </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="12" maxlength="9" value="<%= cdMant.getE01DEAACC().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY2" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= cdMant.getE01DEAPRO().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Original Information</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD1().trim()%>" <%if(!cdMant.getH01SCRCOD().equals("N")) {%> readonly <%}%> >
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD2().trim()%>" <%if(!cdMant.getH01SCRCOD().equals("N")) {%> readonly <%}%> >
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD3().trim()%>" <%if(!cdMant.getH01SCRCOD().equals("N")) {%> readonly <%}%> >
            </td>
            <td nowrap > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= cdMant.getE01DEAOAM().trim()%>"
              <%if (!cdMant.getH01SCRCOD().equals("N")) out.print("readonly"); %>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD1().trim()%>" readonly>
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD2().trim()%>" readonly>
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD3().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0" > 
            </td>
            <td nowrap > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Accrual Basis :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= cdMant.getE01DEABAS().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Current Rate :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01RATE" size="10" maxlength="9" value="<%= cdMant.getE01RATE().trim()%>" readonly>
            </td>
          </tr>
 
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">New Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01NEWMD1" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01NEWMD2" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01NEWMD3" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01NEWMD1,document.forms[0].E01NEWMD2,document.forms[0].E01NEWMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= cdMant.getE01DEATRM().trim()%>" onkeypress="enterInteger()">
              <select name="E01DEATRC">
                <option value=" " <% if (!(cdMant.getE01DEATRC().equals("D") ||cdMant.getE01DEATRC().equals("M")||cdMant.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdMant.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(cdMant.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(cdMant.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Floating Rate Type:</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Floating Rates Table" align="middle" border="0" ></a> 
              <select name="E01DEAFTY">
                <option value=" " <% if (!(cdMant.getE01DEAFTY().equals("FP") || cdMant.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdMant.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (cdMant.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FLTRTE" size="10" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Rate Revision Period / Date:</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>" onkeypress="enterCharNumber()" onblur="rightAlignCharNumber()">
              / 
              <input type="text" name="E01DEARD1" size="2" maxlength="2" value="<%= cdMant.getE01DEARD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD2" size="2" maxlength="2" value="<%= cdMant.getE01DEARD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD3" size="2" maxlength="2" value="<%= cdMant.getE01DEARD3().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap > 
              <div align="right">Interest Rate/Spread :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= cdMant.getE01DEARTE().trim()%>" <%if(!cdMant.getH01SCRCOD().equals("N")) {%> readonly <%}%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Witholding/Sale Tax :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= cdMant.getE01DEAWHF().trim()%>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a> 
            </td>
            <td nowrap > 
              <div align="right"> Reference Number :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Interest Calculation Method :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= cdMant.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom" border="0"> 
            </td>
            <td nowrap > 
              <div align="right">Interest Accrual :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="E01DEAIFL" value="1" <% if (cdMant.getE01DEAIFL().equals("1")) out.print("checked"); %>>
              Yes 
              <input type="radio" name="E01DEAIFL" value="N" <% if (cdMant.getE01DEAIFL().equals("N")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Rate Exchange :</div>
            </td>
            <td nowrap > 
				<input type="text" name="E01DEAEXR" size="10" maxlength="9" value="<%= cdMant.getE01DEAEXR().trim()%>" onKeypress="enterSignDecimal()">
            </td>
            <td nowrap >
              <div align="right">Rates Tables: </div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEARTB" size="1" maxlength="1" value="<%= cdMant.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEACCN" size="8" maxlength="6" value="<%= cdMant.getE01DEACCN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].SCRDEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap > 
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap >
               <input type="text" size="2" maxlength="1" value="<%= cdMant.getE01DEAF05().trim()%>" name="E01DEAF05">
              <a href="javascript:GetCode('E01DEAF05','STATIC_acc_benef_designation.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a><%= !currUser.getH01WK3().equals("4")?"<IMG src='"+request.getContextPath()+"/images/Check.gif' alt='mandatory field' align='bottom'>":"" %>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Status: </div>
            </td>
            <td nowrap >
              <select name="E01DEADLC">
                <option value=" " <% if (!(cdMant.getE01DEADLC().equals("1") ||cdMant.getE01DEADLC().equals("2")||cdMant.getE01DEADLC().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (cdMant.getE01DEADLC().equals("1")) out.print("selected"); %>>Active</option>
				<option value="2" <% if (cdMant.getE01DEADLC().equals("2")) out.print("selected"); %>>Past Due</option>                
				<option value="3" <% if (cdMant.getE01DEADLC().equals("3")) out.print("selected"); %>>Hold</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Inquiry Level (0-9) : </div>
            </td>
            <td nowrap >
				<input type="text"  name="E01DEAOPT" size="2" maxlength="1" value="<%= cdMant.getE01DEAOPT().trim()%>">
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
         </tr>
          <tr id="trdark"> 
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
             <% if (cdMant.getH01SCRCOD().trim().equals("N")) { %>
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>"readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdMant.getE01DEABRN().trim()%>">
              <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"  ></a>
             <% } else {%>
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdMant.getE01DEABRN().trim()%>" readonly>
             <% }%> 
            </td>
          
            <td nowrap > 
              <div align="right">Ownership of Account : </div>
            </td>
            <td nowrap >
              <input type="text" size="2" maxlength="1" value="<%= cdMant.getE01DEAF04().trim()%>" name="E01DEAF04">
              <a href="javascript:GetCode('E01DEAF04','STATIC_acc_ownership.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a></td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMLA" size="2" maxlength="1" value="<%= cdMant.getE01DEAMLA().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="23%">
			<input type="text" name="E01DEAPVI" size="2" maxlength="1" value="<%= cdMant.getE01DEAPVI().trim()%>" >
            <a href="javascript:GetCode('E01DEAPVI','STATIC_cd_pmnt_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a> 
            </td>
          </tr>
          <% if (cdMant.getE01DEAACD().equals("14")
      || cdMant.getE01DEAACD().equals("15")) { %>
	          <tr id="trdark"> 
	            <td nowrap width="25%">
	              <div align="right">Line of Credit :</div>
	            </td>
	            <td nowrap width="23%">
				  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= cdMant.getE01DEACMC().trim()%>"  onkeypress="enterInteger()">
	              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= cdMant.getE01DEACMN().trim()%>"  onkeypress="enterInteger()">
	              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
	            </td>
	            <td nowrap width="25%"></td>
	            <td nowrap width="23%"></td>
	          </tr>
   		  <% } %>	              
        </table>
      </td>
    </tr>
  </table>
<%if (cdMant.getH01SCRCOD().equals("N") && !cdMant.getE01DEARCL().equals("")){%>  
  <h4>IRA Information</h4>
  <table class="tableinfo" width="582">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            	<td nowrap width="16%"> 
              		<div align="right">IRA Type : </div>
            	</td>
	         <td width="18%"> 
              <select name="E01DEARCL">
                <option value="I" <%if (cdMant.getE01DEARCL().equals("I")) { out.print("selected"); }%>>Traditional</option>
                <option value="S" <%if (cdMant.getE01DEARCL().equals("S")) { out.print("selected"); }%>>SEP IRA</option>
                <option value="R" <%if (cdMant.getE01DEARCL().equals("R")) { out.print("selected"); }%>>ROTH IRA</option>                
				</select>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td> 
          </tr>           
          <tr id="trdark"> 
            	<td nowrap width="16%"> 
              		<div align="right">TAX Year : </div>
            	</td>
	         <td width="18%"> 
              <select name="E01DEARRT">
                <option value="C" <%if (cdMant.getE01DEARRT().equals("C")) { out.print("selected"); }%>>Current Year</option>
                <option value="P" <%if (cdMant.getE01DEARRT().equals("P")) { out.print("selected"); }%>>Previous Year</option>
					<OPTION value="">Not Applicable</OPTION>
				</select>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td> 
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Contribution Type : </div>
            </td>
             <td width="18%"> 
              <input type="text" name="E01DEASOU" size="3" maxlength="2" value="<%= cdMant.getE01DEASOU().trim() %>">
              <a href="javascript:GetCodeCNOFC('E01DEASOU','18')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > 
            </td>
             
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%}%>
  <h4>Offset Accounts</h4>
   <TABLE class="tableinfo">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable">
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
    <tr id="trclear"> 
      <td nowrap > 
                <div align="center"> 
                  <input type="text" name="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>" size="2" maxlength="2">
                  <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" 
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01DEAACD.value)">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap > 
                <div align="center"> 
                  <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="9"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(openingWireHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFAM<%= name %>',document.forms[0]['E01OFFOP<%= name %>'].value,'RC')"  onKeyPress="enterInteger()">
                </div>
      </td>
      <td nowrap > 
                <div align="center"> 
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" onKeyPress="enterDecimal()">
                </div>
      </td>
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
 <table id="footTable"> 		
    <tr id="trdark"> 
            <td nowrap align="right"><b>Deal Currency Equivalent :</b> </td>
      <td nowrap align="center"><b><i><strong> 
          <input type="text" name="E01OFFEQV" size="15" maxlength="13" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>    
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
	<% 
		if (error.getERWRNG().equals("Y")) { 
			error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Accept with Warnings</h4>
	<% 
		} 
	%>       
 
   <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </div>
  </form>
</body>
</html>
