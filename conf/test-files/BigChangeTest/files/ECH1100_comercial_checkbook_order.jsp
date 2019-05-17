<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Corporate Client Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="account" class="datapro.eibs.beans.ECH110001Message" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="Javascript">
<% if (userPO.getPurpose().equals("NEW")) {%>
   builtNewMenu(rt_n_opt);
   initMenu();
<% } else if (userPO.getPurpose().equals("MAINTENANCE")) {%>
   builtNewMenu(rt_m_opt);
   initMenu();
<% } %>
</SCRIPT>
</head>

<body> 
<h3 align="center">Comercial Checks Order<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="comercial_checkbook_order, ECH1100" ></h3>
<hr size="4">
<form method="post" action="https://connectionpoint.clarkeamerican.com/cda/processformpost" target="interface">
  
  <input type="hidden" readonly name="USERID" size="8" maxlength="8" value="HVIHFGL1">
  <input type="hidden" readonly name="PASSWORD" size="8" maxlength="8" value="Grb63">
  <input type="hidden" readonly name="PARTNER_USERID" size="15" maxlength="15" value="<%= account.getE01PARTNER()%>">
  <input type="hidden" readonly name="ACCTYPE" size="4" maxlength="3" value="<%= account.getE01ACCTYPE()%>">
  <input type="hidden" readonly name="BANKID" size="10" maxlength="9" value="<%= account.getE01BANKID()%>">
  <input type="hidden" readonly name="BRANCHID" size="6" maxlength="5" value="<%= account.getE01BRANCHI()%>">
                      
  <input type="hidden" readonly name="TITLEADDR1" size="45" maxlength="40" value="">
  <input type="hidden" readonly name="TITLEADDR2" size="45" maxlength="40" value="">
  <input type="hidden" readonly name="TITLEADDR3" size="45" maxlength="40" value="">
  <input type="hidden" readonly name="TITLEADDR4" size="45" maxlength="40" value="">
             
  <h4>Basic Information</h4>
  <table  class="tableinfo">
      <tr > 
        <td nowrap>           
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Account Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="ACCTID" size="22" maxlength="20" value="<%= account.getE01ACCTID()%>">
            </td>
          </tr>
          
          
          <tr id="trclear"> 
              <td nowrap  width="39%"> 
                <div align="right">Account Open Date :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="ACCTOPNDT" size="6" maxlength="5" value="<%= account.getE01ACCTOPN()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Product Code :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="CHKBKSTYLEID" size="10" maxlength="8" value="<%= account.getE01CHKBKST()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Starting Check Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="CHKNUMSTART" size="6" maxlength="5" value="<%= account.getE01CHKNUMS()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">SP/ Club Code :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="SPCD" size="3" maxlength="2" value="<%= account.getE01SPCD()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Bill Code :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="BILLCD" size="3" maxlength="1" value="<%= account.getE01BILLCD()%>">
            </td>
          </tr>
          
        </table>
        </td>
      </tr>
    </table>
    
    
    
    <h4>Customer Information</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Company Name :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="COMPANYNAME" size="50" maxlength="40" value="<%= account.getE01COMPANY()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="LEGALNAME" size="50" maxlength="40" value="<%= account.getE01LEGALNM()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Tax ID Number :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="TAXID" size="12" maxlength="10" value="<%= account.getE01TAXID()%>">
            </td>
          </tr>
            <tr id="trdark"> 
              <td nowrap  width="39%" > 
                <div align="right">Main Address :</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="ADDR1" size="35" maxlength="30" value="<%= account.getE01ADDR1()%>">
              </td>
            </tr>
            <tr id="trclear"> 
       
              <td nowrap width="39%" > 
                <div align="right">City:</div>
              </td>
              <td nowrap  width="61%" > 
                <input type="text" readonly name="CITY" size="16" maxlength="15" value="<%= account.getE01CITY()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  width="39%" > 
                <div align="right">State :</div>
              </td>
              <td nowrap width="61%" > 
                <input type="text" readonly name="STATEPROV" size="3" maxlength="2" value="<%= account.getE01STATEPR()%>">
              </td>
            </tr>           
            <tr id="trclear"> 
              <td nowrap  width="39%"> 
                <div align="right">Zip Code :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="POSTALCODE" size="12" maxlength="10" value="<%= account.getE01POSTALC()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">Phone Number :</div>
              </td>
              <td nowrap  width="61%"> 
                <input type="text" readonly name="PHONE_NOSEND" size="15" maxlength="13" value="<%= account.getE01PHONE()%>">
              </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
     
  <p align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p> 
    
  </form>
</body>
</html>
