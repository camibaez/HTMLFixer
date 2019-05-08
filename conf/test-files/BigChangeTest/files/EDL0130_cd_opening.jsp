<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificate of Deposit Opening</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="cdNew" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<SCRIPT LANGUAGE="javascript">
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

 function CheckSubmit(act)
{
   document.forms[0].ACTION.value=act;
   document.forms[0].submit();
}

 function getAmount(num)
  {
   if (num == 1) {
    if (trim(document.forms[0].E01OFFAM1.value)=="0.00" || trim(document.forms[0].E01OFFAM1.value)=="") {
     document.forms[0].E01OFFAM1.value = document.forms[0].E01DEAOAM.value;}
  }
}
</SCRIPT>
</head>
<body>
<%
 String CUSCUN = "";
 String CUSNA1 = "";

 if (currClient != null && error.getERRNUM().equals("0")) {
    CUSCUN = currClient.getE01CUSCUN().trim();
    CUSNA1 = currClient.getE01CUSNA1().trim();
 } else {
    CUSCUN = cdNew.getE01DEACUN().trim();
    CUSNA1 = cdNew.getE01CUSNA1().trim();
 }

 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>
<h3 align="center">Opening of Deals <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cd_opening.jsp,EDL0130">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK" value="<%= cdNew.getE01DEABNK().trim()%>"">
  <input type=HIDDEN name="E01DEAACD" value="<%= cdNew.getE01DEAACD().trim()%>"">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="10%" >
              <div align="right"><b>Portfolio/Customer :</b></div>
            </td>
            <td nowrap width="30%">
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= CUSCUN%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
                </div>
            </td>
            <td nowrap width="10%" >
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" width="50%">
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= CUSNA1%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right"><b>Reference : </b></div>
            </td>
            <td nowrap>
              <div align="left">
                <input type="text" readonly name="E01DEAACC" size="12" maxlength="9" value="<% if (cdNew.getE01DEAACC().trim().equals("999999999")) out.print("NEW ACCOUNT"); else out.print(cdNew.getE01DEAACC().trim()); %>">
              </div>
            </td>
            <td nowrap>
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= cdNew.getE01DEACCY().trim()%>" readonly>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
                </b> </div>
            </td>
            <td nowrap width="10%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= cdNew.getE01DEAPRO().trim()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
                </b> </div>
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
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= cdNew.getE01DEAOD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= cdNew.getE01DEAOD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= cdNew.getE01DEAOD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAOD1,document.forms[0].E01DEAOD2,document.forms[0].E01DEAOD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap width="25%">
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEATRM" size="4" maxlength="3" value="<%= cdNew.getE01DEATRM().trim()%>" onkeypress="enterInteger()">
              <select name="E01DEATRC">
                <option value=" " <% if (!(cdNew.getE01DEATRC().equals("D") ||cdNew.getE01DEATRC().equals("M")||cdNew.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdNew.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(cdNew.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(cdNew.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" height="37">
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="23%" height="37">
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= cdNew.getE01DEAMD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= cdNew.getE01DEAMD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= cdNew.getE01DEAMD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAMD1,document.forms[0].E01DEAMD2,document.forms[0].E01DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Interest Rate / Spread :</div>
            </td>
            <td nowrap width="27%" height="37">
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= cdNew.getE01DEARTE().trim()%>" onKeypress="enterSignDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Floating Rate Type :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= cdNew.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <select name="E01DEAFTY">
                <option value=" " <% if (!(cdNew.getE01DEAFTY().equals("FP") ||cdNew.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdNew.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (cdNew.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
            </td>
            <td nowrap width="25%" >
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= cdNew.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Rate Revision Date/Period :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARD1" size="2" maxlength="2" value="<%= cdNew.getE01DEARD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD2" size="2" maxlength="2" value="<%= cdNew.getE01DEARD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD3" size="2" maxlength="2" value="<%= cdNew.getE01DEARD3().trim()%>" onkeypress="enterInteger()">
              /
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= cdNew.getE01DEARRP().trim()%>" onkeypress="enterCharNumber()" onblur="rightAlignCharNumber()">
            </td>
            <td nowrap width="25%" >
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= cdNew.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= cdNew.getE01DEAOAM().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" ></td>
            <td nowrap width="25%" >
              <div align="right">Cost Center </div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEACCN" size="8" maxlength="6" value="<%= cdNew.getE01DEACCN().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].SCRDEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEACCY2" size="4" maxlength="3" value="<%= cdNew.getE01DEACCY().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Inquiry Level (0-9) : </div>
            </td>
            <td nowrap width="27%" >
            	<input type="text"  name="E01DEAOPT" size="2" maxlength="1" value="<%= cdNew.getE01DEAOPT().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
              <div align="right">Rates Tables:</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARTB" size="1" maxlength="1" value="<%= cdNew.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap >
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap >
               <input type="text" size="2" maxlength="1" value="<%= cdNew.getE01DEAF05().trim()%>" name="E01DEAF05">
              <a href="javascript:GetCode('E01DEAF05','STATIC_acc_benef_designation.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdNew.getE01DEABNK().trim()%>"readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdNew.getE01DEABRN().trim()%>">
              <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
            </td>

            <td nowrap >
              <div align="right">Ownership of Account : </div>
            </td>
            <td nowrap >
              <input type="text" size="2" maxlength="1" value="<%= cdNew.getE01DEAF04().trim()%>" name="E01DEAF04">
              <a href="javascript:GetCode('E01DEAF04','STATIC_acc_ownership.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Rate Exchange :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01DEAEXR" size="10" maxlength="9" value="<%= cdNew.getE01DEAEXR().trim()%>" onKeypress="enterSignDecimal()">
            </td>

            <td nowrap >
            <div align="right">Witholding/Sale Tax: </div>
            </td>
            <td nowrap >
            <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= cdNew.getE01DEAWHF().trim()%>" >
             <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="23%">
			<input type="text" name="E01DEAPVI" size="2" maxlength="1" value="<%= cdNew.getE01DEAPVI().trim()%>" >
              <a href="javascript:GetCode('E01DEAPVI','STATIC_cd_pmnt_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a>
            </td>
          <% if (cdNew.getE01DEAACD().equals("14")   
                 || cdNew.getE01DEAACD().equals("15")){ %>
	            <td nowrap width="25%">
	              <div align="right">Line of Credit :</div>
	            </td>
	            <td nowrap width="23%">
				  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= cdNew.getE01DEACMC().trim()%>"  onkeypress="enterInteger()">
	              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= cdNew.getE01DEACMN().trim()%>"  onkeypress="enterInteger()">
	              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  >
	            </td>
   		  <% } %>	              
          </tr>


        </table>
      </td>
    </tr>
  </table>

  <%if (!cdNew.getE01DEARCL().equals("")){%>
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
                <option value="I" <%if (cdNew.getE01DEARCL().equals("I")) { out.print("selected"); }%>>Traditional</option>
                <option value="S" <%if (cdNew.getE01DEARCL().equals("S")) { out.print("selected"); }%>>SEP IRA</option>
                <option value="R" <%if (cdNew.getE01DEARCL().equals("R")) { out.print("selected"); }%>>ROTH IRA</option>
				</select>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trdark">
            	<td nowrap width="16%">
              		<div align="right">TAX Year : </div>
            	</td>
	         <td width="18%">
              <select name="E01DEARRT">
                <option value="C" <%if (cdNew.getE01DEARRT().equals("C")) { out.print("selected"); }%>>Current Year</option>
                <option value="P" <%if (cdNew.getE01DEARRT().equals("P")) { out.print("selected"); }%>>Previous Year</option>
					<OPTION value="">Not Applicable</OPTION>
				</select>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%">
              <div align="right">Contribution Type : </div>
            </td>
             <td width="18%">
              <input type="text" name="E01DEASOU" size="3" maxlength="2" value="<%= cdNew.getE01DEASOU().trim() %>">
              <a href="javascript:GetCodeCNOFC('E01DEASOU','18')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <%}%>
  <h4>Offset Accounts</h4>
  <TABLE class="tableinfo" align="center">
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
     <table id="dataTable" >
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%>
    <tr id="trclear">
      <td nowrap >
        <div align="center">
          <input type="text" name="E01OFFOP<%= name %>" value="<%= cdNew.getField("E01OFFOP"+name).getString().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdNew.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdNew.getField("E01OFFCO"+name).getString().trim()%>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01DEAACD.value)">
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdNew.getField("E01OFFBK"+name).getString().trim()%>" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= cdNew.getField("E01OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap  >
        <div align="center">
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdNew.getField("E01OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="9"  value="<%= cdNew.getField("E01OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(openingWireHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFAM<%= name %>',document.forms[0]['E01OFFOP<%= name %>'].value,'RC')"  onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap >
        <div align="center">
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= cdNew.getField("E01OFFAM"+name).getString().trim()%>" onkeypress="enterDecimal()">
        </div>
      </td>
    </tr>
    <%
    		}
    		%>
     </table>
        </div>
    <table id="footTable" >
    <tr id="trdark">
            <td nowrap align="right"><b>Deal Currency Equivalent :</b> </td>
      <td nowrap align="center"><b><i><strong>
          <input type="text" name="E01OFFEQV" size="15" maxlength="13" readonly value="<%= cdNew.getE01OFFEQV().trim()%>">
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
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckSubmit('F')">
  </div>
  </form>
</body>
</html>
