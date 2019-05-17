<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL010501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

    builtNewMenu(cp_a_opt);
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   

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
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center"> Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_ap_maint.jsp,EDL0105"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105A" onsubmit="javascript:this.disabled = true;">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD"  value="<%= cdMant.getE01DEAACD().trim()%>">
  <input type=HIDDEN name="E01DEAGLN"  value="<%= cdMant.getE01DEAGLN().trim()%>">
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
                <input type="text" name="E01DEACUN" readonly <% if (cdMant.getF01DEACUN().equals("Y")) out.print("id=\"txtchanged\""); %> size="9" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>" >
               </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="12" maxlength="9" value="<%= cdMant.getE01DEAACC().trim()%>" readonly>
                
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY2" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>
                
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= cdMant.getE01DEAPRO().trim()%>" readonly>
                 
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
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD1().trim()%>" readonly>
              <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD2().trim()%>" readonly>
              <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD3().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Last Cpn Pmt/Issue Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEALI1" readonly <% if (cdMant.getF01DEALI1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEALI1().trim()%>" >
              <input type="text" name="E01DEALI2" readonly <% if (cdMant.getF01DEALI2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEALI2().trim()%>" >
              <input type="text" name="E01DEALI3" readonly <% if (cdMant.getF01DEALI3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEALI3().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Settlement/Value Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAST1" size="2" maxlength="2" value="<%= cdMant.getE01DEAST1().trim()%>" readonly>
              <input type="text" name="E01DEAST2" size="2" maxlength="2" value="<%= cdMant.getE01DEAST2().trim()%>" readonly>
              <input type="text" name="E01DEAST3" size="2" maxlength="2" value="<%= cdMant.getE01DEAST3().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Redemption Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAMD1" <% if (cdMant.getF01DEAMD1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEAMD1().trim()%>" >
              <input type="text" name="E01DEAMD2" <% if (cdMant.getF01DEAMD1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEAMD2().trim()%>" >
              <input type="text" name="E01DEAMD3" <% if (cdMant.getF01DEAMD3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEAMD3().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="23%" height="37"> 
             <input type="text" name="E01DEATRM" size="4" maxlength="3" value="<%= cdMant.getE01DEATRM().trim()%>" readonly>
             <input type="text" name="E01DEATRC" size="10" readonly 
             	value="<% if(cdMant.getE01DEATRC().equals("D")) out.print("Day(s)");
             			   else if (cdMant.getE01DEATRC().equals("M")) out.print("Month(s)");
             			   else if (cdMant.getE01DEATRC().equals("Y")) out.print("Year(s)");%>" >             
            </td>
            <td nowrap width="25%" height="37"> 
              <div align="right">Market Price :</div>
            </td>
            <td nowrap width="27%" height="37">
            	<INPUT type="text" name="E01DEAMVL" size="15" maxlength="13" value="<%= cdMant.getE01DEAMVL().trim()%>"	readonly >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Bid/Offer Price :</div>
            </td>
            <td nowrap width="27%" height="37">
              <input type="text" name="E01BIDPRC" size="15" maxlength="13" value="<%= cdMant.getE01BIDPRC().trim()%>" readonly>
            </td>
             <td nowrap width="25%" >
              <div align="right">Coupon Rate :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" name="E01DEARTE" size="13" maxlength="12" value="<%= cdMant.getE01DEARTE().trim()%>" readonly>
            </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Face Value :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= cdMant.getE01DEAOAM().trim()%>" readonly>
            </td>
             <td nowrap width="25%" >
              <div align="right">Negotiated By:</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" name="E01DL1OFI" size="13" maxlength="3" value="<%= cdMant.getE01DL1OFI().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Principal/Total Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABAP" size="15" maxlength="13" value="<%= cdMant.getE01DEABAP().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Yield :</div>
            </td>
            <td nowrap width="27%" >
				<input type="text" name="E01DEAMXR" size="13" maxlength="12" value="<%= cdMant.getE01DEAMXR().trim()%>" readonly>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAINT" size="15" maxlength="13" value="<%= cdMant.getE01DEAINT().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Coupon Payment Period :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAROY" size="5" maxlength="4" value="<%= cdMant.getE01DEAROY().trim()%>" readonly>
              <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= cdMant.getE01DEAODA().trim()%>" readonly>          
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Net Proceeds :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01NETPRC" size="15" maxlength="13" value="<%= cdMant.getE01NETPRC().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEAF02" size="10" readonly <% if (cdMant.getF01DEAF02().equals("Y")) out.print("id=\"txtchanged\""); %>
             	value="<% if(cdMant.getE01DEAF02().equals("P")) out.print("Print");
             			   else if (cdMant.getE01DEAF02().equals("S")) out.print("Swift");
             			   else if (cdMant.getE01DEAF02().equals("N")) out.print("None");%>" >             
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Investment Type :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAUC6" readonly <% if (cdMant.getF01DEAUC6().equals("Y")) out.print("id=\"txtchanged\""); %> size="5" maxlength="4" value="<%= cdMant.getE01DEAUC6().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEARRT" size="30" readonly <% if (cdMant.getF01DEARRT().equals("Y")) out.print("id=\"txtchanged\""); %>
             	value="<% if(cdMant.getE01DEARRT().equals("1")) out.print("Reval Gain & Losses Daily");
             			   else if (cdMant.getE01DEARRT().equals("2")) out.print("Reval Only Losses Daily");
             			   else if (cdMant.getE01DEARRT().equals("3")) out.print("Reval Gain & Losses Monthly");
             			   else if (cdMant.getE01DEARRT().equals("4")) out.print("Reval Only Losses Monthly");
             			   else if (cdMant.getE01DEARRT().equals("N")) out.print("No Revaluation");%>" >             
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Safekeeper Number :</div>
            </td>
            <td nowrap width="23%" > 
				<input type="text" name="E01SFENUM" readonly <% if (cdMant.getF01SFENUM().equals("Y")) out.print("id=\"txtchanged\""); %> size="11" maxlength="10" value="<%= cdMant.getE01SFENUM().trim()%>" > 
           </td>
            <td nowrap width="25%" >
              <div align="right">Cusip/Isin Code Number :</div>
            </td>
            <td nowrap width="27%" >
             <INPUT type="text" name="E01DEACUI" readonly <% if (cdMant.getF01DEACUI().equals("Y")) out.print("id=\"txtchanged\""); %> size="13"	maxlength="12" value="<%= cdMant.getE01DEACUI().trim()%>">
            </td>
          </tr>     
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Common Code Number :</div>
            </td>
            <td nowrap width="23%" > 
				<INPUT type="text" name="E01DEAREF" readonly <% if (cdMant.getF01DEAREF().equals("Y")) out.print("id=\"txtchanged\""); %> size="13"	maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">            
			</td>
            <td nowrap width="25%" >
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="27%" >
			  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= cdMant.getE01DEACMC().trim()%>"  readonly>
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= cdMant.getE01DEACMN().trim()%>" <% if (cdMant.getE01DEACMN().equals("Y")) out.print("id=\"txtchanged\""); %> readonly>
            </td>
			
          </tr>
               
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAUC7" readonly <% if (cdMant.getF01DEAUC7().equals("Y")) out.print("id=\"txtchanged\""); %> size="5" maxlength="4" value="<%= cdMant.getE01DEAUC7().trim()%>" >
              <input type="text" name="D01DEAUC7" readonly <% if (cdMant.getF01DEAUC7().equals("Y")) out.print("id=\"txtchanged\""); %> size="40" maxlength="35" value="<%= cdMant.getD01DEAUC7().trim()%>" >
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="25%" height="37">
                <select name="E01DEAPVI"  disabled="disabled">
                  <option value=""  <% if(cdMant.getE01DEAPVI().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(cdMant.getE01DEAPVI().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(cdMant.getE01DEAPVI().equals("1")) out.print("selected");%>>Swift MT-103</option>
                  <option value="2" <% if(cdMant.getE01DEAPVI().equals("2")) out.print("selected");%>>Swift MT-200</option>
				  <option value="3" <% if(cdMant.getE01DEAPVI().equals("3")) out.print("selected");%>>Swift MT-202</option>
				  <option value="G" <% if(cdMant.getE01DEAPVI().equals("G")) out.print("selected");%>>General Ledger</option>
				  <option value="R" <% if(cdMant.getE01DEAPVI().equals("R")) out.print("selected");%>>Retail Account</option>
                  <option value="C" <% if(cdMant.getE01DEAPVI().equals("C")) out.print("selected");%>>Official Check</option>
                </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Documents Location :</div>
            </td>
            <td nowrap width="75%" colspan="3" > 
            	<input type="text" name="E01DEALOC" readonly <% if (cdMant.getF01DEALOC().equals("Y")) out.print("id=\"txtchanged\""); %> size="40" maxlength="35" value="<%= cdMant.getE01DEALOC().trim()%>" >
            </td>
          </tr>  
           <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAGCD" readonly <% if (cdMant.getF01DEAGCD().equals("Y")) out.print("id=\"txtchanged\""); %> size="5" maxlength="4" value="<%= cdMant.getE01DEAGCD().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Country of Risk :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAGRC" readonly <% if (cdMant.getF01DEAGRC().equals("Y")) out.print("id=\"txtchanged\""); %> size="13" maxlength="12" value="<%= cdMant.getE01DEAGRC().trim()%>" >
             </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Floating Rate Type :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" readonly <% if (cdMant.getF01DEAFTB().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
            	<input type="text" name="E01DEAFTY" size="10" readonly <% if (cdMant.getF01DEAFTY().equals("Y")) out.print("id=\"txtchanged\""); %>
             	value="<% if(cdMant.getE01DEAFTY().equals("FP")) out.print("Primary");
              			   else if (cdMant.getE01DEAFTY().equals("FS")) out.print("Secondary");%>" >             
             </td>
            <td nowrap width="25%" > 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Rate Revision Date/Period :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARD1" readonly <% if (cdMant.getF01DEARD1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEARD1().trim()%>" >
              <input type="text" name="E01DEARD2" readonly <% if (cdMant.getF01DEARD2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEARD2().trim()%>" >
              <input type="text" name="E01DEARD3" readonly <% if (cdMant.getF01DEARD3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEARD3().trim()%>" >
              / 
              <input type="text" name="E01DEARRP" readonly <% if (cdMant.getF01DEARRP().equals("Y")) out.print("id=\"txtchanged\""); %> size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>"  >
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="6" value="<%= cdMant.getE01DEACCN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdMant.getE01DEABRN().trim()%>" readonly>
            </td>
             <td nowrap width="25%"> 
              <div align="right">Rate Exchange : </div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEAEXR" size="10" maxlength="9" value="<%= cdMant.getE01DEAEXR().trim()%>" readonly>
            </td>
          </tr>   
          <tr id="trdark"> 
            <td nowrap width="25%">
              <div align="right">First Cpn Pmt Date :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABA1" readonly <% if (cdMant.getF01DEABA1().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEABA1().trim()%>" >
              <input type="text" name="E01DEABA2" readonly <% if (cdMant.getF01DEABA2().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEABA2().trim()%>" >
              <input type="text" name="E01DEABA3" readonly <% if (cdMant.getF01DEABA3().equals("Y")) out.print("id=\"txtchanged\""); %> size="2" maxlength="2" value="<%= cdMant.getE01DEABA3().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Issue is Private/Public :</div>
            </td>
            <td nowrap width="27%" >
              <input type="radio" name="E01DEAFL3" readonly value="V" <%if(cdMant.getE01DEAFL3().equals("V")) out.print("checked");%>>Private 
              <input type="radio" name="E01DEAFL3" readonly value="B" <%if(cdMant.getE01DEAFL3().equals("B")) out.print("checked");%>>Public
            </td>>
          </tr>   
        </table>
      </td>
    </tr>
  </table>  
               
    <h4>Offset Accounts</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFOP<%= name %>"  readonly value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="9"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" readonly>
        </div>
      </td>
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
    <table id="footTable" > 				
    <tr id="trdark"> 
            <td nowrap align="right"><b>Deal Currency Equivalent :</b> </td>
      <td nowrap align="center"><b><i><strong> 
          <input type="text" name="E01OFFEQV" size="15" maxlength="13" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>    

    <h4>Repayment</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable1">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
     <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPOPE" readonly value="<%= cdMant.getE01REPOPE().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01REPGLN" value="<%= cdMant.getE01REPGLN().trim()%>">
          <input type="text" name="E01REPCON" size="25" maxlength="25" readonly value="<%= cdMant.getE01REPCON().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPBNK" size="2" maxlength="2" value="<%= cdMant.getE01REPBNK().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPBRN" size="3" maxlength="3" value="<%= cdMant.getE01REPBRN().trim()%>" readonly>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01REPCCY" size="3" maxlength="3" value="<%= cdMant.getE01REPCCY().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPACC" size="12" maxlength="9"  value="<%= cdMant.getE01REPACC().trim()%>" readonly>
        </div>
      </td>
    </tr>
     </table>
        </div>
  </TD>  
</TR>	
</TABLE>    
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,true);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>
  </form>
</body>
</html>
