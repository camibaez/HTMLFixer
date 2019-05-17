<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Personal Client</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(client_inq_personal_opt);
     
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
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%>

<h3 align="center">Individual Customer Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="H01WK3" VALUE="<%=client.getH01WK3().trim()%>">
    
	<%int row = 1; %>
  <h4> Basic</h4>
 
    <table  class="tableinfo">
      <tr > 
        <td nowrap > 
        
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr  id="trdark"> 
                <td nowrap width="33%"> 
                  <div align="right">Customer Number :</div>
                </td>
                <td nowrap width="67%"> 
                  <input type="text" readonly name="E01CUN" size="15" maxlength="10" value="<%= client.getE01CUN().trim()%>">
                </td>
              </tr>
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("short")) { %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Customer Name :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01NA1" size="35" maxlength="45" value="<%= client.getE01NA1().trim()%>" readonly>
            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">First Name :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FNA" size="25" maxlength="20" value="<%= client.getE01FNA().trim()%>" readonly>
            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Middle Name :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FN2" size="25" maxlength="20" value="<%= client.getE01FN2().trim()%>" readonly>
              
            </td>
          </tr>
		<%}%>	
		 <% if(datapro.eibs.master.JSEIBSProp.getCustomerInfoInputFormat().equals("long")) { %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Last Name :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01LN1" size="35" maxlength="30" value="<%= client.getE01LN1().trim()%>" readonly>
               
            </td>
          </tr>
		<%}%>	
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="33%"> 
                  <div align="right">Short Name :</div>
                </td>
                <td nowrap width="67%"> 
                  <input type="text" readonly name="E01SHN" size="25" maxlength="15" value="<%= client.getE01SHN().trim()%>">
                </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="33%"> 
                  <div align="right">Gender :</div>
                </td>
                <td nowrap colspan=2 width="67%"> 
                  <input type="text" readonly name="E01SEX" size="13" maxlength="13"
				  value="<% if (client.getE01SEX().equals("F")) { out.print("Female"); }
							else if (client.getE01SEX().equals("M")) { out.print("Male"); }
							else { out.print(""); } %>" >
                </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="33%" > 
                  <div align="right">Marital Status :</div>
                </td>
                <td nowrap colspan=2 width="67%" > 
                  <input type="text" readonly name="E01MST" size="13" maxlength="13"
                  value="<% if (client.getE01MST().equals("1")) { out.print("Single"); }
							else if (client.getE01MST().equals("2")) { out.print("Married"); }
	                    	else if (client.getE01MST().equals("3")) { out.print("Divorced"); }
							else if (client.getE01MST().equals("4")) { out.print("Widow"); }
							else if (client.getE01MST().equals("5")) { out.print("Cohabit"); }
							else { out.print(""); } %>" >
                </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="33%" > 
                  <div align="right">Dependents :</div>
                </td>
                <td nowrap  width="67%"> 
                  <p> 
                    <input type="text" readonly name="E01NSO" size="4" maxlength="2" value="<%= client.getE01NSO().trim()%>">
                  </p>
                </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap width="9%"> 
	              <div align="right">Date Of Birth :</div>
	            </td>
	            <td nowrap width="2%"> 
	              <input type="text" readonly name="E01BDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>">
	              <input type="text" readonly name="E01BDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>">
	              <input type="text" readonly name="E01BDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>">
	            </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap width="9%"> 
	              <div align="right">Place of Birth :</div>
	            </td>
	            <td nowrap width="2%"> 
                  <input type="text" readonly name="E01COB" size="5" maxlength="3" value="<%= client.getE01COB().trim()%>">
                  <input type="text" readonly name="D01COB" size="35" maxlength="35" value="<%= client.getD01COB().trim()%>">
	            </td>
              </tr>
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="33%" > 
                  <div align="right">Nationality :</div>
                </td>
                <td nowrap colspan=2 width="67%" >
                  <input type="text" readonly name="E01CCS" size="5" maxlength="3" value="<%= client.getE01CCS().trim()%>">
                  <input type="text" readonly name="D01CCS" size="35" maxlength="35" value="<%= client.getD01CCS().trim()%>">
                </td>
              </tr>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap width="35%"> 
	              <div align="right">Country of Residence :</div>
	            </td>
	            <td nowrap width="65%"> 
	              <input type="text" readonly name="E01GEC" size="5" maxlength="3" value="<%= client.getE01GEC().trim()%>">
	              <input type="text" readonly name="D01GEC" size="35" maxlength="35" value="<%= client.getD01GEC().trim()%>">
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
            <td nowrap width="68%" > 
              <input type="text" readonly name="E01NA2" size="45" maxlength="35" value="<%= client.getE01NA2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01NA3" size="45" maxlength="35" value="<%= client.getE01NA3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01NA4" size="45" maxlength="35" value="<%= client.getE01NA4().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01CTY" size="30" maxlength="30" value="<%= client.getE01CTY().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">State :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="D01STE" size="35" maxlength="35" value="<%= client.getD01STE().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">Country Code :</div>
            </td>
            <td nowrap width="68%"> 
            <input type="text" readonly name="E01UC5" size="35" maxlength="35" value="<%= client.getE01UC5().trim()%>">
            </td>
          </tr>          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01CTR" size="21" maxlength="20" value="<%= client.getE01CTR().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">P.O.Box :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01POB" size="15" maxlength="10" value="<%= client.getE01POB().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01ZPC" size="10" maxlength="15" value="<%= client.getE01ZPC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">Mailing Code :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01MLC" size="6" maxlength="4" value="<%= client.getE01MLC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%"> 
              <div align="right">E-mail :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" readonly name="E01IAD" size="30" maxlength="40" value="<%= client.getE01IAD().trim()%>">
              Denies Information<input type="checkbox" name="E01FLA" disabled value="<%= client.getE01FLA().trim()%>" <%if (client.getE01FLA().equals("X")) out.print("checked");%> > 
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
  <h4>Identification</h4>
    
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%">
              <div align="right">ID Number :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" readonly name="E01IDN" size="16" maxlength="15" value="<%= client.getE01IDN().trim()%>">
            </td>
            <td nowrap width="7%">
              <div align="right">Type :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" readonly name="D01TID" size="35" maxlength="35" value="<%= client.getD01TID().trim()%>">
            </td>
            <td nowrap width="10%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" readonly name="D01PID" size="35" maxlength="35" value="<%= client.getD01PID().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">D.L. Issue Date :</div>
            </td>
            <td nowrap> 
				<input type="text" readonly name="E01I11" size="2" maxlength="2" value="<%= client.getE01I11().trim()%>" >            
				<input type="text" readonly name="E01I12" size="2" maxlength="2" value="<%= client.getE01I12().trim()%>" >
				<input type="text" readonly name="E01I13" size="2" maxlength="2" value="<%= client.getE01I13().trim()%>" >
             </td>
            <td nowrap> 
              <div align="right">D.L. Expiration Date :</div>
            </td>
            <td nowrap> 
				<input type="text" readonly name="E01E11" size="2" maxlength="2" value="<%= client.getE01E11().trim()%>" >            
				<input type="text" readonly name="E01E12" size="2" maxlength="2" value="<%= client.getE01E12().trim()%>" >
				<input type="text" readonly name="E01E13" size="2" maxlength="2" value="<%= client.getE01E13().trim()%>" >
             </td>
            <td nowrap> 
              <div align="right">D.L. Issue State :</div>
            </td>
            <td nowrap> 
                <input type="text" readonly name="E01SI1" size="5" maxlength="4" value="<%= client.getE01SI1().trim()%>">
             </td>
          </tr>                    
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Second Identification</h4>
    
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%">
              <div align="right">ID Number :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" readonly name="E01IDF" size="16" maxlength="15" value="<%= client.getE01IDF().trim()%>">
            </td>
            <td nowrap width="7%">
              <div align="right">Type :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" readonly name="D01TIF" size="35" maxlength="35" value="<%= client.getD01TIF().trim()%>">
            </td>
            <td nowrap width="10%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="24%">
              <input type="text" readonly name="D01PIF" size="35" maxlength="35" value="<%= client.getD01PIF().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">D.L. Issue Date :</div>
            </td>
            <td nowrap> 
				<input type="text" readonly name="E01I21" size="2" maxlength="2" value="<%= client.getE01I21().trim()%>" >            
				<input type="text" readonly name="E01I22" size="2" maxlength="2" value="<%= client.getE01I22().trim()%>" >
				<input type="text" readonly name="E01I23" size="2" maxlength="2" value="<%= client.getE01I23().trim()%>" >
             </td>
            <td nowrap> 
              <div align="right">D.L. Expiration Date :</div>
            </td>
            <td nowrap> 
				<input type="text" readonly name="E01E21" size="2" maxlength="2" value="<%= client.getE01E21().trim()%>" >            
				<input type="text" readonly name="E01E22" size="2" maxlength="2" value="<%= client.getE01E22().trim()%>" >
				<input type="text" readonly name="E01E23" size="2" maxlength="2" value="<%= client.getE01E23().trim()%>" >
             </td>
            <td nowrap> 
              <div align="right">D.L. Issue State :</div>
            </td>
            <td nowrap> 
                <input type="text" readonly name="E01SI2" size="5" maxlength="4" value="<%= client.getE01SI2().trim()%>">
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
              <input type="text" readonly name="E01PHN" size="11" maxlength="6" value="<%= client.getE01PHN().trim()%>" class="input_phone_area">
              <input type="text" readonly name="E01HPN" size="12" maxlength="10" value="<%= client.getE01HPN().trim()%>" class="input_phone" >
            </td>
            <td nowrap width="29%">
				<div align="right">Cellular :</div>
            </td>
            <td nowrap width="23%">
			  <input type="text" readonly name="E01FAX" size="11" maxlength="6" value="<%= client.getE01FAX().trim()%>" class="input_phone_area">
              <input type="text" readonly name="E01PH1" size="12" maxlength="10" value="<%= client.getE01PH1().trim()%>" class="input_phone" >
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
            <td nowrap width="23%">
              <div align="right">First Contact :</div>
            </td>
            <td nowrap width="41%">
              <input type="text" readonly name="E01IDM" size="3" maxlength="2" value="<%= client.getE01IDM().trim()%>">
              <input type="text" readonly name="E01IDD" size="3" maxlength="2" value="<%= client.getE01IDD().trim()%>">
              <input type="text" readonly name="E01IDY" size="3" maxlength="2" value="<%= client.getE01IDY().trim()%>">
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">Main Officer :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01OFC" size="5" maxlength="3" value="<%= client.getE01OFC().trim()%>">
              <input type="text" readonly name="D01OFC" size="35" maxlength="35" value="<%= client.getD01OFC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">Substitude Officer :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01OF2" size="5" maxlength="3" value="<%= client.getE01OF2().trim()%>">
              <input type="text" readonly name="D01OF2" size="35" maxlength="35" value="<%= client.getD01OF2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">Industry Code :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01INC" size="5" maxlength="3" value="<%= client.getE01INC().trim()%>">
              <input type="text" readonly name="D01INC" size="35" maxlength="35" value="<%= client.getD01INC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">Business Line :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01BUC" size="5" maxlength="3" value="<%= client.getE01BUC().trim()%>">
              <input type="text" readonly name="D01BUC" size="35" maxlength="35" value="<%= client.getD01BUC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">User Code 1 :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01UC1" size="5" maxlength="3" value="<%= client.getE01UC1().trim()%>">
              <input type="text" readonly name="D01UC1" size="35" maxlength="35" value="<%= client.getD01UC1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%"> 
              <div align="right">User Code 2 :</div>
            </td>
            <td nowrap width="65%"> 
              <input type="text" readonly name="E01UC2" size="5" maxlength="3" value="<%= client.getE01UC2().trim()%>">
              <input type="text" readonly name="D01UC2" size="35" maxlength="35" value="<%= client.getD01UC2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="35%"> 
              <div align="right">User Code 3 :</div>
            </td>
            <td nowrap  width="65%"> 
              <input type="text" readonly name="E01UC3" size="5" maxlength="3" value="<%= client.getE01UC3().trim()%>">
              <input type="text" readonly name="D01UC3" size="35" maxlength="35" value="<%= client.getD01UC3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  width="29%">
              <div align="right">Politically  Exposed Person :</div>
            </td>
            <td nowrap  width="17%">
              Yes<input type="radio" name="E01FG1"  disabled value="Y" <%if(client.getE01FG1().trim().equals("Y"))out.print("checked"); %> >
              No<input type="radio" name="E01FG1"  disabled value="N" <%if(!client.getE01FG1().trim().equals("Y"))out.print("checked"); %> >
            </td>
            <td nowrap  width="33%">
              <div align="right"> </div>
            </td>
            <td nowrap  width="21%">
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
            <td nowrap width="41%"> 
              <div align="right">Income Level :</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" readonly <% if (client.getF01INL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01INL" size="21" maxlength="20" 
              value="<% if (client.getE01INL().equals("1")) { out.print("0 - 50.000"); }
							else if (client.getE01INL().equals("2")) { out.print("50.000 - 100.000"); }
							else if (client.getE01INL().equals("3")) { out.print("100.000 - 250.000"); }
							else if (client.getE01INL().equals("4")) { out.print("Over 250.000"); }
							else { out.print(""); } %>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="41%"> 
              <div align="right">Source of Income :</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" readonly <% if (client.getF01SOI().equals("Y")) out.print("id=\"txtchanged\""); %> name="D01SOI" size="35" maxlength="35" value="<%= client.getD01SOI().trim()%>">
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
              
            <td nowrap width="23%"> 
              <div align="right">Customer Status :</div>
              </td>
              
            <td nowrap width="36%"> 
            <input type="text" readonly name="E01STS" size="15" maxlength="15"
			  value="<% if (client.getE01STS().equals("1")) { out.print("Active"); }
					  	else if (client.getE01STS().equals("2")) { out.print("Inactive"); }
						else if (client.getE01STS().equals("3")) { out.print("Black List"); }
						else { out.print(""); } %> " >
            </td>
              
            <td nowrap width="25%"> 
              <div align="right">Customer Class :</div>
              </td>
              
            <td nowrap width="16%"> 
              <input type="text" readonly name="E01CCL" size="3" maxlength="1" value="<%= client.getE01CCL().trim()%>">
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              
            <td nowrap width="23%" > 
              <div align="right">Customer Type :</div>
              </td>
              
            <td nowrap width="36%" > 
              <input type="text" readonly name="E01TYP" size="10" maxlength="10"
			  value="<% if (client.getE01TYP().equals("R")) { out.print("Regular"); }
						else if (client.getE01TYP().equals("M")) { out.print("Master"); }	
						else if (client.getE01TYP().equals("G")) { out.print("Group"); }
						else { out.print("Grupo"); } %>" >
			</td>
            <td nowrap width="25%" > 
              <div align="right">Group Number :</div>
              </td>
              
            <td nowrap width="16%" > 
              <input type="text" readonly name="E01GRP" size="10" maxlength="9" value="<%= client.getE01GRP().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              
            <td nowrap width="23%"> 
              <div align="right">Language :</div>
              </td>
              
            <td nowrap width="36%"> 
              <input type="text" readonly name="E01LIF" size="10" maxlength="10"
			  value="<% if (client.getE01LIF().equals("S")) { out.print("Spanish"); }
						else if (client.getE01LIF().equals("E")) { out.print("English"); }
						else { out.print(""); } %>" >
			</td>
              
            <td nowrap width="25%"> 
              <div align="right">Withholding Table :</div>
              </td>
              
            <td width="16%"> 
              <input type="text" readonly name="E01TAX" size="3" maxlength="1" value="<%= client.getE01TAX().trim()%>">
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="25%"> 
            	<div align="right">Subject  to Taxes in U.S. :</div>
            </td>
              
            <td width="16%">
            	<input type="text" readonly name="E01FG2" size="2" maxlength="1"
			  	value="<% if (client.getE01FG2().equals("Y")) { out.print("Yes"); }
				else if (client.getE01FG2().equals("N")) { out.print("No"); }%>" >
            </td>
				<TD width="25%" align="right">Renewal Volume :</TD>
				<TD width="16%"><INPUT type="text" name="E01RLV" readonly
					value='<% if(client.getE01RLV().equals("T")) out.print("Total by Customer without Investments");
              				else if(client.getE01RLV().equals("1")) out.print("Total by Customer with Investments");
              				else if(client.getE01RLV().equals("A")) out.print("By Account");
              				else if(client.getE01RLV().equals("N")) out.print("None");
              				else if(client.getE01RLV().equals(" ")) out.print(" ");%>'
					size="30"></TD>
			</TR>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">        
            <td width="23%"> 
              <div align="right">Consolidated Stmt. Freq. :</div>
              </td>              
            <td nowrap width="36%"> 
              <input type="text" name="E01SFR" 
              		value="<%if (!(client.getE01SFR().equals("M")||client.getE01SFR().equals("Q") ||client.getE01SFR().equals("S")))  out.print(" "); 
              				else if (client.getE01SFR().equals("M")) out.print("Monthly");
              				else if (client.getE01SFR().equals("Q")) out.print("Quarterly");
              				else if (client.getE01SFR().equals("S")) out.print("selected");%>" readonly />
            </td>       
            <td nowrap width="25%" > 
               <div align="right">Consolidated Stmt. Day :</div>
              </td>              
            <td nowrap width="16%" > 
            	<input type="text" name="E01SDY" size="3" maxlength="2" value="<%= client.getE01SDY().trim()%>" readonly>
            </td>            
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="21%"> 
              <div align="right">Inquiry Level :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (client.getF01ILV().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ILV" size="4" maxlength="1" value="<%= client.getE01ILV().trim()%>">
            </td>
          	<td nowrap width="25%">
              <div align="right">OBD :</div>
            </td>
            <td nowrap  width="31%">
				<input type="text" readonly  name="E01UC4" size="8" maxlength="5" value="<%=client.getE01UC4().trim() %>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="41%"> 
              <div align="right">Risk Level :</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" readonly name="D01RSL" size="35" maxlength="35" value="<%= client.getD01RSL().trim()%>">
            </td>
              
            <td width="23%"> 
              <div align="right">Risk Rating Method</div>
              </td>
              
            <td width="36%"> 
              <input type="text" readonly name="E01FL2" size="3" maxlength="1" value="<%= client.getE01FL2().trim()%>">
              </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
		    <td> 
              <div align="right">Loan Losses Table :</div>
              </td>
            <td colspan="3">
              <input type="text" readonly name="E01PRV" size="4" maxlength="2" value="<%= client.getE01PRV().trim()%>">
            </td>
           </tr>
		</table>
        </td>
      </tr>
    </table>
    
  <h4>Additional Information</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td align="right" width="15%">
          		Agency's Manager e-mail :
          	</td>
   			<td nowrap width="35%">
				<input type="text" readonly
				name="E01AME" size="56" maxlength="4"
				value="<%= client.getE01AME().trim()%>">
			</td>
            <td nowrap width="15%"> 
              <div align="right">Education Level :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly <% if (client.getF01EDL().equals("Y")) out.print("id=\"txtchanged\""); %> name="D01EDL" size="35" maxlength="35" value="<%= client.getD01EDL().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="19%"> 
              <div align="right">Referred by :</div>
            </td>
            <td nowrap  width="35%"> 
              <input type="text" readonly <% if (client.getF01RBY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01RBY" size="5" maxlength="4" value="<%= client.getE01RBY().trim()%>">
              <input type="text" readonly <% if (client.getF01RBN().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01RBN" size="20" maxlength="15" value="<%= client.getE01RBN().trim()%>">
            </td>
            <td nowrap  width="21%"> 
              <div align="right">Relationship to Officer :</div>
            </td>
            <td nowrap  width="25%"> 
              <input type="text" readonly name="E01FL3" size="15" maxlength="15"
			  <% if (client.getF01FL3().equals("Y")) out.print("id=\"txtchanged\""); %>
              value="<% if (client.getE01FL3().equals("1")) { out.print("None"); }
						else if (client.getE01FL3().equals("2")) { out.print("Cousin"); }
						else if (client.getE01FL3().equals("3")) { out.print("Father"); }
						else if (client.getE01FL3().equals("4")) { out.print("Mother"); }
               			else if (client.getE01FL3().equals("5")) { out.print("Brother/Sister"); }
						else if (client.getE01FL3().equals("6")) { out.print("Spouse"); }
               			else if (client.getE01FL3().equals("7")) { out.print("Grandparent"); }
						else { out.print(""); } %>" >
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%"> 
              <div align="right">Staff Member :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly <% if (client.getF01STF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01STF" size="3" maxlength="3" value="<% if (client.getE01STF().equals("1")) { out.print("Yes"); }
						else { out.print("No"); } %>" >

            </td>
            <td nowrap width="21%"> 
              <div align="right">Resident :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01FL1" size="3" maxlenth="3"
			  <% if (client.getF01FL1().equals("Y")) out.print("id=\"txtchanged\""); %>
			  value="<% if (client.getE01FL1().equals("1")) { out.print("Yes"); }
						else { out.print("No"); } %>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%"> 
              <div align="right">ATM Card Issued :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly <% if (client.getF01ATM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ATM" size="3" maxlength="3" 
			value="<% if (client.getE01ATM().trim().equals("1")) { out.print("Yes"); } 
                		   else if (client.getE01ATM().trim().equals("2")) { out.print("No"); }
				   else { out.print(""); } %>" >

            </td>
			<td nowrap width="21%"> 
              <div align="right">Treasury Customer :</div>
            </td>
			<td nowrap width="25%">
              <input type="text" readonly name="E01FL5" size="4" maxlength="3" 
			value="<% if (client.getE01FL5().trim().equals("Y")) { out.print("Yes"); } 
                		   else if (client.getE01FL5().trim().equals("N")) { out.print("No"); }
				   else { out.print("No"); } %>">
            </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		    <td nowrap width="19%"> 
              <div align="right">Extended Hold Reg.-CC :</div>
           </td>
			<td nowrap width="35%" colspan="3"> 
              <input type="text" readonly name="E01FL4" size="4" maxlength="3" 
				value="<% if (client.getE01FL4().trim().equals("Y")) { out.print("Yes"); } 
                		   else if (client.getE01FL4().trim().equals("N")) { out.print("No"); }
				   else { out.print(""); } %>">
            </td>
		  </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Customer denies to provide information :</div>
            </td>
           <td nowrap width="80%" colspan="3">             	
             	<input type="checkbox" name="E01FLB" disabled value="<%= client.getE01FLB().trim()%>" <%if (client.getE01FLB().equals("X")) out.print("checked"); %>> Assets
             	<input type="checkbox" name="E01FLC" disabled value="<%= client.getE01FLC().trim()%>" <%if (client.getE01FLC().equals("X")) out.print("checked"); %>> Liabilities
            </td>   
          </tr>              
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

