<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Signers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtFirm" class= "datapro.eibs.beans.ESD000004Message"   scope="session"/>
<jsp:useBean id= "error"class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

 <% 
	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    	error.setERRNUM("0");
 	}
%>

<h3 align="center">Signers<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_inq_firm.jsp, EDD0000"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/pages/e/body_wait.jsp" >
  <INPUT TYPE=HIDDEN NAME="ServletName" VALUE="/servlet/datapro.eibs.teller.JSETS0000"> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
  
  <table class="tableinfo" align="center" style="width: 90%; margin-left: 25">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="11" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="47" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="6" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="14" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Officer :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="47" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="5" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  	int bene_amount = 9;
  	String name;
  	for ( int i=1; i<=bene_amount; i++ ) {
    	if ( i == 10 ) {
      		name = "A"; 
    	} else {
      		name = i + "";
    	}
%>    
    
    <table class="tbenter" border="0" width="100%">
    	<tr>
<%    
    switch ( i ) {
        case 1 :     
%> 
 <td align="left"><h4>First</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Second</h4></td>
<%          
           break;
        case 3 : 
%> 
 <td align="left"><h4>Third</h4></td>
<%          
           break;
        case 4 : 
%> 
 <td align="left"><h4>Forth</h4></td>
<%          
           break;
        case 5 : 
%> 
 <td align="left"><h4>Fifth</h4></td>
<%          
           break;
        case 6 : 
%> 
 <td align="left"><h4>Sixth</h4></td>
<%          
           break;
        case 7 : 
%> 
 <td align="left"><h4>Seventh</h4></td>
<%          
           break;
        case 8 : 
%> 
 <td align="left"><h4>Eighth</h4></td>
<%          
           break;
        case 9 : 
%> 
 <td align="left"><h4>Ninth</h4></td>
<%          
           break;
        case 10 : 
%> 
 <td align="left"><h4>Tenth</h4></td>
<%          
           break;
     }
%>
  <td width="30%" align="right">
  <h4>
  <A href="javascript:go(1)">1</A>,
  <A href="javascript:go(2)">2</A>,
  <A href="javascript:go(3)">3</A>,
  <A href="javascript:go(4)">4</A>,
  <A href="javascript:go(5)">5</A>,
  <A href="javascript:go(6)">6</A>,
  <A href="javascript:go(7)">7</A>,
  <A href="javascript:go(8)">8</A>,
  <A href="javascript:go(9)">9</A>
  </h4> 
  </td>   
  </tr>
  </table> 

  <table id="mainTable<%= name %>" class="tableinfo" width="100%">
    <tr> 
      <td> 
        <table width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Customer Number : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E<%= name %>4RCN" maxlength="9" size="9" value="<%= rtFirm.getField("E" + name + "4RCN").getString().trim()%>" readonly>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Legal Name : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= rtFirm.getField("E" + name + "4MA1").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Address : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="46" value="<%= rtFirm.getField("E" + name + "4MA2").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">City : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= rtFirm.getField("E" + name + "4CTY").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">State : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= rtFirm.getField("E" + name + "4STE").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Country : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= rtFirm.getField("E" + name + "4CTR").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">P.O. Box : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= rtFirm.getField("E" + name + "4POB").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Zip Code : </div>
            </td>
            <td width="23%" nowrap>
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= rtFirm.getField("E" + name + "4ZPC").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">D.O.B. :</div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4DT1" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT1").getString().trim()%>" readonly>
              <input type="text" name="E<%= name %>4DT2" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT2").getString().trim()%>" readonly>
              <input type="text" name="E<%= name %>4DT3" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT3").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Identification : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4BNI" maxlength="15" size="15" value="<%= rtFirm.getField("E" + name + "4BNI").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Telephone : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= rtFirm.getField("E" + name + "4HPN").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Type of Signature: </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4FL1" readonly value="<% if(rtFirm.getField("E" + name + "4FL1").getString().equals("1")) out.print("Individual");
              				else if(rtFirm.getField("E" + name + "4FL1").getString().equals("2")) out.print("Joined");
							else out.print("");%>" size="25">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Title/Position: </div>
            </td>
            <td	width="23%" nowrap> 
				<input type="text" name="E<%= name %>4MLC" value="<%= rtFirm.getField("E" + name + "4MLC").getString().trim()%>" size="4" maxlength="3" readonly>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td width="13%" > 
              <div align="right">Limit Amount: </div>
            </td>
            <td width="23%" nowrap > 
              <input type="text" name="E<%= name %>4AM1" value="<%= rtFirm.getField("E" + name + "4AM1").getString().trim()%>" size="15" maxlength="15" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Narrative: </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4MA4" size="35" maxlength="35" value="<%= rtFirm.getField("E" + name + "4MA4").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right"></div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= rtFirm.getField("E" + name + "4MA3").getString().trim()%>" readonly>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
<%
  }
%>
</div>

<table class="tbenter" width=100% align=center>
	<tr>
		<td><div align="center"><input class="EIBSBTN" type=button name="Submit" value="Close" onClick="checkClose()"></div></td> 
	</tr>
</table>

</form>

<script type="text/javascript">
	function go(idx) {
		getElement("E" + idx + "4RCN").focus();
	}
</script>

</body>
</html>
