<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Payment Conditions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnPyCn" class="datapro.eibs.beans.EDL015008Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
		builtNewMenu(pm_cnd_opt);

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
 
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
 
  // Initial Conditions
  String I08_DEAIPD, I08_DEAPPD;
  boolean I08_isDEAIPDNum = true;
  boolean I08_isDEAPPDNum = true;
  I08_DEAIPD = lnPyCn.getI08DEAIPD().trim();
  I08_DEAPPD = lnPyCn.getI08DEAPPD().trim();
  
  try {
    int i = Integer.parseInt(I08_DEAIPD);
  }
  catch (Exception e) {
    I08_isDEAIPDNum = false;
  }
  try {
    int i = Integer.parseInt(I08_DEAPPD);
  }
  catch (Exception e) {
    I08_isDEAPPDNum = false;
  }
  
  // New Conditions
  String DEAIPD, DEAPPD;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  DEAIPD = lnPyCn.getE08DEAIPD().trim();
  DEAPPD = lnPyCn.getE08DEAPPD().trim();
  
  try {
    int i = Integer.parseInt(DEAIPD);
  }
  catch (Exception e) {
    isDEAIPDNum = false;
  }
  try {
    int i = Integer.parseInt(DEAPPD);
  }
  catch (Exception e) {
    isDEAPPDNum = false;
  }
  
  
%> 
<h3 align="center"> Payment Conditions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_inq_payment_conditions.jsp,EDL0150"> 
</h3>
<hr size="4">
<form name="loan_basic" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="64">

  <br>
  
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer/Portfolio :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E08DEACUN" size="9" maxlength="9" value="<%= lnPyCn.getE08DEACUN().trim() %>" readonly>
               </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E08CUSNA1" size="45" maxlength="45" value="<%= lnPyCn.getE08CUSNA1().trim() %>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E08DEAACC" size="12" maxlength="12" value="<%= lnPyCn.getE08DEAACC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E08DEACCY" size="4" maxlength="3" value="<%= lnPyCn.getE08DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E08DEAPRO" size="7" maxlength="4" value="<%= lnPyCn.getE08DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Initial Conditions</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E08DEAOD1" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAOD1().trim()%>" readonly>
              <input type="text" name="E08DEAOD2" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAOD2().trim()%>" readonly>
              <input type="text" name="E08DEAOD3" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAOD3().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Term :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text"  name="E08DEATRM" size="4" maxlength="4" value="<%= lnPyCn.getE08DEATRM().trim()%>" readonly>
              <input type="text"  name="E08DEATRC" size="15" maxlength="15" readonly 
				  value="<% if (lnPyCn.getE08DEATRC().equals("M")) out.print("Month(s)");
							else if (lnPyCn.getE08DEATRC().equals("D")) out.print("Day(s)");
							else if (lnPyCn.getE08DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 	>
             </td>
         </tr>
        <tr id="trclear"> 
      <td nowrap width="33%" > 
         <div align="right">Maturity Date :</div>
      </td>
      <td nowrap colspan="2"> 
         <input type="text" name="E08DEAMD1" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAMD1().trim()%>" readonly>
         <input type="text" name="E08DEAMD2" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAMD2().trim()%>" readonly>
         <input type="text" name="E08DEAMD3" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAMD3().trim()%>" readonly>
      </td>
      <td nowrap width="22%" > 
         <div align="right">Rate :</div>
      </td>
      <td nowrap colspan="2" > 
         <input type="text" name="E08DEARTE" size="10" maxlength="9" value="<%= lnPyCn.getE08DEARTE().trim()%>" readonly>
      </td>
   </tr>
   <tr id="trdark"> 
      <td nowrap width="33%" > 
         <div align="right">Original Amount :</div>
      </td>
      <td nowrap colspan="2"> 
         <input type="text" name="E08DEAOAM" size="16" maxlength="15" value="<%= lnPyCn.getE08DEAOAM().trim()%>" readonly>
      </td>
      <td nowrap width="22%" > 
         <div align="right">Principal Balance :</div>
      </td>
      <td nowrap colspan="2"> 
         <input type="text" name="E08DEAMEP" size="16" maxlength="15" value="<%= lnPyCn.getE08DEAMEP().trim()%>" readonly>
       </td>
      </tr>
     </table>
     </td>
    </tr>
   </table>
<br>
<h4>BEFORE</h4>
  <% if(I08_DEAPPD.equals("MAT")) { %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Maturity (MAT) </h4>
		</td>
	</tr>
  </table>
  <%}%> <% if(I08_isDEAIPDNum && I08_DEAPPD.equals("MAT")){ %> 
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> 
            	<input type="text" name="I08DEAIPD" size="4" maxlength="3" value="<%= lnPyCn.getI08DEAIPD().trim()%>" readonly> 
            </td>
            <td nowrap width="22%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="I08DEARD1" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD1().trim()%>" readonly>
              <input type="text" name="I08DEARD2" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD2().trim()%>" readonly>
              <input type="text" name="I08DEARD3" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
           	<td nowrap width="15%"> 
           		<input type="text" name="I08DEAPPD" size="4" maxlength="3" value="<%= lnPyCn.getI08DEAPPD().trim()%>" readonly> 
           	</td>
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
   <%}%> <% if(I08_isDEAIPDNum && I08_isDEAPPDNum){ %> 
   <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Cycles </h4>
		</td>
	</tr>
  </table>  
 <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle:</div>
            </td>
           	<td nowrap width="15%"> 
           		<input type="text" name="I08DEAIPD" size="4" maxlength="3" value="<%= lnPyCn.getI08DEAIPD().trim()%>" readonly> 
           	</td>

            <td nowrap width="23%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%"> 
              <input type="text" name="IPRXPAG11" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD1().trim()%>" readonly>
              <input type="text" name="IPRXPAG12" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD2().trim()%>" readonly>
              <input type="text" name="IPRXPAG13" size="2" maxlength="2" value="<%= lnPyCn.getI08DEARD3().trim()%>" readonly>              
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> 
            	<input type="text" name="I08DEAPPD" size="4" maxlength="3" value="<%= lnPyCn.getI08DEAPPD().trim()%>" readonly> 
            </td>            	         
            <td nowrap width="23%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%"> 
              <input type="text" name="IPRXHAG11" size="2" maxlength="2" value="<%= lnPyCn.getI08DEAHE1().trim()%>" readonly>
              <input type="text" name="IPRXHAG12" size="2" maxlength="2" value="<%= lnPyCn.getI08DEAHE2().trim()%>" readonly>
              <input type="text" name="IPRXHAG13" size="2" maxlength="2" value="<%= lnPyCn.getI08DEAHE3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="I08DEAROA" size="15" maxlength="13" value="<%= lnPyCn.getI08DEAROA().trim()%>" readonly>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2" width="29%" > 
              <input type="radio" disabled name="I08DEAIIP" value="Y" <%if(lnPyCn.getI08DEAIIP().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="I08DEAIIP" value="N" <%if(lnPyCn.getI08DEAIIP().equals("N")) out.print("checked");%>>No 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 
   <%}%> <% if(I08_DEAIPD.equals("SC1") && I08_DEAPPD.equals("SC1")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Fixed Payment Amount (SC1 - Amortization Schedule)</h4>
		</td>
	</tr>
  </table>
 
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="FRCFP01" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCFP1().trim()%>" readonly>
              <select name="FRCTP01" disabled>
                <option value=" " <% if (!(lnPyCn.getI08DLCTP1().equals("D") ||lnPyCn.getI08DLCTP1().equals("M")||lnPyCn.getI08DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getI08DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getI08DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getI08DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Prepaid Interest :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="I08DLCPM1"  size="2" maxlength="2" value="<%= lnPyCn.getI08DLCPM1().trim()%>" readonly>
              <input type="text" name="I08DLCPD1"  size="2" maxlength="2" value="<%= lnPyCn.getI08DLCPD1().trim()%>" readonly>
              <input type="text" name="I08DLCPY1"  size="2" maxlength="2" value="<%= lnPyCn.getI08DLCPY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="I08DLCGM1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCGM1().trim()%>" readonly>
              <input type="text" name="I08DLCGD1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCGD1().trim()%>" readonly>
              <input type="text" name="I08DLCGY1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCGY1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">First Payment Date :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="I08DLCXM1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCXM1().trim()%>" readonly>
              <input type="text" name="I08DLCXD1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCXD1().trim()%>" readonly>
              <input type="text" name="I08DLCXY1" size="2" maxlength="2" value="<%= lnPyCn.getI08DLCXY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="I08VALVA1" size="14" maxlength="13" value="<%= lnPyCn.getI08DLCVA1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> 
  <% if(I08_DEAIPD.equals("SC2") && I08_DEAPPD.equals("SC2")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Double Payment Schedule (SC2 - Double Amortization Schedule)</h4>
		</td>
	</tr>
  </table>
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="33%"><b>Schedule 1</b></td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Percent of Principal :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="I08DLCOR1" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCOR1().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="I08DLCPP1" size="14" maxlength="13" value="<%= lnPyCn.getI08DLCPP1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="VALNC11" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" height="31"> 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" height="31"> 
              <input type="text" name="FRCFP11" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCFP1().trim()%>" readonly>
              <select name="FRCTP11" disabled>
                <option value=" " <% if (!(lnPyCn.getI08DLCTP1().equals("D") ||lnPyCn.getI08DLCTP1().equals("M")||lnPyCn.getI08DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getI08DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getI08DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getI08DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="VALVA11" size="14" maxlength="13" value="<%= lnPyCn.getI08DLCVA1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" >&nbsp; </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" ><b>Schedule 2</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Percentage of Principal :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="I08DLCOR2" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCOR2().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="I08DLCPP2" size="14" maxlength="13" value="<%= lnPyCn.getI08DLCPP2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="I08DLCNC2" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCNC2().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="I08DLCFP2" size="4" maxlength="3" value="<%= lnPyCn.getI08DLCFP2().trim()%>" readonly>
              <select name="I08DLCTP2">
                <option value=" " <% if (!(lnPyCn.getI08DLCTP2().equals("D") ||lnPyCn.getI08DLCTP2().equals("M")||lnPyCn.getI08DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getI08DLCTP2().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getI08DLCTP2().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getI08DLCTP2().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="I08DLCVA2" size="14" maxlength="13" value="<%= lnPyCn.getI08DLCVA2().trim()%>" readonly>
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(I08_DEAIPD.equals("SCH") && I08_DEAPPD.equals("SCH")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Payment Plan (SCH - Payment Schedule) </h4>
		</td>

	</tr>
  </table>
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= lnPyCn.getI08DEAIPD().trim()%> </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= lnPyCn.getI08DEAPPD().trim()%> </td>
          </tr>
        </table>
  	  </td>
     </tr>
 </table>
 <%}%>
	<br>
	<h4>AFTER</h4>
  <% if(DEAPPD.equals("MAT")) { %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Maturity (MAT) </h4>
		</td>

	</tr>
  </table>
  
  <%}%> <% if(isDEAIPDNum && DEAPPD.equals("MAT")){ %> 
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle :</div>
            </td>
           	<td nowrap width="15%"> <input type="text" name="E08DEAIPD" size="4" maxlength="3" value="<%= lnPyCn.getE08DEAIPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="PRXPAG01" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD1().trim()%>" readonly>
              <input type="text" name="PRXPAG02" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD2().trim()%>" readonly>
              <input type="text" name="PRXPAG03" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
           	<td nowrap width="15%"> <input type="text" name="E08DEAPPD" size="4" maxlength="3" value="<%= lnPyCn.getE08DEAPPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(isDEAIPDNum && isDEAPPDNum){ %> 
   <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Principal and Interest at Cycles </h4>
		</td>

	</tr>
  </table>
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle:</div>
            </td>
            <td nowrap width="15%"> <input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnPyCn.getE08DEAIPD().trim()%>" readonly> </td>
            <td nowrap width="23%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%"> 
              <input type="text" name="PRXPAG11" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD1().trim()%>" readonly>
              <input type="text" name="PRXPAG12" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD2().trim()%>" readonly>
              <input type="text" name="PRXPAG13" size="2" maxlength="2" value="<%= lnPyCn.getE08DEARD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
           	<td nowrap width="15%"> <input type="text" name="E08DEAPPD" size="4" maxlength="3" value="<%= lnPyCn.getE08DEAPPD().trim()%>" readonly> </td>            	
            <td nowrap width="23%"> 
              <div align="right">Next Payment Date :</div>
            </td>
            <td nowrap colspan="2" width="29%"> 
              <input type="text" name="PRXHAG11" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAHE1().trim()%>" readonly>
              <input type="text" name="PRXHAG12" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAHE2().trim()%>" readonly>
              <input type="text" name="PRXHAG13" size="2" maxlength="2" value="<%= lnPyCn.getE08DEAHE3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E08DEAROA1" size="15" maxlength="13" value="<%= lnPyCn.getE08DEAROA().trim()%>" readonly>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Interest Included in Payment :</div>
            </td>
            <td nowrap colspan="2" width="29%" > 
              <input type="radio" disabled name="CE08DEAIIP" value="Y" onClick="document.forms[0].E08DEAIIP4.value='Y'" 
			  <%if(lnPyCn.getE08DEAIIP().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" disabled name="CE08DEAIIP" value="N" onClick="document.forms[0].E08DEAIIP4.value='N'"
			  <%if(lnPyCn.getE08DEAIIP().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(DEAIPD.equals("SC1") && DEAPPD.equals("SC1")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Fixed Payment Amount (SC1 - Amortization Schedule)</h4>
		</td>

	</tr>
  </table>
 
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="FRCFP01" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCFP1().trim()%>" readonly>
              <select name="FRCTP01" disabled >
                <option value=" " <% if (!(lnPyCn.getE08DLCTP1().equals("D") ||lnPyCn.getE08DLCTP1().equals("M")||lnPyCn.getE08DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getE08DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getE08DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getE08DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Prepaid Interest :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E08DLCPM1" readonly size="2" maxlength="2" value="<%= lnPyCn.getE08DLCPM1().trim()%>" readonly>
              <input type="text" name="E08DLCPD1" readonly size="2" maxlength="2" value="<%= lnPyCn.getE08DLCPD1().trim()%>" readonly>
              <input type="text" name="E08DLCPY1" readonly size="2" maxlength="2" value="<%= lnPyCn.getE08DLCPY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Grace Period :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E08DLCGM1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCGM1().trim()%>" readonly>
              <input type="text" name="E08DLCGD1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCGD1().trim()%>" readonly>
              <input type="text" name="E08DLCGY1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCGY1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">First Payment Date :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E08DLCXM1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCXM1().trim()%>" readonly>
              <input type="text" name="E08DLCXD1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCXD1().trim()%>" readonly>
              <input type="text" name="E08DLCXY1" size="2" maxlength="2" value="<%= lnPyCn.getE08DLCXY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="VALVA01" size="14" maxlength="13" value="<%= lnPyCn.getE08DLCVA1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> 
  <% if(DEAIPD.equals("SC2") && DEAPPD.equals("SC2")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Double Payment Schedule (SC2 - Double Amortization Schedule)</h4>
		</td>

	</tr>
  </table>
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="33%"><b>Schedule 1</b></td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Percent of Principal :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E08DLCOR1" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCOR1().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E08DLCPP1" size="14" maxlength="13" value="<%= lnPyCn.getE08DLCPP1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="VALNC11" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" height="31"> 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" height="31"> 
              <input type="text" name="FRCFP11" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCFP1().trim()%>" readonly>
              <select name="FRCTP11" disabled>
                <option value=" " <% if (!(lnPyCn.getE08DLCTP1().equals("D") ||lnPyCn.getE08DLCTP1().equals("M")||lnPyCn.getE08DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getE08DLCTP1().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getE08DLCTP1().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getE08DLCTP1().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="VALVA11" size="14" maxlength="13" value="<%= lnPyCn.getE08DLCVA1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" >&nbsp; </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" ><b>Schedule 2</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%"> 
              <div align="right">Percentage of Principal :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E08DLCOR2" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCOR2().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E08DLCPP2" size="14" maxlength="13" value="<%= lnPyCn.getE08DLCPP2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">Number of Payments :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="E08DLCNC2" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCNC2().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Payment Frequency :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E08DLCFP2" size="4" maxlength="3" value="<%= lnPyCn.getE08DLCFP2().trim()%>" readonly>
              <select name="E01DLCTP2" disabled >
                <option value=" " <% if (!(lnPyCn.getE08DLCTP2().equals("D") ||lnPyCn.getE08DLCTP2().equals("M")||lnPyCn.getE08DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnPyCn.getE08DLCTP2().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(lnPyCn.getE08DLCTP2().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(lnPyCn.getE08DLCTP2().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E08DLCVA2" size="14" maxlength="13" value="<%= lnPyCn.getE08DLCVA2().trim()%>" readonly>
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(DEAIPD.equals("SCH") && DEAPPD.equals("SCH")){ %> 
  <table class="tbenter" width="100%">
  	<tr>
		<td>
			 <h4>Payment Plan (SCH - Payment Schedule) </h4>
		</td>

	</tr>
  </table>
  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap width="15%"> <%= lnPyCn.getE08DEAIPD().trim()%> </td>
            <td nowrap width="22%"> 
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap colspan="2"><%= lnPyCn.getE08DEAPPD().trim()%> </td>
          </tr>
        </table>
		</td>
       </tr>
   </table>
  <%}%>
  <br>


  </form>
</body>
</html>
