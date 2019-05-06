<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EPR200002Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

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
    
    
</SCRIPT>

</head>

<body>

<h3 align="center">Payment Orders Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_inquiry.jsp,EPR2000" ></h3>
<hr size="4">


<form >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="700">
  	
  <table class="tableinfo" >
    <tr> 
      <td > 
      <table  cellspacing=0 cellpadding=0 width="100%">
      <tr id=trdark>
      	<td nowrap width="30%" > 
        <div align="right">Account :</div>
      	</td>
      	<td nowrap width="10%">  
        
          <input type="text" name="E02PRPDAC" size="12" maxlength="12" value="<%= prBasic.getE02PRPDAC()%>" readonly>
        
        </td>
      	<td nowrap width="20%"> 
        <div align="right">Reference : </div>
      	</td>
      	
      	<td nowrap width="40%" >
      	  <input type="text" name="E02PRPNUM" size="9" maxlength="9" value="<%= prBasic.getE02PRPNUM()%>" readonly>                              
      	</td>
      	
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
                        <select name="E02PRPVIA" disabled>
                          <option value="1" <% if(prBasic.getE02PRPVIA().equals("1")) out.print("selected");%>>FED</option>
                          <option value="2" <% if(prBasic.getE02PRPVIA().equals("2")) out.print("selected");%>>Swift MT-100/103</option>
                          <option value="3" <% if(prBasic.getE02PRPVIA().equals("3")) out.print("selected");%>>Swift MT-200/202</option>
                          <option value="4" <% if(prBasic.getE02PRPVIA().equals("4")) out.print("selected");%>>Chips</option>
                          <option value="5" <% if(prBasic.getE02PRPVIA().equals("5")) out.print("selected");%>>ACH</option>
                          <option value="6" <% if(prBasic.getE02PRPVIA().equals("6")) out.print("selected");%>>Bill View/option>
                          <option value="7" <% int via = 7;
                          try { via = Integer.parseInt(prBasic.getE02PRPVIA()); } catch (Exception e) {	via = 7;}				
                          if (via >= 7) out.print("selected");%>>Interna</option>                          
                        </select>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Comission Table :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPCOT" size="4" maxlength="3" value="<%= prBasic.getE02PRPCOT().trim()%>" readonly>                      
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap width="31%"> 
                        <div align="right">Transfer Amount :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E02PRPAMT" size="17" maxlength="17" value="<%= prBasic.getE02PRPAMT().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Currency :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPTCY" size="4" maxlength="3" value="<%= prBasic.getE02PRPTCY().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap width="31%"> 
                        <div align="right">Beneficiary Ref.:</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPTHF" size="9" maxlength="9" value="<%= prBasic.getE02PRPTHF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Sender Ref. :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPSRF" size="9" maxlength="9" value="<%= prBasic.getE02PRPSRF().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" >
                      <div align="right">Receiver Id :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPRPD" size="9" maxlength="9" value="<%= prBasic.getE02PRPRPD().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Receiver Short Name :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPRSH" size="20" maxlength="15" value="<%= prBasic.getE02PRPRSH().trim()%>" readonly>
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
                    <div>Benef. Bank</div>
                  </td> 
                 
                  <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2)"> 
                    <div>Payment Details</div>
                  </td> 
                 
                  <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3)"> 
                    <div>Intermediary Banck</div>
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
                        <input type="text" name="E12PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE12PRPBCU()%>" readonly><br>
                      	<input type="text" name="E22PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE22PRPBCU()%>" readonly><br>
                      	<input type="text" name="E32PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE32PRPBCU()%>" readonly><br>
                      	<input type="text" name="E42PRPBCU" size="35" maxlength="35" value="<%= prBasic.getE42PRPBCU()%>" readonly>
                      </td>                     
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Bank Account: </div>
                      </td>
                      <td nowrap width="2%" valign="top" > 
                        <input type="text" name="E02PRPBBO" size="2" maxlength="1" value="<%= prBasic.getE02PRPBBO()%>" readonly>
                      </td>
                      
                      <td nowrap > 
                        <input type="text" name="E12PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE12PRPBBK()%>" readonly><br>
                      	<input type="text" name="E22PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE22PRPBBK()%>" readonly><br>
                      	<input type="text" name="E32PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE32PRPBBK()%>" readonly><br>
                      	<input type="text" name="E42PRPBBK" size="35" maxlength="35" value="<%= prBasic.getE42PRPBBK()%>" readonly>
                      </td>
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Payment Details :</div>
                      </td>
                      
                      <td nowrap> 
                        <input type="text" name="E11PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE12PRPDTP()%>" readonly><br>
                      	<input type="text" name="E21PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE22PRPDTP()%>" readonly><br>
                      	<input type="text" name="E31PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE32PRPDTP()%>" readonly><br>
                      	<input type="text" name="E41PRPDTP" size="35" maxlength="35" value="<%= prBasic.getE42PRPDTP()%>" readonly>
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
                        <input type="text" name="E12PRPINB" size="35" maxlength="35" value="<%= prBasic.getE12PRPINB()%>" readonly><br>
                        <input type="text" name="E22PRPINB" size="35" maxlength="35" value="<%= prBasic.getE22PRPINB()%>" readonly><br>
                        <input type="text" name="E32PRPINB" size="35" maxlength="35" value="<%= prBasic.getE32PRPINB()%>" readonly><br>
                        <input type="text" name="E42PRPINB" size="35" maxlength="35" value="<%= prBasic.getE42PRPINB()%>" readonly>
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
                        <div align="center">Bank.</div>
                      </th>
                      <th nowrap>Branch
                      </th>
                      <th nowrap> 
                       <div align="center">CCY</div>
                      </th>
                      <th nowrap> <div align="center">GL</div>                        
                       </th>
                      <th nowrap> <div align="center">Account</div>
                       </th>
                       <th nowrap> <div align="center">Sub Account </div>
                      </th>
                      <th nowrap> <div align="center">Cost Acc</div>
                      </th>
                    </tr>                     
                    <tr  id=trdark > 
                      <td nowrap > 
                        <div align="right">Debit Account:</div>
                      </td>
                      <td nowrap> 
                        <input type="text" id="txtlabel" name="E02PRPDBK" size="3" maxlength="2" value="<%= prBasic.getE02PRPDBK()%>" readonly>
                      </td>
                      <td nowrap> 
                        <input type="text" id="txtlabel" name="E02PRPDBR" size="3" maxlength="3" value="<%= prBasic.getE02PRPDBR()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E02PRPDCY" size="3" maxlength="3" value="<%= prBasic.getE02PRPDCY()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E02PRPDGL" size="17" maxlength="16" value="<%= prBasic.getE02PRPDGL()%>" readonly>                        
                      </td>
                      <td nowrap>  <%= prBasic.getE02PRPDAC()%>                        
                      </td>
                      <td nowrap> <input type="text" id="txtlabel" name="E02PRPDSA" size="6" maxlength="5" value="<%= prBasic.getE02PRPDSA()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" id="txtlabel" name="E02PRPDCC" size="6" maxlength="6" value="<%= prBasic.getE02PRPDCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Credit Account:</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPCBK" size="3" maxlength="2" value="<%= prBasic.getE02PRPCBK()%>" readonly>
					  </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPCBR" size="3" maxlength="3" value="<%= prBasic.getE02PRPCBR()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" name="E02PRPCCY" size="3" maxlength="3" value="<%= prBasic.getE02PRPCCY()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" name="E02PRPCGL" size="17" maxlength="16" value="<%= prBasic.getE02PRPCGL()%>" readonly>                     
                      </td>
                      <td nowrap>  <input type="text" name="E02PRPCAC" size="13" maxlength="12" value="<%= prBasic.getE02PRPCAC()%>" readonly>
                      </td>
                      <td nowrap>  <input type="text" name="E02PRPCSA" size="6" maxlength="5" value="<%= prBasic.getE02PRPCSA()%>" readonly>
                      </td>
                      <td nowrap> <input type="text" name="E02PRPCCC" size="6" maxlength="6" value="<%= prBasic.getE02PRPCCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Description :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPDSC" size="35" maxlength="35" value="<%= prBasic.getE02PRPDSC()%>" readonly> 
					  </td>
					 </tr>	
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Payment Frequency:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <select name="E02PRPFRQ" disabled>
                          <option value="D" <% if(prBasic.getE02PRPFRQ().equals("D")) out.print("selected");%>>Diary</option>
                          <option value="W" <% if(prBasic.getE02PRPFRQ().equals("W")) out.print("selected");%>>Weekly</option>
                          <option value="M" <% if(prBasic.getE02PRPFRQ().equals("M")) out.print("selected");%>>Monthly</option>
                          <option value="V" <% if(prBasic.getE02PRPFRQ().equals("V")) out.print("selected");%>>Variable</option>
                          <option value="2" <% if(prBasic.getE02PRPFRQ().equals("2")) out.print("selected");%>>Every 2 Month</option>
                          <option value="3" <% if(prBasic.getE02PRPFRQ().equals("3")) out.print("selected");%>>Every 3 Month</option>
                        </select>
                      </td>
                    </tr>
                    <tr id=trdark> 
                      <td nowrap > 
                        <div align="right"> Due Date:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPPMD" size="3" maxlength="2" value="<%= prBasic.getE02PRPPMD()%>" readonly>
                        </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right"> o Due Dates:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPDYS" size="4" maxlength="3" value="<%= prBasic.getE02PRPDYS()%>" readonly>
                        (For variable payments only) </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Number of Payments:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPNPM" size="6" maxlength="4" value="<%= prBasic.getE02PRPNPM()%>" readonly>
                        (9999 = Undefined) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Payment Type:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPPMT" value="F" disabled 
              <%if(!prBasic.getE02PRPPMT().equals("V")) out.print("checked");%>>
                        Fixed 
                        <input type="radio" name="E02PRPPMT" value="V" disabled  
              <%if(prBasic.getE02PRPPMT().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Overdraft Authorization:</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPODA" value="Y" disabled  
              <%if(prBasic.getE02PRPODA().equals("Y")) out.print("checked");%>>
                        Yes 
                        <input type="radio" name="E02PRPODA" value="N" disabled  
              <%if(!prBasic.getE02PRPODA().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Payment Suspention :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPSPM" value="Y" disabled  
              <%if(prBasic.getE02PRPSPM().equals("Y")) out.print("checked");%>>
                        Yes 
                        <input type="radio" name="E02PRPSPM" value="N" disabled  
              <%if(!prBasic.getE02PRPSPM().equals("Y")) out.print("checked");%>>
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
                        <input type="text" name="E02PRPLPD" size="3" maxlength="2" value="<%= prBasic.getE02PRPLPD().trim()%>" readonly>                        
                        <input type="text" name="E02PRPLPM" size="3" maxlength="2" value="<%= prBasic.getE02PRPLPM().trim()%>" readonly>
                        <input type="text" name="E02PRPLPY" size="3" maxlength="2" value="<%= prBasic.getE02PRPLPY().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Amount :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPLPA" size="12" maxlength="12" value="<%= prBasic.getE02PRPLPA().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%"> 
                        <div align="right">Reference Number:</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPLRF" size="10" maxlength="9" value="<%= prBasic.getE02PRPLRF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Payment Number:</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPLPN" size="5" maxlength="5" value="<%= prBasic.getE02PRPLPN().trim()%>" readonly>
                      </td>
                    </tr>
                                     
                  </table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
  	<input id="EIBSBTN" type=button name="Submit" value="Print" onclick="javascript:showLetter(document.forms[0].E02PRPDAC.value,document.forms[0].E02PRPNUM.value)">
  </p>
  
<script>
	function showLetter(acc, ref){
 		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2040?account=" + acc + "&ref="+ref;
		CenterWindow(page,600,400,2);
	}
</script>  
</form>
</body>
</html>
