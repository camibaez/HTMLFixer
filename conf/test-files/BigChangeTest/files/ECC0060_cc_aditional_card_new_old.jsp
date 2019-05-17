<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Aditional Card</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgAdtCard" class= "datapro.eibs.beans.ECC006001Message"  scope="session" />
	
</head>
<body>
	
<h3 align="center">Aditional Card 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cc_aditional_card_new.jsp, ECC0060"> 
</h3>
<hr size="4">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	error.setERRNUM("0"); 
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
 
%> 

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0060" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01CCRTCL" VALUE="S">
  <INPUT TYPE=HIDDEN NAME="E01TARTYP" VALUE="<%= userPO.getHeader2().trim()%>">
  <%
    //  int row;
	//	try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
	//	appList.setCurrentRow(row);
  %>   
  
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
                <input type="text" name="E01CCRPRIM" size="21" maxlength="20" value="Secondary" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="16%"> 
              	<input type="text" name="E01TARTY2" size="15" maxlength="14" value="<% if (userPO.getHeader2().equals("D")) out.print("Debit"); else out.print("Credit"); %>" readonly>
            </td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer / Portfolio Primary: </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01PRICUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name Primary: </b></div>
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
              <div align="right"><b>Primary Card Number : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCRNUM" size="21" maxlength="20" value="<%= userPO.getIdentifier().trim()%>" onKeypress="enterInteger()">
                </b> </div>
            </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer / Portfolio Secondary : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01SECCUN" size="9" maxlength="9" value="<%= msgAdtCard.getE01SECCUN().trim()%>">
				<A href="javascript:GetCustomerByPortfolio('<%= userPO.getID() %>', 'E01SECCUN','E01SECNA1', '', '', '', '', '', '', '', '', '', '', '', '', '')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0"></A>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name Secondary : </b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01SECNA1" size="45" maxlength="45" readonly value="<%= msgAdtCard.getE01SECNA1().trim()%>">
              </div>
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
              <div align="right">Bank ABA :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRABA" size="11" maxlength="10" value="<%= msgAdtCard.getE01CCRABA().trim()%>" onKeypress="enterInteger()"> 
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
				<input type="text" name="E01CCRNXN" size="21" maxlength="20" value="<%= msgAdtCard.getE01CCRNXN().trim()%>" > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Account File ID :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCRAFI" size="11" maxlength="10" value="<%= msgAdtCard.getE01CCRAFI().trim()%>" > 
 			</td>
          </tr>                        
           <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Reason Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRRNS" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRRNS().trim()%>" > 
				<a href="javascript:GetCodeCreditCard('E01CCRRNS','07')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Access Code :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCRACD" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRACD().trim()%>" >
			  <a href="javascript:GetCodeCreditCard('E01CCRACD','08')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>               
 			</td>
          </tr>     
           <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Status :</div>
            </td>
            <td nowrap width="23%"> 
              <select name="E01CCRIST">
                <option value=" " <% if (!(msgAdtCard.getE01CCRIST().equals("D") || msgAdtCard.getE01CCRIST().equals("O")|| msgAdtCard.getE01CCRIST().equals("X"))) out.print("selected"); %> selected></option>
                <option value="D" <% if(msgAdtCard.getE01CCRIST().equals("D")) out.print("selected");%>>Delinquent</option>
                <option value="O" <% if(msgAdtCard.getE01CCRIST().equals("O")) out.print("selected");%>>Overlimit</option>
                <option value="X" <% if(msgAdtCard.getE01CCRIST().equals("X")) out.print("selected");%>>Delinquent and Overlimit</option>
              </select>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Card Type :</div>
            </td>
            <td nowrap width="27%"> 
              <select name="E01CCRTYP">
                <option value=" " <% if (!(msgAdtCard.getE01CCRTYP().equals("V") || msgAdtCard.getE01CCRTYP().equals("M")||msgAdtCard.getE01CCRTYP().equals("P"))) out.print("selected"); %> selected></option>
                <option value="V" <% if(msgAdtCard.getE01CCRTYP().equals("V")) out.print("selected");%>>Visa</option>
                <option value="M" <% if(msgAdtCard.getE01CCRTYP().equals("M")) out.print("selected");%>>Master Card</option>
                <option value="P" <% if(msgAdtCard.getE01CCRTYP().equals("P")) out.print("selected");%>>Private Label</option>
              </select>              
 			</td>
          </tr>           
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Plastic Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRPLA" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRPLA().trim()%>" > 
				<a href="javascript:GetCodeCreditCard('E01CCRPLA','02')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>               
            </td>
            <td nowrap width="25%"> 
              <div align="right">Issue Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCRISM" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCRISM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCRISD" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCRISD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCRISY" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCRISY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01CCRISM,document.forms[0].E01CCRISD,document.forms[0].E01CCRISY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01CCREXM" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCREXM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCREXD" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCREXD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CCREXY" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCREXY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01CCREXM,document.forms[0].E01CCREXD,document.forms[0].E01CCREXY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Transaction Free :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRNFT" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCRNFT().trim()%>" >
  			</td>
          </tr>       
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRNAM" size="41" maxlength="40" value="<%= msgAdtCard.getE01CCRNAM().trim()%>" >
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="27%"></td>
          </tr>  
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRNA1" size="41" maxlength="40" value="<%= msgAdtCard.getE01CCRNA1().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">PIN Offset :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRPIO" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCRPIO().trim()%>" >
				<a href="javascript:GetCode('E01CCRPIO','STATIC_pin_offset.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>               
  			</td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Location Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRUBC" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRUBC().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Co-Branding Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROBR" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCROBR().trim()%>" >
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Renewal Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRRNC" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRRNC().trim()%>" >
				<a href="javascript:GetCodeCreditCard('E01CCRRNC','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Delivery Branch :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROFE" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCROFE().trim()%>" >
  			</td>
          </tr>     
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Distribution Type :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRTDI" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCRTDI().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Distribution Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRCDI" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRCDI().trim()%>" >
  			</td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Blocked Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRBKD" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRBKD().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Access Type :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRTAC" size="2" maxlength="1" value="<%= msgAdtCard.getE01CCRTAC().trim()%>" >
  			</td>
          </tr>        
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Affinity Code :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRFIN" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCRFIN().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Premium Code :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRRWD" size="2" maxlength="1" value="<%= msgAdtCard.getE01CCRRWD().trim()%>" >
  			</td>
          </tr>                                                                                           
        </table>
      </td>
    </tr>
  </table>  
  <h4> Amount Information</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Funds Back Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRFBL" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCRFBL().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Overdraft Limit :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROVL" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCROVL().trim()%>" onkeypress="enterInteger()">
  			</td>
          </tr>      
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Cash Withdrawal Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRWHL" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCRWHL().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Limit Frequency :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRLFR" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCRLFR().trim()%>" >
  			</td>
          </tr>      
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">On Line Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRONL" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCRONL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">On Line Available :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROLD" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCROLD().trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Off Line Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCROFL" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCROFL().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Off Line Available :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCROFD" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCROFD().trim()%>" onkeypress="enterDecimal()">
  			</td>
          </tr>     
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">POS Withdrawal Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRPWL" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCRPWL().trim()%>" onkeypress="enterInteger()">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Bill Payment Limit :</div>
            </td>
            <td nowrap width="27%"> 
            	<input type="text" name="E01CCRBPL" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCRBPL().trim()%>" onkeypress="enterInteger()">
  			</td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Card Limit :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="text" name="E01CCRLIM" size="10" maxlength="9" value="<%= msgAdtCard.getE01CCRLIM().trim()%>" onkeypress="enterInteger()">
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
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
