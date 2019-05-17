<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT LANGUAGE="Javascript1.1" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "msg01" class= "datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
userPO.setPrevPage("ELC0560_lc_nego_enter.jsp");
%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Pago/Negociaci&oacute;n de Cartas de Cr&eacute;dito
<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" ALT="ELC0560_lc_nego_enter.jsp"></H3>
<HR SIZE="4">


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="2">
<INPUT TYPE="HIDDEN" NAME="H01OPECOD" VALUE="0001">
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	
		<TR>
			<TD HEIGHT="139">
			<TABLE CLASS="tbenter" ALIGN="center">
				
					<TR>
						<TD>
						<DIV ALIGN="right"><B>N&uacute;mero de Carta de Cr&eacute;dito: </B></DIV>
						</TD>
						<TD>
						<DIV><INPUT TYPE="text" NAME="E01LCRNUM" SIZE="13" MAXLENGTH="12" value="<%= msg01.getE01LCRNUM()%>" ONKEYPRESS="enterInteger()">
						<A HREF="javascript:GetAccount('E01LCRNUM','','LC','')"> <IMG SRC="<%=request.getContextPath()%>/images/1b.gif" ALT="Ayuda" BORDER="0"></A></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
						<DIV ALIGN="right"><B>Tipo de Negociación: </B></DIV>
						</TD>
						<TD>
						<DIV><SELECT NAME="E01OPCODE">
							<OPTION VALUE="1">Pago a la Vista</OPTION>
							<OPTION VALUE="2" <% if(msg01.getE01OPCODE().equals("2")) out.print("selected");%>>Aceptación</OPTION>
							<OPTION VALUE="3" <% if(msg01.getE01OPCODE().equals("3")) out.print("selected");%>>Aceptación Descontada</OPTION>
							<OPTION VALUE="4" <% if(msg01.getE01OPCODE().equals("4")) out.print("selected");%>>Pago Diferido</OPTION>
							<OPTION VALUE="5" <% if(msg01.getE01OPCODE().equals("5")) out.print("selected");%>>Refinanciación</OPTION>
							<OPTION VALUE="6" <% if(msg01.getE01OPCODE().equals("6")) out.print("selected");%>>Cancelación</OPTION>
							<OPTION VALUE="9" <% if(msg01.getE01OPCODE().equals("9")) out.print("selected");%>>Solo Commisiones</OPTION>
						</SELECT></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
							<DIV ALIGN="right"><B>Monto: </B></DIV>
						</TD>
						<TD>
						<DIV><INPUT TYPE="text" NAME="E01DRWAMN" SIZE="20" MAXLENGTH="15" value="<%= msg01.getE01DRWAMN()%>" ONKEYPRESS="enterDecimal()">
						     <IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" border="0"></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
							<DIV ALIGN="right"><b>Moneda de Refinanciación: </b></DIV>
						</TD>
						<TD>
							<DIV>
								<INPUT TYPE="text" NAME="E01REFCCY" SIZE="3" MAXLENGTH="3" value="">
								 <a href="javascript:GetCurrency('E01REFCCY','')">
								 <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0">
								 </a>
							</DIV>
						</TD>
					</TR> 
    				<TR>
				  		<TD width="25%" align="right" nowrap><B>Generar Mensaje Swift: </B></TD>
				  		<TD nowrap width="25%">
				  			<INPUT type="radio" name="E01SWFMSG" value="Y">Si
				    		<INPUT type="radio" name="E01SWFMSG" value="N">No 
				    	</TD>
    				</TR> 
					<TR>
				  		<TD align="right" nowrap><B>Tipo de Mensaje Swift: </B></TD>
				  		<TD align="left" nowrap>
				  			<SELECT name="E01SWFMTP">
				  				<OPTION value=""></OPTION>
				  				<OPTION value="732">MT732</OPTION>
                      			<OPTION value="742">MT742</OPTION>
                      			<OPTION value="752">MT752</OPTION>
                      			<OPTION value="754">MT754</OPTION>
                      			<OPTION value="756">MT756</OPTION>
                  			</SELECT>
                  		</TD>
					</TR>	
					<TR>
						<TD>
							<DIV ALIGN="right"><B>Banco Receptor Swift: </B></DIV>
						</TD>
						<TD>
							<DIV>
								<INPUT TYPE="text" NAME="E01SWFRCV" SIZE="20" MAXLENGTH="12" >
								<!--<A HREF="javascript:GetCorrespondentDescIdSwift('E01SWFRCV','','')">-->
								<A href="javascript:GetSwiftIdDesc('E01SWFRCV','','','')">
								<IMG SRC="<%=request.getContextPath()%>/images/1b.gif" ALT="Ayuda" BORDER="0"></A></DIV>
						</TD>
					</TR>
					<TR>
						<TD COLSPAN="2">
						<DIV ALIGN="center"><BR>
						<H4 style="text-align:center">
	                       <INPUT type="checkbox" name="H01FLGWK2" value="Y" <% if(msg01.getH01FLGWK2().equals("A")){ out.print("checked");} %>>Aceptar con Advertencias
	                    </H4>
					       <INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Enviar"></DIV>
						</TD>
					</TR>
				
			</TABLE>
			</TD>
		</TR>
	
</TABLE>

</DIV>

</FORM>

</BODY>
</HTML>
