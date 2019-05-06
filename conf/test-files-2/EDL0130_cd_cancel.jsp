<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Prepayment of Certificates of Deposit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
  function checkDel(obj){
  	alert('obj.checked=' + obj.checked);
	if (obj.checked) obj.value="Y"; else obj.value="";
	alert('obj.value=' + obj.value);
  }   

 function myGetCodeCNOFC(name, code){
  	if (document.forms[0][name].disabled==false){
  		GetCodeCNOFC(name, code)
  	}
  }

</SCRIPT>
</head>

<jsp:useBean id= "cdCancel" class= "datapro.eibs.beans.EDL013007Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center">Prepayment of Deals <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_cancel.jsp, EDL0130" width="35" height="35"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <INPUT TYPE=HIDDEN NAME="E07DEABNK" VALUE="<%= cdCancel.getE07DEABNK().trim()%>">
  <input type=HIDDEN name="E07DEAACD" value="<%= cdCancel.getE07DEAACD().trim()%>">
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
                <input type="text" size="9" maxlength="9" name="E07DEACUN" value="<%= cdCancel.getE07DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" size="45" maxlength="45" name="E07CUSNA1" value="<%= cdCancel.getE07CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" size="12" maxlength="9" name="E07DEAACC" value="<%= cdCancel.getE07DEAACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E07DEACCY" size="3" maxlength="3" value="<%= cdCancel.getE07DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" size="4" maxlength="4" name="E07DEAPRO" value="<%= cdCancel.getE07DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Financial Information</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Last Calculation Date :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" name="E07DEALC1" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E07DEALC2" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E07DEALC3" size="2" maxlength="2" value="<%= cdCancel.getE07DEALC3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E07DEALC1,document.forms[0].E07DEALC2,document.forms[0].E07DEALC3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" name="E07DEAMEP" size="15" maxlength="13" value="<%= cdCancel.getE07DEAMEP().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%" height="23"> 
              <div align="right">Interest Amount :</div>
            </td>
            <td nowrap width="61%" height="23"> 
              <input type="text" name="E07DEAMEI" size="15" maxlength="13" value="<%= cdCancel.getE07DEAMEI().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%" height="19"> 
              <div align="right">Withholding :</div>
            </td>
            <td nowrap width="61%" height="19"> 
              <input type="text" name="E07DEAWHL" size="15" maxlength="13" value="<%= cdCancel.getE07DEAWHL().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Sales Tax :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" name="E07DEATAX" size="15" maxlength="13" value="<%= cdCancel.getE07DEATAX().trim()%>"  onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap width="61%"> 
              <input type="text" name="E07DEATOT" size="15" maxlength="13" value="<%= cdCancel.getE07DEATOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%	if (!cdCancel.getE07DEARCL().equals("")){ %>  
  <h4>IRA Information</h4>
  <table class="tableinfo" width="582">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trclear"> 
           
            	<td nowrap width="20%"> 
              		<div align="right">TAX Year : </div>
            	</td>
	         <td width="15%" nowrap> 
              <select name="E07DEARRT" >
                <option value="C" <%if (cdCancel.getE07DEARRT().equals("C")) { out.print("selected"); }%>>Current Year</option>
                <option value="P" <%if (cdCancel.getE07DEARRT().equals("P")) { out.print("selected"); }%>>Previous Year</option>
                
			  </select>
             <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
			<td width="35%" nowrap colspan="3">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Contribution Type : </div>
            </td>
             <td nowrap> 
              <input type="text" name="E07TRNSOU" size="3" maxlength="2" value="<%= cdCancel.getE07TRNSOU().trim() %>"
              		>
              <a href="javascript:myGetCodeCNOFC('E07TRNSOU','18')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap> 
              <div align="right">OR </div>
            </td>
            <td nowrap> 
              <div align="right">Distribution Code : </div>
            </td>
			<TD nowrap>
				<div align="left">
					 <INPUT type="text" name="E07TRNDIB" size="3" maxlength="2"
							value="<%= cdCancel.getE07TRNDIB().trim()%>">
            <A href="javascript:myGetCodeCNOFC('E07TRNDIB','38')"> <IMG
							src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
							align="absmiddle" border="0"></A>
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
		         </div> 
			</TD>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <%}%>  
  <p></p>
  <h4>Prepayment of Deals</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap height="21">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="39%" height="23"> 
              <div align="right">Penalty Rate :</div>
            </td>
            <td nowrap width="61%" height="23">
              <input type="text" name="E07PENRTE" size="9" maxlength="9" value="<%= cdCancel.getE07PENRTE().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%">
              <div align="right">Number of Days :</div>
            </td>
            <td nowrap width="61%" height="22" bordercolor="#FFFFFF" >
              <input type="text" name="E07PENDYS" size="3" maxlength="3" value="<%= cdCancel.getE07PENDYS().trim()%>"  onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%">
              <div align="right">Waive Penalty : </div>
            </td>
            <td nowrap width="61%" height="22" bordercolor="#FFFFFF" >
              <input type="radio" name="H07FLGWK3" value="Y"  <%if (cdCancel.getH07FLGWK3().equals("Y")) out.print("checked"); %>>
              Yes 
              <input type="radio" name="H07FLGWK3" value=""  <%if (cdCancel.getH07FLGWK3().equals("")) out.print("checked"); %>>
              No              
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <p></p>
  <h4>Transaction Information</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNPRI" size="15" maxlength="13" value="<%= cdCancel.getE07TRNPRI().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Interests :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNINT" size="15" maxlength="13" value="<%= cdCancel.getE07TRNINT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Penalty :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNPEN" size="15" maxlength="13" value="<%= cdCancel.getE07TRNPEN().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Withholding :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNWHL" size="15" maxlength="13" value="<%= cdCancel.getE07TRNWHL().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Sales Tax :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNTAX" size="15" maxlength="13" value="<%= cdCancel.getE07TRNTAX().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Prepayment Amount :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNTOT" size="15" maxlength="13" value="<%= cdCancel.getE07TRNTOT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="center"><b>Repayment Account</b></div>
            </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark"> 
            <td nowrap width="31%"  > 
              <div align="center">Concept</div>
            </td>
            <td nowrap width="5%" > 
              <div align="center">Bank</div>
            </td>
            <td nowrap width="13%" > 
              <div align="center">Branch</div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center">Currency</div>
            </td>
            <td nowrap width="21%" > 
              <div align="center">Reference</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%" > 
              <div align="center"> 
                <input type="text" name="E07TRNOPC" maxlength="2" size="2" value="<%= cdCancel.getE07TRNOPC().trim()%>">
                <input type=HIDDEN name="E07TRNGLN" value="<%= cdCancel.getE07TRNGLN().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E07TRNCON" value="<%= cdCancel.getE07TRNCON().trim()%>"
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E07DEABNK.value,'','E07TRNGLN','E07TRNOPC',document.forms[0].E07DEAACD.value)">
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= cdCancel.getE07TRNBNK().trim()%>" name="E07TRNBNK" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="13%" > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" value="<%= cdCancel.getE07TRNBRN().trim()%>" name="E07TRNBRN" 
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E07DEABNK.value,'','','','')" onkeypress="enterInteger()"></div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E07TRNCCY" value="<%= cdCancel.getE07TRNCCY().trim()%>" 
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E07DEABNK.value,'','','','')"> </div>
            </td>
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" size="16" maxlength="12" value="<%= cdCancel.getE07TRNACC().trim()%>" name="E07TRNACC"  
                oncontextmenu="showPopUp(accountHelp,this.name,document.forms[0].E07DEABNK.value,'','','','RT')"  onkeypress="enterInteger()"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <% 
		if (error.getERWRNG().equals("Y")) { 
				error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H07FLGWK2" value="A">
      		Accept with Warnings</h4>
	<% 
		} 
	%>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</form>
</body>
</html>
