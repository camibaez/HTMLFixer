<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Corporate Client Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008002Message" scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(client_inq_corp_opt);

</SCRIPT>
 
</head>

<body bgcolor="#FFFFFF">

<SCRIPT> initMenu();  </SCRIPT>

 
<h3 align="center">Corporate Customer Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_corp_basic, ESD0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <INPUT TYPE=HIDDEN NAME="H02WK3" VALUE="<%=client.getH02WK3().trim()%>">
  
  <%int row = 1; %>
  <h4>Articles of Incorporation</h4>
  <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="23%"> 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap  colspan=3> 
              <input type="text" readonly name="E02CUN" size="10" maxlength="9" value="<%= client.getE02CUN()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="44%"> 
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap   width="56%"> 
              <input type="text" readonly name="E02NA1" size="50" maxlength="45" value="<%= client.getE02NA1().trim()%>">
            </td>
          </tr>
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Brand  Name :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   <% if(client.getH02WK3().equals("1") || client.getH02WK3().equals("2")) { %> readonly <%}%> name="E02CP1" size="31" maxlength="30" value="<%= client.getE02CP1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="44%"> 
              <p align="right">Short Name :</p>
            </td>
            <td nowrap  width="56%"> 
              <input type="text" readonly name="E02SHN" size="16" maxlength="15" value="<%= client.getE02SHN().trim()%>">
            </td>
          </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%">
              <div align="right">Web Page : </div>
            </td>
            <td nowrap colspan="2">
              <input type="text"   name="E02FN2" size="31" maxlength="30" value="<%= client.getE02FN2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%" align="right">Contact Name : </td>
            <td nowrap colspan="2">
              <div align="left">
                <input type="text"  name="E02LN1" size="31" maxlength="30" value="<%= client.getE02LN1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td><div align="right">Date of Incorporation :</div></td>
          	<td nowrap width="27%" colspan="3">
              <input type="text" readonly  name="E02BDM" size="3" maxlength="2" value="<%= client.getE02BDM().trim()%>">
              <input type="text" readonly  name="E02BDD" size="3" maxlength="2" value="<%= client.getE02BDD().trim()%>">
              <input type="text" readonly  name="E02BDY" size="3" maxlength="2" value="<%= client.getE02BDY().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Country of Incorporation :</div>
            </td>
            <td nowrap width="58%" >
              <input type="text" readonly name="E02GEC" size="5" maxlength="3" value="<%= client.getE02GEC().trim()%>">
              <input type="text" readonly name="D02GEC" size="40" maxlength="35" value="<%= client.getD02GEC().trim()%>">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    <h4>Address Information</h4>
  <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%" > 
                <div align="right">Title/Address :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02NA2" size="36" maxlength="35" value="<%= client.getE02NA2().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%" > 
                <div align="right">Address :</div>
              </td>
              <td nowrap width="61%" > 
                <input type="text" readonly name="E02NA3" size="36" maxlength="35" value="<%= client.getE02NA3().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%" > 
                <div align="right">Address :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02NA4" size="36" maxlength="35" value="<%= client.getE02NA4().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="39%" > 
                <div align="right">City :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="E02CTY" size="31" maxlength="30" value="<%= client.getE02CTY().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%" > 
                <div align="right">State :</div>
              </td>
              <td nowrap width="61%" > 
                <input type="text" readonly name="D02STE" size="36" maxlength="35" value="<%= client.getD02STE().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="right">Country Code  :</div>
            </td>
            <td nowrap  width="10%"> 
            <input type="text" readonly name="E02UC5" size="35" maxlength="35" value="<%= client.getE02UC5().trim()%>">
            </td>
            </tr>            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%"> 
                <div align="right">Country :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02CTR" size="21" maxlength="20" value="<%= client.getE02CTR().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%"> 
                <div align="right">P.O.Box :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02POB" size="11" maxlength="10" value="<%= client.getE02POB().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%"> 
                <div align="right">Zip Code :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02ZPC" size="16" maxlength="15" value="<%= client.getE02ZPC().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="39%"> 
                <div align="right">Mailing Code :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02MLC" size="5" maxlength="4" value="<%= client.getE02MLC().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="39%"> 
                <div align="right">E-Mail :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="E02IAD" size="41" maxlength="40" value="<%= client.getE02IAD().trim()%>">
                Denies Information<input type="checkbox" name="E02FLA" disabled value="<%= client.getE02FLA().trim()%>" <%if (client.getE02FLA().equals("X")) out.print("checked"); %>> 
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Identification</h4>
    <table  class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="23%"> 
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E02IDF" size="16" maxlength="15" value="<%= client.getE02IDF().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">ID Number :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E02IDN" size="16" maxlength="15" value="<%= client.getE02IDN().trim()%>">
            </td>
            <td nowrap width="10%"> 
              <div align="right">Type :</div>
            </td>
            <td nowrap  width="47%"> 
              <input type="text" readonly name="D02TID" size="35" maxlength="35" value="<%= client.getD02TID().trim()%>">
            </td>
            <td nowrap width="10%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap  width="47%"> 
              <input type="text" readonly name="D02PID" size="35" maxlength="35" value="<%= client.getD02PID().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="21%"> 
              <div align="right">ID Issue Date :</div>
            </td>
            <td nowrap width="21%"> 
				<input type="text" readonly name="E02I11" size="2" maxlength="2" value="<%= client.getE02I11().trim()%>" >            
				<input type="text" readonly name="E02I12" size="2" maxlength="2" value="<%= client.getE02I12().trim()%>" >
				<input type="text" readonly name="E02I13" size="2" maxlength="2" value="<%= client.getE02I13().trim()%>" >
				 
 			</td>
            <td nowrap width="9%"> 
              <div align="right">ID Expiration Date :</div>
            </td>
            <td nowrap> 
				<input type="text" readonly name="E02E11" size="2" maxlength="2" value="<%= client.getE02E11().trim()%>" >            
				<input type="text" readonly name="E02E12" size="2" maxlength="2" value="<%= client.getE02E12().trim()%>" >
				<input type="text" readonly name="E02E13" size="2" maxlength="2" value="<%= client.getE02E13().trim()%>" >
				
            </td>
            <td nowrap width="12%"> 
              <div align="right">ID Issue State :</div>
            </td>
            <td nowrap width="20%"> 
                <input type="text" readonly name="E02SI1" size="5" maxlength="4" value="<%= client.getE02SI1().trim()%>">
                
            </td>
          </tr>         
          
        </table>
        </td>
      </tr>
    </table>
    <h4>Dates</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="21%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="3%"> 
              <div align="center"><font size="1">Month</font> </div>
            </td>
            <td nowrap width="2%"> 
              <div align="center">Day</div>
            </td>
            <td nowrap width="4%">Year</td>
            <td nowrap width="70%">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="21%"> 
              <div align="right">First Contact Date :</div>
            </td>
            <td nowrap colspan="4"> 
              <input type="text" readonly name="E02IDM" size="2" maxlength="2" value="<%= client.getE02IDM().trim()%>">
              <input type="text" readonly name="E02IDD" size="2" maxlength="2" value="<%= client.getE02IDD().trim()%>">
              <input type="text" readonly name="E02IDY" size="2" maxlength="2" value="<%= client.getE02IDY().trim()%>">
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
				<input type="text" readonly name="E02PHN" size="12" maxlength="6" value="<%= client.getE02PHN().trim()%>" class="input_phone_area">
                <input type="text" readonly name="E02HPN" size="12" maxlength="10" value="<%= client.getE02HPN().trim()%>" class="input_phone">
              </td>
              <td nowrap >

              <div align="right">Cellular :</div>
              </td>
              <td nowrap >
				<input type="text" readonly name="E02FAX" size="12" maxlength="6" value="<%= client.getE02FAX().trim()%>" class="input_phone_area">
                <input type="text" readonly name="E02PH1" size="12" maxlength="10" value="<%= client.getE02PH1().trim()%>" class="input_phone" >
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap>
				<div align="right">Extension :</div>
              </td>
              <td nowrap>
                <input type="text" readonly name="E02BRN" size="6" maxlength="4" value="<%= client.getE02BRN().trim()%>" onkeypress="enterInteger()">
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
    <h4>Classification Codes</h4>
    <table class="tableinfo">
      <tr> 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Main Officer :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02OFC" size="40" maxlength="35" value="<%= client.getD02OFC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Secondary Officer :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02OF2" size="40" maxlength="35" value="<%= client.getD02OF2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02INC" size="40" maxlength="35" value="<%= client.getD02INC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Business Line :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02BUC" size="40" maxlength="35" value="<%= client.getD02BUC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap  width="58%" > 
              <input type="text" readonly name="D02UC1" size="40" maxlength="35" value="<%= client.getD02UC1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02UC2" size="40" maxlength="35" value="<%= client.getD02UC2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap width="58%" > 
              <input type="text" readonly name="D02UC3" size="40" maxlength="35" value="<%= client.getD02UC3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="42%"> 
              <div align="right">Politically Exposed Person :</div>
            </td>
            <td nowrap width="58%" > 
              Yes<input type="radio" name="E02FG1"  disabled value="Y" <%if(client.getE02FG1().trim().equals("Y"))out.print("checked"); %> >
              No<input type="radio" name="E02FG1"  disabled value="N" <%if(!client.getE02FG1().trim().equals("Y"))out.print("checked"); %> >
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
              <input type="text"   name="E02NST" size="8" maxlength="7" value="<%= client.getE02NST().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Years in Business :</div>
            </td>
            <td nowrap width="31%">
              <input type="text"   name="E02NSO" size="3" maxlength="2" value="<%= client.getE02NSO().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="22%">
              <div align="right">Initial Capital :</div>
            </td>
            <td nowrap width="22%">
              <input type="text"   name="E02CAI" size="16" maxlength="15" value="<%= client.getE02CAI().trim()%>" readonly>
            </td>
            <td nowrapwidth="25%">
              <div align="right">Number of Stock Holders :</div>
            </td>
            <td nowrap width="31%">
              <input type="text"   name="E02NSH" size="8" maxlength="7" value="<%= client.getE02NSH().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrapwidth="22%">
              <div align="right">Paid in Capital :</div>
            </td>
            <td nowrap  width="22%">
              <input type="text"   name="E02CAP" size="16" maxlength="15" value="<%= client.getE02CAP().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Stock Holders Equity :</div>
            </td>
            <td nowrap  width="31%">
              <input type="text"   name="E02CAS" size="16" maxlength="15" value="<%= client.getE02CAS().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="22%">
              <div align="right">Business Size :</div>
            </td>
            <td nowrap width="22%">
              <input type="text"  name="E02SEX" size="2" maxlength="1" value="<%= client.getE02SEX().trim()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Sales Level :</div>
            </td>
            <td nowrap width="31%">
              <input type="text" readonly name="E02INL" size="21" maxlength="20" 
               value="<% if (client.getE02INL().equals("1")) { out.print("0 - 50.000"); }
							else if (client.getE02INL().equals("2")) { out.print("50.000 - 100.000"); }
							else if (client.getE02INL().equals("3")) { out.print("100.000 - 250.000"); }
							else if (client.getE02INL().equals("4")) { out.print("Over 250.000"); }
							else { out.print(""); } %>">

            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap n width="22%">
              <div align="right">Source of Wealth :</div>
            </td>
            <td nowrap  width="22%">
				<input type="text" readonly name="D02SOI" size="35" maxlength="35" value="<%= client.getD02SOI().trim()%>">
            </td>
            <td nowrap width="25%">
              <div align="right">Business Area :</div>
            </td>
            <td nowrap  width="31%">
              <input type="text" readonly name="E02FL3" size="2" maxlength="1" value="<%= client.getE02FL3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap n width="22%">
               <div align="right">Corporation Type :</div>
            </td>
            <td nowrap  width="22%">
              	 <input type="text" name="E02SPF" readonly value="<% if(client.getE02SPF().equals("4")) out.print("Corporation - For Profit");
              				else if(client.getE02SPF().equals("5")) out.print("Corporation - Nonprofit");
              				else if(client.getE02SPF().equals("6")) out.print("Partnership");
              				else if(client.getE02SPF().equals("7")) out.print("Sole Proprietorship");
              				else if(client.getE02SPF().equals("8")) out.print("Limited Liability Company");
							else if(client.getE02SPF().equals("9")) out.print("Trust-Separate Agreement Dated");%>" size="30">       
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    
  <h4>Operational Information</h4>
    <table class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%"> 
              <div align="right">Customer Status :</div>
            </td>
            <td nowrap  width="28%" bordercolor="#FFFFFF"> 
              <input type="text" readonly name="E02STS" size="15" maxlength="15" 
				value="<% if (client.getE02STS().equals("1")) { out.print("Active"); }
                    	  else if (client.getE02STS().equals("2")) { out.print("Inactive"); }
                          else if (client.getE02STS().equals("3")) { out.print("Black List"); }
                          else { out.print(""); } %>">
            </td>
            <td nowrap  width="22%"> 
              <div align="right">Customer Class :</div>
            </td>
            <td nowrap  width="22%" > 
              <input type="text" readonly name="E02CCL" size="2" maxlength="1" value="<%= client.getE02CCL().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="28%"> 
              <div align="right">Customer Type :</div>
            </td>
            <td nowrap width="28%" bordercolor="#FFFFFF"> 
              <input type="text" readonly name="E02TYP" size="10" maxlength="10" 
    		  value="<% if (client.getE02TYP().equals("R")) { out.print("Regular"); }
						else if (client.getE02TYP().equals("M")) { out.print("Master"); }
		                else if (client.getE02TYP().equals("G")) { out.print("Group"); }
						else { out.print(""); } %>">
            <td nowrap  width="22%"> 
              <div align="right">Group Number :</div>
            </td>
            <td nowrap  width="22%"> 
              <input type="text" readonly name="E02GRP" size="10" maxlength="9" value="<%= client.getE02GRP().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap  width="28%"> 
              <div align="right">Language :</div>
            </td>
            <td nowrap width="28%" bordercolor="#FFFFFF"> 
              <input type="text" readonly name="E02LIF" size="10" maxlength="10" 
			  value="<% if (client.getE02LIF().equals("E")) { out.print("English"); } 
                		else if (client.getE02LIF().equals("S")) { out.print("Spanish"); }
						else { out.print(""); } %>" >
            </td>
            <td nowrap width="28%"> 
              <div align="right">Withholding Table :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E02TAX" size="2" maxlength="1" value="<%= client.getE02TAX().trim()%>">
            </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="23%"> 
              <div align="right">Consolidated Stmt. Freq. :</div>
            </td>
            <td nowrap width="36%"> 
            <%
              		String consolidated = (String) client.getE02SFR();
              		
              		if( consolidated == null ) consolidated = "";
              		
              		if( consolidated.equals("M" ) )
              			consolidated = "Montlhy";
              		else if( consolidated.equals("Q" ) )
              			consolidated = "Quartely";
              		else if( consolidated.equals("S" ) )
              			consolidated = "Semiannually";
              		else if( consolidated.equals("W" ) )
              			consolidated = "Weekly";
              %>
             	<input name="E02SFR" value="<%=consolidated %>" readonly >

            <td nowrap width="25%"> 
              <div align="right">Consolidated Stmt. Day :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02SDY" size="2" maxlength="2" value="<%= client.getE02SDY().trim()%>" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              
            <td nowrap width="23%" > 
              <div align="right">Subject  to Taxes in U.S. :</div>
              </td>
              
            <td nowrap width="36%" > 
            	<input type="text" name="E02FG2" size="2" maxlength="1"
			  <% if (client.getF02FG2().equals("Y")) out.print("id=\"txtchanged\""); %>
			  value="<% if (client.getE02FG2().equals("Y")) { out.print("Yes"); }
						else if (client.getE02FG2().equals("N")) { out.print("No"); }%>" readonly >
            </td>
              
            <td nowrap width="25%" > 
              <div align="right"> Renewal Volume </div>
              </td>
              
            <td nowrap width="16%" > 
            <INPUT type="text" name="E02RLV" readonly
					value='<% if(client.getE02RLV().equals("T")) out.print("Total by Customer without Investments");
              				else if(client.getE02RLV().equals("1")) out.print("Total by Customer with Investments");
              				else if(client.getE02RLV().equals("A")) out.print("By Account");
              				else if(client.getE02RLV().equals("N")) out.print("None");
              				else if(client.getE02RLV().equals(" ")) out.print(" ");%>'
					size="30"></td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="18%" > 
              <div align="right">Inquiry Level :</div>
            </td>
            <td nowrap width="39%"> 
              <input type="text" readonly name="E02ILV" size="1" maxlength="1" value="<%= client.getE02ILV().trim()%>">
            </td>
      	 	<td nowrap width="25%">
              <div align="right">OBD :</div>
            </td>
            <td nowrap  width="31%">
				<input type="text" readonly name="E02UC4" size="8" maxlength="5" value="<%=client.getE02UC4().trim() %>" >
            </td>
            <td colspan="2">
            </td>
      </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="42%">
              <div align="right">Risk Level :</div>
            </td>
            <td nowrap width="58%" >
              <input type="text" name="E02RSL" size="5" maxlength="4" value="<%= client.getE02RSL().trim()%>" readonly>
            </td>
            <td nowrap  width="22%"> 
              <div align="right">Risk Rating Method :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" readonly name="E02FL2" size="2" maxlength="1" value="<%= client.getE02FL2().trim()%>">
            </td>
          </tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Loan Losses Table :</div>
            </td>
            <td nowrap> 
			<input type="text" readonly name="E02PRV" size="4" maxlength="2" value="<%= client.getE02PRV().trim()%>">
            </td>
		</tr>
        </table>
        </td>
      </tr>
    </table>
    <h4>Additional Information</h4>
    <table  class="tableinfo">
      <tr > 
        <td  nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="18%"> 
              <div align="right">Referred by :</div>
            </td>
            <td nowrap  width="36%"> 
              <input type="text" readonly <% if (client.getF02RBY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E02RBY" size="5" maxlength="4" value="<%= client.getE02RBY().trim()%>">
              <input type="text" readonly <% if (client.getF02RBN().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E02RBN" size="20" maxlength="15" value="<%= client.getE02RBN().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Resident :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E02FL1" size="3" maxlenth="3"
			  <% if (client.getF02FL1().equals("Y")) out.print("id=\"txtchanged\""); %>
			  value="<% if (client.getE02FL1().equals("1")) { out.print("Yes"); }
						else { out.print("No"); } %>" >
            </td>        
          </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td align="right">
          		Agency's Manager e-mail :</td>
   				<td nowrap>
					<input type="text" readonly
					<% if (client.getF02AME().equals("Y")) out.print("id=\"txtchanged\""); %>
					name="E02AME" size="56" maxlength="4"
					value="<%= client.getE02AME().trim()%>">
				</td>
            <td nowrap  width="21%"> 
              <div align="right">Extended Hold Reg.-CC :</div>
            </td>
            <td nowrap  width="25%"> 
              <input type="text" readonly name="E02FL4" size="4" maxlength="3" 
				value="<% if (client.getE02FL4().trim().equals("Y")) { out.print("Yes"); } 
                		   else if (client.getE02FL4().trim().equals("N")) { out.print("No"); }
				   else { out.print(""); } %>">
            </td>
            </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="18%" >
              <div align="right">Treasury Customer :</div>
            </td>
            <td nowrap width="39%">
              <input type="text" readonly name="E02FL5" size="4" maxlength="3" 
			value="<% if (client.getE02FL5().trim().equals("Y")) { out.print("Yes"); } 
                		   else if (client.getE02FL5().trim().equals("N")) { out.print("No"); }
				   else { out.print("No"); } %>">
            </td> 
            <td nowrap width="23%" > 
              <div align="right">ATM Card Issued :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly name="E02ATM" size="4" maxlength="3" 
			value="<% if (client.getE02ATM().trim().equals("1")) { out.print("Yes"); } 
                		   else if (client.getE02ATM().trim().equals("2")) { out.print("No"); }
				   else { out.print(""); } %>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="18%" >
              <div align="right">Customer denies to provide information :</div>
            </td>
            <td nowrap width="39%" colspan="3">
            	<input type="checkbox" name="E02FLB" disabled value="<%= client.getE02FLB().trim()%>"  <%if (client.getE02FLB().equals("X")) out.print("checked"); %>> Assets
             	<input type="checkbox" name="E02FLC" disabled value="<%= client.getE02FLC().trim()%>"  <%if (client.getE02FLC().equals("X")) out.print("checked"); %>> Liabilities
            </td>   
          </tr>            
        </table>
        </td>
      </tr>
    </table> 
    
  </form>
</body>
</html>
