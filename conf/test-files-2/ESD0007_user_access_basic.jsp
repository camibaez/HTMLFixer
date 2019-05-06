 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>User's Access</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="user" class="datapro.eibs.beans.ESD000701Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">User's Access<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="user_access_basic, ESD0007" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0007" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>
  <h4>User Information </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">User :</div>
            </td>
            <td nowrap>
              <input type="hidden" name="E01BTHKEY" size="17" maxlength="15" value="<%= user.getE01BTHKEY().trim()%>">
              <%= user.getE01BTHKEY().trim()%>
             </td>
            <td nowrap>
              <div align="right"></div>
            </td>
            <td nowrap>
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Name :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01EUPNME" size="40" maxlength="45" value="<%= user.getE01EUPNME().trim()%>">
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  >
             </td>
            <td nowrap>
              <div align="right">Identification :</div>
            </td>
            <td nowrap>
             	<input type="text" name="E01EUPIDN" size="17" maxlength="15" value="<%= user.getE01EUPIDN().trim()%>" >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">E-mail :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01EUPEML" size="40" maxlength="40" value="<%= user.getE01EUPEML().trim()%>">
              </td>
            <td nowrap>
              <div align="right">Phone :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01EUPPHN" size="13" maxlength="12" value="<%= user.getE01EUPPHN().trim()%>" onkeypress="enterInteger()">
            	Ext :
            	<input type="text" name="E01EUPPXT" size="5" maxlength="4" value="<%= user.getE01EUPPXT().trim()%>" onkeypress="enterInteger()">
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">eIBS Password :</div>
            </td>
            <td nowrap>
              	<input type="password" name="E01EUPACP" size="12" maxlength="10" value="<%= user.getE01EUPACP().trim()%>">
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  >
             </td>
            <td nowrap>
              <div align="right">Approval Password :</div>
            </td>
            <td nowrap>
            	<input type="password" name="E01BTHPSW" size="6" maxlength="4" value="<%= user.getE01BTHPSW().trim()%>">
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Password Required :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01EUPOPR" value="1" <%if (user.getE01EUPOPR().equals("1")) out.print("checked"); %>>Yes
              <input type="radio" name="E01EUPOPR" value="0" <%if (user.getE01EUPOPR().equals("0")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">User Status :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01EUPSTS" size="2" maxlength="1" value="<%= user.getE01EUPSTS().trim()%>">
              	<a href="javascript:GetCode('E01EUPSTS','STATIC_user_status.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0" ></a>
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Password Frequency Chances :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01EUPCHG" size="5" maxlength="4" value="<%= user.getE01EUPCHG().trim()%>" onkeypress="enterInteger()">
             </td>
            <td nowrap>
              <div align="right">Language :</div>
            </td>
            <td nowrap>
               <select name="E01EUPF02">
                <option value=" " <% if (!(user.getE01EUPF02().equals("E")||user.getE01EUPF02().equals("S"))) out.print("selected"); %>>
                </option>
                <option value="E" <% if (user.getE01EUPF02().equals("E")) out.print("selected"); %>>English</option>
                <option value="S" <% if (user.getE01EUPF02().equals("S")) out.print("selected"); %>>Spanish</option>
              </select>
            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Bank :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHUBK" size="3" maxlength="2" value="<%= user.getE01BTHUBK().trim()%>">
             </td>
            <td nowrap>
              <div align="right">Branch :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHUBR" size="5" maxlength="4" value="<%= user.getE01BTHUBR().trim()%>" onkeypress="enterInteger()">
            	<a href="javascript:GetBranch('E01BTHUBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0"  ></a>
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01EUPCCN" size="10" maxlength="9" value="<%= user.getE01EUPCCN().trim()%>" onkeypress="enterInteger()">
              	<a href="javascript:GetCostCenter('E01EUPCCN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0" ></a>
             </td>
            <td nowrap>
              <div align="right">Officer :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHOFC" size="4" maxlength="3" value="<%= user.getE01BTHOFC().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01BTHOFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a>
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHCUN" size="12" maxlength="10" value="<%= user.getE01BTHCUN().trim()%>" onkeypress="enterInteger()">
              	<a href="javascript:GetCustomer('E01BTHCUN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0" ></a>
             </td>
            <td nowrap>
              <div align="right">Group Id :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHGRP" size="15" maxlength="10" value="<%= user.getE01BTHGRP().trim()%>">
            	<a href="javascript:GetGroupId('E01BTHGRP')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a>
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Authorization Level :</div>
            </td>
            <td nowrap colspan="3">
              	<input type="text" name="E01BTHAUT" size="2" maxlength="1" value="<%= user.getE01BTHAUT().trim()%>">
              	<a href="javascript:GetCode('E01BTHAUT','STATIC_user_authorization_level.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0" ></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field"  border="0"  >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Inquiry Level :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHINL" size="3" maxlength="2" value="<%= user.getE01BTHINL().trim()%>" onkeypress="enterInteger()">(0 - 9)
              </td>
            <td nowrap>
              <div align="right">Accounting Level :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHACL" size="3" maxlength="2" value="<%= user.getE01BTHACL().trim()%>" onkeypress="enterInteger()">(0 - 9)
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Batch Range 1 From :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHFB1" size="5" maxlength="4" value="<%= user.getE01BTHFB1().trim()%>" onkeypress="enterInteger()">
              </td>
            <td nowrap>
              <div align="right">Batch Range 1 To :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHTB1" size="5" maxlength="4" value="<%= user.getE01BTHTB1().trim()%>" onkeypress="enterInteger()">
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Batch Range 2 From :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHFB2" size="5" maxlength="4" value="<%= user.getE01BTHFB2().trim()%>" onkeypress="enterInteger()">
              </td>
            <td nowrap>
              <div align="right">Batch Range 2 To :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHTB2" size="5" maxlength="4" value="<%= user.getE01BTHTB2().trim()%>" onkeypress="enterInteger()">
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">L/C Negotiation From :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHFB3" size="5" maxlength="4" value="<%= user.getE01BTHFB3().trim()%>" onkeypress="enterInteger()">
              </td>
            <td nowrap>
              <div align="right">L/C Negotiation To :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHTB3" size="5" maxlength="4" value="<%= user.getE01BTHTB3().trim()%>" onkeypress="enterInteger()">
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">User Default Batch :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHDIB" size="5" maxlength="4" value="<%= user.getE01BTHDIB().trim()%>" onkeypress="enterInteger()">
              </td>
            <td nowrap>
              <div align="right">P&R Batch Number :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHPRB" size="5" maxlength="4" value="<%= user.getE01BTHPRB().trim()%>" onkeypress="enterInteger()">
             </td>
          </tr>
          <tr id="trdark">
          	<td nowrap></td>
            <td nowrap></td>
            <td nowrap>
              <div align="right"> Session Number :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01SWFSNB" size="5" maxlength="4" value="<%= user.getE01SWFSNB().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  <h4>Approvals Information</h4>
   <table  class="tableinfo">
    <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap>
              <div align="right">Transaction (Currency/Amount) :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01BTHCCY" size="4" maxlength="3" value="<%= user.getE01BTHCCY().trim()%>">
              	<a href="javascript:GetCurrency('E01BTHCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" border="0"></a>
              	<input type="text" name="E01BTHALM" size="17" maxlength="15" value="<%= user.getE01BTHALM().trim()%>" onkeypress="enterDecimal()">
              </td>
            <td nowrap>
              <div align="right">Total :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01BTHAM2" size="17" maxlength="15" value="<%= user.getE01BTHAM2().trim()%>" onkeypress="enterDecimal()">
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="4">
              <div align="left"><b>Return items Approval</b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Daily Maximum (Currency/Amount) :</div>
            </td>
            <td nowrap>
              	<input type="text" name="E01EUPCCY" size="4" maxlength="3" value="<%= user.getE01EUPCCY().trim()%>">
              	<a href="javascript:GetCurrency('E01EUPCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" border="0"></a>
              	<input type="text" name="E01EUPAM2" size="17" maxlength="15" value="<%= user.getE01EUPAM2().trim()%>" onkeypress="enterDecimal()">
              </td>
            <td nowrap>
              <div align="right">Approval Level :</div>
            </td>
            <td nowrap>
               <select name="E01EUPAPL">
                <option value=" " <% if (!(user.getE01EUPAPL().equals("1")||user.getE01EUPAPL().equals("2") || user.getE01EUPAPL().equals("3"))) out.print("selected"); %>>
                </option>
                <option value="1" <% if (user.getE01EUPAPL().equals("1")) out.print("selected"); %>>Bank</option>
                <option value="2" <% if (user.getE01EUPAPL().equals("2")) out.print("selected"); %>>Branch</option>
                <option value="3" <% if (user.getE01EUPAPL().equals("3")) out.print("selected"); %>>All</option>
              </select>
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="4">
              <div align="left"><b>Foreign Users</b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Authorization Level :</div>
            </td>
            <td nowrap>
               <select name="E01EUPF01">
                <option value=" " <% if (!(user.getE01EUPF01().equals("1")||user.getE01EUPF01().equals("2") || user.getE01EUPF01().equals("3")|| user.getE01EUPF01().equals("N"))) out.print("selected"); %>>
                </option>
                <option value="N" <% if (user.getE01EUPF01().equals("N")) out.print("selected"); %>>It's not a Foreign User</option>
                <option value="1" <% if (user.getE01EUPF01().equals("1")) out.print("selected"); %>>Request Input</option>
                <option value="2" <% if (user.getE01EUPF01().equals("2")) out.print("selected"); %>>Request Approval</option>
                <option value="3" <% if (user.getE01EUPF01().equals("3")) out.print("selected"); %>>Request Input & Approval</option>
               </select>
              </td>
            <td nowrap>
              <div align="right">Foreign Branch :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E01EUPUC2" size="4" maxlength="3" value="<%= user.getE01EUPUC2().trim()%>">
             </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Foreign Officer Code :</div>
            </td>
            <td nowrap>
				<input type="text" name="E01EUPUC1" size="4" maxlength="3" value="<%= user.getE01EUPUC1().trim()%>">
				<a href="javascript:GetCodeCNOFC('E01EUPUC1','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"  border="0" ></a>
			</td>
            <td nowrap>
              <div align="right"></div>
            </td>
            <td nowrap>
             </td>
          </tr>

        </table>
        </td>
      </tr>
    </table>

  <h4>Additional Features</h4>

  <table  class="tableinfo">
    <tr>
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="trdark">
            <td nowrap>
              <div align="right">Post G/L's :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCGL" value="Y" <%if (user.getE01BTHCGL().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHCGL" value="N" <%if (!user.getE01BTHCGL().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Change Customer Number :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCCU" value="Y" <%if (user.getE01BTHCCU().equals("Y")) out.print("checked"); %> >Yes
              <input type="radio" name="E01BTHCCU" value="N" <%if (!user.getE01BTHCCU().equals("Y")) out.print("checked"); %> >No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Post Retail Accounts :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHRTL" value="Y" <%if (user.getE01BTHRTL().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHRTL" value="N" <%if (!user.getE01BTHRTL().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Change Accounts Status :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCAC" value="Y" <%if (user.getE01BTHCAC().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHCAC" value="N" <%if (!user.getE01BTHCAC().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trdark">
            <td nowrap>
              <div align="right">Post Deals (Assets) :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHASS" value="Y" <%if (user.getE01BTHASS().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHASS" value="N" <%if (!user.getE01BTHASS().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Change Holds and Collaterals :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCHL" value="Y" <%if (user.getE01BTHCHL().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHCHL" value="N" <%if (!user.getE01BTHCHL().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Post Deals (Liabilities) :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHLIB" value="Y" <%if (user.getE01BTHLIB().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHLIB" value="N" <%if (!user.getE01BTHLIB().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Deals (Assets) :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHLNA" value="Y" <%if (user.getE01BTHLNA().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHLNA" value="N" <%if (!user.getE01BTHLNA().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trdark">
            <td nowrap>
              <div align="right">Post Letters of Credits :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHLCR" value="Y" <%if (user.getE01BTHLCR().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHLCR" value="N" <%if (!user.getE01BTHLCR().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Deals (Liabilities) :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCDA" value="Y" <%if (user.getE01BTHCDA().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHCDA" value="N" <%if (!user.getE01BTHCDA().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Post Reimbursements :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHRBM" value="Y" <%if (user.getE01BTHRBM().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHRBM" value="N" <%if (!user.getE01BTHRBM().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval O/D Paying & Receiving :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHAOP" value="Y" <%if (user.getE01BTHAOP().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHAOP" value="N" <%if (!user.getE01BTHAOP().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trdark">
            <td nowrap>
              <div align="right">Post Mortgage Loans :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHMLF" value="Y" <%if (user.getE01BTHMLF().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHMLF" value="N" <%if (!user.getE01BTHMLF().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Collaterals :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHCLP" value="Y" <%if (user.getE01BTHCLP().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHCLP" value="N" <%if (!user.getE01BTHCLP().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Post Others :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHOTH" value="Y" <%if (user.getE01BTHOTH().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHOTH" value="N" <%if (!user.getE01BTHOTH().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Letters of Credits :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHLEC" value="Y" <%if (user.getE01BTHLEC().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHLEC" value="N" <%if (!user.getE01BTHLEC().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trdark">
            <td nowrap>
              <div align="right">Investment Banking :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHAIV" value="Y" <%if (user.getE01BTHAIV().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHAIV" value="N" <%if (!user.getE01BTHAIV().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Lines of Credits :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHLIC" value="Y" <%if (user.getE01BTHLIC().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHLIC" value="N" <%if (!user.getE01BTHLIC().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Change Extended Holds :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHILF" value="Y" <%if (user.getE01BTHILF().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHILF" value="N" <%if (!user.getE01BTHILF().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval O/D Lines of Credits :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHODL" value="Y" <%if (user.getE01BTHODL().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHODL" value="N" <%if (!user.getE01BTHODL().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trdark">
            <td nowrap>
              <div align="right">Official Checks Types :</div>
            </td>
            <td nowrap>
               <select name="E01BTHOCK">
                <option value=" " <% if (!(user.getE01BTHOCK().equals("A")||user.getE01BTHOCK().equals("N"))) out.print("selected"); %>>
                </option>
                <option value="A" <% if (user.getE01BTHOCK().equals("A")) out.print("selected"); %>>All Types</option>
                <option value="N" <% if (user.getE01BTHOCK().equals("N")) out.print("selected"); %>>Not Authorized</option>
                </select>
             </td>
            <td nowrap>
              <div align="right">Approval F/E Contracts :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHAFE" value="Y" <%if (user.getE01BTHAFE().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHAFE" value="N" <%if (!user.getE01BTHAFE().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
           <tr id="trclear">
            <td nowrap>
              <div align="right">Post External Transfr. :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01BTHAEW" value="Y" <%if (user.getE01BTHAEW().equals("Y")) out.print("checked"); %>>Yes
              <input type="radio" name="E01BTHAEW" value="N" <%if (!user.getE01BTHAEW().equals("Y")) out.print("checked"); %>>No
             </td>
            <td nowrap>
              <div align="right">Approval Securities Tolerance Over/Above</div>
            </td>
            <td nowrap>
             <INPUT type="radio" name="E01EUPF03" value="Y"
					<%if (user.getE01EUPF03().equals("Y")) out.print("checked"); %>>Yes
              <INPUT type="radio" name="E01EUPF03" value="N"
					<%if (!user.getE01EUPF03().equals("Y")) out.print("checked"); %>>No
             </td>
          </tr>
			<TR>
				<TD nowrap align="right">User Domain :</TD>
				<TD nowrap colspan="3">
				<INPUT type="radio" name="E01EUPLNA" value="P" <%if (user.getE01EUPLNA().equals("P")) out.print("checked"); %>>Private Banking
				<INPUT type="radio" name="E01EUPLNA" value="T" <%if (user.getE01EUPLNA().equals("T")) out.print("checked"); %>>Treasury
				<INPUT type="radio" name="E01EUPLNA" value=" " <%if (!user.getE01EUPLNA().equals("T") && !user.getE01EUPLNA().equals("P")) out.print("checked"); %>>None
				</TD>
			</TR></table>
      </td>
    </tr>
  </table>
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
</form>
</body>
</html>

