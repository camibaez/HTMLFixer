<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EPR200001Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  
  function showTab(index){  
  	for(var i=0;i<4;i++){
   		document.all["Tab"+i].className="tabnormal";
   		document.all["dataTab"+i].style.display="none";
   	}
  
    document.all["Tab"+index].className="tabhighlight";  
  	document.all["dataTab"+index].style.display="";
  	//if (index == 2) tableresize();
  }
  
  builtHPopUp();
  
  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
    init(opth,field,bank,ccy,field1,field2,opcod);
    showPopupHelp();
  }
  
  function setHelp() {
    var val = document.forms[0].E01PRPVIA.options[document.forms[0].E01PRPVIA.selectedIndex].value;
    if (val=="1" || val=="5") {
    	document.all.recivHelp.href="javascript:GetFedId('E01PRPRPD')";
    	document.all.recivHelp.style.display="";
    }
    else if (val=="2" || val=="3") {
  		document.all.recivHelp.href="javascript:GetSwiftId('E01PRPRPD')";
  		document.all.recivHelp.style.display="";
  	} else document.all.recivHelp.style.display="none";
  }
  
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 String title = "";
 title = (userPO.getPurpose().equals("NEW")) ? "Open " : "Maintenance ";
 
%>

<h3 align="center"><%=title%>Payment Order  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_maint.jsp,EPR2000" ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  	
  <table class="tableinfo" >
    <tr> 
      <td > 
      <table  cellspacing=0 cellpadding=0 width="100%">
      <tr id=trdark>
      	<td nowrap width="30%" > 
        <div align="right">Account :</div>
      	</td>
      	<td nowrap width="10%">  
        <% if (userPO.getPurpose().equals("NEW")) {%>
          <input type="text" name="E01PRPDAC" size="12" maxlength="12" value="<%= userPO.getAccNum()%>">
        <% } else {%>
          <input type="text" name="E01PRPDAC" size="12" maxlength="12" value="<%= prBasic.getE01PRPDAC()%>">
        <% } %>
        </td>
      	<td nowrap width="20%"> 
        <div align="right">Reference : </div>
      	</td>
      	<% if (userPO.getPurpose().equals("NEW")) {%>
      	<td nowrap width="40%" >
      	  <input type="hidden" name="E01PRPNUM" size="9" maxlength="9" value="999999999">
      	  <B>N</B>ew                              
      	</td>
      	<% } else {%>
      	<td nowrap width="40%" >
      	  <input type="text" name="E01PRPNUM" size="9" maxlength="9" value="<%= prBasic.getE01PRPNUM()%>">                              
      	</td>
      	<% } %>
      	</tr>
  	  </table>
  	  </td>
    </tr>
  </table>
  <h4>Basic Information </h4>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="31%" > 
                        <div align="right">Payment Method :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <select name="E01PRPVIA" onchange="setHelp()">
                          <option value="1" <% if(prBasic.getE01PRPVIA().equals("1")) out.print("selected");%>>FED</option>
                          <option value="2" <% if(prBasic.getE01PRPVIA().equals("2")) out.print("selected");%>>Swift MT-100/103</option>
                          <option value="3" <% if(prBasic.getE01PRPVIA().equals("3")) out.print("selected");%>>Swift MT-200/202</option>
                          <option value="4" <% if(prBasic.getE01PRPVIA().equals("4")) out.print("selected");%>>Chips</option>
                          <option value="5" <% if(prBasic.getE01PRPVIA().equals("5")) out.print("selected");%>>ACH</option>
                          <option value="6" <% if(prBasic.getE01PRPVIA().equals("6")) out.print("selected");%>>Bill View</option>
                          <option value="7" <% int via = 7;
                          try { via = Integer.parseInt(prBasic.getE01PRPVIA()); } catch (Exception e) {	via = 7;}				
                          if (via >= 7) out.print("selected");%>>Interna</option>                          
                        </select>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Comision Table:</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPCOT" size="4" maxlength="3" value="<%= prBasic.getE01PRPCOT().trim()%>">                      
                        <input type="hidden" name="AMTCOT">                      
                        <a href="javascript:GetCNTRLPRF('E01PRPCOT','AMTCOT')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a>                  
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap width="31%"> 
                        <div align="right">Transfer Amount :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01PRPAMT" size="17" maxlength="17" value="<%= prBasic.getE01PRPAMT().trim()%>" onkeypress="enterDecimal()">
                      </td>
                      <td nowrap> 
                        <div align="right">Currency :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPTCY" size="4" maxlength="3" value="<%= prBasic.getE01PRPTCY().trim()%>">
                        <a href="javascript:GetCurrency('E01PRPTCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a>                  
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap width="31%"> 
                        <div align="right">Beneficiary Ref. :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPTHF" size="9" maxlength="9" value="<%= prBasic.getE01PRPTHF().trim()%>">
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Sender Ref. :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPSRF" size="9" maxlength="9" value="<%= prBasic.getE01PRPSRF().trim()%>">
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" >
                      <div align="right">Receiver Id. :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPRPD" size="14" maxlength="12" value="<%= prBasic.getE01PRPRPD().trim()%>">
                        <a id="recivHelp" style="display:none"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a>                  
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Receiver Short Name :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPRSH" size="20" maxlength="15" value="<%= prBasic.getE01PRPRSH().trim()%>">
                      </td>
                    </tr>                   
                  </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr> 
       <td nowrap> 
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
          		<tr> 
                  <td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0)"> 
                    <div>Beneficiary</div>
                  </td> 
                
                  <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1)"> 
                    <div> Benef.Bank</div>
                  </td> 
                 
                  <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2)"> 
                    <div>Details Payment</div>
                  </td> 
                 
                  <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3)"> 
                    <div>Intermediary Bank</div>
                  </td>
                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
    </tr>
  </table>
  <table class="tabdata" width="100%">
    <tr>
     <td nowrap>
                <div id="dataTab0"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right"> Customer :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E11PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE11PRPBCU()%>"><br>
                      	<input type="text" name="E21PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE21PRPBCU()%>"><br>
                      	<input type="text" name="E31PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE31PRPBCU()%>"><br>
                      	<input type="text" name="E41PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE41PRPBCU()%>">
                      </td>                     
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Bank Account : </div>
                      </td>
                      <td nowrap width="2%" valign="top" > 
                        <input type="text" name="E01PRPBBO" size="2" maxlength="1" value="<%= prBasic.getE01PRPBBO()%>" >
                      </td>
                      
                      <td nowrap > 
                        <input type="text" name="E11PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE11PRPBBK()%>"><br>
                      	<input type="text" name="E21PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE21PRPBBK()%>"><br>
                      	<input type="text" name="E31PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE31PRPBBK()%>"><br>
                      	<input type="text" name="E41PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE41PRPBBK()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Payment Details:</div>
                      </td>
                      
                      <td nowrap> 
                        <input type="text" name="E11PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE11PRPDTP()%>"><br>
                      	<input type="text" name="E21PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE21PRPDTP()%>"><br>
                      	<input type="text" name="E31PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE31PRPDTP()%>"><br>
                      	<input type="text" name="E41PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE41PRPDTP()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab3" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right"> Intermediary Bank :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E11PRPINB" size="35" maxlength="35" value="<%= prBasic.getE11PRPINB()%>"><br>
                        <input type="text" name="E21PRPINB" size="35" maxlength="35" value="<%= prBasic.getE21PRPINB()%>"><br>
                        <input type="text" name="E31PRPINB" size="35" maxlength="35" value="<%= prBasic.getE31PRPINB()%>"><br>
                        <input type="text" name="E41PRPINB" size="35" maxlength="35" value="<%= prBasic.getE41PRPINB()%>">
                      </td>
                      
                    </tr>
                  </table>
                </div>
              
            </td>
            
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
  					<tr  id=trclear > 
                      <td nowrap > 
                        <div align="right"></div>
                      </td>
                      <th nowrap> 
                        <div align="left">Bank.</div>
                      </th>
                      <th nowrap> 
                        <div align="left">Branch.</div>
                      </th>
                      <th nowrap> 
                       <div align="left">CCY</div>
                      </th>
                      <th nowrap> <div align="left">GL</div>                        
                       </th>
                      <th nowrap> <div align="left">Account</div>
                       </th>
                       <th nowrap> <div align="left">Sub Account </div>
                      </th>
                      <th nowrap> <div align="left">Cost Acc</div>
                      </th>
                    </tr>                     
                    <tr  id=trdark > 
                      <td nowrap > 
                        <div align="right">Debit Account :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" id="txtlabel" name="E01PRPDBK" size="3" maxlength="2" value="<%= prBasic.getE01PRPDBK()%>" readonly>
                      </td>
                      <td nowrap> 
                        <input type="text" id="txtlabel" name="E01PRPDBR" size="3" maxlength="3" value="<%= prBasic.getE01PRPDBR()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E01PRPDCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPDCY()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E01PRPDGL" size="13" maxlength="12" value="<%= prBasic.getE01PRPDGL()%>" readonly>                        
                      </td>
                      <td nowrap>  <% if (userPO.getPurpose().equals("NEW")) out.print(userPO.getAccNum()); else out.print(prBasic.getE01PRPDAC());%>                        
                      </td>
                      <td nowrap> <input type="text" id="txtlabel" name="E01PRPDSA" size="6" maxlength="5" value="<%= prBasic.getE01PRPDSA()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E01PRPDCC" size="6" maxlength="6" value="<%= prBasic.getE01PRPDCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Credit Account :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPCBK" size="3" maxlength="2" value="<%= prBasic.getE01PRPCBK()%>"> 
					  </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPCBR" size="3" maxlength="3" value="<%= prBasic.getE01PRPCBR()%>" 
						oncontextmenu="showPopUp(branchHelp,'E01PRPCBR',document.forms[0].E01PRPCBK.value,'','','','')">
                      </td>
                      <td nowrap>  <input type="text" name="E01PRPCCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPCCY()%>" 
						oncontextmenu="showPopUp(currencyHelp,'E01PRPCCY',document.forms[0].E01PRPCBK.value,'','','','')"	>
                      </td>
                      <td nowrap>  <input type="text" name="E01PRPCGL" size="13" maxlength="12" value="<%= prBasic.getE01PRPCGL()%>" 
                        oncontextmenu="showPopUp(ledgerHelp,'E01PRPCGL',document.forms[0].E01PRPCBK.value,'','','','')"	>                     
                      </td>
                      <td nowrap>  <input type="text" name="E01PRPCAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPCAC()%>" 
						oncontextmenu="showPopUp(accountHelp,'E01PRPCAC',document.forms[0].E01PRPCBK.value,'','','','RA')">
                      </td>
                      <td nowrap>  <input type="text" name="E01PRPCSA" size="6" maxlength="5" value="<%= prBasic.getE01PRPCSA()%>" >
                      </td>
                      <td nowrap> <input type="text" name="E01PRPCCC" size="6" maxlength="6" value="<%= prBasic.getE01PRPCCC()%>" 
                      	oncontextmenu="showPopUp(costcenterHelp,this.name,document.forms[0].E01PRPCBK.value,'','','','')">
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Description :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDSC" size="35" maxlength="35" value="<%= prBasic.getE01PRPDSC()%>"> 
					  </td>
					 </tr>	
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Payment Frequency :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <select name="E01PRPFRQ">
                          <option value="D" <% if(prBasic.getE01PRPFRQ().equals("D")) out.print("selected");%>>Daily</option>
                          <option value="W" <% if(prBasic.getE01PRPFRQ().equals("W")) out.print("selected");%>>Weekly</option>
                          <option value="M" <% if(prBasic.getE01PRPFRQ().equals("M")) out.print("selected");%>>Monthly</option>
                          <option value="V" <% if(prBasic.getE01PRPFRQ().equals("V")) out.print("selected");%>>Variable</option>
                          <option value="2" <% if(prBasic.getE01PRPFRQ().equals("2")) out.print("selected");%>>Every 2 Month</option>
                          <option value="3" <% if(prBasic.getE01PRPFRQ().equals("3")) out.print("selected");%>>Every 2 Month/option>
                        </select>
                      </td>
                    </tr>
                    <tr id=trdark> 
                      <td nowrap > 
                        <div align="right"> Due Date :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPPMD" size="3" maxlength="2" value="<%= prBasic.getE01PRPPMD()%>" >
                        <a href="javascript:GetCode('E01PRPPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" alt="help" ></a> 
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right"> or Due Dates :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDYS" size="4" maxlength="3" value="<%= prBasic.getE01PRPDYS()%>" >
                        (For variable payment only) </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Payments Count :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPNPM" size="6" maxlength="4" value="<%= prBasic.getE01PRPNPM()%>" >
                        (9999 = Undefined) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Payment Type :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPPMT" value="F" 
              <%if(!prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Fixed 
                        <input type="radio" name="E01PRPPMT" value="V" 
              <%if(prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Overdraft Authorization:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPODA" value="Y" 
              <%if(prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        Yes 
                        <input type="radio" name="E01PRPODA" value="N" 
              <%if(!prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Payment Suspention :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPSPM" value="Y" 
              <%if(prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        Yes 
                        <input type="radio" name="E01PRPSPM" value="N" 
              <%if(!prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right"></div>
                      </td>
                      <td nowrap colspan=7> 
                         </td>
                    </tr>                    
                  </table>
  		 </td>            
    </tr>
  </table>
 <h4>Last Payment</h4>
 <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark">                        
                      <td nowrap width="31%"> 
                        <div align="right">Date :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01PRPLPD" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPD().trim()%>" readonly>                        
                        <input type="text" name="E01PRPLPM" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPM().trim()%>" readonly>
                        <input type="text" name="E01PRPLPY" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPY().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Amount :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPLPA" size="12" maxlength="12" value="<%= prBasic.getE01PRPLPA().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%"> 
                        <div align="right">Reference Number :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPLRF" size="10" maxlength="9" value="<%= prBasic.getE01PRPLRF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Payment Number :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPLPN" size="5" maxlength="5" value="<%= prBasic.getE01PRPLPN().trim()%>" readonly>
                      </td>
                    </tr>
                                     
                  </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Send">
  </p>
  <SCRIPT Language="Javascript">
  	setHelp();
  </SCRIPT>
</form>
</body>
</html>
