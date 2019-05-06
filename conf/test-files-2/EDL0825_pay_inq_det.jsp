<html>
<head>
<title>Basic Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="docList" class="datapro.eibs.beans.JBListRec" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<%
	int row;
    try {
      row = Integer.parseInt(request.getParameter("CurrRow"));
    }
    catch (Exception e) {
      row = 0;
    }
    docList.setCurrentRow(row);
%> 

</head>

<body>


<h3 align="center">Document Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pay_inq_det.jsp,EDL0825"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825I"><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<table class="tableinfo">
    <tr>
        <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            
            <TR id="trdark">
                <TD nowrap width="14%">
                <DIV align="right"><B>Loan :</B></DIV>
                </TD>
                <TD nowrap>
                <DIV align="left"><%= docList.getRecord(7) %></DIV>
                </TD>
                <TD nowrap width="14%">
                <DIV align="right"><B>Customer :</B></DIV>
                </TD>
                <TD nowrap>
                <DIV align="left"><%= docList.getRecord(28) %>-<%= docList.getRecord(9) %></DIV>
                </TD>
            </TR>
		</table>
        </td>
     </tr>
 </table>
 
 <h4>Información del Giro</h4>
            
 <table class="tableinfo">
    <tr>
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr>
                <td nowrap>
                <DIV align="right"><b>Document No. :</b></DIV>
                </td>
                <td nowrap><%= docList.getRecord(0)%></td>
                <td nowrap>
                <DIV align="right"><b>Doc. Status:</b></DIV>
                </td>
                <td nowrap><% if (docList.getRecord(8).equals("A")) out.print("Active");
      			   else if (docList.getRecord(8).equals("P")) out.print("Paid");
      			   else if (docList.getRecord(8).equals("Q")) out.print("Annulled");
      			   else if (docList.getRecord(8).equals("D")) out.print("Deferred");
      			   else if (docList.getRecord(8).equals("N")) out.print("Renewed");
      			   else if (docList.getRecord(8).equals("R")) out.print("Reversión");
      			   else out.print("");%>
      			</td>
              </tr>     
              <tr>
                <td nowrap>
                <div align="right"><b>Cuenta Contable :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(10)+" - "+ docList.getRecord(11)+" - "+docList.getRecord(12)+" - "+docList.getRecord(13)%></td>
                <td nowrap>
                <div align="right"><b>Opening Date :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(18)%></td>
              </tr>
              <tr >
                <td nowrap>
                <div align="right"><b>Drawer Name :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(1) +" - " + docList.getRecord(2)%></td>
                <td nowrap>
                <div align="right"><b>Expiraton Date :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(4)%></td>
              </tr>
              <tr>
                <td nowrap>
                <div align="right"><b>Original Amount :</b></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(3)%></td>
                <td nowrap>
                <div align="right"><b>Interest Rate :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(29)%></td>
              </tr>
              <tr >
                <td nowrap>
                <div align="right"><b>Capital Amount :</b></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(14)%></td>
                <td nowrap>
                
              <div align="right"><b>Grace Period :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(10)%></td>
                
              </tr>
              <tr>
                <td nowrap>
                <div align="right"><b>Interest Rate :</b></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(15)%></td>
                <td nowrap>
                <div align="right"><b>Payment Via :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(20)%></td>
                
              </tr>
              <tr >
                <td nowrap>
                <div align="right"><b>Penalty Amount :</b></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(5)%></td>
                <td nowrap>
                <div align="right"><b>Plaza Pago :</b></div>
                </td>
                <td nowrap><%= docList.getRecord(21)%></td>
                
              </tr>
              <tr>
                <td nowrap>
                
              <div align="right"><B>Monto Revaluaci&oacute;n :</B></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(16)%></td>
                <td nowrap>
                <div align="right"><B>Agente Cobrador :</B></div>
                </td>
                <td nowrap><%= docList.getRecord(22)%></td>
              </tr>
              <tr>
                <td nowrap>
                <div align="right"><B>Saldo Total :</B></div>
                </td>
                <td nowrap align="right"><%= docList.getRecord(17)%></td>
                <td nowrap></td>
                <td nowrap></td>
              </tr>
           </table>
        </td>
     </tr>
  </table>

<% if (docList.getRecord(6).equals("4")) { %>
<h4>Check Information</h4>
            
 <table class="tableinfo">
    <tr>
        <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <TR>
                <TD nowrap>
                <DIV align="right"><b>Banco del Cheque :</b></DIV>
                </TD>
                <TD nowrap><%= docList.getRecord(23)%></TD>
                <TD nowrap>
                <DIV align="right"><b>Localidad Banco :</b></DIV>
                </TD>
                <TD nowrap><%= docList.getRecord(24)%></TD>
            </TR>
            <TR>
                <TD nowrap>
                <DIV align="right"><b>Account Number :</b></DIV>
                </TD>
                <TD nowrap><%= docList.getRecord(25)%></TD>
                <TD nowrap>
                <DIV align="right"><b>Check Number :</b></DIV>
                </TD>
                <TD nowrap><%= docList.getRecord(26)%></TD>
            </TR>
            <TR>
                <TD nowrap>
                <DIV align="right"><b>Envio a Cámara :</b></DIV>
                </TD>
                <TD nowrap><%= docList.getRecord(27)%></TD>
                <TD nowrap></TD>
                <TD nowrap></TD>
            </TR>
		</table>
        </td>
     </tr>
  </table>            
<% } %>
</form>
</body>
</html>
