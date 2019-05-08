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

   	builtNewMenu(cp_m_opt);
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
  	
  	String readonly = cdMant.getH01SCRCOD().equals("N") ? "" : "readonly";
%>

<h3 align="center"> Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_maint.jsp,EDL0105"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD"  value="<%= cdMant.getE01DEAACD().trim()%>">
  <input type=HIDDEN name="E01DEAGLN"  value="<%= cdMant.getE01DEAGLN().trim()%>">
	<input type=HIDDEN name="E01DEAIIP" value="<%= cdMant.getE01DEAIIP().trim()%>">
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
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>" readonly>
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
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Last Cpn Pmt/Issue Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEALI1" size="2" maxlength="2" value="<%= cdMant.getE01DEALI1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEALI2" size="2" maxlength="2" value="<%= cdMant.getE01DEALI2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEALI3" size="2" maxlength="2" value="<%= cdMant.getE01DEALI3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEALI1,document.forms[0].E01DEALI2,document.forms[0].E01DEALI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
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
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Redemption Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEAMD1,document.forms[0].E01DEAMD2,document.forms[0].E01DEAMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="23%" height="37"> 
             <input type="text" name="E01DEATRM" size="4" maxlength="3" value="<%= cdMant.getE01DEATRM().trim()%>" >
              <select name="E01DEATRC">
                <option value=" " <% if (!(cdMant.getE01DEATRC().equals("D") ||cdMant.getE01DEATRC().equals("M")||cdMant.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdMant.getE01DEATRC().equals("D")) out.print("selected");%>>Day(s)</option>
                <option value="M" <% if(cdMant.getE01DEATRC().equals("M")) out.print("selected");%>>Month(s)</option>
                <option value="Y" <% if(cdMant.getE01DEATRC().equals("Y")) out.print("selected");%>>Year(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" > 
            </td>
            <td nowrap width="25%" height="37"> 
              <div align="right">Market Price :</div>
            </td>
            <td nowrap width="27%" height="37"><INPUT type="text"
					name="E01DEAMVL" size="15" maxlength="13"
					value="<%= cdMant.getE01DEAMVL().trim()%>"
					onkeypress="enterDecimal()">
              <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0">           
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Bid/Offer Price :</div>
            </td>
            <td nowrap width="23%" ><INPUT type="text" name="E01BIDPRC"
					size="15" maxlength="13" value="<%= cdMant.getE01BIDPRC().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" ></td>
            <td nowrap width="25%" >
              <div align="right">Negotiated By</div>
            </td>
            <td nowrap width="27%" ><INPUT type="text" name="E01DL1OFI"
					size="3" maxlength="3" value="<%= cdMant.getE01DL1OFI().trim()%>">
            <INPUT type="text" name="D01DL1OFI" size="40" maxlength="15"
					value="<%= cdMant.getD01DL1OFI().trim()%>" <%= readonly %>>
            <A
					href="javascript:GetCodeDescCNOFC('E01DL1OFI','D01DL1OFI','15')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absbottom" border="0"></A> 
              <IMG src="<%=request.getContextPath()%>/images/Check.gif"
					alt="mandatory field" align="absbottom" border="0"></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Face Value :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= cdMant.getE01DEAOAM().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" ></td>
            <td nowrap width="25%" >
              <div align="right">Coupon Rate :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" name="E01DEARTE" size="13" maxlength="12" value="<%= cdMant.getE01DEARTE().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Principal/Total Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABAP" size="15" maxlength="13" value="<%= cdMant.getE01DEABAP().trim()%>" >
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" ></td>
            <td nowrap width="25%" >
              <div align="right">Yield :</div>
            </td>
            <td nowrap width="27%" >
				<input type="text" name="E01DEAMXR" size="13" maxlength="12" value="<%= cdMant.getE01DEAMXR().trim()%>" <%= readonly %>>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAINT" size="15" maxlength="13" value="<%= cdMant.getE01DEAINT().trim()%>" <%= readonly %>></td>
            <td nowrap width="25%" >
              <div align="right">Coupon Payment Period :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAROY" size="5" maxlength="4" value="<%= cdMant.getE01DEAROY().trim()%>" >
              <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= cdMant.getE01DEAODA().trim()%>" >
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0">            
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Net Proceeds :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01NETPRC" size="15" maxlength="13" value="<%= cdMant.getE01NETPRC().trim()%>" <%= readonly %>>
            </td>
            <td nowrap width="25%" >
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap width="27%" >
              <select name="E01DEAF02">
                <option value=" " <% if (!(cdMant.getE01DEAF02().equals("P") ||cdMant.getE01DEAF02().equals("S")||cdMant.getE01DEAF02().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <% if (cdMant.getE01DEAF02().equals("P")) out.print("selected"); %>>Print</option>
                <option value="S" <% if (cdMant.getE01DEAF02().equals("S")) out.print("selected"); %>>Swift</option>
                <option value="N" <% if (cdMant.getE01DEAF02().equals("N")) out.print("selected"); %>>None</option>
              </select>            
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Investment Type :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAUC6" size="5" maxlength="4" value="<%= cdMant.getE01DEAUC6().trim()%>" <%= readonly %>>
            </td>
            <td nowrap width="25%" >
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap width="27%" >
               <select name="E01DEARRT">
                <option value=" " <% if (!(cdMant.getE01DEARRT().equals("1") ||cdMant.getE01DEARRT().equals("2")||cdMant.getE01DEARRT().equals("3")||cdMant.getE01DEARRT().equals("4")||cdMant.getE01DEARRT().equals("N"))) out.print("selected"); %>></option>
                <option value="1" <% if (cdMant.getE01DEARRT().equals("1")) out.print("selected"); %>>Reval Gain & Losses Daily</option>
                <option value="2" <% if (cdMant.getE01DEARRT().equals("2")) out.print("selected"); %>>Reval Only Losses Daily</option>
                <option value="3" <% if (cdMant.getE01DEARRT().equals("3")) out.print("selected"); %>>Reval Gain & Losses Monthly</option>
                <option value="4" <% if (cdMant.getE01DEARRT().equals("4")) out.print("selected"); %>>Reval Only Losses Monthly</option>
                <option value="N" <% if (cdMant.getE01DEARRT().equals("N")) out.print("selected"); %>>No Revaluation</option>
              </select>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Safekeeper Number :</div>
            </td>
            <td nowrap width="23%" > 
				<input type="text" name="E01SFENUM" size="11" maxlength="10" value="<%= cdMant.getE01SFENUM().trim()%>" onkeypress="enterInteger()">            
				<a href="javascript:GetCustomerDescId('E01SFENUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a>
			</td>
            <td nowrap width="25%" >
              <div align="right">Cusip/Isin Code Number :</div>
            </td>
            <td nowrap width="27%" >
             <INPUT type="text" name="E01DEACUI" size="13"	maxlength="12" value="<%= cdMant.getE01DEACUI().trim()%>">
            </td>
          </tr>     
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Common Code Number :</div>
            </td>
            <td nowrap width="23%" > 
				<INPUT type="text" name="E01DEAREF" size="13"	maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">            
			</td>
            <td nowrap width="25%" >
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="27%" >
			  <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= cdMant.getE01DEACMC().trim()%>"  onkeypress="enterInteger()">
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= cdMant.getE01DEACMN().trim()%>"  onkeypress="enterInteger()">
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
            </td>

          </tr>
               
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEAUC7" size="5" maxlength="4" value="<%= cdMant.getE01DEAUC7().trim()%>" >
              <input type="text" name="D01DEAUC7" size="40" maxlength="35" value="<%= cdMant.getD01DEAUC7().trim()%>" >
              <a href="javascript:GetBrokerT('E01DEAUC7','D01DEAUC7')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%" height="37">
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="25%" height="37">
                <select name="E01DEAPVI" >
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
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Documents Location :</div>
            </td>
            <td nowrap width="75%" colspan="3" > 
            	<input type="text" name="E01DEALOC" size="40" maxlength="35" value="<%= cdMant.getE01DEALOC().trim()%>" >
            </td>
          </tr>  
           <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAGCD" size="5" maxlength="4" value="<%= cdMant.getE01DEAGCD().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E01DEAGCD','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" >
              <div align="right">Country of Risk :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAGRC" size="13" maxlength="12" value="<%= cdMant.getE01DEAGRC().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E01DEAGRC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
             </td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Floating Rate Type :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
              <select name="E01DEAFTY">
                <option value=" " <% if (!(cdMant.getE01DEAFTY().equals("FP") ||cdMant.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdMant.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (cdMant.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Rate Revision Date/Period :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARD1" size="2" maxlength="2" value="<%= cdMant.getE01DEARD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD2" size="2" maxlength="2" value="<%= cdMant.getE01DEARD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEARD3" size="2" maxlength="2" value="<%= cdMant.getE01DEARD3().trim()%>" onkeypress="enterInteger()">
              / 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>" onkeypress="enterCharNumber()" onblur="rightAlignCharNumber()">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="6" value="<%= cdMant.getE01DEACCN().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" <%= readonly %>>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdMant.getE01DEABRN().trim()%>" <%= readonly %>>
              <% if (readonly.equals("")) { %>
              		<a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"  ></a>
              <% }  %>
            </td>
             <td nowrap width="25%"> 
              <div align="right">Rate Exchange : </div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEAEXR" size="10" maxlength="9" value="<%= cdMant.getE01DEAEXR().trim()%>" >
            </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">First Cpn Pmt Date :</div>
            </td>
            <td nowrap width="23%"> 
             <input type="text" name="E01DEABA1" size="2" maxlength="2" value="<%= cdMant.getE01DEABA1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEABA2" size="2" maxlength="2" value="<%= cdMant.getE01DEABA2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DEABA3" size="2" maxlength="2" value="<%= cdMant.getE01DEABA3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DEABA1,document.forms[0].E01DEABA2,document.forms[0].E01DEABA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>  
            </td>
            <td nowrap width="25%" >
              <div align="right">Issue is Private/Public :</div>
            </td>
            <td nowrap width="27%" >
              <input type="radio" name="E01DEAFL3" value="V" <%if(cdMant.getE01DEAFL3().equals("V")) out.print("checked");%>>Private 
              <input type="radio" name="E01DEAFL3" value="B" <%if(cdMant.getE01DEAFL3().equals("B")) out.print("checked");%>>Public
            </td>
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
          <input type="text" name="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" 
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01DEAACD.value)">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="9"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>"
                oncontextmenu="showPopUp(openingWireHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01OFFAM<%= name %>',document.forms[0]['E01OFFOP<%= name %>'].value,'RC')"  onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" onkeypress="enterDecimal()">
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
    </tr>
    </table> 
      
    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
     <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPOPE" value="<%= cdMant.getE01REPOPE().trim()%>" size="2" maxlength="2">
          <input type="hidden" name="E01REPGLN" value="<%= cdMant.getE01REPGLN().trim()%>">
          <input type="text" name="E01REPCON" size="25" maxlength="25" readonly value="<%= cdMant.getE01REPCON().trim()%>" 
                  oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].SCRDEABNK.value,'','E01REPGLN','E01REPOPE',document.forms[0].E01DEAACD.value)">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPBNK" size="2" maxlength="2" value="<%= cdMant.getE01REPBNK().trim()%>" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPBRN" size="3" maxlength="3" value="<%= cdMant.getE01REPBRN().trim()%>"
                oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')" onkeypress="enterInteger()">
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01REPCCY" size="3" maxlength="3" value="<%= cdMant.getE01REPCCY().trim()%>"
                oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].SCRDEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01REPACC" size="12" maxlength="9"  value="<%= cdMant.getE01REPACC().trim()%>"
                oncontextmenu="showPopUp(openingWireHelp,this.name,document.forms[0].SCRDEABNK.value,'','document.forms[0].E01DEACUN.value','','RT')"  onkeypress="enterInteger()">
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
	<% 
		if (error.getERWRNG().equals("Y")) { 
			error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Accept with Warnings</h4>
	<% 
		} 
	%>       
 
   <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit" >
  </div>
  </form>
</body>
</html>
