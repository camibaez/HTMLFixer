<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0003DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Card Inquiry</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0003" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">

  <table class="tableinfo">
    <tr > 
      <td nowrap></td>
    </tr>
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Card Number :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRINI" size="20" maxlength="19" readonly value="<%= msgCD.getE03CDRINI() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Card Type :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRNPL" size="35" maxlength="30" readonly value="<%= msgCD.getE03CDRNPL() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Status : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRSTD" size="18" maxlength="15" readonly value="<%= msgCD.getE03CDRSTD() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Creation Time :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E03CDRTIS0" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRTIS() %>"></DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Creation Date :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                
			  <INPUT type="text" name="E03CDRDAS0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRDAS() %>">
                <INPUT type="text" name="E03CDRMOS0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMOS() %>">
                <INPUT type="text" name="E03CDRYES0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYES() %>"></DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Batch # : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"><INPUT type="text" name="E03CDRLOT0" size="15" maxlength="13" readonly value="<%= msgCD.getE03CDRLOT() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt Date in Bank :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRDAS" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRDAE() %>">
                <INPUT type="text" name="E03CDRMOS" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMOE() %>">
                <INPUT type="text" name="E03CDRYES" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYEE() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt Time in Bank :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRTIS" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRTIE() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt User in Bank :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRLOT" size="15" maxlength="13" readonly value="<%= msgCD.getE03CDREUS() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Expiration Date :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"><INPUT type="text" name="E03CDRMOX0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMOX() %>">
                <INPUT type="text" name="E03CDRYEX0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYEX() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Batch Send #  : </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E03CDRNUM0" size="15" maxlength="13" readonly value="<%= msgCD.getE03CDRNUM() %>"></DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Send Branch</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left"><INPUT type="text" name="E03CDRBRN0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRBRN() %>">
                 </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Send Date in Branch :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRDAY" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRDAY() %>">
                <INPUT type="text" name="E03CDRMON" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMON() %>">
                <INPUT type="text" name="E03CDRYEA" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYEA() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Send Time in Branch :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                
			  <INPUT type="text" name="E03CDRTIS1" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRTIM() %>"></DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Send User in Branch</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRUSR0" size="18" maxlength="15" readonly value="<%= msgCD.getE03CDRUSR() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt Branch :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"><INPUT type="text" name="E03CDRBRD0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRBRD() %>">
              </DIV>
            </TD>
          </TR> 
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt Date in Branch :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"><INPUT type="text" name="E03CDRDAR0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRDAR() %>">
                <INPUT type="text" name="E03CDRMOR0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMOR() %>">
                <INPUT type="text" name="E03CDRYER0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYER() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Receipt Time in Branch :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E03CDRTIR0" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRTIR() %>"></DIV>
            </TD>
          </TR> 
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">
				<DIV align="right">Receipt User in Branch :</DIV>
				</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              <INPUT type="text" name="E03CDRUSR1" size="18" maxlength="15" readonly value="<%= msgCD.getE03CDRRUS() %>"></DIV>
            </TD>
            <TD nowrap width="16%">
              <DIV align="right">Delivery Date :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
			  <INPUT type="text" name="E03CDRDAD0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRDAD() %>">
                <INPUT type="text" name="E03CDRMOD0" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRMOD() %>">
                <INPUT type="text" name="E03CDRYED0" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRYED() %>"></DIV>
            </TD>
          </TR>
			<TR>
				<TD nowrap width="16%"> 
              <DIV align="right">Delivery Time :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRTID" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRTID() %>">
              </DIV>
            </TD>
				
				<TD nowrap width="16%"> 
              <DIV align="right">Delivery User :</DIV>
            </TD><TD nowrap width="16%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRUSD" size="18" maxlength="15" readonly value="<%= msgCD.getE03CDRUSD() %>">
                 </DIV>
            </TD>
				
			</TR>
			<TR>
				<TD nowrap width="16%"> 
              <DIV align="right">Customer Number :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRCUN" size="12" maxlength="10" readonly value="<%= msgCD.getE03CDRCUN() %>">
              </DIV>
            </TD>
				
				<TD nowrap width="16%"> 
              <DIV align="right">Last Status :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRCUN" size="12" maxlength="10" readonly value="<%= msgCD.getE03CDRSDP() %>">
              </DIV>
            </TD>
				
			</TR>
				<TR>
					<TD nowrap width="16%"> 
              <DIV align="right">Change Status Date :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRDAD" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRSCD() %>">
                <INPUT type="text" name="E03CDRMOD" size="3" maxlength="2" readonly value="<%= msgCD.getE03CDRSCM() %>">
                <INPUT type="text" name="E03CDRYED" size="5" maxlength="4" readonly value="<%= msgCD.getE03CDRSCY() %>">
              </DIV>
            </TD>
					
					<TD nowrap width="16%"> 
              <DIV align="right">Change Status Time :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E03CDRTID" size="8" maxlength="7" readonly value="<%= msgCD.getE03CDRSCT() %>">
              </DIV>
            </TD>
					
				</TR>
				<TR>
					<TD nowrap width="16%"> 
              <DIV align="right">
				<DIV align="right">Change Status User :</DIV>
				</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left">
              <INPUT type="text" name="E03CDRUSR1" size="18" maxlength="15" readonly value="<%= msgCD.getE03CDRSCU() %>"></DIV>
            </TD>
					
					<TD nowrap width="16%">
              <DIV align="right">Notes :</DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left">
                <INPUT type="text" name="E03CDROBS" size="40" maxlength="35" readonly value="<%= msgCD.getE03CDROBS() %>">
			  </DIV>
            </TD>
					
				</TR>
			</TBODY></TABLE>
      </td>
    </tr>
    
  </table>
  <br>
  </form>
</body>
</html>
