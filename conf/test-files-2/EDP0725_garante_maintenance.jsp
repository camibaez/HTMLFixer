<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Guarantee Proposals Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "optCN05" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "optCN19" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="l0725" class="datapro.eibs.beans.EDP072501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

	builtNewMenu(pc_optionGaran);


function callInfF() {
var customer = document.forms[0].E01DPGIDN.value;    
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=100&CUSTOMER="+ customer;
    	CenterNamedWindow(page,'Information',700,600,2);

}


function goConfirm() {

// alert(document.forms[0].ACTION.value);
	if(document.forms[0].ACTION.value == "6"){
      ok = confirm("Confirm Addition of this Guarantee");
	       document.forms[0].SCREEN.value="380";
	       document.forms[0].submit();
    } else {
		if(document.forms[0].ACTION.value == "7"){
    	  ok = confirm("Confirm Modification of this Guarantee");
	    	   document.forms[0].SCREEN.value="380";
	    	   document.forms[0].submit();
 	   }
    }  
}

function init(){  


}


function goCancel() {

document.forms[0].SCREEN.value="200";
document.forms[0].submit(); 
	  		  
}

</script>
</HEAD>
<body onload=javascript:init()>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Aval/Co-Applicant/Co-Signer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="garante_maintenance.jsp, EDP0725"></H3>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0725" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="<%= userPO.getHeader16().trim()%>">
  <INPUT TYPE=HIDDEN NAME="TYPEG" VALUE="<%= l0725.getE01DPGTIP().trim()%>">

  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      
      
      </td>
    </tr>
  </table>
   
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Customer :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPCCUN" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Name :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01CUSNA1" size="45" readonly value="<%=userPO.getCusName()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Proposal Number :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPCNPR" size="15" readonly value="<%=userPO.getHeader4()%>">
      </td>
      <td nowrap align="right">
         <b>Sequence :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01DPCSEQ" size="5" readonly value="<%=userPO.getHeader7()%>">
      </td>
    </tr>  

  </table> 

<% if(l0725.getE01DPGCPR().equals("80")){ %>
   <BR>
<TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trclear"> 
      <td align="right"  >
         <b>Account Number:</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPGACC" size="12" readonly value="<%=l0725.getE01DPGACC().trim()%>">
      </td>
      <td align="right"  >
         <b>Credit Line/Number:</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01DPGLNU" size="5" readonly value="<%=l0725.getE01DPGLNU().trim()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Application Code:</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPGACD" size="3" readonly value="<%=l0725.getE01DPGACD().trim()%>">
      </td>
      <td nowrap align="right">
         <b>Status:</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01DPGCPR" size="15" readonly value="<%=l0725.getE01DPGCPR().trim()%>">
      </td>
    </tr>  

  </table> 
<% } %>


  <h4><% if(userPO.getHeader16().equals("7")){out.print("Modificar Garante");} else {out.print("Crear Garante:"); } %> </h4> 

<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            			
 		 <tr id="trclear"> 
            <td nowrap width="5%" height="19" align="right">Identification </td>
            
            <td nowrap height="19" width="55%">
      			<INPUT type="text" name="E01DPGIDN" size="15" maxlength="15" value="<%= l0725.getE01DPGIDN().trim()%>";
					<% if(userPO.getHeader16().equals("9")){out.print("readonly");} %> 
			>
			<A href="javascript:GetCustomerDescId('E01DPGIDN','E01DPGDES','E01DPGIDN')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
					align="absmiddle" border="0"></A></td>
			
			<td nowrap height="19" width="2%"> 
			<div align="right"> </div>
			</td>
		    
		    <td nowrap width="28%" height="19"> 
			<div align="right"> </div>
			</td>	
         </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap height="23" colspan="1" width="372"> 

      			<INPUT type="text" name="E01DPGDES" size="50" maxlength="50"
					value="<%= l0725.getE01DPGDES().trim()%>";
					<% if(userPO.getHeader16().equals("9")){out.print("readonly");} %> >
			</td>
            <td nowrap height="23" colspan="1" width="14"> 
              
            </td>
            <td nowrap height="23" colspan="1"> 
              
            </td>
            <td nowrap height="23" colspan="1"> 
              
            </td>
            
          </tr>
		<tr id="trclear">
								<td	nowrap width="30%">
   									<DIV align="right">Type</DIV>
								</td>
								  
								<td nowrap align="left" width="100%">
									<input type="radio" name="E01DPGCRG" value="1" <%if(l0725.getE01DPGCRG().equals("1")) out.print("checked");%>>
              						Guarantor 
              						<input type="radio" name="E01DPGCRG" value="2" <%if(l0725.getE01DPGCRG().equals("2")) out.print("checked");%>>
              						Co-Applicant 
              						<input type="radio" name="E01DPGCRG" value="3" <%if(l0725.getE01DPGCRG().equals("3")) out.print("checked");%>>
              						Bailor
								</td>
								
								<td nowrap width="25%">	
								</td>						
		</tr>
		
          <tr id="trdark"> 
            <td nowrap >
             Products to Guarantee :</td>
            <td nowrap > 
            Amount</td>
            <td nowrap >               
            </td>
          </tr>

		<% if(!l0725.getE01DPGP00().equals("")){%>
          <tr id="trclear"> 
            <td nowrap >               
            <INPUT type="text" name="E01DPGP00" size="4" maxlength="5" readonly value="<%= l0725.getE01DPGP00().trim()%>">
            <INPUT type="text" name="E01DPGPD0" size="35" maxlength="35" readonly value="<%= l0725.getE01DPGPD0().trim()%>">
			</td>
            <td nowrap > 
            <INPUT type="text" name="E01DPGA00" size="16" maxlength="16" onkeypress="enterDecimal()" readonly value="<%= l0725.getE01DPGA00().trim()%>" 
            <% if((userPO.getHeader16().equals("9"))){out.print("readonly");} %>
            >
			</td>
            <td nowrap >
            </td>
          </tr>
		<%}%>
		<% if(!l0725.getE01DPGP01().equals("")){%>
          <tr id="trdark"> 
            <td nowrap >               
            <INPUT type="text" name="E01DPGP01" size="4" maxlength="5" readonly value="<%= l0725.getE01DPGP01().trim()%>">
            <INPUT type="text" name="E01DPGPD1" size="35" maxlength="35" readonly value="<%= l0725.getE01DPGPD1().trim()%>">
			</td>
            <td nowrap > 
            <INPUT type="text" name="E01DPGA01" size="16" maxlength="16" onkeypress="enterDecimal()" value="<%= l0725.getE01DPGA01().trim()%>" 
            <% if((userPO.getHeader16().equals("9"))){out.print("readonly");} %>
            >
			</td>
            <td nowrap >
            </td>
          </tr>
		<%}%>
		<% if(!l0725.getE01DPGP02().equals("")){%>
          <tr id="trclear"> 
            <td nowrap >               
            <INPUT type="text" name="E01DPGP02" size="4" maxlength="5" readonly value="<%= l0725.getE01DPGP02().trim()%>">
            <INPUT type="text" name="E01DPGPD2" size="35" maxlength="35" readonly value="<%= l0725.getE01DPGPD2().trim()%>">
			</td>
            <td nowrap > 
            <INPUT type="text" name="E01DPGA02" size="16" maxlength="16" onkeypress="enterDecimal()" value="<%= l0725.getE01DPGA02().trim()%>" <% if(userPO.getHeader16().equals("7")){out.print("readonly");} %>
            >
			</td>
            <td nowrap >
            </td>
          </tr>
		<%}%>
		<% if(!l0725.getE01DPGP03().equals("")){%>
          <tr id="trdark"> 
            <td nowrap >               
            <INPUT type="text" name="E01DPGP03" size="4" maxlength="5" readonly value="<%= l0725.getE01DPGP03().trim()%>">
            <INPUT type="text" name="E01DPGPD3" size="35" maxlength="35" readonly value="<%= l0725.getE01DPGPD3().trim()%>">
			</td>
            <td nowrap > 
            <INPUT type="text" name="E01DPGA03" size="16" maxlength="16" onkeypress="enterDecimal()" value="<%= l0725.getE01DPGA03().trim()%>" <% if(userPO.getHeader16().equals("7")){out.print("readonly");} %>
            >
			</td>
            <td nowrap >
            </td>
          </tr>
		<%}%>
		<% if(!l0725.getE01DPGP04().equals("")){%>
          <tr id="trclear"> 
            <td nowrap >               
            <INPUT type="text" name="E01DPGP04" size="4" maxlength="5" readonly value="<%= l0725.getE01DPGP04().trim()%>">
            <INPUT type="text" name="E01DPGPD4" size="35" maxlength="35" readonly value="<%= l0725.getE01DPGPD4().trim()%>">
			</td>
            <td nowrap > 
            <INPUT type="text" name="E01DPGA04" size="16" maxlength="16" onkeypress="enterDecimal()" value="<%= l0725.getE01DPGA04().trim()%>" <% if(userPO.getHeader16().equals("7")){out.print("readonly");} %>
			>
			</td>
            <td nowrap >
            </td>
          </tr>
		<%}%>

          <tr id="trdark"> 
            <td nowrap > 
            </td>
            <td nowrap >               
			</td>
            <td nowrap > 
			</td>
            <td nowrap >
            </td>
          </tr>


          
        </table>

        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="100%" align="center">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="100%" align="center"> 
			</td>
          </tr>



        </table>
  </table>
<div align="left">
</div>

<div align="center"> 
	        <input id="EIBSBTN" type="button" name="Submit" value="Submit" onclick="goConfirm()"> 
            <INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancel" onclick="goCancel()">
</div>
          
          <script language="JavaScript">
  		  
  		  <% if(userPO.getHeader16().equals("1")){out.print("document.forms[0].E01DPGIDN.focus()");} %>
  		  <% if(userPO.getHeader16().equals("2")){out.print("document.forms[0].E01DPGIPD.focus()");} %>

  		  </script>

  </form>
</body>
</html>
