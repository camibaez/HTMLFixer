
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Loans Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnGenTran" class="datapro.eibs.beans.EDL015230Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);


</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

  out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

<h3 align="center">Loans Transactions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_ap_new_transac,EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN NAME="E30DEABNK"  value="<%= lnGenTran.getE30DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E30DEACCY"  value="<%= lnGenTran.getE30DEACCY().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" readonly name="E30DEACUN" size="9" maxlength="9" value="<%= lnGenTran.getE30DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly name="E30CUSNA1" size="45" maxlength="45" value="<%= lnGenTran.getE30CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" readonly name="E30DEAACC" size="12" maxlength="12" value="<%= lnGenTran.getE30DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E30DEACCY2" size="3" maxlength="3" value="<%= lnGenTran.getE30DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E30DEAPRO" size="4" maxlength="4" value="<%= lnGenTran.getE30DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Payment Distributions</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">LOAN AMOUNT :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30TRNPRI" value="<%= lnGenTran.getE30TRNPRI().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">PREPAID INTEREST AMOUNT :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30TRNINT" value="<%= lnGenTran.getE30TRNINT().trim()%>">
            </td>
          </tr>
          <%
		   if(!lnGenTran.getE30PDSC01().trim().equals("")){
		 %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC01().trim()%> : </div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT01" value="<%= lnGenTran.getE30PAMT01().trim()%>">
            </td>
          </tr>
          <%
		   }
		  %> <%
		   if(!lnGenTran.getE30PDSC02().trim().equals("")){
		 %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC02().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT02" value="<%= lnGenTran.getE30PAMT02().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		   if(!lnGenTran.getE30PDSC03().trim().equals("")){
		 %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC03().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT03" value="<%= lnGenTran.getE30PAMT03().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		    if(!lnGenTran.getE30PDSC04().trim().equals("")){
	      %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC04().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT04" value="<%= lnGenTran.getE30PAMT04().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC05().trim().equals("")){
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC05().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT05" value="<%= lnGenTran.getE30PAMT05().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC06().trim().equals("")){
		    %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC06().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT06" value="<%= lnGenTran.getE30PAMT06().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC07().trim().equals("")){
	   	 %> 
          <tr id="trdark"> 
            <td nowrap colspan="2" height="20"> 
              <div align="right"><%= lnGenTran.getE30PDSC07().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%" height="20"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT07" value="<%= lnGenTran.getE30PAMT07().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		      if(!lnGenTran.getE30PDSC08().trim().equals("")){
		    %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC08().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT08" value="<%= lnGenTran.getE30PAMT08().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC09().trim().equals("")){
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC09().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT09" value="<%= lnGenTran.getE30PAMT09().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		      if(!lnGenTran.getE30PDSC10().trim().equals("")){
		    %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC10().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT10" value="<%= lnGenTran.getE30PAMT10().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC11().trim().equals("")){
		   %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC11().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT11" value="<%= lnGenTran.getE30PAMT11().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC12().trim().equals("")){
	   	 %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC12().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT12" value="<%= lnGenTran.getE30PAMT12().trim()%>">
            </td>
          </tr>
          <%
           }
          %> <%
		     if(!lnGenTran.getE30PDSC13().trim().equals("")){
		   %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC13().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT13" value="<%= lnGenTran.getE30PAMT13().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		    if(!lnGenTran.getE30PDSC14().trim().equals("")){
	      %> 
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC14().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT14" value="<%= lnGenTran.getE30PAMT14().trim()%>">
            </td>
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC15().trim().equals("")){
		   %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC15().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30PAMT15" value="<%= lnGenTran.getE30PAMT15().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3" width="56%">&nbsp;</td>
          </tr>
          <%
		     }
		    %> 
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">INITIAL FUNDING DATE :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" name="E30DEAOD1" size="2" readonly maxlength="2" value="<%= lnGenTran.getE30DEAOD1().trim()%>" onkeypress="enterInteger()" >
              <input type="text" name="E30DEAOD2" size="2" readonly maxlength="2" value="<%= lnGenTran.getE30DEAOD2().trim()%>" onkeypress="enterInteger()" >
              <input type="text" name="E30DEAOD3" size="2" readonly maxlength="2" value="<%= lnGenTran.getE30DEAOD3().trim()%>" onkeypress="enterInteger()" >             

            </td>
          </tr>		    
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">TOTAL :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" readonly size="15" maxlength="13" name="E30TRNTOT" value="<%= lnGenTran.getE30TRNTOT().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> 
    <h4>&nbsp;</h4>
  </h4>
  <h4>Offset Credit Account</h4>
<TABLE class="tableinfo" align="center" >
  <TR><TD>
  
   <table id="headTable" >
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%>			 
          <tr id="trclear">
            <td nowrap > 
              <div align="center"> 
                <input type="hidden" name="E30OFFOP<%= name %>" value="<%= lnGenTran.getField("E30OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E30OFFGL<%= name %>" value="<%= lnGenTran.getField("E30OFFGL"+name).getString().trim()%>">
                <input type="text" name="E30OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= lnGenTran.getField("E30OFFCO"+name).getString().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFBK<%= name %>" size="2" maxlength="2" value="<%= lnGenTran.getField("E30OFFBK"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFBR<%= name %>" size="3" maxlength="3" value="<%= lnGenTran.getField("E30OFFBR"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E30OFFCY<%= name %>" size="3" maxlength="3" value="<%= lnGenTran.getField("E30OFFCY"+name).getString().trim()%>" readonly>
               </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFAC<%= name %>" size="12" maxlength="12"  value="<%= lnGenTran.getField("E30OFFAC"+name).getString().trim()%>" readonly>
               </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E30OFFAM<%= name %>" size="15" maxlength="15"  value="<%= lnGenTran.getField("E30OFFAM"+name).getString().trim()%>" readonly>
              </div>
            </td>
          </tr>
          
    		<%
    		}
    		%>
    	</table>
        </div>
    <table id="footTable" > 		
          <tr id="trdark"> 
            <td nowrap align="right"><b>Loan Currency Equivalent :</b>
            </td>
            <td nowrap align="center"><b><i><strong> 
                <input type="text" name="E30OFFEQV" size="15" maxlength="15" readonly value="<%= lnGenTran.getE30OFFEQV().trim()%>">
                </strong></i></b>
            </td>
          </tr>
        </table>
</TD>  
</TR>	
</TABLE>    
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
  </form>
</body>
</html>
