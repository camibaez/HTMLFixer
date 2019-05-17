<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Consulta de Conciliación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0015DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Clearing Inquiry</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0015" >
<input type=HIDDEN name="SCREEN" value="104">

<h4>Información General</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">ATM/POS ID : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRATM" size="9" maxlength="8" readonly value="<%= msgCD.getE01CCRATM() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right"> ATM Name: </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRNAM" size="41" maxlength="40" readonly value="<%= msgCD.getE01CCRNAM() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Card Number : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRTAR" size="20" maxlength="19" readonly value="<%= msgCD.getE01CCRTAR() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Trace : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRTRA" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRTRA() %>">
              </DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Trans. Date : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRFET" size="9" maxlength="8" readonly value="<%= msgCD.getE01CCRFET() %>">
               </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Trans. Time : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              	<INPUT type="text" name="E01CCRHOT" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRHOT() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Clearing Amount : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRAMO" size="15" maxlength="14" readonly value="<%= msgCD.getE01CCRAMO() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Reverse : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRFLG" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRFLG() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right"> Trans.Amount : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRTRS" size="15" maxlength="14" readonly value="<%= msgCD.getE01CCRTRS() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right"> Trans.Currency : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
                <INPUT type="text" name="E01CCRCCY" size="4" maxlength="3" readonly value="<%= msgCD.getE01CCRCCY() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right"> Original Response: </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRRES" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRRES() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right"> Reverse Response : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
              	<INPUT type="text" name="E01CCRREV" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRREV() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Processing Code : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRPRO" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRPRO() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Authorization : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRAUT" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRAUT() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Adquirer Net : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRRED" size="4" maxlength="3" readonly value="<%= msgCD.getE01CCRRED() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">POS Entry Mode : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRPOE" size="4" maxlength="3" readonly value="<%= msgCD.getE01CCRPOE() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Fee Collected : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRFEE" size="5" maxlength="4" readonly value="<%= msgCD.getE01CCRFEE() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Fee Amount : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRMFE" size="18" maxlength="17" readonly value="<%= msgCD.getE01CCRMFE() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Debit Account : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRCTD" size="21" maxlength="20" readonly value="<%= msgCD.getE01CCRCTD() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Debit Account Type : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRTPD" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRTPD() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Credit Account : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRCTA" size="21" maxlength="20" readonly value="<%= msgCD.getE01CCRCTA() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Credit Account Type : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRTPA" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRTPA() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Adquirer Code : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRADI" size="12" maxlength="11" readonly value="<%= msgCD.getE01CCRADI() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Reference : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CCRREF" size="13" maxlength="12" readonly value="<%= msgCD.getE01CCRREF() %>">
              </DIV>
            </TD>
          </TR>
		</TBODY></TABLE>
      </td>
    </tr>
  </table>

<h4>Match Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Date : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRFEC" size="9" maxlength="8" readonly value="<%= msgCD.getE01CCRFEC() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Time : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRTIC" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRTIC() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Match Status : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              	<SELECT name="E01CCRSTS" disabled>
					<OPTION value="P"
						<% if (msgCD.getE01CCRSTS().equals("P")) { out.println("selected"); }%>>Pendiente</OPTION>
					<OPTION value="C"
						<% if (msgCD.getE01CCRSTS().equals("C")) { out.println("selected"); }%>>Conciliada</OPTION>
				</SELECT>
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Response : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
              	<SELECT name="E01CCRREC" disabled>
					<OPTION value="OR"
						<% if (msgCD.getE01CCRREC().equals("OR")) { out.println("selected"); }%>>Orig. Trans. Received Correctly</OPTION>
					<OPTION value="RR"
						<% if (msgCD.getE01CCRREC().equals("RR")) { out.println("selected"); }%>>Reverse Received Correctly</OPTION>
					<OPTION value="NE"
						<% if (msgCD.getE01CCRREC().equals("NE")) { out.println("selected"); }%>>Transac. not sent by ATM</OPTION>
					<OPTION value="NR"
						<% if (msgCD.getE01CCRREC().equals("NR")) { out.println("selected"); }%>>Transac. not Received by IBS</OPTION>
					<OPTION value="RE"
						<% if (msgCD.getE01CCRREC().equals("RE")) { out.println("selected"); }%>>Reverse not sent by ATM</OPTION>
					<OPTION value="RN"
						<% if (msgCD.getE01CCRREC().equals("RN")) { out.println("selected"); }%>>Reverse not Received by IBS</OPTION>
				</SELECT>
              </DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Source : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRORI" size="2" maxlength="1" readonly value="<%= msgCD.getE01CCRORI() %>">
               </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Changed : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              	<INPUT type="text" name="E01CCRFLC" size="2" maxlength="1" readonly value="<%= msgCD.getE01CCRFLC() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Last Response : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRREA" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRREA() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Status : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRSTA" size="2" maxlength="1" readonly value="<%= msgCD.getE01CCRSTA() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">User : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRUSE" size="16" maxlength="15" readonly value="<%= msgCD.getE01CCRUSE() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Change Date : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
                <INPUT type="text" name="E01CCRDCA" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRDCA() %>">
                <INPUT type="text" name="E01CCRMCA" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRMCA() %>">
                <INPUT type="text" name="E01CCRYCA" size="5" maxlength="4" readonly value="<%= msgCD.getE01CCRYCA() %>">
              </DIV>
            </TD>
          </TR>
		</TBODY></TABLE>
      </td>
    </tr>
  </table>

<h4>Clearing Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Date : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRFEP" size="9" maxlength="8" readonly value="<%= msgCD.getE01CCRFEP() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Time : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRTIP" size="7" maxlength="6" readonly value="<%= msgCD.getE01CCRTIP() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Clearing Status : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              	<SELECT name="E01CCRSTP">
					<OPTION value="P" <% if (msgCD.getE01CCRSTP().equals("P")) { out.println("selected"); }%>>Pendiente</OPTION>
					<OPTION value="C" <% if (msgCD.getE01CCRSTP().equals("C")) { out.println("selected"); }%>>Compensada</OPTION>
					<OPTION value="A" <% if (msgCD.getE01CCRSTP().equals("A")) { out.println("selected"); }%>>Ajustada</OPTION>
				</SELECT>
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Changed : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left">
              	<INPUT type="text" name="E01CCRFLP" size="2" maxlength="1" readonly value="<%= msgCD.getE01CCRFLP() %>">
              </DIV>
            </TD>
            
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Clearing Amount : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRMOP" size="15" maxlength="14" readonly value="<%= msgCD.getE01CCRMOP() %>">
               </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Clearing Currency : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRCYP" size="4" maxlength="3" readonly value="<%= msgCD.getE01CCRCYP() %>">
			  </DIV>
            </TD>
            
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Las Status : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRSAP" size="2" maxlength="1" readonly value="<%= msgCD.getE01CCRSAP() %>">
              </DIV>
            </TD>
            
            <TD nowrap width="16%"></TD>
            <TD nowrap width="20%"></TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">User : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CCRUSP" size="16" maxlength="15" readonly value="<%= msgCD.getE01CCRUSP() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Change Date : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
                <INPUT type="text" name="E01CCRDCP" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRDCP() %>">
                <INPUT type="text" name="E01CCRMCP" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRMCP() %>">
                <INPUT type="text" name="E01CCRYCP" size="5" maxlength="4" readonly value="<%= msgCD.getE01CCRYCP() %>">
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
