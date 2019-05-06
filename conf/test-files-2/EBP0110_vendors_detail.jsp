<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Vendors Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0110Record" class="datapro.eibs.beans.EBP011001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Do you want to delete this record??")) {
			return;
		}
	}
	document.forms[0].submit();
}

function goCustIns() {
    var pg = "";
    var ccy = "<%=currUser.getE01BCU()%>";
    var customer = document.getElementById("E01BPVCUN").value;
    if (customer == 0) {
		alert("Please enter a Customer Number to this Vendor!!!");
		return;
	}
 	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=62&E11CUS=" + customer + 
 	"&E11CCY=" + ccy + "&E11TYP=1";
 	CenterWindow(pg,900,600,2);
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	String read = "";
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
%>


<H3 align="center">Vendors 
					<% if (userPO.getPurpose().equals("NEW")) { 
										out.println("  - New "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println(" - Maintenance "); 
					   }			  
					   else { out.println(" - Inquiry ");
					   } 
				   %>				
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="vendors_detail.jsp, EBP0110">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN name="E01BPVCOD" value="<%= EBP0110Record.getE01BPVCOD().trim()%>"> 

  	<table class="tableinfo" width="100%">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
        		<table cellspacing="0" width="100%" border="0">
        			<tr id="trdark"> 
            			<td nowrap width="10%" align="right">Code : </td>
            			<td nowrap width="20%" align="left"><%= EBP0110Record.getE01BPVCOD()%></td>
						<td nowrap width="10%" align="right">Customer Number : </td>
						<td nowrap width="10%" align="left"> 
              				<INPUT type="text" name="E01BPVCUN" id="E01BPVCUN" maxlength="9" size="10" <%= read %> value="<%= EBP0110Record.getE01BPVCUN().trim()%>" onkeypress="enterDecimal()">
			    				<a href="javascript:GetCustomerDescId('E01BPVCUN','','')">
			    				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0">
			    				</a>
			    		</td>
            			<td nowrap width="20%">Creation Date : <%= datapro.eibs.master.Util.formatDate(EBP0110Record.getE01BPVCMM(),EBP0110Record.getE01BPVCDD(),EBP0110Record.getE01BPVCYY())%></td>
						<td nowrap width="30%">Last Update Date : <%= datapro.eibs.master.Util.formatDate(EBP0110Record.getE01BPVMMM(),EBP0110Record.getE01BPVMDD(),EBP0110Record.getE01BPVMYY())%></td>
					</tr>
        		</table>
   	   		</td>
   	 	</tr>
	</table>
  	<h4>Basic Information</h4>  
  	<table class="tableinfo" width="100%">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trdark"> 
          				<td nowrap width="10%" align="right">Vendor Name :</td>
						<td nowrap width="40%" align="left">
							<INPUT type="text" name="E01BPVNM1" maxlength="45" size="46" <%= read %> value="<%= EBP0110Record.getE01BPVNM1().trim()%>">
            					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
						</td>
			 			<td nowrap width="10%" align="right">Vendor Address : </td>
          				<td nowrap width="40%" align="left">
                			<INPUT type="text" name="E01BPVNM3" size="36" maxlength="35" <%= read %> value="<%= EBP0110Record.getE01BPVNM3().trim()%>">
				  				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
            			</td>
          			</tr>
          			<tr id="trdark"> 
 						<td nowrap width="10%" align="right"></td>
						<td nowrap width="40%" align="left">
							<INPUT type="text" name="E01BPVNM2" maxlength="45" size="46" <%= read %> value="<%= EBP0110Record.getE01BPVNM2().trim()%>">
						</td>
						<td nowrap width="10%" align="right"></td>
          				<td nowrap width="40%" align="left">
                			<INPUT type="text" name="E01BPVNM4" size="36" maxlength="35" <%= read %> value="<%= EBP0110Record.getE01BPVNM4().trim()%>">
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap width="10%" align="right">Short Name : </td>
            			<td nowrap align="left" width="40%">
            				<INPUT type="text" name="E01BPVSNM" size="16" maxlength="15" <%= read %> value="<%= EBP0110Record.getE01BPVSNM().trim()%>">
				  				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
				  		</td>		
						<td nowrap width="10%" align="right"> </td>
            			<td nowrap width="40%" align="left">
                			<INPUT type="text" name="E01BPVNM5" size="36" maxlength="35" <%= read %> value="<%= EBP0110Record.getE01BPVNM5().trim()%>">
            			</td>
          			</tr>
          			<tr id="trclear"> 
        				<td nowrap width="10%" align="right">Country : </td>
						<td nowrap width="40%" align="left">
              				<INPUT type="text" name="E01BPVCNT" maxlength="3" size="4" <%= read %> value="<%= EBP0110Record.getE01BPVCNT().trim()%>">
              				<INPUT type="text" name="E01BPVCDS" size="40" maxlength="35" value="<%= EBP0110Record.getE01BPVCDS().trim()%>" readonly>
              					<a href="javascript:GetCodeDescCNOFC('E01BPVCNT','E01BPVCDS','03')">
              						<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="help"  border="0" >
              					</a>
              					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
            			</td>    
            			<td nowrap width="10%" align="right">State : </td>
						<td nowrap width="40%" align="left">
              				<INPUT type="text" name="E01BPVSTE" maxlength="4" size="5" <%= read %> value="<%= EBP0110Record.getE01BPVSTE().trim()%>">
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap width="10%" align="right">Zip Code : </td>
						<td nowrap width="40%" align="left"> 
              				<INPUT type="text" name="E01BPVZIP" maxlength="10" size="11" <%= read %> value="<%= EBP0110Record.getE01BPVZIP().trim()%>">
						</td>
						<td nowrap width="10%" align="right">Phone Number : </td>
						<td nowrap width="40%" align="left"> 
              				<INPUT type="text" name="E01BPVPHN" maxlength="20" size="21" <%= read %> value="<%= EBP0110Record.getE01BPVPHN().trim()%>">
						</td>
          			</tr>
         		 	<tr id="trclear"> 
        				<td nowrap width="10%" align="right">e-Mail : </td>
						<td nowrap width="40%" align="left">
              				<INPUT type="text" name="E01BPVEMA" maxlength="60" size="61" <%= read %> value="<%= EBP0110Record.getE01BPVEMA().trim()%>">
            			</td>    
            			<td nowrap width="10%" align="right">Tax I.D. Number : </td>
						<td nowrap width="40%" align="left">
							<INPUT type="text" name="E01BPVIDF" maxlength="15" size="16" <%= read %> value="<%= EBP0110Record.getE01BPVIDF().trim()%>">
			    				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
            			</td>
    	  			</tr>         
          		</table> 
      		</td>
    	</tr>
   </table> 
   
   <h4>Payment Information</h4>  
   <table  class="tableinfo" width="100%">
   	  	<tr bordercolor="#FFFFFF"> 
   	    	<td nowrap> 
          		<table cellspacing="0" cellpadding="2" width="100%" border="0">
            		<tr id="trdark"> 
            			<td nowrap width="10%" align="right">Default Payment Via : </td>
						<td nowrap width="40%" align="left"> 
              				<SELECT name="E01BPVPVI" <%= disabled %>>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("A")?"Selected":"" %> value="A">ACH</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("R")?"Selected":"" %> value="R">Retail Account</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("G")?"Selected":"" %> value="G">GL Account</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("C")?"Selected":"" %> value="C">Official Check</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("S")?"Selected":"" %> value="S">Swift</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("P")?"Selected":"" %> value="P">Petty Cash</OPTION>
			  				</SELECT>
			  				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
						</td>
            			<td nowrap width="10%" align="right">Payment Method : </td>
            			<td nowrap width="40%" align="left"> 
              				<SELECT name="E01BPVPMT" <%= disabled %>>
							<OPTION <%= EBP0110Record.getE01BPVPMT().trim().equals("S")?"Selected":"" %> value="S">Single Payment</OPTION>
							<OPTION <%= EBP0110Record.getE01BPVPMT().trim().equals("M")?"Selected":"" %> value="M">Multiple invoices in one payment</OPTION>
			  				</SELECT>
			  				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
			 			</td>
           			</tr> 
		   			<tr id="trclear"> 
             			<td nowrap width="10%" align="left"><B>ACH Payment Via Information </B></td>
	         			<td nowrap width="40%" align="left"></td>
             			<td nowrap width="10%" align="right"></td> 
             			<td nowrap width="40%" align="left"></td>
		   			</tr>	
           			<tr id="trclear"> 
             			<td nowrap width="10%" align="right">Beneficiary name : </td>
	         			<td nowrap width="40%" align="left">
	           				<INPUT type="text" name="E01BPVNME" maxlength="45" size="46" <%= read %> value="<%= EBP0110Record.getE01BPVNME().trim()%>">
               			</td>
             			<td nowrap width="10%" align="right">Address : </td> 
             			<td nowrap width="40%" align="left"> 
			   				<INPUT type="text" name="E01BPVADD" maxlength="45" size="46" <%= read %> value="<%= EBP0110Record.getE01BPVADD().trim()%>">
			 			</td>
		   			</tr>	
		   			<tr id="trclear"> 
             			<td nowrap width="10%" align="right">City, State, ZIP : </td>
	         			<td nowrap width="40%" align="left">
	           				<INPUT type="text" name="E01BPVCSZ" maxlength="45" size="46" <%= read %> value="<%= EBP0110Record.getE01BPVCSZ().trim()%>">
             			</td>
             			<td nowrap width="10%" align="right">Routing Number : </td> 
             			<td nowrap width="40%" align="left"> 
			   				<INPUT type="text" name="E01BPVROU" maxlength="9" size="10" <%= read %> value="<%= EBP0110Record.getE01BPVROU().trim()%>" onkeypress="enterInteger()">
		     			</td>
		   			</tr>	
           			<tr id="trclear"> 
             			<td nowrap width="10%" align="right">Type </td>
	         			<td nowrap width="40%" align="left">
	           				<SELECT name="E01BPVACT" <%= disabled %>>
			     			<OPTION <%= EBP0110Record.getE01BPVACT().trim().equals("C")?"Selected":"" %> value="C">Checking</OPTION>
			     			<OPTION <%= EBP0110Record.getE01BPVACT().trim().equals("S")?"Selected":"" %> value="S">Saving</OPTION>
			   				</SELECT>
             			</td>
             			<td nowrap width="10%" align="right">Beneficiary Account  : </td> 
             			<td nowrap width="40%" align="left"> 
               				<INPUT type="text" name="E01BPVACC1" maxlength="17" size="18" <%= read %> value="<%= EBP0110Record.getE01BPVACC1().trim()%>">
             			</td>
		   			</tr>	
		   			<tr id="trdark"> 
             			<td nowrap width="10%" align="left"><B>Retail Account Payment Via Information</B> </td>
             			<td nowrap width="10%" align="left"></td>             
	         			<td nowrap width="40%" align="left"></td>
             			<td nowrap width="10%" align="right"></td> 
             			<td nowrap width="40%" align="left"></td>
		   			</tr>	
           			<tr id="trdark"> 
             			<td nowrap width="10%" align="right">Account Number : </td>
	         				<td nowrap width="40%" align="left">
	           					<INPUT type="text" name="E01BPVACC2" maxlength="9" size="11" <%= read %> value="<%= EBP0110Record.getE01BPVACC2().trim()%>">
               						<A href="javascript:GetAccount('E01BPVACC2','','','')">
                					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Account Help" border="0" align="top">
                					</A>
             				</td>
             				<td nowrap width="10%" align="right"></td> 
             				<td nowrap width="40%" align="left"></td>
		   			</tr>		
		   			<tr id="trclear"> 
             			<td nowrap width="10%" align="left"><B>GL Account Payment Via Information</B></td>
             			<td nowrap width="10%" align="left"></td>             
	         			<td nowrap width="40%" align="left"></td>
             			<td nowrap width="10%" align="right"></td> 
             			<td nowrap width="40%" align="left"></td>
		   			</tr>	
           			<tr id="trclear"> 
             			<td nowrap width="10%" align="right">Account Number : </td>
	         			<td nowrap width="40%" align="left">
             				<INPUT type="text" name="E01BPVACC3" maxlength="12" size="15" <%= read %> value="<%= EBP0110Record.getE01BPVACC3().trim()%>">
               					<A href="javascript:GetLedger('E01BPVACC3','','','')"> 
               					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="GL Account Help" border="0" align="top">
               					</A>
             			</td>
             			<td nowrap width="10%" align="right"></td> 
             			<td nowrap width="40%" align="left"></td>
		   			</tr>		
		   			<tr id="trdark"> 
             			<td nowrap width="10%" align="left"><B>SWIFT Payment Via Information </B></td>
	         			<td nowrap width="40%" align="left"></td>
             			<td nowrap width="10%" align="right"> </td> 
             			<td nowrap width="40%" align="left"> </td>
		   			</tr>	
           			<tr id="trdark"> 
             			<td nowrap width="10%" align="right">Instructions : </td>
	         			<td nowrap width="40%" align="left">
             				<A href="javascript:goCustIns()">
             					<IMG src="<%=request.getContextPath()%>/images/1bori.gif" alt="Customer Payment Instructions" align="middle" border="0">
							</A>
						</td>
             			<td nowrap width="10%" align="right"> </td> 
             			<td nowrap width="40%" align="left"> </td>
		    		</tr>	
      			</table>
	 		</td>
   		</tr>
   </table>  
   
   <h4>Tax Information</h4>
   <table  class="tableinfo" width="100%">
   	 	<tr bordercolor="#FFFFFF"> 
   	 		<td nowrap> 
      			<table cellspacing="0" cellpadding="2" width="100%" border="0">
        			<tr id="trdark"> 
          				<td nowrap width="10%" align="right">Tax Exception : </td>
	      				<td nowrap width="40%" align="left"> 
            				<INPUT type="radio" name="E01BPVFTX" value="Y" <% if (EBP0110Record.getE01BPVFTX().equals("Y")) out.print("checked"); %>>Yes 
            				<INPUT type="radio" name="E01BPVFTX" value="N" <% if (EBP0110Record.getE01BPVFTX().equals("N")) out.print("checked"); %>>No          
            					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
            			</td>
          				<td nowrap width="10%" align="right"></td> 
          				<td nowrap width="40%" align="left"></td>
        			</tr>
        			<tr id="trclear"> 
          				<td nowrap width="10%" align="right">Form : </td>
          				<td nowrap width="40%" align="left" >
							<SELECT name="E01BPVWTH" <%= disabled %>>
	          				<OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("N")?"Selected":"" %> value="N">None</OPTION>		
			  				<OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("B")?"Selected":"" %> value="B">Both</OPTION>
			  				<OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("F")?"Selected":"" %> value="F">Form 1099</OPTION>
			  				<OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("W")?"Selected":"" %> value="W">Withholding</OPTION>
							</SELECT>
		  				</td>	
          				<td nowrap width="10%" align="right"></td> 
          				<td nowrap width="40%" align="left"></td>
        			</tr>
      			</table>
     		</td>
     		</tr>
   </table>
   
   <h5></h5>
   <table  class="tableinfo" width="100%">
   	 <tr bordercolor="#FFFFFF"> 
   	 	<td nowrap> 
      		<table cellspacing="0" cellpadding="2" width="100%" border="0">
        		<tr id="trdark"> 
          			<td nowrap width="10%" align="right">Status : </td>
	      			<td nowrap width="40%" align="left">
	        			<SELECT name="E01BPVSTA" <%= disabled %>>
			  			<OPTION <%= EBP0110Record.getE01BPVSTA().trim().equals("A")?"Selected":"" %> value="A">Active</OPTION>
			  			<OPTION <%= EBP0110Record.getE01BPVSTA().trim().equals("I")?"Selected":"" %> value="I">Inactive</OPTION>
						</SELECT>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Mandatory Field" align="bottom">
          			</td>
            		<td nowrap width="10%" align="right"> </td> 
            		<td nowrap width="40%" align="left"></td>
				</tr>
       		</table>
	 	</td>
	 </tr>
    </table>
   
<h5></h5>
	<table width="100%">		
  		<tr>
  			<td width="33%">
  		  		<div align="center"> 
     				<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(5);" <%= disabled %>>
     	  		</div>	
  			</td>
  			<td width="33%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type=button name="Delete" value="Delete" onClick="goAction(4);" <%= disabled %>>
     	  		</div>	
  			</td>
  			<td width="34%">
  		  		<div align="center"> 
     				<input id="EIBSBTN" type=submit name="Exit" value="Exit" 
						<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    			onClick="goAction(1);" 
						<% } else { %>
							onClick="goAction(6);" 
						<% } %>>
     	  		</div>	
  			</td>
  		</tr>	
  	</table>	

</form>
</body>
</html>
