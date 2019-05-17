<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Primary Credit Card</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="ccPrim" class="datapro.eibs.beans.ECC006001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="javascript">

	builtNewMenu(cc_m_opt);

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

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
<h3 align="center">Primary Credit Card <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_primary_card.jsp,ECC0010">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01CCRTCL" VALUE="P">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Card Type : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01CCRPRIM" size="21" maxlength="20" value="Primary" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"></div>
            </td>
            <td nowrap width="16%">
              	<input type="text" name="E01TARTYP" size="15" maxlength="14" value="<% if (userPO.getHeader2().equals("D")) out.print("Debit Card"); else out.print("Credit Card"); %>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01PRICUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
			  </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name : </b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01PRINA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" readonly name="E01CCRCRA" size="12" maxlength="9" value="<%= userPO.getAccNum().trim() %>">
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Card Number : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" readonly name="E01CCRNUM" size="21" maxlength="20" value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Primary Card Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Bank ABA :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01CCRABA" size="11" maxlength="10" value="<%= ccPrim.getE01CCRABA().trim()%>" onKeypress="enterInteger()">
            </td>
            <td nowrap width="25%">
              <div align="right"></div>
            </td>
            <td nowrap width="27%"> </td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Fifth/Third Account :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01CCRNXN" size="21" maxlength="20" value="<%= ccPrim.getE01CCRNXN().trim()%>" >
            </td>
            <td nowrap width="25%">
              <div align="right">Account File ID :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01CCRAFI" size="11" maxlength="10" value="<%= ccPrim.getE01CCRAFI().trim()%>" >
 			</td>
          </tr>
           <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Reason Code :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01CCRRNS" size="5" maxlength="4" value="<%= ccPrim.getE01CCRRNS().trim()%>" >
				<a href="javascript:GetCodeCreditCard('E01CCRRNS','07')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="25%">
              <div align="right">Access Code :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01CCRACD" size="5" maxlength="4" value="<%= ccPrim.getE01CCRACD().trim()%>" >
			  <a href="javascript:GetCodeCreditCard('E01CCRACD','08')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 			</td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Status :</div>
            </td>
            <td nowrap width="23%">
              <select name="E01CCRIST">
                <option value=" " <% if (!(ccPrim.getE01CCRIST().equals("D") ||ccPrim.getE01CCRIST().equals("O")||ccPrim.getE01CCRIST().equals("X"))) out.print("selected"); %> selected></option>
                <option value="D" <% if(ccPrim.getE01CCRIST().equals("D")) out.print("selected");%>>Delinquent</option>
                <option value="O" <% if(ccPrim.getE01CCRIST().equals("O")) out.print("selected");%>>Overlimit</option>
                <option value="X" <% if(ccPrim.getE01CCRIST().equals("X")) out.print("selected");%>>Delinquent and Overlimit</option>
              </select>
            </td>
            <td nowrap width="25%">
              <div align="right">Card Type :</div>
            </td>
            <td nowrap width="27%">
              <select name="E01CCRTYP">
                <option value=" " <% if (!(ccPrim.getE01CCRTYP().equals("V") ||ccPrim.getE01CCRTYP().equals("M")||ccPrim.getE01CCRTYP().equals("P"))) out.print("selected"); %> selected></option>
                <option value="V" <% if(ccPrim.getE01CCRTYP().equals("V")) out.print("selected");%>>Visa</option>
                <option value="M" <% if(ccPrim.getE01CCRTYP().equals("M")) out.print("selected");%>>Master Card</option>
                <option value="P" <% if(ccPrim.getE01CCRTYP().equals("P")) out.print("selected");%>>Private Label</option>
              </select>
 			</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Plastic Code :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01CCRPLA" size="5" maxlength="4" value="<%= ccPrim.getE01CCRPLA().trim()%>" >
				<a href="javascript:GetCodeCreditCard('E01CCRPLA','02')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="25%">
              <div align="right">Issue Date :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01CCRISM" size="2" maxlength="2" value="<%= ccPrim.getE01CCRISM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCRISD" size="2" maxlength="2" value="<%= ccPrim.getE01CCRISD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCRISY" size="2" maxlength="2" value="<%= ccPrim.getE01CCRISY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01CCRISM,document.forms[0].E01CCRISD,document.forms[0].E01CCRISY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01CCREXM" size="2" maxlength="2" value="<%= ccPrim.getE01CCREXM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCREXD" size="2" maxlength="2" value="<%= ccPrim.getE01CCREXD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCREXY" size="2" maxlength="2" value="<%= ccPrim.getE01CCREXY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01CCREXM,document.forms[0].E01CCREXD,document.forms[0].E01CCREXY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
            <td nowrap width="25%">
              <div align="right">Transaction Free :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRNFT" size="3" maxlength="2" value="<%= ccPrim.getE01CCRNFT().trim()%>" >
  			</td>
          </tr>       
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRNAM" size="41" maxlength="40" value="<%= ccPrim.getE01CCRNAM().trim()%>" >
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="27%"></td>
          </tr>  
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRNA1" size="41" maxlength="40" value="<%= ccPrim.getE01CCRNA1().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">PIN Offset :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRPIO" size="17" maxlength="16" value="<%= ccPrim.getE01CCRPIO().trim()%>" >
  			</td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Location Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRUBC" size="5" maxlength="4" value="<%= ccPrim.getE01CCRUBC().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Co-Branding Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROBR" size="5" maxlength="4" value="<%= ccPrim.getE01CCROBR().trim()%>" >
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Renewal Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRRNC" size="5" maxlength="4" value="<%= ccPrim.getE01CCRRNC().trim()%>" >
				<a href="javascript:GetCodeCreditCard('E01CCRRNC','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Delivery Branch :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROFE" size="5" maxlength="4" value="<%= ccPrim.getE01CCROFE().trim()%>" >
  			</td>
          </tr>     
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Distribution Type :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRTDI" size="3" maxlength="2" value="<%= ccPrim.getE01CCRTDI().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Distribution Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRCDI" size="5" maxlength="4" value="<%= ccPrim.getE01CCRCDI().trim()%>" >
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Blocked Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRBKD" size="5" maxlength="4" value="<%= ccPrim.getE01CCRBKD().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Access Type :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRTAC" size="2" maxlength="1" value="<%= ccPrim.getE01CCRTAC().trim()%>" >
  			</td>
          </tr>        
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Affinity Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRFIN" size="5" maxlength="4" value="<%= ccPrim.getE01CCRFIN().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Premium Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRRWD" size="2" maxlength="1" value="<%= ccPrim.getE01CCRRWD().trim()%>" >
  			</td>
          </tr>                                                                                           
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Privilege Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRPRV" size="5" maxlength="4" value="<%= ccPrim.getE01CCRPRV().trim()%>" >
				<a href="javascript:GetCodeCreditCard('E01CCRPRV','9')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="27%"> 
            	
  			</td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>  
  <h4> Primary Card Amount Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Funds Back Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRFBL" size="17" maxlength="16" value="<%= ccPrim.getE01CCRFBL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Overdraft Limit :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROVL" size="17" maxlength="16" value="<%= ccPrim.getE01CCROVL().trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>      
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Withdrawal Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRWHL" size="17" maxlength="16" value="<%= ccPrim.getE01CCRWHL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Limit Frequency :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRLFR" size="3" maxlength="2" value="<%= ccPrim.getE01CCRLFR().trim()%>" >
  			</td>
          </tr>      
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">On Line Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRONL" size="17" maxlength="16" value="<%= ccPrim.getE01CCRONL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">On Line Available :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROLD" size="17" maxlength="16" value="<%= ccPrim.getE01CCROLD().trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Off Line Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCROFL" size="17" maxlength="16" value="<%= ccPrim.getE01CCROFL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Off Line Available :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROFD" size="17" maxlength="16" value="<%= ccPrim.getE01CCROFD().trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>                                                                                                   
        </table>
      </td>
    </tr>
  </table>   
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
