<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Parametros de Tarjeta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0004DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Transactions Parameters<BR>Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_param_maint.jsp, ECD0004"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0004" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
   <input type="hidden" name="E04CDRDAY" size="3" maxlength="2" value="<%= msgCD.getE04CDRDAY() %>" >
   <input type="hidden" name="E04CDRMON" size="3" maxlength="2" value="<%= msgCD.getE04CDRMON() %>" >
   <input type="hidden" name="E04CDRYEA" size="5" maxlength="4" value="<%= msgCD.getE04CDRYEA() %>" >
   <input type="hidden" name="E04CDRTIM" size="8" maxlength="7" value="<%= msgCD.getE04CDRTIM() %>">
   <input type="hidden" name="E04CDRUSR" size="17" maxlength="15" value="<%= msgCD.getE04CDRUSR() %>" >

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Card Type : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="hidden" name="E04CDRTPL" size="3" maxlength="2" value="<%= msgCD.getE04CDRTPL() %>">
                <INPUT type="text" name="E04CDRNPL" size="35" maxlength="30" readonly value="<%= msgCD.getE04CDRNPL() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Transaction Type : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="hidden" name="E04CDRTRS" size="5" maxlength="4" value="<%= msgCD.getE04CDRTRS() %>">
                <INPUT type="text" name="E04CDRTRD" size="17" maxlength="15" readonly value="<%= msgCD.getE04CDRTRD() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Local/Other Bank/Intl. : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="hidden" name="E04CDRLOI" size="2" maxlength="1" value="<%= msgCD.getE04CDRLOI() %>">
                <INPUT type="text" name="E04CDRLOID" size="17" maxlength="15" readonly value='<%	 if(msgCD.getE04CDRLOI().equals("L")) out.print("Local");
							else if(msgCD.getE04CDRLOI().equals("O")) out.print("Other");
							else if(msgCD.getE04CDRLOI().equals("I")) out.print("International");
					%>'>
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Device : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
                <INPUT type="hidden" name="E04CDRADV" size="8" maxlength="5" value="<%= msgCD.getE04CDRADV() %>">
                <INPUT type="text" name="E04CDRADVD" size="8" maxlength="5" readonly value='<%	 if(msgCD.getE04CDRADV().equals("P")) out.print("POS");
							else if(msgCD.getE04CDRADV().equals("A")) out.print("ATM");
							else if(msgCD.getE04CDRADV().equals("W")) out.print("WEB");
							else if(msgCD.getE04CDRADV().equals("I")) out.print("IVR");
					%>'>
              </DIV>
            </TD>
          </TR>  
          <TR id="trdark">
<%--
            <TD nowrap width="16%"> 
              <DIV align="right" id="txtnet" <% if(!msgCD.getE04CDRADV().equals("A")) { %> style="display:'none'" <% } %>>Net Type : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left" id="btnnet" <% if(!msgCD.getE04CDRADV().equals("A")) { %> style="display:'none'" <% } %>> 
                <INPUT type="text" name="E04CDRATM" size="5" maxlength="4" value="<%= msgCD.getE04CDRATM() %>" readonly>
              </DIV>
            </TD>
--%>
			<td></td> <td></td>            
            <TD nowrap width="16%"> 
              <DIV align="right"># Max. Trans./ Day : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRTMD" size="5" maxlength="3" value="<%= msgCD.getE04CDRTMD() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
          </TR>  
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right"># Max. Trans./Month : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRTMM" size="6" maxlength="4" value="<%= msgCD.getE04CDRTMM() %>" onkeypress="enterInteger()">
			  </DIV>
            </TD>
            
            <TD nowrap width="16%"> 
              <DIV align="right">Min.Trans. Amount : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRMAT" size="20" maxlength="17" value="<%= msgCD.getE04CDRMAT() %>" onkeypress="enterDecimal()">
              </DIV>
            </TD>
            
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Max.  Trans. Amount: </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRXAT" size="20" maxlength="17" value="<%= msgCD.getE04CDRXAT() %>" onkeypress="enterDecimal()">
              </DIV>
            </TD>
            
            <TD nowrap width="16%"> 
              <DIV align="right">Max./Day Amount : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRMAD" size="20" maxlength="17" value="<%= msgCD.getE04CDRMAD() %>" onkeypress="enterDecimal()">
              </DIV>
            </TD>
            
          </TR> 
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Max./Month Amount : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRMAM" size="20" maxlength="17" value="<%= msgCD.getE04CDRMAM() %>" onkeypress="enterDecimal()">
              </DIV>
            </TD>
            
            <TD nowrap width="16%"> 
              <DIV align="right"># Errors PIN : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRPIN" size="4" maxlength="3" value="<%= msgCD.getE04CDRPIN() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Days Inact.  PIN Invalid  : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRPED" size="6" maxlength="5" value="<%= msgCD.getE04CDRPED() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
            <TD nowrap width="16%"> 
              <DIV align="right">Generals Errors # : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRERR" size="4" maxlength="3" value="<%= msgCD.getE04CDRERR() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
          </TR> 
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Days Inact.  Generals  Errors: </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRERD" size="20" maxlength="17" value="<%= msgCD.getE04CDRERD() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
            <TD nowrap width="16%"> 
              <DIV align="right">Non Fee Trans.: </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRFFE" size="5" maxlength="4" value="<%= msgCD.getE04CDRFFE() %>" onkeypress="enterInteger()">
              </DIV>
            </TD>
            
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Fee : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRFEE" size="5" maxlength="4" value="<%= msgCD.getE04CDRFEE() %>">
<%--
				<A href="javascript:GetCommissionType('E04CDRFEE','')">
--%>
				<a href="javascript:GetCodeCNOFC('E04CDRFEE', '67')">				
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"></A>
              </DIV>
            </TD>
<%--            
            <TD nowrap width="16%"> 
              <DIV align="right"> ISA Fee : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRISA" size="5" maxlength="4" value="<%= msgCD.getE04CDRISA() %>">
				<A href="javascript:GetCommissionType('E04CDRISA','')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0"></A>
              </DIV>
            </TD>
--%>
			<td> </td> <td> </td>            
          </TR> 
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Credit Account : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRACC" size="14" maxlength="12" value="<%= msgCD.getE04CDRACC() %>" onkeypress="enterInteger()">
        		<A href="javascript:GetAccount('E04CDRACC','','RT','')">
		        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"></A>  
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Credit GL : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E04CDRGLN" size="14" maxlength="12" value="<%= msgCD.getE04CDRGLN() %>" onkeypress="enterInteger()">
        		<A href="javascript:GetLedger('E04CDRGLN','<%= currUser.getE01UBK() %>','<%= currUser.getE01BCU() %>','')">
		        <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absbottom" border="0"></A>  
              </DIV>
            </TD>
          </TR>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
