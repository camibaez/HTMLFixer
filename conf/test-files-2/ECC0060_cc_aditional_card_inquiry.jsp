<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Aditional Credit Card</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgAdtCard" class= "datapro.eibs.beans.ECC006001Message"  scope="session" />
	
</head>
<body>
	
<h3 align="center">Aditional Credit Card Inquiry
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cc_aditional_card_inquiry.jsp, ECC0060"> 
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I" >
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer / Portfolio : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCRRCN" size="9" maxlength="9" readonly value="<%= userPO.getID().trim()%>">
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSTROMER" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name : </b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
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
				 <div align="right"><b>Type : </b></div>
			</td>
            <td nowrap width="16%"> 
            	<div align="left"><b> 
                	<input type="text" name="E01TARTYP" size="12" maxlength="10" value="<% if (userPO.getHeader2().equals("D")) out.print("Debit"); else out.print("Credit");%>" readonly>
				</b> </div>
			</td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCRPRO" size="4" maxlength="4" value="<%= userPO.getProdCode().trim()%>" readonly>
                </b> </div>
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
      <h4> Primary Card </h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Primary Card Number : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01CCRNXN" size="21" maxlength="20" value="<%= userPO.getIdentifier().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Card Type : </b></div>
            </td>
            <td nowrap width="16%" colspan="3"> 
              <div align="left"><b> 
                <input type="text" name="E01CCRTPL" size="4" maxlength="4" value="<%= userPO.getType().trim()%>" readonly>
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
              <div align="right">Card Number :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" name="E01CCRPCN" size="21" maxlength="20" value="<%= msgAdtCard.getE01CCRPCN().trim()%>">            
 			</td>
    			<td nowrap width="20%"><div align="right">Customer Number :</div></td>
    			<td nowrap width="30%" >
      				<div align="left">
        				<input type="text" name="E01PRICUN" size="9" maxlength="9" value="<%= msgAdtCard.getE01PRICUN().trim()%>" readonly >
						<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
	  				</div>
    			</td>
          </tr>             
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01CCROPM" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCROPM().trim()%>" readonly">
              <input type="text" name="E01CCROPD" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCROPD().trim()%>" readonly">
              <input type="text" name="E01CCROPY" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCROPY().trim()%>" readonly">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01CCREXM" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCREXM().trim()%>" readonly">
              <input type="text" name="E01CCREXD" size="3" maxlength="2" value="<%= msgAdtCard.getE01CCREXD().trim()%>" readonly">
              <input type="text" name="E01CCREXY" size="5" maxlength="4" value="<%= msgAdtCard.getE01CCREXY().trim()%>" readonly">
            </td>
          </tr>        
			<tr id="trdark">
    			<td nowrap width="20%"><div align="right">Issue Country :</div></td>
    			<td nowrap width="30%">
      				<input type="text" id="COUNTRY" name="E01CCRICC" size="4" maxlength="3" value="<%= msgAdtCard.getE01CCRICC().trim()%>" readonly >
					<input type="text" name="E01CCRICD" size="30" maxlength="30" value="<%= msgAdtCard.getE01CCRICD().trim()%>" readonly >
					<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
    			</td>
			<td nowrap width="20%"><div align="right">Status :</div></td>
			<td nowrap width="30%">
  				<select name="E01CCRAST" disabled >
    				<option value=" " <% if (!(msgAdtCard.getE01CCRAST().equals("0") || msgAdtCard.getE01CCRAST().equals("1")
    										|| msgAdtCard.getE01CCRAST().equals("2") || msgAdtCard.getE01CCRAST().equals("3")
    										|| msgAdtCard.getE01CCRAST().equals("4") || msgAdtCard.getE01CCRAST().equals("5")
    										|| msgAdtCard.getE01CCRAST().equals("6") || msgAdtCard.getE01CCRAST().equals("7")
    										|| msgAdtCard.getE01CCRAST().equals("8") || msgAdtCard.getE01CCRAST().equals("9"))) out.print("selected"); %>></option>
	                <option value="0" <% if (msgAdtCard.getE01CCRAST().equals("0")) out.print("selected"); %>>REQUESTED BY CLIENT</option>
	                <option value="A" <% if (msgAdtCard.getE01CCRAST().equals("A")) out.print("selected"); %>>REQUESTED TO PROVIDER</option>
	                <option value="B" <% if (msgAdtCard.getE01CCRAST().equals("B")) out.print("selected"); %>>PREACTIVATED</option>
	                <option value="C" <% if (msgAdtCard.getE01CCRAST().equals("C")) out.print("selected"); %>>EMBOSSED</option>
	                <option value="D" <% if (msgAdtCard.getE01CCRAST().equals("D")) out.print("selected"); %>>SENT TO PROVIDER</option>
	                <option value="E" <% if (msgAdtCard.getE01CCRAST().equals("E")) out.print("selected"); %>>RECEIVED AT BANK</option>
	                <option value="F" <% if (msgAdtCard.getE01CCRAST().equals("F")) out.print("selected"); %>>SENT TO REGIONAL OFFICE</option>
	                <option value="G" <% if (msgAdtCard.getE01CCRAST().equals("G")) out.print("selected"); %>>SENT TO CLIENT</option>
					<option value="1" <% if (msgAdtCard.getE01CCRAST().equals("1")) out.print("selected"); %>>ACTIVE</option>
	                <option value="2" <% if (msgAdtCard.getE01CCRAST().equals("2")) out.print("selected"); %>>LOST</option>
	                <option value="3" <% if (msgAdtCard.getE01CCRAST().equals("3")) out.print("selected"); %>>BLOCKED PREVENTIVE</option>
	                <option value="H" <% if (msgAdtCard.getE01CCRAST().equals("H")) out.print("selected"); %>>BLOCKED BY CLIENT</option>
	                <option value="I" <% if (msgAdtCard.getE01CCRAST().equals("I")) out.print("selected"); %>>BLOCKED BY BANK</option>
	                <option value="4" <% if (msgAdtCard.getE01CCRAST().equals("4")) out.print("selected"); %>>STOLEN</option>
	                <option value="5" <% if (msgAdtCard.getE01CCRAST().equals("5")) out.print("selected"); %>>EXPIRED</option>
	                <option value="6" <% if (msgAdtCard.getE01CCRAST().equals("6")) out.print("selected"); %>>DESTROYED</option>                
	                <option value="7" <% if (msgAdtCard.getE01CCRAST().equals("7")) out.print("selected"); %>>NULIFIED</option>
	                <option value="8" <% if (msgAdtCard.getE01CCRAST().equals("8")) out.print("selected"); %>>DENIED</option>
  				</select>
			</td>
  			</tr>
         <tr id="trclear"> 
   			<td nowrap width="25%"><div align="right">Customer First Name :</div></td>
			<td nowrap width="27%" >
   				<input type="text" id="FIRST_NAME" name="E01CCRFNA" size="21" maxlength="20" value="<%= msgAdtCard.getE01CCRFNA().trim()%>" readonly>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
			</td>
   			<td nowrap width="25%"><div align="right">Customer Last Name :</div></td>
    		<td nowrap width="27%" >
				<input type="text" id="LAST_NAME" name="E01CCRLN1" size="21" maxlength="20" value="<%= msgAdtCard.getE01CCRLN1().trim()%>" readonly>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
    		</td>
          </tr>           
          <tr id="trdark"> 
			<td nowrap width="20%"><div align="right">Customer Embossing Name:</div></td>
			<td nowrap width="30%">
  				<input type="text" id="CARD_NAME" name="E01CCRCNN" size="28" maxlength="26" value="<%= msgAdtCard.getE01CCRCNN().trim()%>" readonly>
			</td>
			<td nowrap width="20%"><div align="right">Second Line Embossing :</div></td>
			<td nowrap width="30%">
  				<input type="text" name="E01CCRCNM" size="28" maxlength="26" value="<%= msgAdtCard.getE01CCRCNM().trim()%>" readonly>
			</td>
          </tr>           
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Card Limit :</div>
            </td>
            <td nowrap width="30%"> 
                <input type="text" name="E01CCRLNL" size="17" maxlength="16" value="<%= msgAdtCard.getE01CCRLNL().trim()%>" readonly> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory" align="bottom" border="0" >
 			</td>
	            <td nowrap width="25%"> 
	              <div align="right">Table Fees :</div>
	            </td>
	            <td nowrap width="23%"> 
					<input type="text" name="E01CCRTBL" size="2" maxlength="2" value="<%= msgAdtCard.getE01CCRTBL().trim()%>" readonly>
	            </td>
          </tr>           
        </table>
      </td>
    </tr>
  </table>

</form>
</body>
</html>
