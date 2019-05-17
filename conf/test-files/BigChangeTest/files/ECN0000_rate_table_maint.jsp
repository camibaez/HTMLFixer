<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tabla de Renovaci&oacute;n de Certificados de Dep&oacute;sitos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.ECN000003Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

 function goAction(op) {
   var ok = true;
   if (op == "C") {
   	  ok = confirm("Are you sure you want to change the values?");
   }
   if (ok) {
   	document.forms[0].OPT.value = op;
   	document.forms[0].submit(); 
   }	 
 }
 function calculate(){
//a variable that will hold the index number of the selected radio button
	for (i=0;i<document.tabRates.baseRate.length;i++){
		if (document.tabRates.baseRate[i].checked==true)
			colvalue= i+1;			
		}
	var fieldobj ;
	var factorobj ;
	var baseobj ;
	
	for( i =1 ; i <= 15 ; i++ ){ 	    	
		name2= (i<10)? "0"+i: ""+i;	
		baseobj = getElement( "E03CL" + colvalue + name2 );
		for( j =1 ; j <= 7 ; j++ ){ 
		factorobj = getElement( "factor" + j );
		factor = parseFloat(factorobj.value);		
			if( j != colvalue ){
				fieldobj = getElement( "E03CL" + j + name2 );											
				fieldobj.value=(factor + parseFloat(baseobj.value)).toFixed(5);			
			}	
		}	
	}

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
%>

<h3 align="center">Interest Rate VS Term/Amount<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rate_table_maint.jsp,ECN0000"></h3>
<hr size="4">

<form name="tabRates" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03CDRSFL" VALUE="<%= tbRate.getE03CDRSFL()%>">      

<TABLE class="tableinfo">
    <TR>
    <TD>
		<TABLE width="102%">
			<tr>
				<td>
				<div align="right">Table Number :</div>
				</td>
				<td><input type="text" name="E03CDRRTB" size="2" maxlength="1"
					value="<%= tbRate.getE03CDRRTB()%>" readonly></td>
				<td>
				<div align="right"></div>
				</td>
				<td width="239"></td>
			</tr>
			<tr>
				<td>
				<div align="right">Application Date :</div>
				</td>
				<td><input type="text" name="E03CDRDT1" size="3" maxlength="2"
					onKeypress="enterInteger()" value="<%= tbRate.getE03CDRDT1()%>" readonly> 
					<input type="text" name="E03CDRDT2" size="3" maxlength="2"
					onKeypress="enterInteger()" value="<%= tbRate.getE03CDRDT2()%>" readonly> 
					<input type="text" name="E03CDRDT3" size="3" maxlength="2"
					onKeypress="enterInteger()" value="<%= tbRate.getE03CDRDT3()%>" readonly>
				</td>
				<td>
				<div align="right">Currency :</div>
				</td>
				<td width="239"><input type="text" name="E03CDRCCY" size="3"
					maxlength="3" value="<%= tbRate.getE03CDRCCY()%>" readonly>
				</td>
			</tr>
		</TABLE>
		</TD>
  </TR>
  </TABLE>	  
<h4>Basic Data</h4>	  
<TABLE class="tableinfo">
    <TR>
    <TD> 
   <TABLE width=100%>	  
	  <tr id=trdark>
	    <td width=60% align=center><b>Data</b></td>
	    <td width=40% align=center><b>Pre-Cancellation Penalty</b></td>
	  </tr>
	  <tr> 
	    <td valign=top>
	    	 <TABLE>	  
	  			<tr>
	  				<td nowrap> 
			          <div align="right">Minimun Rate : </div>
			        </td>
			        <td>
			        	<input type="text" name="E03CDRMIR" size="10" maxlength="10" value="<%= tbRate.getE03CDRMIR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap> 
			          <div align="right">Maximum Rate : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E03CDRMXR" size="10" maxlength="10" value="<%= tbRate.getE03CDRMXR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr>
	  				<td nowrap> 
			          <div align="right">Base Period : </div>
			        </td>
			        <td>
			        	<input type="text" name="E03CDRB01" size="10" maxlength="10" value="<%= tbRate.getE03CDRB01()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap> 
			          <div align="right">Base Points : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E03CDRBSE" size="10" maxlength="10" value="<%= tbRate.getE03CDRBSE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr>
	  				<td nowrap> 
			          <div align="right">Variable Rate : </div>
			        </td>
			        <td colspan=3>
			        	<input type="text" name="E03CDRFTB" size="2" maxlength="2" value="<%= tbRate.getE03CDRFTB()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        	<%if (!userPO.getPurpose().equals("READONLY")) {%>
			        		<a href="javascript:GetFloating('E03CDRFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Floating Rate Table" align="middle" border="0" ></a> 
			        	<%}%>
			            
		              <select name="E03CDRFTY" <%if (userPO.getPurpose().equals("READONLY")) {%>disabled<%}%>>
		                <option value=" " <% if (!(tbRate.getE03CDRFTY().equals("FP") ||tbRate.getE03CDRFTY().equals("FS"))) out.print("selected"); %>></option>
		                <option value="FP" <%if (tbRate.getE03CDRFTY().equals("FP")) { out.print("selected"); }%>>FP</option>
		                <option value="FS" <%if (tbRate.getE03CDRFTY().equals("FS")) { out.print("selected"); }%>>FS</option>
		              </select>
			            
				  	</td>      
	  			</tr>
	  	     </TABLE>
	    </td>
	    <td valign=top>
	    	 <TABLE>	  
	  			<tr>
	  				<td> 
			          <div align="right">Days : </div>
			        </td>
			        <td>
			        	<input type="text" name="E03CDRDPE" size="4" maxlength="3" value="<%= tbRate.getE03CDRDPE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td > 
			          <div align="right">% : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E03CDRPRT" size="5" maxlength="5" value="<%= tbRate.getE03CDRPRT()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  	     </TABLE>	
	    </td>
	  </tr>  
  </TABLE>
  </TD>  
  </TR>  
  </TABLE>
<H4>To calculate rates, Select Base Rate Column:</H4> 
  <TABLE class="tableinfo" width="100%">

      <TR id="trclear">
      <TH ALIGN=CENTER  nowrap width=3%> Points:</TH> 
      <TD width=100%>
      	<INPUT type="radio" name="baseRate" align="middle" checked/>
      	<INPUT type="text" name="factor1" size=12 maxlength=12  />
      </TD>
      <TD width=100%>
      	<input type="radio" name="baseRate" align="middle"/>
      	<INPUT type="text" name="factor2" size=12 maxlength=12  />
      </TD>
      <TD width=100%>
      	<input type="radio"  name="baseRate" align="middle" />
     	<INPUT type="text" name="factor3" size=12 maxlength=12  />
      </TD>
      <TD width=100%>
      	<input type="radio"  name="baseRate" align="middle"/>
      	<INPUT type="text" name="factor4" size=12 maxlength=12  />
      </TD>
      <TD width=100%>
      	<input type="radio" name="baseRate" align="middle"/>
      	<INPUT type="text" name="factor5" size=12 maxlength=12 />
      </TD>
      <TD width=100%>
      	<input type="radio" name="baseRate" align="middle"/>
      	<INPUT type="text" name="factor6" size=12 maxlength=12 />
      </TD>
      <TD width=100%>
      	<input type="radio" name="baseRate" align="middle"/>
      	<INPUT type="text" name="factor7" size=12 maxlength=12 />
      </TD>                     
    </TR>
  
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width=3%></TH> 
      <TH ALIGN=CENTER  nowrap colspan=7>Amount :</TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER width=100% nowrap >Term</TH>
      <%
      String name1= "";
      String name2= ""; 
      for(int i=1; i<8;i++) {
        name1= ""+i;
      %> 
      <TH ALIGN=CENTER width=100% nowrap >
        <% if (userPO.getHeader1().equals("")) {%>
            <%= tbRate.getField("E03CDUA"+name1).getString().trim()%>
            <input type="hidden" name="E03CDUA<%=i%>" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
        <% } else {%>
      		<input type="input" name="E03CDUA<%=i%>" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>" onkeypress="enterInteger()" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
      	<% } %>
      </TH> 
      <% } %>  
    </TR>
      <%
       for(int i=1;i<16; i++) { 
         name2=(i<10)? "0"+i: ""+i;                               
       %>             
                    
        <TR>
          <td align="center" id=trdark >
           <% if (userPO.getHeader1().equals("")) {%>
            <%= tbRate.getField("E03CDD"+name2).getString().trim()%>
          	<input type="hidden" name="E03CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E03CDD"+name2).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>      	
		   <% } else {%>
		    <input type="input" name="E03CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E03CDD"+name2).getString().trim()%>" onkeypress="enterInteger()" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>      			   
		   <% } %>
		  </td>
      	  <% 
      		for(int j=1; j<8;j++) {
      		  name1= ""+ j + name2;
     	  %>
          <td NOWRAP align=center >
          	<input type="input" name="E03CL<%=name1%>" size="10" maxlength="10" value="<%= tbRate.getField("E03CL"+name1).getString().trim()%>" onkeypress="enterDecimal()" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>      	
		  </td>		  
		  
		  <% } %>
		  		  
		  
		</TR>
        <% 
          }
        %> 
  </TABLE>
  <br>
  <TABLE width=100% class=tbenter>
  <%if (!userPO.getPurpose().equals("READONLY")) {%>
  <tr>
  	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Submit" onclick="goAction('S')">
  	</td>
  	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Update Ter." onclick="goAction('C')">
    </td>
      	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Calc. Rates" onclick="calculate()">

    </td>
  </tr>
  <%}%>
  </TABLE>
  <% if (!userPO.getHeader1().equals("")) {%>
    <SCRIPT Language="javascript">
   		document.forms[0].E03CDUA1.focus();
	    document.forms[0].E03CDUA1.select(); 	
    </SCRIPT>
  <% } %>
</form>
</body>
</html>
