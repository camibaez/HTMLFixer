<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Credit Card</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="ccNew" class="datapro.eibs.beans.ECC001001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="javascript">
 
	builtNewMenu(cc_a_opt);
 
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
 out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 

</head>
<body>
<h3 align="center">Credit Card<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cc_ap_basic.jsp,ECC0140"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="E01CCMBNK" VALUE="<%= ccNew.getE01CCMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCMATY" VALUE="<%= ccNew.getE01CCMATY().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer / Portfolio :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCMCUN" size="9" maxlength="9" readonly value="<%= ccNew.getE01CCMCUN().trim()%>" >
           </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= ccNew.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E01CCMACC" size="12" maxlength="9" value="<%= ccNew.getE01CCMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMCCY" size="3" maxlength="3" value="<%= ccNew.getE01CCMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCMPRO" size="4" maxlength="4" value="<%= ccNew.getE01CCMPRO().trim()%>" readonly>
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
              <input type="text" readonly <% if (ccNew.getF01CCMOPM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMOPM" size="3" maxlength="2" value="<%= ccNew.getE01CCMOPM().trim()%>" >
              <input type="text" readonly <% if (ccNew.getF01CCMOPD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMOPD" size="3" maxlength="2" value="<%= ccNew.getE01CCMOPD().trim()%>" >
              <input type="text" readonly <% if (ccNew.getF01CCMOPY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMOPY" size="5" maxlength="4" value="<%= ccNew.getE01CCMOPY().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMEXM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMEXM" size="3" maxlength="2" value="<%= ccNew.getE01CCMEXM().trim()%>" >
              <input type="text" readonly <% if (ccNew.getF01CCMEXD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMEXD" size="3" maxlength="2" value="<%= ccNew.getE01CCMEXD().trim()%>" >
              <input type="text" readonly <% if (ccNew.getF01CCMEXY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMEXY" size="5" maxlength="4" value="<%= ccNew.getE01CCMEXY().trim()%>" >
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Table Fees :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMTBL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMTBL" size="2" maxlength="2" value="<%= ccNew.getE01CCMTBL().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fifth/Numb :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" readonly <% if (ccNew.getF01CCMNXN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMNXN" size="21" maxlength="20" value="<%= ccNew.getE01CCMNXN().trim()%>">            
 			</td>
          </tr>         
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Design Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMDCD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMDCD" size="5" maxlength="4" value="<%= ccNew.getE01CCMDCD().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Embossing Code :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" readonly <% if (ccNew.getF01CCMECD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMECD" size="5" maxlength="4" value="<%= ccNew.getE01CCMECD().trim()%>">  
 			</td>
          </tr> 
           <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Rates Table :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMROT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMROT" size="3" maxlength="2" value="<%= ccNew.getE01CCMROT().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Renewal Code :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" readonly <% if (ccNew.getF01CCMRNC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMRNC" size="5" maxlength="4" value="<%= ccNew.getE01CCMRNC().trim()%>">            
 			</td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Collection Type :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMCLT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCLT" size="3" maxlength="2" value="<%= ccNew.getE01CCMCLT().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Overdraft :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="radio" disabled name="E01CCMODA" value="Y" <%if(ccNew.getE01CCMODA().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01CCMODA" value="N" <%if(ccNew.getE01CCMODA().equals("N")) out.print("checked");%>>No             
 			</td>
          </tr>            
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Billing Cycle :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMCFA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCFA" size="3" maxlength="2" value="<%= ccNew.getE01CCMCFA().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">FV Code :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMCPM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCPM" size="5" maxlength="4" value="<%= ccNew.getE01CCMCPM().trim()%>"> 
 			</td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Account Status :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMAST().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMAST" size="2" maxlength="1" value="<%= ccNew.getE01CCMAST().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Primary Card Number :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMPCN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMPCN" size="21" maxlength="20" value="<%= ccNew.getE01CCMPCN().trim()%>"> 
 			</td>
          </tr>                
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Discount Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMRBC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMRBC" size="2" maxlength="1" value="<%= ccNew.getE01CCMRBC().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">National Amount Limit :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMLBC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMLBC" size="17" maxlength="16" value="<%= ccNew.getE01CCMLBC().trim()%>" > 
 			</td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">International Amount Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMLFC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMLFC" size="17" maxlength="16" value="<%= ccNew.getE01CCMLFC().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Amount for the Line :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMLNL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMLNL" size="17" maxlength="16" value="<%= ccNew.getE01CCMLNL().trim()%>" > 
 			</td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Advances Amount :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMLAD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMLAD" size="17" maxlength="16" value="<%= ccNew.getE01CCMLAD().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Amount of Pmts. :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMLQT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMLQT" size="17" maxlength="16" value="<%= ccNew.getE01CCMLQT().trim()%>" > 
 			</td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Minimum Payment Type :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMTPM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMTPM" size="2" maxlength="1" value="<%= ccNew.getE01CCMTPM().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Minimum Payment Amount :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMMPA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMMPA" size="17" maxlength="16" value="<%= ccNew.getE01CCMMPA().trim()%>" > 
 			</td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">National Amount to Apply :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMUNB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMUNB" size="17" maxlength="16" value="<%= ccNew.getE01CCMUNB().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">International Amount to Apply :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMUNF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMUNF" size="17" maxlength="16" value="<%= ccNew.getE01CCMUNF().trim()%>" > 
 			</td>
          </tr>      
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Collection Code 2 :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMCC2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCC2" size="5" maxlength="4" value="<%= ccNew.getE01CCMCC2().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Balance Transfer Code :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMCTS().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCTS" size="2" maxlength="1" value="<%= ccNew.getE01CCMCTS().trim()%>" > 
 			</td>
          </tr>      
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">VIP Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMVIP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMVIP" size="2" maxlength="1" value="<%= ccNew.getE01CCMVIP().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">No. Cards ADI :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMNCC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMNCC" size="8" maxlength="7" value="<%= ccNew.getE01CCMNCC().trim()%>" > 
 			</td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Repayment Account :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMRPA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMRPA" size="11" maxlength="10" value="<%= ccNew.getE01CCMRPA().trim()%>" > 
            </td>
            <td nowrap width="25%">
            	<div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly <% if (ccNew.getF01CCMCCN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCCN" size="8" maxlength="6" value="<%= ccNew.getE01CCMCCN().trim()%>" >
            </td>
          </tr>           
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Instalment Purchase :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMCCU().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMCCU" size="2" maxlength="1" value="<%= ccNew.getE01CCMCCU().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Portfolio Type :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMTCI().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMTCI" size="2" maxlength="1" value="<%= ccNew.getE01CCMTCI().trim()%>" > 
 			</td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Statement Number :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" readonly <% if (ccNew.getF01CCMNST().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMNST" size="7" maxlength="6" value="<%= ccNew.getE01CCMNST().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Folder :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly <% if (ccNew.getF01CCMFOL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01CCMFOL" size="7" maxlength="6" value="<%= ccNew.getE01CCMFOL().trim()%>" > 
 			</td>
          </tr>             
        </table>
      </td>
    </tr>
  </table>
  <br>
  </form>
</body>
</html>
