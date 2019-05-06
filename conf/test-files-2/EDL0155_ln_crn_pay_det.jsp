<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>

<HTML>
<HEAD>
<TITLE>
Payment Details
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="header" class= "datapro.eibs.beans.EDL015501Message"  scope="session"/>
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBListRec"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" >

function goAction(opt) {
	  
      document.forms[0].OPTION.value = opt;
	  document.forms[0].submit();

}

function GetHelpDeductions(name)
{
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370?SCREEN=8";
	fieldName=name;
	CenterWindow(page,600,350,3);
}

function AddConcepts() {
	var dataT = document.all["dataTable"];
	for(var n=0;n<dataT.rows.length;n++) {
		dataT.rows[n].style.display="";
	}
	
}

function ShowHelpCode(cboName, divName) {

	var v = document.forms[0][cboName][document.forms[0][cboName].selectedIndex].value;
	if (v == '3') {
		document.all[divName].style.display = "";
	} else {
		document.all[divName].style.display = "none";
	}
	
}

</SCRIPT>
</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0155" >
  <p> 
    <input TYPE=HIDDEN name="SCREEN" value="3">
    <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="0002">
    
  </p>

  <h3 align="center">Payment Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_crn_pay_det.jsp , EDL0155"> 
  </h3>
  <hr size="4">

<h4></h4>
  <%
   int row = Integer.parseInt(request.getParameter("Row"));
   list.setCurrentRow(row);   
 %> 
 <input TYPE=HIDDEN name="E02DLPACC" value="<%=list.getRecord(133)%>">
    
  <input TYPE=HIDDEN name="E02SEQU01" value="<%=list.getRecord(113)%>">
  <input TYPE=HIDDEN name="E02SEQU02" value="<%=list.getRecord(114)%>">
  <input TYPE=HIDDEN name="E02SEQU03" value="<%=list.getRecord(115)%>">
  <input TYPE=HIDDEN name="E02SEQU04" value="<%=list.getRecord(116)%>">
  <input TYPE=HIDDEN name="E02SEQU05" value="<%=list.getRecord(117)%>">
  <input TYPE=HIDDEN name="E02SEQU06" value="<%=list.getRecord(118)%>">
  <input TYPE=HIDDEN name="E02SEQU07" value="<%=list.getRecord(119)%>">
  <input TYPE=HIDDEN name="E02SEQU08" value="<%=list.getRecord(120)%>">
  <input TYPE=HIDDEN name="E02SEQU09" value="<%=list.getRecord(121)%>">
  <input TYPE=HIDDEN name="E02SEQU10" value="<%=list.getRecord(122)%>">
  <input TYPE=HIDDEN name="E02SEQU11" value="<%=list.getRecord(123)%>">
  <input TYPE=HIDDEN name="E02SEQU12" value="<%=list.getRecord(124)%>">
  <input TYPE=HIDDEN name="E02SEQU13" value="<%=list.getRecord(125)%>">
  <input TYPE=HIDDEN name="E02SEQU14" value="<%=list.getRecord(126)%>">
  <input TYPE=HIDDEN name="E02SEQU15" value="<%=list.getRecord(127)%>">
  <input TYPE=HIDDEN name="E02SEQU16" value="<%=list.getRecord(128)%>">
  <input TYPE=HIDDEN name="E02SEQU17" value="<%=list.getRecord(129)%>">
  <input TYPE=HIDDEN name="E02SEQU18" value="<%=list.getRecord(130)%>">
  <input TYPE=HIDDEN name="E02SEQU19" value="<%=list.getRecord(131)%>">
  <input TYPE=HIDDEN name="E02SEQU20" value="<%=list.getRecord(132)%>">
  
  <input TYPE=HIDDEN name="ROW" value="<%=row%>">
 
  
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" height="23" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="17%" height="23" > 
              <div align="right"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="23%" height="23" > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="35%" height="23" > 
              <div align="right"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="35%" > 
              <div align="right"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" height="18" > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="17%" height="18" > 
              <div align="right"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="23%" height="18" > 
              <div align="right">Calculation Type :</div>
            </td>
            <td nowrap width="35%" height="18" > 
              <div align="right"><%= userPO.getHeader15().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="21%"  >Payment Number : <%= list.getRecord(0) %></td>
            <td nowrap width="4%"  >&nbsp;</td>
            <td nowrap width="15%"  > 
              <div align="left">Pay Date : </div>
            </td>
            <td nowrap width="30%"  > 
            	<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPPD1" value="<%=list.getRecord(137)%>" >
 				<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPPD2" value="<%=list.getRecord(138)%>" >
 				<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPPD3" value="<%=list.getRecord(139)%>" >
			</td>
            <td nowrap width="30%"  > 
              <div align="left">Date Paid :</div>
              
            </td>
            <td nowrap width="30%"  > 
            	<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPDT1" value="<%=list.getRecord(134)%>" onKeyPress="enterInteger()">
 				<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPDT2" value="<%=list.getRecord(135)%>" onKeyPress="enterInteger()">
 				<input TYPE="TEXT" size="3" maxlength="2" name="E02DLPDT3" value="<%=list.getRecord(136)%>" onKeyPress="enterInteger()">
			</td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>

  <table id="dataTable" class="tableinfo" >
    <tr id="trdark"> 
      <th align=CENTER nowrap   >Type</th>
      <th align=CENTER nowrap colspan="2"  >Code</th>
      <th align=CENTER nowrap   >Description</th>
      <th align=CENTER nowrap   >Pay Amount</th>
      <th align=CENTER nowrap   >Amount Paid</th>
    </tr>
    
    <tr <% if (list.getRecord(31).equals("0.00")){%> style="display:none" <%}%>> 
      
      <% if (!(list.getRecord(73).equals("P") || list.getRecord(73).equals("I") || list.getRecord(73).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE01" onChange="javascript:ShowHelpCode('E02TYPE01','HLPCODE1')">
            <option value=" " <% if (!(list.getRecord(73).equals("1") ||list.getRecord(73).equals("2")||list.getRecord(73).equals("3")||list.getRecord(73).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(73).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(73).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(73).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(73).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE01" size="4" maxlength="3" value="<%= list.getRecord(93) %>" >
      	</td> 
      	 <td><div align="left" id="HLPCODE1" <% if (!list.getRecord(73).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE01')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
			</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE01" value="<%=list.getRecord(73)%>">
        </td>
        <td align=left  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE01" value="<%=list.getRecord(93)%>">
        </td>    
      <%}%>
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC01" size="21" maxlength="20" value="<%= list.getRecord(11) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT01" size="17" maxlength="16" value="<%= list.getRecord(31) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID01" size="17" maxlength="16" value="<%= list.getRecord(51) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(32).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(74).equals("P") || list.getRecord(74).equals("I") || list.getRecord(74).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE02" onChange="javascript:ShowHelpCode('E02TYPE02','HLPCODE2')">
            <option value=" " <% if (!(list.getRecord(74).equals("1") ||list.getRecord(74).equals("2")||list.getRecord(74).equals("3")||list.getRecord(74).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(74).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(74).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(74).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(74).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE02" size="4" maxlength="3" value="<%= list.getRecord(94) %>" >
      	</td>
      	  <td><div align="left" id="HLPCODE2" <% if (!list.getRecord(74).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE02')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE02" value="<%=list.getRecord(74)%>">
        </td>
        <td align="left"  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE02" value="<%=list.getRecord(94)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC02" size="21" maxlength="20" value="<%= list.getRecord(12) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT02" size="17" maxlength="16" value="<%= list.getRecord(32) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID02" size="17" maxlength="16" value="<%= list.getRecord(52) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(33).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(75).equals("P") || list.getRecord(75).equals("I") || list.getRecord(75).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE03" onChange="javascript:ShowHelpCode('E02TYPE03','HLPCODE3')">
            <option value=" " <% if (!(list.getRecord(75).equals("1") ||list.getRecord(75).equals("2")||list.getRecord(75).equals("3")||list.getRecord(75).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(75).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(75).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(75).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(75).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE03" size="4" maxlength="3" value="<%= list.getRecord(95) %>" >
      	</td>
      	  <td><div align="left" id="HLPCODE3" <% if (!list.getRecord(75).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
			</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE03" value="<%=list.getRecord(75)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE03" value="<%=list.getRecord(95)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap width="201%"   >
      	<input type="text" name="E02DESC03" size="21" maxlength="20" value="<%= list.getRecord(13) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT03" size="17" maxlength="16" value="<%= list.getRecord(33) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID03" size="17" maxlength="16" value="<%= list.getRecord(53) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(34).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(76).equals("P") || list.getRecord(76).equals("I") || list.getRecord(76).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE04" onChange="javascript:ShowHelpCode('E02TYPE04','HLPCODE4')">
            <option value=" " <% if (!(list.getRecord(76).equals("1") ||list.getRecord(76).equals("2")||list.getRecord(76).equals("3")||list.getRecord(76).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(76).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(76).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(76).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(76).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE04" size="4" maxlength="3" value="<%= list.getRecord(96) %>" >
      	</td>
      	  <td><div id="HLPCODE4" <% if (!list.getRecord(76).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE04')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE04" value="<%=list.getRecord(76)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE04" value="<%=list.getRecord(96)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC04" size="21" maxlength="20" value="<%= list.getRecord(14) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT04" size="17" maxlength="16" value="<%= list.getRecord(34) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID04" size="17" maxlength="16" value="<%= list.getRecord(54) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(35).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(77).equals("P") || list.getRecord(77).equals("I") || list.getRecord(77).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE05" onChange="javascript:ShowHelpCode('E02TYPE05','HLPCODE5')">
            <option value=" " <% if (!(list.getRecord(77).equals("1") ||list.getRecord(77).equals("2")||list.getRecord(77).equals("3")||list.getRecord(77).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(77).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(77).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(77).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(77).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE05" size="4" maxlength="3" value="<%= list.getRecord(97) %>" >
      	</td>
      	  <td><div id="HLPCODE5" <% if (!list.getRecord(77).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE05')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE05" value="<%=list.getRecord(77)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE05" value="<%=list.getRecord(97)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC05" size="21" maxlength="20" value="<%= list.getRecord(15) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT05" size="17" maxlength="16" value="<%= list.getRecord(35) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID05" size="17" maxlength="16" value="<%= list.getRecord(55) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(36).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(78).equals("P") || list.getRecord(78).equals("I") || list.getRecord(78).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE06" onChange="javascript:ShowHelpCode('E02TYPE06','HLPCODE6')">
            <option value=" " <% if (!(list.getRecord(78).equals("1") ||list.getRecord(78).equals("2")||list.getRecord(78).equals("3")||list.getRecord(78).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(78).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(78).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(78).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(78).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE06" size="4" maxlength="3" value="<%= list.getRecord(98) %>" >
      	</td>
      	  <td><div id="HLPCODE6" <% if (!list.getRecord(78).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE06')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE06" value="<%=list.getRecord(78)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE06" value="<%=list.getRecord(98)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC06" size="21" maxlength="20" value="<%= list.getRecord(16) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT06" size="17" maxlength="16" value="<%= list.getRecord(36) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID06" size="17" maxlength="16" value="<%= list.getRecord(56) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(37).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(79).equals("P") || list.getRecord(79).equals("I") || list.getRecord(79).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE07" onChange="javascript:ShowHelpCode('E02TYPE07','HLPCODE7')">
            <option value=" " <% if (!(list.getRecord(79).equals("1") ||list.getRecord(79).equals("2")||list.getRecord(79).equals("3")||list.getRecord(79).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(79).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(79).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(79).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(79).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE07" size="4" maxlength="3" value="<%= list.getRecord(99) %>" >
      	</td>
      	  <td><div id="HLPCODE7" <% if (!list.getRecord(79).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE07')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE07" value="<%=list.getRecord(79)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE07" value="<%=list.getRecord(99)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC07" size="21" maxlength="20" value="<%= list.getRecord(17) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT07" size="17" maxlength="16" value="<%= list.getRecord(37) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID07" size="17" maxlength="16" value="<%= list.getRecord(57) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(38).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(80).equals("P") || list.getRecord(80).equals("I") || list.getRecord(80).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE08" onChange="javascript:ShowHelpCode('E02TYPE08','HLPCODE8')">
            <option value=" " <% if (!(list.getRecord(80).equals("1") ||list.getRecord(80).equals("2")||list.getRecord(80).equals("3")||list.getRecord(80).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(80).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(80).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(80).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(80).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE08" size="4" maxlength="3" value="<%= list.getRecord(100) %>" >
      	</td>
      	  <td><div id="HLPCODE8" <% if (!list.getRecord(80).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE08')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE08" value="<%=list.getRecord(80)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE08" value="<%=list.getRecord(100)%>">
        </td>    
      <%}%>    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC08" size="21" maxlength="20" value="<%= list.getRecord(18) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT08" size="17" maxlength="16" value="<%= list.getRecord(38) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID08" size="17" maxlength="16" value="<%= list.getRecord(58) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
  
    <tr <% if (list.getRecord(39).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(81).equals("P") || list.getRecord(81).equals("I") || list.getRecord(81).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE09" onChange="javascript:ShowHelpCode('E02TYPE09','HLPCODE9')">
            <option value=" " <% if (!(list.getRecord(81).equals("1") ||list.getRecord(81).equals("2")||list.getRecord(81).equals("3")||list.getRecord(81).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(81).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(81).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(81).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(81).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE09" size="4" maxlength="3" value="<%= list.getRecord(101) %>" >
      	</td>
      	  <td><div id="HLPCODE9" <% if (!list.getRecord(81).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE09" value="<%=list.getRecord(81)%>">
        </td>
        <td align=CENTER  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE09" value="<%=list.getRecord(101)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC09" size="21" maxlength="20" value="<%= list.getRecord(19) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT09" size="17" maxlength="16" value="<%= list.getRecord(39) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID09" size="17" maxlength="16" value="<%= list.getRecord(59) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(40).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(82).equals("P") || list.getRecord(82).equals("I") || list.getRecord(82).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE10" onChange="javascript:ShowHelpCode('E02TYPE10','HLPCODE10')">
            <option value=" " <% if (!(list.getRecord(82).equals("1") ||list.getRecord(82).equals("2")||list.getRecord(82).equals("3")||list.getRecord(82).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(82).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(82).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(82).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(82).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE10" size="4" maxlength="3" value="<%= list.getRecord(102) %>" >
      	 </td>
      	  <td><div id="HLPCODE10" <% if (!list.getRecord(82).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE10')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE10" value="<%=list.getRecord(82)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE10" value="<%=list.getRecord(102)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC10" size="21" maxlength="20" value="<%= list.getRecord(20) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT10" size="17" maxlength="16" value="<%= list.getRecord(40) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID10" size="17" maxlength="16" value="<%= list.getRecord(60) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(41).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(83).equals("P") || list.getRecord(83).equals("I") || list.getRecord(83).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE11" onChange="javascript:ShowHelpCode('E02TYPE11','HLPCODE11')">
            <option value=" " <% if (!(list.getRecord(83).equals("1") ||list.getRecord(83).equals("2")||list.getRecord(83).equals("3")||list.getRecord(83).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(83).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(83).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(83).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(83).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE11" size="4" maxlength="3" value="<%= list.getRecord(103) %>" >
      	 </td>
      	  <td><div id="HLPCODE11" <% if (!list.getRecord(83).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE11')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE11" value="<%=list.getRecord(83)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE11" value="<%=list.getRecord(103)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC11" size="21" maxlength="20" value="<%= list.getRecord(21) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT11" size="17" maxlength="16" value="<%= list.getRecord(41) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID11" size="17" maxlength="16" value="<%= list.getRecord(61) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(42).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(84).equals("P") || list.getRecord(84).equals("I") || list.getRecord(84).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE12" onChange="javascript:ShowHelpCode('E02TYPE12','HLPCODE12')">
            <option value=" " <% if (!(list.getRecord(84).equals("1") ||list.getRecord(84).equals("2")||list.getRecord(84).equals("3")||list.getRecord(84).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(84).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(84).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(84).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(84).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE12" size="4" maxlength="3" value="<%= list.getRecord(104) %>" >
      	</td>
      	  <td><div id="HLPCODE12" <% if (!list.getRecord(84).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE12" value="<%=list.getRecord(84)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE12" value="<%=list.getRecord(104)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC12" size="21" maxlength="20" value="<%= list.getRecord(22) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT12" size="17" maxlength="16" value="<%= list.getRecord(42) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID12" size="17" maxlength="16" value="<%= list.getRecord(62) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(43).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(85).equals("P") || list.getRecord(85).equals("I") || list.getRecord(85).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE13" onChange="javascript:ShowHelpCode('E02TYPE13','HLPCODE13')">
            <option value=" " <% if (!(list.getRecord(85).equals("1") ||list.getRecord(85).equals("2")||list.getRecord(85).equals("3")||list.getRecord(85).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(85).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(85).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(85).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(85).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE13" size="4" maxlength="3" value="<%= list.getRecord(105) %>" >
      	</td>
      	  <td><div id="HLPCODE13" <% if (!list.getRecord(85).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE13')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE13" value="<%=list.getRecord(85)%>">
        </td>
        <td align=CENTER  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE13" value="<%=list.getRecord(105)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC13" size="21" maxlength="20" value="<%= list.getRecord(23) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT13" size="17" maxlength="16" value="<%= list.getRecord(43) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID13" size="17" maxlength="16" value="<%= list.getRecord(63) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(44).equals("0.00")){%> style="display:none" <%}%>>
      <% if (!(list.getRecord(86).equals("P") || list.getRecord(86).equals("I") || list.getRecord(86).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE14" onChange="javascript:ShowHelpCode('E02TYPE14','HLPCODE14')">
            <option value=" " <% if (!(list.getRecord(86).equals("1") ||list.getRecord(86).equals("2")||list.getRecord(86).equals("3")||list.getRecord(86).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(86).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(86).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(86).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(86).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE14" size="4" maxlength="3" value="<%= list.getRecord(106) %>" >
      	</td>
      	  <td><div id="HLPCODE14" <% if (!list.getRecord(86).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE14')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE14" value="<%=list.getRecord(86)%>">
        </td>
        <td align=CENTER  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE14" value="<%=list.getRecord(106)%>">
        </td>    
      <%}%>       
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC14" size="21" maxlength="20" value="<%= list.getRecord(24) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT14" size="17" maxlength="16" value="<%= list.getRecord(44) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID14" size="17" maxlength="16" value="<%= list.getRecord(64) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(45).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(87).equals("P") || list.getRecord(87).equals("I") || list.getRecord(87).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE15" onChange="javascript:ShowHelpCode('E02TYPE15','HLPCODE15')">
            <option value=" " <% if (!(list.getRecord(87).equals("1") ||list.getRecord(87).equals("2")||list.getRecord(87).equals("3")||list.getRecord(87).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(87).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(87).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(87).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(87).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE15" size="4" maxlength="3" value="<%= list.getRecord(107) %>" >
      	</td>
      	  <td><div id="HLPCODE15" <% if (!list.getRecord(87).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	 	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE15" value="<%=list.getRecord(87)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE15" value="<%=list.getRecord(107)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC15" size="21" maxlength="20" value="<%= list.getRecord(25) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT15" size="17" maxlength="16" value="<%= list.getRecord(45) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID15" size="17" maxlength="16" value="<%= list.getRecord(65) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(46).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(88).equals("P") || list.getRecord(88).equals("I") || list.getRecord(88).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE16" onChange="javascript:ShowHelpCode('E02TYPE16','HLPCODE16')">
            <option value=" " <% if (!(list.getRecord(88).equals("1") ||list.getRecord(88).equals("2")||list.getRecord(88).equals("3")||list.getRecord(88).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(88).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(88).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(88).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(88).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE16" size="4" maxlength="3" value="<%= list.getRecord(108) %>" >
      	</td>
      	  <td><div id="HLPCODE16" <% if (!list.getRecord(88).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE16')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE16" value="<%=list.getRecord(88)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE16" value="<%=list.getRecord(108)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC16" size="21" maxlength="20" value="<%= list.getRecord(26) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT16" size="17" maxlength="16" value="<%= list.getRecord(46) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID16" size="17" maxlength="16" value="<%= list.getRecord(66) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(47).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(89).equals("P") || list.getRecord(89).equals("I") || list.getRecord(89).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE17" onChange="javascript:ShowHelpCode('E02TYPE17','HLPCODE17')">
            <option value=" " <% if (!(list.getRecord(89).equals("1") ||list.getRecord(89).equals("2")||list.getRecord(89).equals("3")||list.getRecord(89).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(89).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(89).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(89).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(89).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE17" size="4" maxlength="3" value="<%= list.getRecord(109) %>" >
      	</td>
      	  <td><div id="HLPCODE17" <% if (!list.getRecord(89).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE17')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
         </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE17" value="<%=list.getRecord(89)%>">
        </td>
        <td align=CENTER  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE17" value="<%=list.getRecord(109)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC17" size="21" maxlength="20" value="<%= list.getRecord(27) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT17" size="17" maxlength="16" value="<%= list.getRecord(47) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID17" size="17" maxlength="16" value="<%= list.getRecord(67) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(48).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(90).equals("P") || list.getRecord(90).equals("I") || list.getRecord(90).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE18" onChange="javascript:ShowHelpCode('E02TYPE18','HLPCODE18')">
            <option value=" " <% if (!(list.getRecord(90).equals("1") ||list.getRecord(90).equals("2")||list.getRecord(90).equals("3")||list.getRecord(90).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(90).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(90).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(90).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(90).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE18" size="4" maxlength="3" value="<%= list.getRecord(110) %>" >
      	</td>
      	  <td><div id="HLPCODE18" <% if (!list.getRecord(90).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE18')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE18" value="<%=list.getRecord(90)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE18" value="<%=list.getRecord(110)%>">
        </td>    
      <%}%>      
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC18" size="21" maxlength="20" value="<%= list.getRecord(28) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT18" size="17" maxlength="16" value="<%= list.getRecord(48) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID18" size="17" maxlength="16" value="<%= list.getRecord(68) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

    <tr <% if (list.getRecord(49).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(91).equals("P") || list.getRecord(91).equals("I") || list.getRecord(91).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE19" onChange="javascript:ShowHelpCode('E02TYPE19','HLPCODE19')">
            <option value=" " <% if (!(list.getRecord(91).equals("1") ||list.getRecord(91).equals("2")||list.getRecord(91).equals("3")||list.getRecord(91).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(91).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(91).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(91).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(91).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE19" size="4" maxlength="3" value="<%= list.getRecord(111) %>" >
      	</td>
      	  <td><div id="HLPCODE19" <% if (!list.getRecord(91).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE19')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE19" value="<%=list.getRecord(91)%>">
        </td>
        <td align=CENTER  nowrap  colspan="2"   >
          <input TYPE=HIDDEN name="E02CODE19" value="<%=list.getRecord(111)%>">
        </td>    
      <%}%>      
    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC19" size="21" maxlength="20" value="<%= list.getRecord(29) %>" >
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT19" size="17" maxlength="16" value="<%= list.getRecord(49) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID19" size="17" maxlength="16" value="<%= list.getRecord(69) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>
 
    <tr <% if (list.getRecord(50).equals("0.00")){%> style="display:none" <%}%>> 
      <% if (!(list.getRecord(92).equals("P") || list.getRecord(92).equals("I") || list.getRecord(92).equals("L"))) {%>
        <td align=CENTER  nowrap     >
          <select name="E02TYPE20" onChange="javascript:ShowHelpCode('E02TYPE20','HLPCODE20')">
            <option value=" " <% if (!(list.getRecord(92).equals("1") ||list.getRecord(92).equals("2")||list.getRecord(92).equals("3")||list.getRecord(92).equals("4"))) out.print("selected"); %>></option>
            <option value="1" <% if(list.getRecord(92).equals("1")) out.print("selected");%>>Commissions</option>
            <option value="2" <% if(list.getRecord(92).equals("2")) out.print("selected");%>>Taxes</option>
            <option value="3" <% if(list.getRecord(92).equals("3")) out.print("selected");%>>Escrow/Deductions</option>
            <option value="4" <% if(list.getRecord(92).equals("4")) out.print("selected");%>>Sales Tax</option>
          </select>   
        </td>
        <td align="left"  nowrap     >
      	  <input type="text" name="E02CODE20" size="4" maxlength="3" value="<%= list.getRecord(112) %>" >
      	</td>
      	  <td><div id="HLPCODE20" <% if (!list.getRecord(92).equals("3")) {%> style="display:none" <%}%>>
      	  	<a href="javascript:GetHelpDeductions('E02CODE20')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
      	  	</div>
        </td>    
      <%} else {%>	
        <td align=CENTER  nowrap     >
          <input TYPE=HIDDEN name="E02TYPE20" value="<%=list.getRecord(92)%>">
        </td>
        <td align=CENTER  nowrap   colspan="2"  >
          <input TYPE=HIDDEN name="E02CODE20" value="<%=list.getRecord(112)%>">
        </td>    
      <%}%>      
    
      <td align=CENTER  nowrap     >
      	<input type="text" name="E02DESC20" size="21" maxlength="20" value="<%= list.getRecord(30) %>" y>
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02AMNT20" size="17" maxlength="16" value="<%= list.getRecord(50) %>" onKeyPress="enterDecimal()">
      </td>
      <td align=CENTER  nowrap     > 
        <input type="text" name="E02PAID20" size="17" maxlength="16" value="<%= list.getRecord(70) %>" onKeyPress="enterDecimal()">
      </td>
    </tr>

  </table>

  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="3%" height="18" >&nbsp;</td>
            <td nowrap width="37%" height="18" >Pay Amount : <input type="text" name="E02TOAMNT" size="17" maxlength="16" value="<%= list.getRecord(71) %>" readonly></td>
            <td nowrap width="4%" height="18" >&nbsp;</td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Amount Paid :<input type="text" name="E02TOPAID" size="17" maxlength="16" value="<%= list.getRecord(72) %>" readonly></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
       		<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction('0002');">
  	  </td>     
      <td width="33%" align="center"> 
       		<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction('0004');">
	  </td> 
      <td width="34%" align="center"> 
       		<input id="EIBSBTN" type=button name="Add" value="Add Charges" onClick="AddConcepts();">
	  </td>  	   	  
    </tr>    
  </table>  
  </FORM>

</BODY>
</HTML>
