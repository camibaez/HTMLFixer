<html>
<head>
<title>Funding Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">


<jsp:useBean id= "fnInst" class= "datapro.eibs.beans.EDL013601Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

  function ClearRow(idx){
    document.forms[0]["E01DLFSRF"+idx].value = "";
    document.forms[0]["E01DLFREF"+idx].value = "0";
	document.forms[0]["E01DLFMAM"+idx].value = "0";
	document.forms[0]["E01DLFMAD"+idx].value = "0";
	document.forms[0]["E01DLFMAY"+idx].value = "0";	
	document.forms[0]["E01DLFAMT"+idx].value = "0.00";				
	document.forms[0]["E01DLFTXT"+idx].value = "";					
  }
  
  function DeleteFundsSel(){
    var okdel=false;
    var posDel=0;
    var posSel=0;
    okdel = confirm("All selected rows will be deleted");
    if ( okdel ) { 
       for (var i=0;i<8;i++){
         if (document.forms[0].OPTDLT[i].checked){
           var j;
           posDel=i+1;
           posSel=0;
           for ( j=i+1;j<9;j++) {
             if (!document.forms[0].OPTDLT[j].checked){
                posSel=j+1;
                document.forms[0]["E01DLFSRF"+posDel].value = document.forms[0]["E01DLFSRF"+posSel].value;
             	document.forms[0]["E01DLFREF"+posDel].value = document.forms[0]["E01DLFREF"+posSel].value;
				document.forms[0]["E01DLFMAM"+posDel].value = document.forms[0]["E01DLFMAM"+posSel].value;
				document.forms[0]["E01DLFMAD"+posDel].value = document.forms[0]["E01DLFMAD"+posSel].value;
				document.forms[0]["E01DLFMAY"+posDel].value = document.forms[0]["E01DLFMAY"+posSel].value;
				document.forms[0]["E01DLFAMT"+posDel].value = document.forms[0]["E01DLFAMT"+posSel].value;
				document.forms[0]["E01DLFTXT"+posDel].value = document.forms[0]["E01DLFTXT"+posSel].value;
				document.forms[0].OPTDLT[j].checked=true;
				break;
			 }
           }
           if (posSel==0) ClearRow(posDel);
         }
       }
       if (document.forms[0].OPTDLT[8].checked) ClearRow(9);
       for (var i=0;i<9;i++){
        document.forms[0].OPTDLT[i].checked=false;
       } 
    }
  } 

</SCRIPT>

</head>


<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Funding Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fund_inst_lst.jsp,EDL0136"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0136" >
<% if (userPO.getPurpose().equals("INQUIRY")){ %>
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="50">
<% } else { %>
  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
<% } %>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap width="873"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap width="34%"> 
              <div align="left"> 
                <input type="text" name="E02NA12" size="40"
					maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td></td>
            <td></td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%" height="26"> 
              <div align="right"><b>Contract :</b></div>
            </td>
            <td nowrap width="9%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01DLFACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" height="26"> 
              <div align="right"><b>Maturity Date:</b></div>
            </td>
            <td nowrap height="26" width="34%"> 
              <div align="left"><b>
                </b><INPUT type="text" name="E01DEAMAM" size="3"
					maxlength="2" value="<%= fnInst.getE01DEAMAM().trim()%>" readonly> <INPUT
					type="text" name="E01DEAMAD" size="3" maxlength="2"
					value="<%= fnInst.getE01DEAMAD().trim()%>" readonly><INPUT
					type="text" name="E01DEAMAY" size="5" maxlength="4"
					value="<%= fnInst.getE01DEAMAY().trim()%>" readonly></div>
            </td>
            <td nowrap height="26" width="16%"> 
              <div align="right"><B>Currency : </B></div>
            </td>
            <td nowrap width="21%" height="26"> 
              <div align="left"><b> 
                
                </b><INPUT type="text" name="E01DEACCY" size="3"
					maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly> </div>
            </td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right"><b>Principal :</b></div>
          	</td>
          	<td>
          		<INPUT type="text" name="E01DEAPRI" size="25" maxlength="21"
					value="<%= fnInst.getE01DEAPRI().trim()%>" readonly>
			</td>
			<td>
				<div align="right"><b>Equivalent :</b></div>
			</td>
			<td width="260">
			    <INPUT type="text" name="E01DEAEQV" size="25" maxlength="21"
					value="<%= fnInst.getE01DEAEQV().trim()%>" readonly>
			
			</td>
			<td width="149">
				<div align="right"><b></b></div>
			</td>
			<td>
				<div align="center">
			    			
			    			
			    								
			    </div>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tbenter">
   <tr>
    <td><h4></h4></td>
    	<td 
    		<% if (!userPO.getPurpose().equals("INQUIRY")) { %>
	    		align=center class=TDBKG width><a href="javascript:DeleteFundsSel()">Delete Selection</a>
	    	<% } %>
    	</td>
   </tr>
  </table>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap width="877"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
	          <td nowrap width="4%"><% if (!userPO.getPurpose().equals("INQUIRY")) out.print("Delete"); %>
          </td>
          	<td nowrap width="11%">
          		<div align="center">Source</div>
          	</td>
            <td nowrap width="9%"> 
              <div align="center">Reference</div>
            </td>
            <td nowrap width="23%"> 
              <div align="center">Maturity</div>
            </td>
            <td nowrap width="29%"> 
              <div align="center"> Funding Amount</div>
            </td>
            <td nowrap width="31%"> 
              <div align="center">Remarks</div>
            </td>
          </tr>
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap width="4%"> 
           	<% if (!userPO.getPurpose().equals("INQUIRY")) { %>
              <div align="center"> 
                <input type="checkbox" name="OPTDLT" value="1">
              </div>
            <% } %>
            </td>
          
            <td nowrap width="11%"> 
              <div align="center">               
                <% if (userPO.getPurpose().equals("INQUIRY")) { %>
                	<input type="text" name="E01DLFSRF<%= name %>" size="2"  maxlength="1"
					value="<%= fnInst.getField("E01DLFSRF"+name).getString().trim()%>" readonly >
				<% } else { %>
                	<input type="text" name="E01DLFSRF<%= name %>" size="2"  maxlength="1"
					oncontextmenu="showPopUp(FundSourceHelp,this.name,'','','','','')"  value="<%= fnInst.getField("E01DLFSRF"+name).getString().trim()%>" >				
				<% } %>
              </div>
            </td>
          
            <td nowrap width="9%"> 
              <div align="center"> 
                <% if (userPO.getPurpose().equals("INQUIRY")) { %>
                	<input type="text" name="E01DLFREF<%= name %>" size="9" maxlength="9" value="<%= fnInst.getField("E01DLFREF"+name).getString().trim()%>" readonly>
                <% } else { %>
                	<input type="text" name="E01DLFREF<%= name %>" size="9" maxlength="9" value="<%= fnInst.getField("E01DLFREF"+name).getString().trim()%>"
                	oncontextmenu="showPopUp(openingWireHelp,this.name,'','','','','')"  onkeypress="enterInteger()">                
                <% } %>
              </div>
            </td>
            <td nowrap width="10%"> 
            	<div align="center"> 
               		<input type="text" name="E01DLFMAM<%= name %>" size="3" maxlength="2" value="<%= fnInst.getField("E01DLFMAM"+name).getString().trim()%>" 
               			<% if (userPO.getPurpose().equals("INQUIRY")) out.print("readonly"); %>>
            		<INPUT type="text" name="E01DLFMAD<%= name %>" size="3"	maxlength="2" value='<%= fnInst.getField("E01DLFMAD"+name).getString().trim()%>'
            			<% if (userPO.getPurpose().equals("INQUIRY")) out.print("readonly"); %> >
					<INPUT type="text" name="E01DLFMAY<%= name %>" size="5"	maxlength="4" value='<%= fnInst.getField("E01DLFMAY"+name).getString().trim()%>' 
						<% if (userPO.getPurpose().equals("INQUIRY")) out.print("readonly"); %>>
				</div>
            </td>
            
            <td nowrap width="25%"> 
              <div align="center"> 
                <input type="text" name="E01DLFAMT<%= name %>" size="25" maxlength="15" value="<%= fnInst.getField("E01DLFAMT"+name).getString().trim()%>" 
                	<% if (userPO.getPurpose().equals("INQUIRY")) out.print("readonly"); %>>
              </div>
            </td>
            <td nowrap width="31%"> 
              <div align="center"> 
                <input type="text" name="E01DLFTXT<%= name %>" size="38"  maxlength="35" value="<%= fnInst.getField("E01DLFTXT"+name).getString().trim()%>" 
                	<% if (userPO.getPurpose().equals("INQUIRY")) out.print("readonly"); %>>
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo" cellspacing="0">
  	<tr id="trdark">
  		<td>
          <div align="right">Total Funds :</div>  		
  		</td>
	    <td nowrap width="29%"> 
          <div align="left"> 
             <input type="text" name="E01TOTALS" size="25" maxlength="15" value="<%= fnInst.getField("E01TOTALS").getString().trim()%>" readonly>
          </div>
        </td>
        
  		<td>
          <div align="right">Difference :</div>  		
  		</td>        
	    <td nowrap width="29%"> 
          <div align="left"> 
             <input type="text" name="E01DIFFER" size="25" maxlength="15" value="<%= fnInst.getField("E01DIFFER").getString().trim()%>" readonly>
          </div>
        </td>
  	</tr>
  </table>
  <div align="center"> 
  <% if (userPO.getPurpose().equals("INQUIRY")) { %>
		<input id="EIBSBTN" type="button" onclick="top.close()" value="Close" name="button1">		
  <% } else { %>
	   	<input id="EIBSBTN" type=submit name="Submit" value="Submit">
  <% } %>
  </div>  
</form>
</body>
</html>
