<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Wire Transfer Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<%@ page import = "datapro.eibs.sockets.CharacterField" %>	
<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000504Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
	String GPI = "";	
	String hdr2e = "";
	String hdr2f = "";
	String hdr1c = "";
	
	String Block = (((CharacterField)bankOld.getField("E04CWTABK")).getStringUD());
	%>
<script type="text/javascript">

	function changeVisibility(visible){
		getElement('swiftBlocks').style.display = visible =="Y" ? "inline" : "none";
	}
	
	function splitData(setData){
		var value = "<%=Block%>";

		if(!setData){
			getElement('tag103').value = (value.substring(0, 3));
			getElement('tag111').value = (value.substring(3, 6));
			<%			
				try{
					GPI =Block.substring(6,7); 
				}
				catch(Exception e){}
				try{
					hdr2e =Block.substring(7,8); 
				}
				catch(Exception e){}
				try{
					hdr2f =Block.substring(8,9); 
				}
				catch(Exception e){}
				try{
					hdr1c = Block.substring(9,10);
				} catch(Exception e){}
			%> 
			
			
			if((trim(value.substring(0, 7))).length <= 0)
				changeVisibility(false);
		} else {
			var gpij =" ";		
			fillRight(getElement("tag103"),' ');
			fillRight(getElement("tag111"),' ');
			if(getElementChecked("tag121")) gpij = getElementChecked("tag121").value;
			getElement("E04CWTABK").value = getElement("tag103").value + 
											getElement("tag111").value + 
											gpij +
											getElement("hdr2e").value + 
											getElement("hdr2f").value +
											getElement("hdr1c").value;
			//alert("set " + getElement("E04CWTABK").value);
			document.forms[0].submit();
		}	
	}
	
	
</script>

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}

%>

<h3 align="center">Wire Transfer Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="wire_transf_param_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  <table class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Bank Code :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
					<input type="text" name="E04CWTBNK" size="3" readonly maxlength="2" value="<%=bankOld.getE04CWTBNK().trim()%>">          
			  </div>  
			</td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E04CWTNAM" size="36" readonly maxlength="35" value="<%=bankOld.getE04CWTNAM().trim()%>">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
<h4>FED</h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">FED/ABA Account :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E04CWTBAB" size="10" maxlength="9" value="<%=bankOld.getE04CWTBAB().trim()%>">
	   </td>
	    <td nowrap width="30%">
		   <div align="right">Name :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E04CWTNME" size="36" maxlength="35" value="<%=bankOld.getE04CWTNME().trim()%>">
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Default CR G/L :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTFCA" size="13" maxlength="12" value="<%=bankOld.getE04CWTFCA().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E04CWTFCA',document.forms[0].E04CWTBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
	    <td nowrap width="30%">
		   <div align="right">Default DR G/L :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E04CWTDGL" size="13" maxlength="12" value="<%=bankOld.getE04CWTDGL().trim()%>" onKeyPress="enterInteger()">
		   <a href="javascript:GetLedger('E04CWTDGL',document.forms[0].E04CWTBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">Interface :</div>
		</td>
		<td nowrap width="20%">
		  <select name="E04CWTFIN">
		    <option value=" " <% if (!(bankOld.getE04CWTFIN().equals("P") || bankOld.getE04CWTFIN().equals("T"))) out.print("selected"); %>></option>
            <option value="P" <%if (bankOld.getE04CWTFIN().equals("P"))  out.print("selected");%>>Prod</option>
		    <option value="T" <%if (bankOld.getE04CWTFIN().equals("T"))  out.print("selected");%>>Test</option>
		  </select>
		</td>
		<td nowrap width="30%">
		</td>
        <td nowrap width="25%">
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		    <div align="right">Terminal ID # :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTFTR" size="9" maxlength="8" value="<%=bankOld.getE04CWTFTR().trim()%>">
		</td>
		<td nowrap width="30%">
		<div align="right">File Used for Desc :</div>
		</td>
        <td nowrap width="25%">
		  <select name="E04CWTFDS">
		    <option value=" " <% if (!(bankOld.getE04CWTFDS().equals("ORG") || bankOld.getE04CWTFDS().equals("BNF") || bankOld.getE04CWTFDS().equals("RFB") || bankOld.getE04CWTFDS().equals("OBI"))) out.print("selected"); %>></option>
            <option value="ORG" <%if (bankOld.getE04CWTFDS().equals("ORG"))  out.print("selected");%>>Originator</option>
		    <option value="BNF" <%if (bankOld.getE04CWTFDS().equals("BNF"))  out.print("selected");%>>Beneficiary</option>
            <option value="RFB" <%if (bankOld.getE04CWTFDS().equals("RFB"))  out.print("selected");%>>Beneficiary Reference</option>
		    <option value="OBI" <%if (bankOld.getE04CWTFDS().equals("OBI"))  out.print("selected");%>>Originator Beneficiary Inf.</option>
		  </select>
		 </td>
	</tr>
</table>
</div>
<h4>SWIFT</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Swift ID :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTSWN" size="12" maxlength="11" value="<%=bankOld.getE04CWTSWN().trim()%>">
		</td>
		<td nowrap width="30%">
		</td>
        <td nowrap width="25%">
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Default CR G/L :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTSCG" size="13" maxlength="12" value="<%=bankOld.getE04CWTSCG().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E04CWTSCG',document.forms[0].E04CWTBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
	    <td nowrap width="30%">
		   <div align="right">Default DR G/L :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E04CWTSDG" size="13" maxlength="12" value="<%=bankOld.getE04CWTSDG().trim()%>" onKeyPress="enterInteger()">
		   <a href="javascript:GetLedger('E04CWTSDG',document.forms[0].E04CWTBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		    <div align="right">Interface :</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E04CWTSIN" value="Y"  <%if (bankOld.getE04CWTSIN().equals("Y")) 	out.print("checked");%> onclick="changeVisibility(this.value)"> Yes
           <input type="radio" name="E04CWTSIN" value="N"  <%if (bankOld.getE04CWTSIN().equals("N")) 	out.print("checked");%> onclick="changeVisibility(this.value)"> No</p>
		</td>
		<td nowrap width="30%">
		</td>
        <td nowrap width="25%">
        </td>
	</tr>
</table>
<div id="swiftBlocks" >
<br>
<h4> Basic Header Block </h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
	<tr>
		<td nowrap width="25%">
			<div align="right"> Service ID : </div>
		</td>
		<td nowrap >
			<select name="hdr1c">
		    <option value="01" <% if (!(hdr1c.equals("21"))) out.print("selected"); %>>FIN/GPA</option>
            <option value="21" <%if (hdr1c.equals("21"))  out.print("selected");%>>ACK/NAK</option>
		  </select>
        </td>
	</tr>
</table>
<br>
<h4> Application Header Block </h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
	<tr>
		<td nowrap width="25%">
			<div align="right"> Message priority : </div>
		</td>		
		<td nowrap>
			<select name="hdr2e">
		    <option value="N" <% if (!(hdr2e.equals("S") || hdr2e.equals("U"))) out.print("selected"); %>>Normal</option>
            <option value="S" <%if (hdr2e.equals("S"))  out.print("selected");%>>System</option>
		    <option value="U" <%if (hdr2e.equals("U"))  out.print("selected");%>>Urgent</option>
		  </select>
        </td>
        <td nowrap width="25%">
			<div align="right"> Delivery monitoring : </div>
		</td>
		<td nowrap>
			<select name="hdr2f">
		    <option value="1" <% if (hdr2f.equals("1")) out.print("selected"); %>>Non delivery warning</option>
            <option value="2" <%if (hdr2f.equals("2"))  out.print("selected");%>>Delivery notification</option>
		    <option value="3" <%if (hdr2f.equals("3"))  out.print("selected");%>>Both valid</option>
		  </select>
        </td>
	</tr>
</table>
<br>
<h4> User Header Block </h4>
<div id="block3">
<input type="hidden" name="E04CWTABK" > 
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Service Identifier :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="tag103" size="4" maxlength="3" >
        </td>
		<td nowrap width="30%">
		<div align="right">GPI :</div>
		</td>
        <td nowrap width="25%">
		  <p>
           <input type="radio" name="tag121" value="Y" maxlength="1" <%if (GPI.equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="tag121" value="N" maxlength="1" <%if (GPI.equals("N")) out.print("checked");%>> No 
          </p>
 		</td>		
	</tr>
	<tr>
		<td nowrap width="25%">
			<div align="right">Service Type Identifier :</div>
		</td>		
		<td nowrap colspan="3">
			<input type="text" name="tag111" size="4" maxlength="3"  >
        </td>
	</tr>
</table>
</div>
</div>
<%--
<h4>TELEX</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Carrier Code :</div>
		</td>
		<td nowrap width="20%">
		  <select name="E04CWTTLC">
		    <option value=" " <% if (!(bankOld.getE04CWTTLC().equals("1") || bankOld.getE04CWTTLC().equals("2"))) out.print("selected"); %>></option>
            <option value="1" <%if (bankOld.getE04CWTTLC().equals("1"))  out.print("selected");%>>MCI</option>
		    <option value="2" <%if (bankOld.getE04CWTTLC().equals("2"))  out.print("selected");%>>AT&T</option>
		  </select>
		</td>
		<td nowrap width="30%">
		<div align="right">Bank ID :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E04CWTTLB" size="7" maxlength="6" value="<%=bankOld.getE04CWTTLB().trim()%>" >
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Answerback :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTABK" size="18" maxlength="17" value="<%=bankOld.getE04CWTABK().trim()%>" >
		</td>
		<td nowrap width="30%">
		<div align="right">Last Number :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E04CWTRTN" size="7" maxlength="6" value="<%=bankOld.getE04CWTRTN().trim()%>" onKeyPress="enterInteger()">
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Last Incoming Number :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTITN" size="7" maxlength="6" value="<%=bankOld.getE04CWTITN().trim()%>" onKeyPress="enterInteger()">
		</td>
		<td nowrap width="30%">
		<div align="right">Transfer Interface :</div>
		</td>
        <td nowrap width="25%">
		  <select name="E04CWTAIG">
		    <option value=" " <% if (!(bankOld.getE04CWTAIG().equals("1") || bankOld.getE04CWTAIG().equals("2"))) out.print("selected"); %>></option>
            <option value="1" <%if (bankOld.getE04CWTAIG().equals("1"))  out.print("selected");%>>Web</option>
		    <option value="2" <%if (bankOld.getE04CWTAIG().equals("2"))  out.print("selected");%>>5250</option>
		  </select>
 		</td>
	</tr>
</table>
 --%>
<h4>STP</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Incoming Messages :</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E04CWTIST" value="Y"  <%if (bankOld.getE04CWTIST().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E04CWTIST" value="N"  <%if (bankOld.getE04CWTIST().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="30%">
		<div align="right">Outgoing Messages :</div>
		</td>
        <td nowrap width="25%">
            <p>
           <input type="radio" name="E04CWTOST" value="Y"  <%if (bankOld.getE04CWTOST().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E04CWTOST" value="N"  <%if (bankOld.getE04CWTOST().equals("N")) 	out.print("checked");%>> No</p>
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Currency for Limit :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTSCY" size="4" maxlength="3" value="<%=bankOld.getE04CWTSCY().trim()%>" >
			<a href="javascript:GetCurrency('E04CWTSCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
		</td>
		<td nowrap width="30%">
		<div align="right">Incoming Limit Amount :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E04CWTILM" size="15" maxlength="14" value="<%=bankOld.getE04CWTILM().trim()%>" onKeyPress="enterDecimal()">
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Outgoing Limit Amount :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTMXO" size="15" maxlength="14" value="<%=bankOld.getE04CWTMXO().trim()%>" onKeyPress="enterDecimal()">
		</td>
		<td nowrap width="30%">
		<div align="right">Type of OFAC Search :</div>
		</td>
        <td nowrap width="25%">
			<input type="text" name="E04CWTOFT" size="2" maxlength="1" value="<%=bankOld.getE04CWTOFT().trim()%>" >
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Years of History :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E04CWTHYR" size="3" maxlength="2" value="<%=bankOld.getE04CWTHYR().trim()%>" onKeyPress="enterInteger()">
		</td>
		<td nowrap width="30%">
		<div align="right"></div>
		</td>
        <td nowrap width="25%">
 		</td>
	</tr>
</table>
<h4>Additional Information</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">WT/Ofac Monitor Compliance :</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E04CWTF023" value="Y"  <%if (bankOld.getE04CWTF023().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E04CWTF023" value="N"  <%if (bankOld.getE04CWTF023().equals("N") || bankOld.getE04CWTF023().equals(""))out.print("checked");%> > No</p>
		</td>
		<td nowrap width="30%">
		<div align="right">Transfer Interface :</div>
		</td>
        <td nowrap width="25%">
		  <select name="E04CWTAIG">
		    <option value=" " <% if (!(bankOld.getE04CWTAIG().equals("1") || bankOld.getE04CWTAIG().equals("2"))) out.print("selected"); %>></option>
            <option value="1" <%if (bankOld.getE04CWTAIG().equals("1"))  out.print("selected");%>>Web</option>
		    <option value="2" <%if (bankOld.getE04CWTAIG().equals("2"))  out.print("selected");%>>5250</option>
		  </select>
 		</td>		
	</tr>

</table>


<br/>
<div align="center">
	<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:splitData(true);">
</div>

<script type="text/javascript">
	splitData(false);
	changeVisibility('<%=bankOld.getE04CWTSIN()%>');
</script>
</form>
</body>
</html>

