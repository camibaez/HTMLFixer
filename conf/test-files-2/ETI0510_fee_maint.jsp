<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Structure of Commissions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnParam" class="datapro.eibs.beans.ETI051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/jquery.jsp"> </script>

<SCRIPT Language="Javascript">

function goAction(op,bnew) {

	op = document.forms[0].IND.value ;

	document.forms[0].E02CNLAC1.value = document.forms[0].E02CNLAC.value;
	document.forms[0].E02CNLFT1.value = document.forms[0].E02CNLFT.value;
	document.forms[0].E02CNLAC1.value = document.forms[0].E02CNLAC.value;
	document.forms[0].E02CNLGL1.value = document.forms[0].E02CNLGL.value;
	document.forms[0].E02CNLFA1.value = document.forms[0].E02CNLFA.value;
	document.forms[0].E02CNLFX1.value = document.forms[0].E02CNLFX.value;
	document.forms[0].E02CNLFM1.value = document.forms[0].E02CNLFM.value;
	document.forms[0].E02CNLCM1.value = document.forms[0].E02CNLCM.value;
	document.forms[0].E02CNLCX1.value = document.forms[0].E02CNLCX.value;
	document.forms[0].E02CNLIV1.value = document.forms[0].E02CNLIV.value;
	document.forms[0].D02GL1DSC.value = document.forms[0].D02GLDSC.value;
}

function backPage(){
	document.forms[0].E01CNLBNK.value = document.forms[0].E02CNLBNK.value;
	document.forms[0].SCREEN.value = 1;
}

function save(){
	document.forms[0].E01CNLBNK.value = document.forms[0].E02CNLBNK.value;
	document.forms[0].SCREEN.value = 200;
}


</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

</head>
<body>
<h3 align="center">Structure of Commissions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fee_maint.jsp, ETI0510"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETI0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  <INPUT TYPE=HIDDEN NAME="IND">
  <INPUT TYPE=HIDDEN NAME="E01CNLBNK">
 
  
  <div id="maintFee" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelEvent(event)"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Type of Commission :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
	              <select name="E02CNLFT">
	                <option value=" " ></option>
	                <option value="F" >Fixed</option>
	                <option value="%" >Percentage</option>        
	              </select>                
          </div>
        </td>

        <td align=CENTER width="14%"> 
        </td>
        <td align=CENTER width="34%"> 
        </td>

      </tr>
      <tr id="clear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Currency :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
			<input type="text" name="E02CNLAC"  size="4" maxlength="3" >              
            <a href="javascript:GetCurrency('E02CNLAC','')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
		  </div>
        </td>
        <td align=CENTER width="34%"> 
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Account :</div>
        </td>

            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNLGL" size="18" maxlength="17">
	            <a href="javascript:GetLedger('E02CNLGL','','','')">
	            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
              </div>
            </td>

        <td align=CENTER width="14%"> 
          <div align="right">Description :</div>
        </td>
        <td align=CENTER width="34%"> 
           <div align="left"> 
              <input type="text" name="D02GLDSC" size="35" maxlength="35" readonly>
            </div>
        </td>
      </tr>
      <tr id="clear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Amount :</div>
        </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA"  size="15" maxlength="13" onkeypress="enterDecimal(event)">              
              </div>
            </td>
        <td align=CENTER width="14%"> 
        </td>
        <td align=CENTER width="34%"> 
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Minimum Transaction Amount :</div>
        </td>
            <td nowrap > 
              <div align="left"> 
 				<input type="text" name="E02CNLCM"  size="15" maxlength="13" onkeypress="enterDecimal(event)">              
 			  </div>
            </td>
        <td align=CENTER width="14%"> 
          <div align="right">Maximum Transaction Amount :</div>
        </td>
        <td align=CENTER width="34%"> 
 				<input type="text" name="E02CNLCX"  size="15" maxlength="13" onkeypress="enterDecimal(event)">              
        </td>
      </tr>

      <tr id="clear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Minimum Fee Collect :</div>
        </td>
        <td align=CENTER width="34%"> 
 				<input type="text" name="E02CNLFM"  size="15" maxlength="13" onkeypress="enterDecimal(event)">              
        </td>
	    <td align=CENTER width="14%"> 
         <div align="right">Maximum Fee Collect :</div>
        </td>
            <td nowrap > 
              <div align="left"> 
 				<input type="text" name="E02CNLFX"  size="15" maxlength="13" onkeypress="enterDecimal(event)">              
 			  </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Tax :</div>
        </td>
            <td nowrap > 
              <div align="left"> 
	              <select name="E02CNLIV">
	                <option value=" " ></option>
	                <option value="Y" >Y</option>
	                <option value="N" >N</option>        
	              </select>
              </div>
            </td>
        <td align=CENTER width="14%"> 
        </td>
        <td align=CENTER width="34%"> 
        </td>
      </tr>
       <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input class="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1, true)">
        </td>
      </tr>
    </table>
  </div>

  <table class="tableinfo" width="100%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Bank :</b>
            </td>
            <td nowrap > 
              <input type="text" name="E02CNLBNK" size="3" maxlength="2" value="<%= lnParam.getE02CNLBNK()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Transaction Code :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02CNLTBL" size="5" maxlength="4" value="<%= lnParam.getE02CNLTBL()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Currency :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02CNLFCY" size="4" maxlength="3" value="<%= lnParam.getE02CNLFCY()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Teller Transaction Code :</b>
            </td>
            <td nowrap colspan="5">  
                <input type="text" name="E02CNLCII" size="8" maxlength="6" value="<%= lnParam.getE02CNLCII()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Description :</b>
            </td>
            <td nowrap colspan="5">  
               <input type="text" name="E02CNLDSC" size="35" maxlength="35" value="<%= lnParam.getE02CNLDSC()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Reimbursement Commission Payment :</b>
            </td>
            <td nowrap colspan="5">  
	              <select name="E02CNLRCC">
	                <option value=" " <% if (lnParam.getE02CNLRCC().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLRCC().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLRCC().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Debit Nemonic :</b>
            </td>
            <td nowrap colspan="5">  
                <input type="text" name="E02CNLMND" size="3" maxlength="2" value="<%= lnParam.getE02CNLMND()%>" >
				<A href="javascript:GetCodeDescCNOFC('E02CNLMND','D02CNLMND','20')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
                <input type="text" name="D02CNLMND" size="25" maxlength="25" value="<%= lnParam.getD02CNLMND()%>"  readonly >

              <b>Credit Nemonic :</b>
                <input type="text" name="E02CNLMNC" size="3" maxlength="2" value="<%= lnParam.getE02CNLMNC()%>" >
				<A href="javascript:GetCodeDescCNOFC('E02CNLMNC','D02CNLMNC','20')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
                <input type="text" name="D02CNLMNC" size="25" maxlength="25" value="<%= lnParam.getD02CNLMNC()%>"  readonly >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Commission Office :</b>
            </td>
            <td nowrap colspan="5">  
                <input type="text" name="E02CNLBCM" size="4" maxlength="3" value="<%= lnParam.getE02CNLBCM()%>"
                class="context-menu-help" 
                onmousedown="init(branchHelp,this.name,'','','','','')">
              <b>000=Office Origen, 999=Office Account. nnn=Central</b>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Cost Center :</b>
            </td>
            <td nowrap>  
                <input type="text" name="E02CNLCCN" size="9" maxlength="8" value="<%= lnParam.getE02CNLCCN()%>" >
                <a href="javascript:GetCostCenter('E02CNLCCN',document.forms[0].E02CNLBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="middle" border="0" ></a>

            </td>
            <td nowrap align=right> 
              <b>Minimum Average Montthly :</b>
            </td>
            <td nowrap colspan="3">  
                <input type="text" name="E02CNLPMM" size="15" maxlength="13" onkeypress="enterDecimal(event)" value="<%= lnParam.getE02CNLPMM()%>" 
                style="text-align: right;">
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Customer Type :</b>
            </td>
            <td nowrap>  
	              <select name="E02CNLPER">
	                <option value=" " <% if (lnParam.getE02CNLPER().equals(" ")) out.print("selected"); %>></option>
	                <option value="1" <% if (lnParam.getE02CNLPER().equals("1")) out.print("selected"); %>>Corporate</option>
	                <option value="2" <% if (lnParam.getE02CNLPER().equals("2")) out.print("selected"); %>>Individual</option>        
	                <option value="3" <% if (lnParam.getE02CNLPER().equals("3")) out.print("selected"); %>>Other</option>        
	              </select>                

            </td>
            <td nowrap align=right> 
              <b>Exception If Amount Egual to or Greater than :</b>
            </td>
            <td nowrap colspan="3">  
                <input type="text" name="E02CNLEXM" size="15" maxlength="13" onkeypress="enterDecimal(event)" value="<%= lnParam.getE02CNLEXM()%>"  
                style="text-align: right;">
            </td>
          </tr>
          <tr id="trdark">
          	<td nowrap align="right">
          		<b>Summarize Trans. G/L Account :</b>
          	</td>
          	<td nowrap colspan="5">
          		<input type="text" name="E02CNLGPC" size="13" maxlength="12" onkeypress="enterDecimal(event)" value="<%= lnParam.getE02CNLGPC()%>"  >
          		<a href="javascript:GetLedger('E02CNLGPC',document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'')">
          		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
          	</td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <table  class="tableinfo" width="100%">
    <tr > 
      <td nowrap width="100%"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th >Commission<br>Type</th>
     	 	<th >Currency</th> 
            <th >General Ledger<br>Account</th>
            <th >Amount of<br>Commission</th>
            <th >Range Amount<br>Minimum Trans.</th>
            <th >Range Amount<br>Maximum Trans.</th>
            <th >Minimum<br>Fee Collect</th>
            <th >Maximum<br>Fee Collect</th>
            <th >Tax</th>
            <th >Description</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT1">
	                <option value=" " <% if (!(lnParam.getE02CNLFT1().equals("F") ||lnParam.getE02CNLFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT1().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT1().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC1" value="<%= lnParam.getE02CNLAC1() %>" size="4" maxlength="3"
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL1" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL1()%>" 
 				style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA1" value="<%= lnParam.getE02CNLFA1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM1" value="<%= lnParam.getE02CNLFM1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX1" value="<%= lnParam.getE02CNLFX1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM1" value="<%= lnParam.getE02CNLCM1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX1" value="<%= lnParam.getE02CNLCX1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV1">
	                <option value=" " <% if (lnParam.getE02CNLIV1().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV1().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL1DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT2">
	                <option value=" " <% if (!(lnParam.getE02CNLFT2().equals("F") ||lnParam.getE02CNLFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT2().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT2().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC2" value="<%= lnParam.getE02CNLAC2() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL2" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL2()%>"
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA2" value="<%= lnParam.getE02CNLFA2() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM2" value="<%= lnParam.getE02CNLFM2() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX2" value="<%= lnParam.getE02CNLFX2() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM2" value="<%= lnParam.getE02CNLCM2() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX2" value="<%= lnParam.getE02CNLCX2() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV2">
	                <option value=" " <% if (lnParam.getE02CNLIV2().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV2().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL2DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT3">
	                <option value=" " <% if (!(lnParam.getE02CNLFT3().equals("F") ||lnParam.getE02CNLFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT3().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT3().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC3" value="<%= lnParam.getE02CNLAC3() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL3" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL3()%>" 
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA3" value="<%= lnParam.getE02CNLFA3() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM3" value="<%= lnParam.getE02CNLFM3() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX3" value="<%= lnParam.getE02CNLFX3() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM3" value="<%= lnParam.getE02CNLCM3() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX3" value="<%= lnParam.getE02CNLCX3() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV3">
	                <option value=" " <% if (lnParam.getE02CNLIV3().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV3().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL3DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT4">
	                <option value=" " <% if (!(lnParam.getE02CNLFT4().equals("F") ||lnParam.getE02CNLFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT4().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT4().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC4" value="<%= lnParam.getE02CNLAC4() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL4" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL4()%>" 
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA4" value="<%= lnParam.getE02CNLFA4() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM4" value="<%= lnParam.getE02CNLFM4() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX4" value="<%= lnParam.getE02CNLFX4() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM4" value="<%= lnParam.getE02CNLCM1() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX4" value="<%= lnParam.getE02CNLCX4() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV4">
	                <option value=" " <% if (lnParam.getE02CNLIV4().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV4().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL4DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT5">
	                <option value=" " <% if (!(lnParam.getE02CNLFT5().equals("F") ||lnParam.getE02CNLFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT5().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT5().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC5" value="<%= lnParam.getE02CNLAC5() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL5" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL5()%>" 
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA5" value="<%= lnParam.getE02CNLFA5() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM5" value="<%= lnParam.getE02CNLFM5() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX5" value="<%= lnParam.getE02CNLFX5() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM5" value="<%= lnParam.getE02CNLCM5() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX5" value="<%= lnParam.getE02CNLCX5() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV5">
	                <option value=" " <% if (lnParam.getE02CNLIV5().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV5().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL5DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT6">
	                <option value=" " <% if (!(lnParam.getE02CNLFT6().equals("F") ||lnParam.getE02CNLFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT6().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT6().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC6" value="<%= lnParam.getE02CNLAC6() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL6" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL6()%>" 
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA6" value="<%= lnParam.getE02CNLFA6() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM6" value="<%= lnParam.getE02CNLFM6() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX6" value="<%= lnParam.getE02CNLFX6() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM6" value="<%= lnParam.getE02CNLCM6() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX6" value="<%= lnParam.getE02CNLCX6() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV6">
	                <option value=" " <% if (lnParam.getE02CNLIV6().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV6().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL6DSC()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLFT7">
	                <option value=" " <% if (!(lnParam.getE02CNLFT7().equals("F") ||lnParam.getE02CNLFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNLFT7().equals("F")) out.print("selected"); %>>Fixed</option>
	                <option value="%" <% if (lnParam.getE02CNLFT7().equals("%")) out.print("selected"); %>>Percentage</option>        
	              </select>                
              </div>
            </td>
            
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02CNLAC7" value="<%= lnParam.getE02CNLAC7() %>" size="4" maxlength="3" 
 				style="text-align: center;" 
                class="context-menu-help" 
 				onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNLGL7" size="18" maxlength="17" value="<%= lnParam.getE02CNLGL7()%>" 
                style="text-align: center;" 
                class="context-menu-help" 
                onmousedown="init(ledgerHelp,this.name,document.forms[0].E02CNLBNK.value,document.forms[0].E02CNLFCY.value,'','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              	<input type="text" name="E02CNLFA7" value="<%= lnParam.getE02CNLFA7() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
              	style="text-align: right;" >              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFM7" value="<%= lnParam.getE02CNLFM7() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLFX7" value="<%= lnParam.getE02CNLFX7() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCM7" value="<%= lnParam.getE02CNLCM7() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNLCX7" value="<%= lnParam.getE02CNLCX7() %>" size="15" maxlength="13" onkeypress="enterDecimal(event)"
 				style="text-align: right;" >              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNLIV7">
	                <option value=" " <% if (lnParam.getE02CNLIV7().equals(" ")) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNLIV7().equals("Y")) out.print("selected"); %>>Yes</option>
	                <option value="N" <% if (lnParam.getE02CNLIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL7DSC()%>" readonly>
              </div>
            </td>
          </tr>
         <tr id="trclear"> 
            <td nowrap colspan="7"> Commission Fixed, Percentage (3 decimal) 
            </td>
          </tr>
     </table>
    </td>
    </tr>
  </table>
<table class="tbenter" width=100% align=center>
	<tr> 
    	<td><div align="center"><input class="EIBSBTN" type=submit name="Submit" value="Submit" OnClick="save()"></div></td>
        <td><div align="center"><INPUT class="EIBSBTN" type=submit name="Submit0" value="Cancel" OnClick="backPage()"></div></td>
    </tr>
</table>
</form>
</body>
</html>
