<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate Customer Basic Information</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008002Message" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/jquery.jsp"> </SCRIPT>
<script language="javascript">
function showInqOFAC(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }
</script>

<%
 if ( !userPO.getPurpose().equals("NEW") ) {
%>

   <SCRIPT Language="Javascript">
		<% if (client.getH02WK3().equals("1") || client.getH02WK3().equals("2")){ %>
	      builtNewMenu(client_corp_opt_Enc);
	    <%}%>
	    <% if (!(client.getH02WK3().equals("1") || client.getH02WK3().equals("2"))){ %>
		  builtNewMenu(client_corp_opt);
		  <%}%>

	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
	   }

 		function checkYearFormat(s,lng){
			if (!isYearFormat(s,lng)) {
				alert("Year must be 4 digits long");
				event.srcElement.focus();
			}
		}

   </SCRIPT>

<%
}
%>

</head>

<body bgcolor="#FFFFFF">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
 %>


<h3 align="center">Corporate Customer Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_corp_basic, ESD0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <INPUT TYPE=HIDDEN NAME="H02WK3" VALUE="<%=client.getH02WK3().trim()%>">
  
	<%int row = 1; %>
  <h4>Articles of Incorporation</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%" >
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="23%" >
              <input type="hidden" name="E02CUN" size="10" maxlength="9" value="<%= client.getE02CUN()%>">
              <%= client.getE02CUN()%>
              <%if (client.getH02MAS().equals("Y")) {%>
			  <a href="javascript:showInqOFAC('<%= client.getE02CUN().trim()%>')"><img src="<%=request.getContextPath()%>/images/warning_16.jpg" alt="OFAC Match List" align="absmiddle" border="0"></a>
			  <%}%>
            </td>
            <td width="38%">&nbsp; </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%>  name="E02NA1" size="55" maxlength="45" value="<%= client.getE02NA1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Brand Name :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02CP1" size="40" maxlength="30" value="<%= client.getE02CP1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <p align="right">Short Name : </p>
            </td>
            <td nowrap colspan="2">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02SHN" size="20" maxlength="15" value="<%= client.getE02SHN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Web Page : </div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   name="E02FN2" size="40" maxlength="30" value="<%= client.getE02FN2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%" align="right">Contact Name:</td>
            <td nowrap colspan="2">
              <div align="left">
                <input type="text"  name="E02LN1" size="40" maxlength="30" value="<%= client.getE02LN1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Date of Incorporation :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02BDM" size="2" maxlength="2" value="<%= client.getE02BDM().trim()%>" onKeyPress="enterInteger()">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02BDD" size="2" maxlength="2" value="<%= client.getE02BDD().trim()%>" onKeyPress="enterInteger()">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02BDY" size="4" maxlength="4" value="<%= client.getE02BDY().trim()%>" onKeyPress="enterInteger()" onChange="checkYearFormat(this.value,'4')">
            	<a href="javascript:DOBPicker(document.forms[0].E02BDM,document.forms[0].E02BDD,document.forms[0].E02BDY)">
            	<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Country of Incorporation :</div>
            </td>
            <td nowrap width="18%" colspan="2">
              <input type="text" name="E02GEC" size="5" maxlength="3" value="<%= client.getE02GEC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02GEC','03')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
             </td>
             </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Address</h4>


  <table class="tableinfo">
      <tr >
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">

              <div align="right">Title/Address :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02NA2" size="45" maxlength="35" value="<%= client.getE02NA2().trim()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" > </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
                <div align="right">Address :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02NA3" size="45" maxlength="35" value="<%= client.getE02NA3().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
                <div align="right">Address :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02NA4" size="45" maxlength="35" value="<%= client.getE02NA4().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">

              <div align="right">City :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02CTY" size="45" maxlength="30" value="<%= client.getE02CTY().trim()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
              <div align="right">State :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02STE" size="5" maxlength="4" value="<%= client.getE02STE().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Country :</div>
            </td>
            <td nowrap  width="61%">
              	<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02UC5" size="5" maxlength="3" value="<%= client.getE02UC5().trim()%>">
                <input type="text" readonly name="E02CTR" size="21" maxlength="20" value="<%= client.getE02CTR().trim()%>">
				<a href="javascript:GetCodeDescCNOFC('E02UC5','E02CTR','03')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
              <div align="right">P.O.Box :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02POB" size="11" maxlength="10" value="<%= client.getE02POB().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
              <div align="right">Zip Code :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02ZPC" size="16" maxlength="15" value="<%= client.getE02ZPC().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
              <div align="right">Mailing Code :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02MLC" size="5" maxlength="4" value="<%= client.getE02MLC().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%">
              <div align="right">E-Mail :</div>
              </td>
              <td nowrap width="61%">
                <input type="text" name="E02IAD" size="41" maxlength="40" value="<%= client.getE02IAD().trim()%>"
                	<% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> style="text-transform: none">
                Denies Information<input type="checkbox" name="E02FLA" value="<%= client.getE02FLA().trim()%>" onClick="checkDel(this)" <%if (client.getE02FLA().equals("X")) out.print("checked"); %>>
                </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  <h4>Identification </h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="21%">
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap colspan="5">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02IDF" size="16" maxlength="9" value="<%= client.getE02IDF().trim()%>" onkeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="21%">
              <div align="right">ID Number :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02IDN" size="16" maxlength="15" value="<%= client.getE02IDN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="9%">
              <div align="right">Type :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02TID" size="5" maxlength="4" value="<%= client.getE02TID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="12%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="20%">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02PID" size="5" maxlength="4" value="<%= client.getE02PID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="21%">
              <div align="right">ID Issue Date :</div>
            </td>
            <td nowrap width="21%">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02I11" size="2" maxlength="2" value="<%= client.getE02I11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02I12" size="2" maxlength="2" value="<%= client.getE02I12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02I13" size="2" maxlength="2" value="<%= client.getE02I13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E02I11,document.forms[0].E02I12,document.forms[0].E02I13)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
 			</td>
            <td nowrap width="9%">
              <div align="right">ID Expiration Date :</div>
            </td>
            <td nowrap width="17%">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02E11" size="2" maxlength="2" value="<%= client.getE02E11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02E12" size="2" maxlength="2" value="<%= client.getE02E12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02E13" size="2" maxlength="2" value="<%= client.getE02E13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E02E11,document.forms[0].E02E12,document.forms[0].E02E13)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="12%">
              <div align="right">ID Issue State :</div>
            </td>
            <td nowrap width="20%">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02SI1" size="5" maxlength="4" value="<%= client.getE02SI1().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02SI1','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Telephone Numbers</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%">
				<div align="right">Call Back Number :</div>
              </td>
              <td nowrap width="30%">
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02PHN" size="12" maxlength="3" value="<%= client.getE02PHN().trim()%>" class="input_phone_area">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02HPN" size="12" maxlength="11" value="<%= client.getE02HPN().trim()%>" class="input_phone">
              </td>
              <td nowrap >

              <div align="right">Cellular :</div>
              </td>
              <td nowrap >
				<input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02FAX" size="12" maxlength="3" value="<%= client.getE02FAX().trim()%>" class="input_phone_area">
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02PH1" size="12" maxlength="11" value="<%= client.getE02PH1().trim()%>" class="input_phone" >
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap>
				<div align="right">Extension :</div>
              </td>
              <td nowrap>
                <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02BRN" size="6" maxlength="4" value="<%= client.getE02BRN().trim()%>" onkeypress="enterInteger()">
              </td>
               <td nowrap>
              </td>
              <td nowrap>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
  <h4>Dates</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right"></div>
            </td>
            <td nowrap width="3%">
              <div align="center"><font size="1">Month</font> </div>
            </td>
            <td nowrap width="2%">
              <div align="center">Day</div>
            </td>
            <td nowrap width="4%">
              <div align="center">Year</div>
            </td>
            <td nowrap width="52%">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">First Contact Date :</div>
            </td>
            <td nowrap colspan="4">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02IDM" size="2" maxlength="2" value="<%= client.getE02IDM().trim()%>" onkeypress="enterInteger()">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02IDD" size="2" maxlength="2" value="<%= client.getE02IDD().trim()%>" onkeypress="enterInteger()">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02IDY" size="2" maxlength="2" value="<%= client.getE02IDY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E02IDM,document.forms[0].E02IDD,document.forms[0].E02IDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4>Classification Codes</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Main Officer :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02OFC" size="5" maxlength="3" value="<%= client.getE02OFC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" >
            </td>
            <td nowrap width="29%">
              <div align="right">Substitute Officer :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E02OF2" size="5" maxlength="3" value="<%= client.getE02OF2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02OF2','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02INC" size="5" maxlength="3" value="<%= client.getE02INC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" ></td>
            <td nowrap width="29%">
              <div align="right">Business Line :</div>
            </td>
            <td nowrap width="31%">
              <input type="text" name="E02BUC" size="5" maxlength="3" value="<%= client.getE02BUC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E02UC1" size="5" maxlength="3" value="<%= client.getE02UC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></td>
	        <td nowrap width="22%">
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap width="18%">
              <input type="text" name="E02UC2" size="5" maxlength="3" value="<%= client.getE02UC2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC2','2B')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >              
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E02UC3" size="5" maxlength="3" value="<%= client.getE02UC3().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02UC3','2C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="22%">
              <div align="right">Politically Exposed Person :</div>
            </td>
            <td nowrap width="18%" >
              Yes<input type="radio" name="E02FG1"  value="Y" <%if(client.getE02FG1().trim().equals("Y"))out.print("checked"); %> >
              No<input type="radio" name="E02FG1"  value="N" <%if(!client.getE02FG1().trim().equals("Y"))out.print("checked"); %> >
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  <h4 align="left">Business Profile</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="22%">
              <div align="right">Number of Stocks :</div>
            </td>
            <td nowrap width="22%">
              <input type="text"   name="E02NST" size="8" maxlength="7" value="<%= client.getE02NST().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Years in Business :</div>
            </td>
            <td nowrap width="31%">
              <input type="text"   name="E02NSO" size="3" maxlength="2" value="<%= client.getE02NSO().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="22%">
              <div align="right">Initial Capital :</div>
            </td>
            <td nowrap width="22%">
              <input type="text"   name="E02CAI" size="16" maxlength="15" value="<%= client.getE02CAI().trim()%>">
            </td>
            <td nowrapwidth="25%">
              <div align="right">Number of Stock Holders :</div>
            </td>
            <td nowrap width="31%">
              <input type="text"   name="E02NSH" size="8" maxlength="7" value="<%= client.getE02NSH().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrapwidth="22%">
              <div align="right">Paid in Capital :</div>
            </td>
            <td nowrap  width="22%">
              <input type="text"   name="E02CAP" size="16" maxlength="15" value="<%= client.getE02CAP().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Stock Holders Equity :</div>
            </td>
            <td nowrap  width="31%">
              <input type="text"   name="E02CAS" size="16" maxlength="15" value="<%= client.getE02CAS().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Business Size :</div>
            </td>
            <td nowrap width="22%">
              <input type="text"  name="E02SEX" size="2" maxlength="1" value="<%= client.getE02SEX().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Sales Level :</div>
            </td>
            <td nowrap width="31%">
              <select name="E01INL">
                <option value=" " <% if (!(client.getE02INL().equals("1")||client.getE02INL().equals("2")||client.getE02INL().equals("3")||client.getE02INL().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <% if (client.getE02INL().equals("1")) out.print("selected"); %>>0 - 50.000</option>
                <option value="2" <% if (client.getE02INL().equals("2")) out.print("selected"); %>>50.000 - 100.000</option>
                <option value="3" <% if (client.getE02INL().equals("3")) out.print("selected"); %>>100.000 - 250.000</option>
                <option value="4" <% if (client.getE02INL().equals("4")) out.print("selected"); %>>Over 250.000</option>
              </select>

            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap n width="22%">
              <div align="right">Source of Wealth :</div>
            </td>
            <td nowrap  width="22%">
              <input type="text" name="E02SOI" size="5" maxlength="4" value="<%= client.getE02SOI().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02SOI','30')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>

            </td>
            <td nowrap width="25%">
              <div align="right">Business Area :</div>
            </td>
            <td nowrap  width="31%">
              <input type="text" name="E02FL3" size="2" maxlength="1" value="<%= client.getE02FL3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap n width="22%">
               <div align="right">Corporation Type :</div>
            </td>
            <td nowrap  width="22%">
               <select name="E02SPF">
				<option value=" " <%if (!(client.getE02SPF().equals("4") || client.getE02SPF().equals("5") || client.getE02SPF().equals("6")
				|| client.getE02SPF().equals("7") || client.getE02SPF().equals("8") || client.getE02SPF().equals("9")))	out.print("selected"); %>></option>
                <option value="4" <%if (client.getE02SPF().equals("4")) out.print("selected"); %>>Corporation - For Profit</option>
                <option value="5" <%if (client.getE02SPF().equals("5")) out.print("selected"); %>>Corporation - Nonprofit</option>
                <option value="6" <%if (client.getE02SPF().equals("6")) out.print("selected"); %>>Partnership</option>
                <option value="7" <%if (client.getE02SPF().equals("7")) out.print("selected"); %>>Sole Proprietorship</option>
                <option value="8" <%if (client.getE02SPF().equals("8")) out.print("selected"); %>>Limited Liability Company</option>
                <option value="9" <%if (client.getE02SPF().equals("9")) out.print("selected"); %>>Trust-Separate Agreement</option>
               </select>
             </td>
            <td nowrap width="25%">
            </td>
            <td nowrap  width="31%">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Operational Information</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Customer Status :</div>
            </td>
            <td nowrap width="41%">
              <select name="E02STS">
                <% boolean flag = false; %>
                <option value="1" <%if (client.getE02STS().equals("1")) { flag = true; out.print("selected"); }%>>Active</option>
                <option value="2" <%if (client.getE02STS().equals("2")) { flag = true; out.print("selected"); }%>>Inactive</option>
                <option value="3" <%if (client.getE02STS().equals("3")) { flag = true; out.print("selected"); }%>>Black
                List</option>
                <option value=" " <%if ( flag == false ) out.print("selected");  %>></option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="20%">
              <div align="right">Customer Class :</div>
            </td>

            <td nowrap width="16%">
              <select name="E02CCL">
                <option value=" " <% if (!(client.getE02CCL().equals("1")||client.getE02CCL().equals("2") ||client.getE02CCL().equals("3")||client.getE02CCL().equals("4") ||client.getE02CCL().equals("5")))  out.print("selected"); %>></option>
                <option value="1" <% if (client.getE02CCL().equals("1")) out.print("selected"); %>>Single Product</option>
                <option value="2" <% if (client.getE02CCL().equals("2")) out.print("selected"); %>>2 Products</option>
                <option value="3" <% if (client.getE02CCL().equals("3")) out.print("selected"); %>>3 Products</option>
                <option value="4" <% if (client.getE02CCL().equals("4")) out.print("selected"); %>>4 Products</option>
                <option value="5" <% if (client.getE02CCL().equals("5")) out.print("selected"); %>>5 Products or more</option>
              </select>
            </td>

          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Customer Type :</div>
            </td>
            <td nowrap width="41%" bordercolor="#FFFFFF">
              <input type="radio" name="E02TYP" value="R" <% if (!(client.getE02TYP().equals("M") || client.getE02TYP().equals("G"))) out.print("checked"); %>>
              Regular
              <input type="radio" name="E02TYP" value="M" <% if (client.getE02TYP().equals("M")) out.print("checked"); %>>
              Master
              <input type="radio" name="E02TYP" value="G" <% if (client.getE02TYP().equals("G")) out.print("checked"); %>>
              Group <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
            <td nowrap width="20%">
              <div align="right">Group Number :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E02GRP" size="10" maxlength="9" value="<%= client.getE02GRP().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Language :</div>
            </td>
            <td nowrap width="41%">
              <input type="radio" name="E02LIF" value="E"  <%if (!client.getE02LIF().equals("S")) out.print("checked"); %>>
              English
              <input type="radio" name="E02LIF" value="S"  <%if (client.getE02LIF().equals("S")) out.print("checked"); %>>
              Spanish <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
            <td nowrap width="22%">
              <div align="right">Withholding Table :</div>
            </td>
            <td nowrap width="41%" bordercolor="#FFFFFF">
              <input type="text" name="E02TAX" size="2" maxlength="1" value="<%= client.getE02TAX().trim()%>">
              <a href="javascript:GetCode('E02TAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="23%" >
              <div align="right">Subject  to Taxes in U.S. :</div>
              </td>

            <td nowrap width="36%" >
              <input type="radio" name="E02FG2" value="Y" <%if (client.getE02FG2().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E02FG2" value="N" <%if (client.getE02FG2().equals("N")) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>

            <td nowrap width="25%" >
              <div align="right"> Renewal/Volume :</div>
              </td>

            <td nowrap width="16%" >
            <SELECT name="E02RLV">
					<OPTION value=" "
						<% if (!(client.getE02RLV().equals("T")) || (client.getE02RLV().equals("1")) || (client.getE02RLV().equals("A")) || (client.getE02RLV().equals("N"))) out.print("selected"); %>></OPTION>
					<OPTION value="T"
						<% if (client.getE02RLV().equals("T")) out.print("selected"); %>>Total
					by Customer without Investments</OPTION>
					<OPTION value="1"
						<% if (client.getE02RLV().equals("1")) out.print("selected"); %>>Total
					by Customer with Investments</OPTION>
					<OPTION value="A"
						<% if (client.getE02RLV().equals("A")) out.print("selected"); %>>By
					Account</OPTION>
					<OPTION value="N"
						<% if (client.getE02RLV().equals("N")) out.print("selected"); %>>None</OPTION>
				</SELECT></td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="23%">
              <div align="right">Consolidated Stmt. Freq. :</div>
            </td>
            <td nowrap width="36%">
              <select name="E02SFR">
                <option value=" " <% if (!(client.getE02SFR().equals("M")||client.getE02SFR().equals("Q") ||client.getE02SFR().equals("S")))  out.print("selected"); %>></option>
                <option value="M" <% if (client.getE02SFR().equals("M")) out.print("selected"); %>>Monthly</option>
                <option value="Q" <% if (client.getE02SFR().equals("Q")) out.print("selected"); %>>Quarterly</option>
                <option value="S" <% if (client.getE02SFR().equals("S")) out.print("selected"); %>>Semiannually</option>
               </select>
            <td nowrap width="25%">
              <div align="right">Consolidated Stmt. Day :</div>
            </td>
            <td nowrap width="16%">
              <input type="text" name="E02SDY" size="2" maxlength="2" value="<%= client.getE02SDY().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="18%" >
              <div align="right">Inquiry Level :</div>
            </td>
            <td nowrap width="39%" >
              <input type="text" name="E02ILV" size="1" maxlength="1" value="<%= client.getE02ILV().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">OBD :</div>
            </td>
            <td nowrap width="16%">
				<input type="text" name="E02UC4" size="8" maxlength="5" value="<%=client.getE02UC4().trim() %>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Risk Level :</div>
            </td>
            <td nowrap width="18%" >
              <input type="text" name="E02RSL" size="5" maxlength="4" value="<%= client.getE02RSL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02RSL','31')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
            <td nowrap width="20%">
              <div align="right"><% if (!currUser.getH01WK3().equals("1")) out.print("Risk Rating Method :"); %></div>
            </td>
            <td nowrap width="17%">
              <% if (!currUser.getH01WK3().equals("1")) { %>
	              <input type="text" name="E02FL2" size="2" maxlength="1" value="<%= client.getE02FL2().trim()%>">
	              <a href="javascript:GetCode('E02FL2','STATIC_client_help_qualification_type.jsp')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a><img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
	          <% } %>
          </tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="23%">
               <div align="right"><% if (!currUser.getH01WK3().equals("1")) out.print("Loan Losses Table :"); %></div>
            </td>
            <td nowrap width="20%" colspan="3">
            <% if (!currUser.getH01WK3().equals("1")) { %>
               <input type="text" name="E02PRV" size="4" maxlength="2" value="<%= client.getE02PRV().trim()%>">
              <a href="javascript:GetPrevTable('E02PRV')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            <% } %>
            </td>
		</tr>
        </table>
        </td>
      </tr>
    </table>
    
  <h4>Additional Information</h4>
  <table class="tableinfo">
      <tr >
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap   width="20%">
              <div align="right">Referred By :</div>
            </td>
            <td nowrap  width="37%">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02RBY" size="5" maxlength="4" value="<%= client.getE02RBY().trim()%>">
              <input type="text" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02RBN" size="20" maxlength="15" value="<%= client.getE02RBN().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E02RBY','E02RBN','28')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap width="23%">
               <div align="right">Resident : </div>
            </td>
            <td nowrap width="20%">
               <input type="radio" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> disabled <%}%> name="E02FL1" value="1" <%if ( !client.getE02FL1().equals("2")) out.print("checked"); %>>
              Yes
              <input type="radio" <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> disabled <%}%> name="E02FL1" value="2" <%if (client.getE02FL1().equals("2")) out.print("checked"); %>>
              No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td align="right">
          	Agency's Manager e-mail :</td>
   			<td nowrap><input type="text"
					name="E02AME" size="60" maxlength="40"
					value="<%= client.getE02AME().trim()%>"></td>
            <td nowrap   width="17%">
              <div align="right">Extended Hold Reg.-CC :</div>
            </td>
            <td nowrap   width="26%">
              <input type="radio" name="E02FL4" value="Y"  <%if (client.getE02FL4().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E02FL4" value="N"  <%if (!(client.getE02FL4().equals("Y"))) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="18%" >
              <div align="right">Treasury Customer :</div>
            </td>
            <td nowrap width="39%" >
              <input type="radio" name="E02FL5" value="Y"  <%if (client.getE02FL5().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E02FL5" value="N"  <%if (client.getE02FL5().equals("N")) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="23%" >
              <div align="right">ATM Card Issued :</div>
            </td>
            <td nowrap width="20%" >
              <input type="radio" name="E02ATM" value="1"  <%if (client.getE02ATM().equals("1")) out.print("checked"); %>>
              Standard
              <input type="radio" name="E02ATM" value="2"  <%if (client.getE02ATM().equals("2")) out.print("checked"); %>>
              Platinum
              <input type="radio" name="E02ATM" value="N"  <%if (client.getE02ATM().equals("N")) out.print("checked"); %>>
              None
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="18%" >
              <div align="right">Customer denies to provide information :</div>
            </td>
            <td nowrap width="39%" colspan="3">
            	<input type="checkbox" name="E02FLB" value="<%= client.getE02FLB().trim()%>" onClick="checkDel(this)" <%if (client.getE02FLB().equals("X")) out.print("checked"); %>> Assets
             	<input type="checkbox" name="E02FLC" value="<%= client.getE02FLC().trim()%>" onClick="checkDel(this)" <%if (client.getE02FLC().equals("X")) out.print("checked"); %>> Liabilities
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
  <br>
	<% if (client.getH02MAS().equals("Y") || client.getH02MAS().equals("W")) {%>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	    <tr bgcolor="#FFFFFF">
	      <td width="33%">
	        <div align="center">
	          <input type="checkbox" name="H02WK2" value="Y" >
	          Accept with Warnings </div>
	      </td>
	    </tr>
	  </table>
	<% } %>
  <p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>

<script language="javascript">$($IBS_INPUT())</script>