<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Interest Calculator</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcLoans" class= "datapro.eibs.beans.EDL088002Message"  scope="session"/>
<jsp:useBean id= "resultList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


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
    
 
%> 
<div align="center"></div>
<h3 align="center"> Yield/Market Price Analysis<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_yield_cal.jsp, EDL0880"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0880" >
  <input type=HIDDEN name="SCREEN" value="4">
  <input type=HIDDEN name="totalRow" value="0">
  <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Face Value :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02FACVAL" size="15" maxlength="13" value="<%= calcLoans.getE02FACVAL().trim()%>"  >
            </td>
            <td nowrap > 
              <div align="right"> Anual Coupon Payments :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02COUPON" size="15" maxlength="13" value="<%= calcLoans.getE02COUPON().trim()%>"  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Price :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02PRICE" size="15" maxlength="13" value="<%= calcLoans.getE02PRICE().trim()%>"  >
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Initial Yield % :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02INIYLD" size="15" maxlength="13" value="<%= calcLoans.getE02INIYLD().trim()%>"  >
            </td>
            <td nowrap > 
              <div align="right"> End Yield % :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02ENDYLD" size="15" maxlength="13" value="<%= calcLoans.getE02ENDYLD().trim()%>"  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Increment :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02INCDV1" size="2" maxlength="1" value="<%= calcLoans.getE02INCDV1().trim()%>"  >
              <input type="text" name="E02INCDV2" size="2" maxlength="2" value="<%= calcLoans.getE02INCDV2().trim()%>"  >
              <input type="text" name="E02INCDEC" size="10" maxlength="8" value="<%= calcLoans.getE02INCDEC().trim()%>"  readonly>
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Coupon Periods/Year :</div>
            </td>
            <td nowrap >
              <select name="E02PER12">
                <option value=" " <% if (!(calcLoans.getE02PER12().equals("1") ||calcLoans.getE02PER12().equals("2"))) out.print("selected"); %>></option>
                <option value="1" <% if(calcLoans.getE02PER12().equals("1")) out.print("selected");%>>Annual</option>
                <option value="2" <% if(calcLoans.getE02PER12().equals("2")) out.print("selected");%>>Semiannual</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Days Count Convention :</div>
            </td>
            <td nowrap >
              <select name="E02CON16">
                <option value=" " <% if (!(calcLoans.getE02CON16().equals("1") ||calcLoans.getE02CON16().equals("2")||calcLoans.getE02CON16().equals("3")||calcLoans.getE02CON16().equals("4")||calcLoans.getE02CON16().equals("5")||calcLoans.getE02CON16().equals("6"))) out.print("selected"); %>></option>
                <option value="1" <% if(calcLoans.getE02CON16().equals("1")) out.print("selected");%>>Actual/Actual (In Period)</option>
                <option value="2" <% if(calcLoans.getE02CON16().equals("2")) out.print("selected");%>>Actual/365</option>
                <option value="3" <% if(calcLoans.getE02CON16().equals("3")) out.print("selected");%>>Actual/365 (366 in Leap Year)</option>
                <option value="4" <% if(calcLoans.getE02CON16().equals("4")) out.print("selected");%>>Actual/360</option>
                <option value="5" <% if(calcLoans.getE02CON16().equals("5")) out.print("selected");%>>30/360</option>
                <option value="6" <% if(calcLoans.getE02CON16().equals("6")) out.print("selected");%>>30E/360</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Settlement Date :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E02SETDT1" size="2" maxlength="2" value="<%= calcLoans.getE02SETDT1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02SETDT2" size="2" maxlength="2" value="<%= calcLoans.getE02SETDT2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02SETDT3" size="2" maxlength="2" value="<%= calcLoans.getE02SETDT3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02SETDT1,document.forms[0].E02SETDT2,document.forms[0].E02SETDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap   > 
              <div align="right"> Next Coupon Payment :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E02NEXDT1" size="2" maxlength="2" value="<%= calcLoans.getE02NEXDT1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02NEXDT2" size="2" maxlength="2" value="<%= calcLoans.getE02NEXDT2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02NEXDT3" size="2" maxlength="2" value="<%= calcLoans.getE02NEXDT3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02NEXDT1,document.forms[0].E02NEXDT2,document.forms[0].E02NEXDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap   > 
              <div align="right"> Last Coupon Payment :</div>
            </td>
            <td nowrap   > 
              <input type="text" name="E02LSTDT1" size="2" maxlength="2" value="<%= calcLoans.getE02LSTDT1().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02LSTDT2" size="2" maxlength="2" value="<%= calcLoans.getE02LSTDT2().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E02LSTDT3" size="2" maxlength="2" value="<%= calcLoans.getE02LSTDT3().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02LSTDT1,document.forms[0].E02LSTDT2,document.forms[0].E02LSTDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Days Between Payments :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DYSCOU" size="5" maxlength="4" value="<%= calcLoans.getE02DYSCOU().trim()%>"  >
            </td>
            <td nowrap > 
              <div align="right"> Number of Coupons :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02NUMCOU" size="5" maxlength="4" value="<%= calcLoans.getE02NUMCOU().trim()%>"  >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <br>
  <%if (!resultList.getNoResult()) {%>
  <h4>Result</h4>
  <table class="tableinfo" id="mainTable" >
    <tr> 
      <td nowrap> 
  		<table id="headTable">
  			<tr id="trdark"> 
		      <th align="center" nowrap>Yield</th>
		      <th align="center" nowrap>Price</th>
		      <th align="center" nowrap>Quote</th>
    		</tr>
    	</table>
		<div id="dataDiv1" class="scbarcolor" style="padding:0">
	    <table id="dataTable">
    	<%
            resultList.initRow();
            int k=1;
            while (resultList.getNextRow()) {
                if (resultList.getFlag().equals("")) {
                		out.println(resultList.getRecord());
                k++;
                }        
            }
             
      	%>
   		</table>
   		</div>
      </td> 
    </tr> 
  </table>
  <br>
  
  <SCRIPT Language="Javascript">
	document.forms[0].totalRow.value="<%= k %>";

	function resizeDoc() {
		divResize(false);
		adjustEquTables(headTable, dataTable, dataDiv1, 0, false);
	}
	resizeDoc();
	window.onresize=resizeDoc;
  </SCRIPT>
  <%}%>
  
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

  </form>
</body>
</html>
