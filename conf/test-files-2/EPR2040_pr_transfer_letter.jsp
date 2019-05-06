<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Confirmation</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.*" %>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="msgLetter" class="datapro.eibs.beans.EPR204001Message"  scope="session" />
<%
String smonth = "";
String syear ="" ;
String expyear="";
int nmonth = 1;
int nyear = 2000;
int nexpyear = 2000; 
try {
 nmonth = Integer.parseInt(msgLetter.getE01PRODT2());
 nyear = 2000 + Integer.parseInt(msgLetter.getE01PRODT3());
 nexpyear = 2000 + Integer.parseInt(msgLetter.getE01EXPDT3());
} catch(Exception e){
} 
syear = "" + nyear;
expyear="" + nexpyear;
switch (nmonth){
	case 1 : smonth = "January";
			 break;
	case 2 : smonth = "Febrary";
			 break;
	case 3 : smonth = "March";
			 break;
	case 4 : smonth = "April";
			 break;
	case 5 : smonth = "May";
			 break;
	case 6 : smonth = "June";
			 break;		 
	case 7 : smonth = "July";
			 break;		 		
	case 8 : smonth = "August";
			 break;
	case 9 : smonth = "September";
			 break;
	case 10 : smonth = "October";
			 break;
	case 11 : smonth = "November";
			 break;
	case 12 : smonth = "December";
			 break;		 		 		 		 		  		 
}
%> 
</head>
<body>
<TABLE class="border=no">
	<TBODY>
		<TR>
			<TD colspan="3" align="center"
				style="font-weight: bold; text-decoration: underline">FUNDS TRANFER WARRANT<BR>
			(Exclusive use for regular account costumers)</TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184"><br></TD>
			<TD style="font-weight: bold;" colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184">Folio:</TD>
			<td><%= msgLetter.getE01PRPNUM() %></td>
			<TD style="font-weight: bold;"></TD>
		</TR>
		<TR>
			<TD colspan="3" style="font-weight: bold"><BR>
			APPLICANT PERSONAL RECORDS<BR>
			</TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184"><BR></TD>
			<TD style="font-weight: bold;" colspan="2" width="437"></TD>
		</TR>	
		<TR>
			<TD style="font-weight: bold;" width="184">Customer Name :</TD>
			<TD style="font-weight: bold;" colspan="2" width="437"><%= msgLetter.getE01CUSNA1() %></TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184">ID Number:</TD>
			<TD style="font-weight: bold;" colspan="2" width="437"><%= Util.formatRUT(msgLetter.getE01CUSIDN()) %></TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184">Regular Account :</TD>
			<TD style="font-weight: bold;" colspan="2" width="437"><%= msgLetter.getE01PRPDAC() %></TD>
		</TR>
		<TR>
			<TD colspan="3" style="text-align: justify"><BR>
			<p>Por el Presente instrumento, otorgo un mandato especial a
			Scotiabank Sud Americano, para transferir desde mi cuenta corriente
			señalada precedentemente, o en su defecto, si en ella no existiesen
			fondos disponibles suficientes, en la línea de crédito asociada, a
			la cuenta de abono que se detallan más abajo, el 
			valor, en el día y con la periodicidad que se ha señalado. En el
			evento que el  día que corresponda efectuar la transferencia,
			fuese un día sábado, domingo o festivo, ella se realizará el día
			hábil siguiente.</p>

			<p>Me obligo a mantener en la cuenta señalada precedentemente, los
			fondos necesarios para cubrir cada uno de los cargos que se hagan por
			la transferencia de fondos a las cuentas de abono señaladas, como
			asimismo el impuesto que grava estos actos.</p>
			<p>Libero a Scotiabank Sud Americano de toda responsabilidad en el
			ejercicio de este mandato, especialmente por no cargar las
			transferencias de fondos a las cuentas de abono en el caso de no
			tener fondos disponibles suficientes en la cuenta corriente o línea
			de crédito.</p>
			<p>Este mandato expirará en la fecha señalada, por voluntad del
			mandante, del Banco o por el cierre de la cuenta corriente
			respectiva; la revocación del mandato deberá notificarse por escrito
			al Banco y surtirá efectos dentro de las 48 horas siguientes al acuse
			de recibo, salvo en el primer caso señalado.</p>
			</TD>
		</TR>
		<TR>
			<TD style="font-weight: bold;" width="184"><BR>WARRANT DETAILS</TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD width="184"><BR></TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD width="184">Branch:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01PRPOBR() %> - <%= msgLetter.getE01BRNNME() %></TD>
		</TR>
		<TR>
			<TD width="184">Executive:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01PRPOFC() %> - <%=msgLetter.getE01OFCNME() %></TD>
		</TR>
		<TR>
			<TD width="184">Expiration Date:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01EXPDT1() %>/<%=msgLetter.getE01EXPDT2()%>/<%= expyear %></TD>
		</TR>
		<TR>
			<TD width="184">Currency Type(2/CLP):</TD>
			<TD colspan="2" width="437"><% if (msgLetter.getE01PRPTCY().equals("2")) { out.println("UF"); } else if (msgLetter.getE01PRPTCY().equals("CLP")) {out.println("PESOS");}%></TD>
		</TR>
		<TR>
			<TD width="184">Payment Type (Fijo/Variable):</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01TIPOPA() %></TD>
		</TR>
		<TR>
			<TD width="184">Payment Account Number:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01PRPCAC() %></TD>
		</TR>
		<TR>
			<TD width="184">Payment Account Holder:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01CRENA1() %></TD>
		</TR>
		<TR>
			<TD width="184">Account Amount:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01PRPAMT() %></TD>
		</TR>
		<TR>
			<TD width="184">Frequency (D/S/M/2M/3M/V):</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01TIPOFR() %></TD>
		</TR>
		<TR>
			<TD width="184">Payment Day (W:M -&gt; F/M:1-&gt;31):</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01DIAPAG() %></TD>
		</TR>
		<TR>
			<TD width="184">Days Number (V: Cada 1-&gt; 999):</TD>
			<TD colspan="2" width="437"><% if (!msgLetter.getE01PRPDYS().equals("0")) out.print(msgLetter.getE01PRPDYS()); %></TD>
		</TR>
		<TR>
			<TD width="184">Payments Counts (Required: 1 -&gt; 9999):</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01PRPNPM() %></TD>
		</TR>
		<TR>
			<TD width="184"><br></TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD width="184">Comission Amount:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01COMAMT() %></TD>
		</TR>
		<TR>
			<TD width="184">Comission Currency:</TD>
			<TD colspan="2" width="437"><%=msgLetter.getE01COMNME() %></TD>
		</TR>
		<TR>
			<TD width="184"><br></TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD colspan="3">EN SANTIAGO, a <%=msgLetter.getE01PRODT1() %> de <%=smonth %> de <%= syear %></TD>
		</TR>
		<TR>
			<TD width="184"><br></TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD width="184"><br></TD>
			<TD colspan="2" width="437"></TD>
		</TR>
		<TR>
			<TD width="184"></TD>
			<TD align="left" colspan="2" width="437"><div align=center>----------------------------------------<br>Client Signature</div></TD>
		</TR>
	</TBODY>
</TABLE>
</body>
</html>


