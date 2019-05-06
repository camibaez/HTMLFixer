<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Personal Client</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="client" class="datapro.eibs.beans.ESD008001Message"  scope="session" />

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

 
function checkYearFormat(s,lng){
	if (!isYearFormat(s,lng)) {
		alert("Year must be 4 digits long");
		event.srcElement.focus();
	}
}
 
</script>

<%
 if ( !userPO.getPurpose().equals("NEW") ) {
%>

   <SCRIPT Language="Javascript">
   		<% if (client.getH01WK3().equals("1") || client.getH01WK3().equals("2")){ %>
      		builtNewMenu(client_personal_opt_Enc);
      	<%}%>

   		<% if (!(client.getH01WK3().equals("1") || client.getH01WK3().equals("2"))){ %>
      		builtNewMenu(client_personal_opt);
      	<%}%>

	   function checkDel(obj){
	     if (obj.checked) obj.value="X"; else obj.value="";
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

<h3 align="center">Individual Customer Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_personal_basic, ESD0080" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="H01WK3" VALUE="<%= client.getH01WK3().trim()%>">
  </p>
	<%int row = 1; %>
  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="17%">
              <input type="hidden" name="E01CUN" size="15" maxlength="10" value="<%= client.getE01CUN().trim()%>">
              <%= client.getE01CUN().trim()%>
              <%if (client.getH01MAS().equals("Y")) {%>
			  <a href="javascript:showInqOFAC('<%= client.getE01CUN().trim()%>')"><img src="<%=request.getContextPath()%>/images/warning_16.jpg" alt="OFAC Match List" align="absmiddle" border="0"></a>
              <%}%>
             </td>
             <td nowrap colspan="2">
             </td>
          </tr>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("short")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Customer Name :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01NA1" size="35" maxlength="45" value="<%= client.getE01NA1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
		<%}%>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">First Name :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01FNA" size="25" maxlength="20" value="<%= client.getE01FNA().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
		<%}%>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Middle Name :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01FN2" size="25" maxlength="20" value="<%= client.getE01FN2().trim()%>">

            </td>
          </tr>
		<%}%>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Last Name :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01LN1" size="35" maxlength="30" value="<%= client.getE01LN1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
		<%}%>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Short Name :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01SHN" size="25" maxlength="15" value="<%= client.getE01SHN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Gender :</div>
            </td>
            <td nowrap colspan="3">
              <input type="radio" <% if(client.getH01WK3().equals("Y")) { %> disabled  <%}%> name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %>>
              Female
              <input type="radio" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%> name="E01SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %>>
              Male
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Marital Status :</div>
            </td>
            <td nowrap>
              <select <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%>  name="E01MST">
                <option value=" " <% if (!(client.getE01MST().equals("1")||client.getE01MST().equals("2") || client.getE01MST().equals("3")||client.getE01MST().equals("4")||client.getE01MST().equals("5"))) out.print("selected"); %>>
                </option>
                <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Single</option>
                <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Married</option>
                <option value="3" <% if (client.getE01MST().equals("3")) out.print("selected"); %>>Divorced</option>
                <option value="4" <% if (client.getE01MST().equals("4")) out.print("selected"); %>>Widow</option>
                <option value="5" <% if (client.getE01MST().equals("5")) out.print("selected"); %>>Cohabit</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
      		<td nowrap width="10%">
              <div align="right">Dependents :</div>
            </td>
            <td nowrap>
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01NSO" size="4" maxlength="2" value="<%= client.getE01NSO().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Date of Birth :</div>
            </td>
           	<td nowrap>
             	<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01BDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" onKeyPress="enterInteger()">
             	<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01BDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01BDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" onKeyPress="enterInteger()" onChange="checkYearFormat(this.value,'4')">
				<a href="javascript:DatePicker(document.forms[0].E01BDM,document.forms[0].E01BDD,document.forms[0].E01BDY)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
           	</td>
            <td nowrap>
                <div align="right">Place of Birth :</div>
            </td>
          	<td nowrap>
          	<INPUT type="text" name="E01COB" size="4" maxlength="3" value="<%= client.getE01COB().trim()%>">
			<A href="javascript:GetCodeCNOFC('E01COB','03')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"></A>
			</td>			
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">Nationality :</div>
            </td>
            <td nowrap>
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01CCS" size="6" maxlength="4" value="<%= client.getE01CCS().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01CCS','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="10%">
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01GEC" size="5" maxlength="3" value="<%= client.getE01GEC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Address Information</h4>

  <table  class="tableinfo">
    <tr >
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" >
              <div align="right">Address :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01NA2"
					size="45" maxlength="35" value="<%= client.getE01NA2().trim()%>"> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right"></div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01NA3"
					size="45" maxlength="35" value="<%= client.getE01NA3().trim()%>"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right"></div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01NA4"
					size="45" maxlength="35" value="<%= client.getE01NA4().trim()%>"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">City :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01CTY"
					size="30" maxlength="30" value="<%= client.getE01CTY().trim()%>"> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">State :</div>
            </td>
				<td nowrap width="68%">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01STE"
					size="6" maxlength="4" value="<%= client.getE01STE().trim()%>"> <a
					href="javascript:GetCodeCNOFC('E01STE','27')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="absbottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">Country :</div>
            </td>
            <td nowrap  width="68%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01UC5" size="5" maxlength="3" value="<%= client.getE01UC5().trim()%>">
              <input type="text" readonly name="E01CTR" size="21" maxlength="20" value="<%= client.getE01CTR().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01UC5','E01CTR','03')">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">POBox :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01POB"
					size="15" maxlength="10" value="<%= client.getE01POB().trim()%>"
					onkeypress="enterInteger()"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">Zip Code :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01ZPC"
					size="16" maxlength="15" value="<%= client.getE01ZPC().trim()%>"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">Mailing Code :</div>
            </td>
				<td nowrap width="68%" colspan="3"><input type="text"
				<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01MLC" size="6" maxlength="4"
					value="<%= client.getE01MLC().trim()%>"></td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%">
              <div align="right">E-mail :</div>
            </td>
			<td nowrap width="68%" colspan="3">
				<input type="text" name="E01IAD" size="30" maxlength="40" value="<%= client.getE01IAD().trim()%>"
					<% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> style="text-transform: none">
				Denies Information
				<input type="checkbox" name="E01FLA" value="<%= client.getE01FLA().trim()%>" <%if (client.getE01FLA().equals("X")) out.print("checked");%>
					onClick="checkDel(this)">
			</td>
			</tr>
        </table></td>
      </tr>
    </table>

  <h4>Identification</h4>

  <table  class="tableinfo">
    <tr>
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%">
              <div align="right">ID Number :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01IDN" size="16" maxlength="15" value="<%= client.getE01IDN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="7%">
              <div align="right">Type :</div>
            </td>
            <td nowrap width="19%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01TID" size="8" maxlength="4" value="<%= client.getE01TID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="10%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01PID" size="8" maxlength="4" value="<%= client.getE01PID().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom"></td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%">
              <div align="right">D.L. Issue Date :</div>
            </td>
            <td nowrap width="24%">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I11" size="2" maxlength="2" value="<%= client.getE01I11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I12" size="2" maxlength="2" value="<%= client.getE01I12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I13" size="2" maxlength="2" value="<%= client.getE01I13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E01I11,document.forms[0].E01I12,document.forms[0].E01I13)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
             </td>
            <td nowrap width="7%">
              <div align="right">D.L. Expiration Date :</div>
            </td>
            <td nowrap width="19%">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E11" size="2" maxlength="2" value="<%= client.getE01E11().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E12" size="2" maxlength="2" value="<%= client.getE01E12().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E13" size="2" maxlength="2" value="<%= client.getE01E13().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E01E11,document.forms[0].E01E12,document.forms[0].E01E13)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
             </td>
            <td nowrap width="10%">
              <div align="right">D.L. Issue State :</div>
            </td>
            <td nowrap width="24%">
                <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01SI1" size="5" maxlength="4" value="<%= client.getE01SI1().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01SI1','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Second Identification</h4>

  <table  class="tableinfo">
    <tr>
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%">
              <div align="right">ID Number :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01IDF" size="16" maxlength="15" value="<%= client.getE01IDF().trim()%>">
            </td>
            <td nowrap width="7%">
              <div align="right">Type :</div>
            </td>
            <td nowrap width="19%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01FC2" size="8" maxlength="4" value="<%= client.getE01FC2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01FC2','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap width="10%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01FC1" size="8" maxlength="4" value="<%= client.getE01FC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01FC1','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
			</td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%">
              <div align="right">D.L. Issue Date :</div>
            </td>
            <td nowrap width="24%">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I21" size="2" maxlength="2" value="<%= client.getE01I21().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I22" size="2" maxlength="2" value="<%= client.getE01I22().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%> name="E01I23" size="2" maxlength="2" value="<%= client.getE01I23().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E01I21,document.forms[0].E01I22,document.forms[0].E01I23)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
             </td>
            <td nowrap width="7%">
              <div align="right">D.L. Expiration Date :</div>
            </td>
            <td nowrap width="19%">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E21" size="2" maxlength="2" value="<%= client.getE01E21().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E22" size="2" maxlength="2" value="<%= client.getE01E22().trim()%>" onKeyPress="enterInteger()">
				<input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01E23" size="2" maxlength="2" value="<%= client.getE01E23().trim()%>" onKeyPress="enterInteger()">
				<a href="javascript:DatePicker(document.forms[0].E01E21,document.forms[0].E01E22,document.forms[0].E01E23)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
             </td>
            <td nowrap width="10%">
              <div align="right">D.L. Issue State :</div>
            </td>
            <td nowrap width="24%">
                <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01SI2" size="5" maxlength="4" value="<%= client.getE01SI2().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01SI2','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Telephone Numbers</h4>

  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="27%">
              <div align="right">Home :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01PHN" size="11" maxlength="3" value="<%= client.getE01PHN().trim()%>" class="input_phone_area">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01HPN" size="12" maxlength="11" value="<%= client.getE01HPN().trim()%>" class="input_phone" >
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="29%">
				<div align="right">Cellular :</div>
            </td>
            <td nowrap width="23%">
			  <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01FAX" size="11" maxlength="3" value="<%= client.getE01FAX().trim()%>" class="input_phone_area">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01PH1" size="12" maxlength="11" value="<%= client.getE01PH1().trim()%>" class="input_phone" >
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
  
  <h4>Dates</h4>

  <table  class="tableinfo">
    <tr >
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%">
              <div align="right">First Contact :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01IDM" size="3" maxlength="2" value="<%= client.getE01IDM().trim()%>" onKeyPress="enterInteger()">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01IDD" size="3" maxlength="2" value="<%= client.getE01IDD().trim()%>" onKeyPress="enterInteger()">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01IDY" size="3" maxlength="2" value="<%= client.getE01IDY().trim()%>" onKeyPress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01IDM,document.forms[0].E01IDD,document.forms[0].E01IDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>

        </td>
      </tr>
    </table>
    
	<h4>Financial Information</h4>
	
  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="28%">
              <div align="right">Income Level :</div>
            </td>
            <td nowrap width="21%">
              <select name="E01INL">
                <option value=" " <% if (!(client.getE01INL().equals("1")||client.getE01INL().equals("2")||client.getE01INL().equals("3")||client.getE01INL().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <% if (client.getE01INL().equals("1")) out.print("selected"); %>>0 - 50.000</option>
                <option value="2" <% if (client.getE01INL().equals("2")) out.print("selected"); %>>50.000 - 100.000</option>
                <option value="3" <% if (client.getE01INL().equals("3")) out.print("selected"); %>>100.000 - 250.000</option>
                <option value="4" <% if (client.getE01INL().equals("4")) out.print("selected"); %>>Over 250.000</option>
              </select>
            </td>
            <td nowrap width="30%">
              <div align="right">Source of Income :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E01SOI" size="5" maxlength="4" value="<%= client.getE01SOI().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01SOI','30')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Classification Codes</h4>

  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">Main Officer :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E01OFC" size="5" maxlength="3" value="<%= client.getE01OFC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="33%">
              <div align="right">Substitute Officer :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E01OF2" size="5" maxlength="3" value="<%= client.getE01OF2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OF2','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>

            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="17%">
              <input type="text" name="E01INC" size="5" maxlength="3" value="<%= client.getE01INC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            <td nowrap width="33%">
              <div align="right">Business Line :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E01BUC" size="5" maxlength="3" value="<%= client.getE01BUC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01UC1" size="5" maxlength="3" value="<%= client.getE01UC1().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap>
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01UC2" size="5" maxlength="3" value="<%= client.getE01UC2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC2','2B')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01UC3" size="5" maxlength="3" value="<%= client.getE01UC3().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC3','2C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap>
              <div align="right">Politically  Exposed Person:</div>
            </td>
            <td nowrap>
              Yes<input type="radio" name="E01FG1"  value="Y" <%if(client.getE01FG1().trim().equals("Y"))out.print("checked"); %> >
              No<input type="radio" name="E01FG1"  value="N" <%if(!client.getE01FG1().trim().equals("Y"))out.print("checked"); %> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Operational Information</h4>

  <table  class="tableinfo">
    <tr >
        <td nowrap >

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="15%">
              <div align="right">Customer Status :</div>
              </td>

            <td nowrap width="35%">
              <select name="E01STS">
                <option value=" " <% if (!(client.getE01STS().equals("1")||client.getE01STS().equals("2")||client.getE01STS().equals("3"))) out.print("selected"); %>>
                </option>
                <option value="1" <% if (client.getE01STS().equals("1")) out.print("selected"); %>>Active</option>
                <option value="2" <% if (client.getE01STS().equals("2")) out.print("selected"); %>>Inactive</option>
                <option value="3" <% if (client.getE01STS().equals("3")) out.print("selected"); %>>Black
                List</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
            </td>

            <td nowrap width="15%">
              <div align="right">Customer Class :</div>
            </td>
            <td nowrap width="35%">
              <select name="E01CCL">
                <option value=" " <% if (!(client.getE01CCL().equals("1")||client.getE01CCL().equals("2") ||client.getE01CCL().equals("3")||client.getE01CCL().equals("4") ||client.getE01CCL().equals("5")))  out.print("selected"); %>></option>
                <option value="1" <% if (client.getE01CCL().equals("1")) out.print("selected"); %>>Single Product</option>
                <option value="2" <% if (client.getE01CCL().equals("2")) out.print("selected"); %>>2 Products</option>
                <option value="3" <% if (client.getE01CCL().equals("3")) out.print("selected"); %>>3 Products</option>
                <option value="4" <% if (client.getE01CCL().equals("4")) out.print("selected"); %>>4 Products</option>
                <option value="5" <% if (client.getE01CCL().equals("5")) out.print("selected"); %>>5 Products or more</option>
              </select>
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="23%" >
              <div align="right">Customer Type :</div>
              </td>

            <td nowrap width="36%" >
              <input type="radio" name="E01TYP" value="R" <%if (!(client.getE01TYP().equals("M") || client.getE01TYP().equals("G"))) out.print("checked"); %>>
              Regular
              <input type="radio" name="E01TYP" value="M" <%if (client.getE01TYP().equals("M")) out.print("checked"); %>>
              Master
              <input type="radio" name="E01TYP" value="G" <%if (client.getE01TYP().equals("G")) out.print("checked"); %>>
              Group <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>

            <td nowrap width="25%" >
              <div align="right">Group Number :</div>
              </td>

            <td nowrap width="16%" >
              <input type="text" name="E01GRP" size="10" maxlength="9" value="<%= client.getE01GRP().trim()%>" onkeypress="enterInteger()">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="23%">
              <div align="right">Language :</div>
              </td>

            <td nowrap width="36%">
              <input type="radio" name="E01LIF" value="S" <%if (client.getE01LIF().equals("S")) out.print("checked"); %>>
              Spanish
              <input type="radio" name="E01LIF" value="E" <%if (!client.getE01LIF().equals("S")) out.print("checked"); %>>
              English <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap width="25%">
              <div align="right">Withholding Table:</div>
              </td>

            <td nowrap width="16%">
              <input type="text" name="E01TAX" size="3" maxlength="1" value="<%= client.getE01TAX().trim()%>">
              <a href="javascript:GetCode('E01TAX','STATIC_client_help_tax_instructions.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="23%" >
              <div align="right">Subject  to Taxes in U.S. :</div>
              </td>

            <td nowrap width="36%" >
              <input type="radio" name="E01FG2" value="Y" <%if (client.getE01FG2().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01FG2" value="N" <%if (client.getE01FG2().equals("N")) out.print("checked"); %>>
              No
               <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>

            <td nowrap width="25%" >
              <div align="right"> Renewal/Volume </div>
              </td>

            <td nowrap width="16%" >
            <SELECT name="E01RLV">
					<OPTION value=" "
						<% if (!(client.getE01RLV().equals("T")) || (client.getE01RLV().equals("1")) || (client.getE01RLV().equals("A")) || (client.getE01RLV().equals("N"))) out.print("selected"); %>></OPTION>
					<OPTION value="T"
						<% if (client.getE01RLV().equals("T")) out.print("selected"); %>>Total
					by Customer without Investments</OPTION>
					<OPTION value="1"
						<% if (client.getE01RLV().equals("1")) out.print("selected"); %>>Total
					by Customer with Investments</OPTION>
					<OPTION value="A"
						<% if (client.getE01RLV().equals("A")) out.print("selected"); %>>By
					Account</OPTION>
					<OPTION value="N"
						<% if (client.getE01RLV().equals("N")) out.print("selected"); %>>None</OPTION>
				</SELECT></td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

            <td nowrap width="23%">
              <div align="right">Consolidated Stmt. Freq. :</div>
            </td>
            <td nowrap width="36%">
				<select name="E01SFR">
					<option value=" "
						<% if (!(client.getE01SFR().equals("M")||client.getE01SFR().equals("Q") ||client.getE01SFR().equals("S")))  out.print("selected"); %>></option>
					<option value="M"
						<% if (client.getE01SFR().equals("M")) out.print("selected"); %>>Monthly</option>
					<option value="Q"
						<% if (client.getE01SFR().equals("Q")) out.print("selected"); %>>Quarterly</option>
					<option value="S"
						<% if (client.getE01SFR().equals("S")) out.print("selected"); %>>Semiannually</option>
				</select>
            </td>
            <td nowrap width="25%">
              <div align="right">Consolidated Stmt. Day :</div>
              </td>

            <td nowrap width="16%">
              <input type="text" name="E01SDY" size="2" maxlength="2" value="<%= client.getE01SDY().trim()%>">
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="17%">
              <div align="right">Inquiry Level :</div>
            </td>
            <td nowrap  width="26%">
              <input type="text" name="E01ILV" size="4" maxlength="1" value="<%= client.getE01ILV().trim()%>">
            </td>
          	<td nowrap width="25%">
              <div align="right">OBD :</div>
            </td>
            <td nowrap  width="31%">
				<input type="text" name="E01UC4" size="8" maxlength="5" value="<%=client.getE01UC4().trim() %>" >
            </td>
            </tr>
            <% if (!currUser.getH01WK3().equals("1")) { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Risk Level :</div>
            </td>
            <td nowrap width="21%">
              <input type="text" name="E01RSL" size="5" maxlength="4" value="<%= client.getE01RSL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01RSL','31')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="23%">
              <div align="right">Risk Rating Method :</div>
            </td>
            <td nowrap width="36%">
              <input type="text" name="E01FL2" size="3" maxlength="1" value="<%= client.getE01FL2().trim()%>">
              <a href="javascript:GetCode('E01FL2','STATIC_client_help_qualification_type.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">
            </td>
            </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">Loan Losses Table :</div>
            </td>
            <td nowrap  width="37%">
              <input type="text" name="E01PRV" size="4" maxlength="2" value="<%= client.getE01PRV().trim()%>">
              <a href="javascript:GetPrevTable('E01PRV')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap width="17%">
              <div align="right"></div>
            </td>
            <td nowrap  width="26%">
            </td>
          </tr>
            <% } %>
          </table>
        </td>
      </tr>
    </table>
    
  <h4>Additional Information</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td align="right" width="15%">
          	Agency's Manager e-mail :
          	</td>
   			<td nowrap width="35%">
   			<input type="text" name="E01AME" size="60" maxlength="40" value="<%= client.getE01AME().trim()%>">
   			</td>
            <td nowrap width="15%">
              <div align="right">Education Level :</div>
            </td>
            <td nowrap width="35%">
              <input type="text" name="E01EDL" size="5" maxlength="4" value="<%= client.getE01EDL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01EDL','29')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap   width="20%">
              <div align="right">Referred By :</div>
            </td>
            <td nowrap  width="37%">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01RBY" size="5" maxlength="4" value="<%= client.getE01RBY().trim()%>">
              <input type="text" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> readonly <%}%>  name="E01RBN" size="20" maxlength="15" value="<%= client.getE01RBN().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01RBY','E01RBN','28')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
            <td nowrap   width="17%">
              <div align="right">Relationship to Officer :</div>
            </td>
            <td nowrap   width="26%">
              <select name="E01FL3">
                <option value=" " <% if (!(client.getE01FL3().equals("1")||client.getE01FL3().equals("2") ||client.getE01FL3().equals("3")||client.getE01FL3().equals("4") ||client.getE01FL3().equals("5")||client.getE01FL3().equals("6")||client.getE01FL3().equals("7")))  out.print("selected"); %>></option>
                <option value="1" <% if (client.getE01FL3().equals("1")) out.print("selected"); %>>None</option>
                <option value="2" <% if (client.getE01FL3().equals("2")) out.print("selected"); %>>Cousin</option>
                <option value="3" <% if (client.getE01FL3().equals("3")) out.print("selected"); %>>Father</option>
                <option value="4" <% if (client.getE01FL3().equals("4")) out.print("selected"); %>>Mother</option>
                <option value="5" <% if (client.getE01FL3().equals("5")) out.print("selected"); %>>Brother/Sister</option>
                <option value="6" <% if (client.getE01FL3().equals("6")) out.print("selected"); %>>Spouse</option>
                <option value="7" <% if (client.getE01FL3().equals("7")) out.print("selected"); %>>Grandparent</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="20%">
              <div align="right">Staff Member :</div>
            </td>
            <td nowrap width="37%">
  		 <input type="radio" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%>  name="E01STF" value="1" <%if (client.getE01STF().equals("1")) out.print("checked"); %>>
              Yes
              <input type="radio" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%>  name="E01STF" value="2" <%if (client.getE01STF().equals("2")) out.print("checked"); %>>
              No
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
            <td nowrap  width="17%">
              <div align="right">Resident :</div>
            </td>
            <td nowrap  width="26%">
              <input type="radio" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%>  name="E01FL1" value="1" <%if ( !client.getE01FL1().equals("2")) out.print("checked"); %>>
              Yes
              <input type="radio" <% if(client.getH01WK3().equals("1") || client.getH01WK3().equals("2")) { %> disabled  <%}%>  name="E01FL1" value="2" <%if (client.getE01FL1().equals("2")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">ATM Card Issued :</div>
            </td>
            <td nowrap  width="37%">
              <input type="radio" name="E01ATM" value="1"  <%if (client.getE01ATM().equals("1")) out.print("checked"); %>>
              Standard
              <input type="radio" name="E01ATM" value="2"  <%if (client.getE01ATM().equals("2")) out.print("checked"); %>>
              Platinum
              <input type="radio" name="E01ATM" value="N"  <%if (client.getE01ATM().equals("N")) out.print("checked"); %>>
              None
            </td>
			<td nowrap width="21%">
              <div align="right">Treasury Customer :</div>
            </td>
			<td nowrap width="25%">
              <input type="radio" name="E01FL5" value="Y"  <%if (client.getE01FL5().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01FL5" value="N"  <%if (!client.getE01FL5().equals("Y")) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom">
            </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		    <td nowrap width="19%">
              <div align="right">Extended Hold Reg.-CC :</div>
           </td>
			<td nowrap width="35%" colspan="3">
              <input type="radio" name="E01FL4" value="Y"  <%if (client.getE01FL4().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01FL4" value="N"  <%if (!(client.getE01FL4().equals("Y"))) out.print("checked"); %>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></td>
		  </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">Customer denies to provide information :</div>
            </td>
           <td nowrap width="80%" colspan="3">
             	<input type="checkbox" name="E01FLB" value="<%= client.getE01FLB().trim()%>" onClick="checkDel(this)" <%if (client.getE01FLB().equals("X")) out.print("checked"); %>> Assets
             	<input type="checkbox" name="E01FLC" value="<%= client.getE01FLC().trim()%>" onClick="checkDel(this)" <%if (client.getE01FLC().equals("X")) out.print("checked"); %>> Liabilities
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
	<% if (client.getH01MAS().equals("Y") || client.getH01MAS().equals("W")) {%>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	    <tr bgcolor="#FFFFFF">
	      <td width="33%">
	        <div align="center">
	          <input type="checkbox" name="H01WK2" value="Y" >
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