<html>
<head>
<title>Detalle del Pl&aacute;stico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="ecd0009" class="datapro.eibs.beans.ECD0009DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>
<P><BR>
</P>
<%!
  String ScreenMode="Q";  //Q - Query, E - Edit, N - New
  String action="2"; 
  String FieldEditable="";
  String KeyFieldEditable="";
  String FieldEditable2="";
  String KeyFieldEditable2="";
 
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
     
     //Determina el modo de pantalla
     if (request.getAttribute("ScreenMode") != null && !request.getAttribute("ScreenMode").equals(""))
       ScreenMode = request.getAttribute("ScreenMode").toString();
     if (!ScreenMode.equals ("E") && !ScreenMode.equals ("N"))   
       ScreenMode="Q";
       
     //Determina el proceso a ejecutar segun el modo de pantalla
     
     if ( ScreenMode.equals("Q")){  //Consulta del detalle del plastico
       action = "2"; 
       FieldEditable="readonly";
       KeyFieldEditable="readonly";
       FieldEditable2="disabled";
       KeyFieldEditable2="disabled";
     }
     else if (ScreenMode.equals("E")){ // Edicion del detalle del plastico
       action="5";
       FieldEditable="";
       KeyFieldEditable="readonly";
       FieldEditable2="";
       KeyFieldEditable2="disabled";
     }
     else{
       action="1";   // Creacion de un plastico.
       FieldEditable="";
       KeyFieldEditable="";
       FieldEditable2="";
       KeyFieldEditable2="";
     }  
   
%>

<h3 align="center">Card Control<BR>
Detail<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="Card_Info.jsp, ECD0009"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0009" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%=action%>">
  
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Code : </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01CDRTBL" size="3" maxlength="2" value="<%= ecd0009.getE01CDRTBL()%>" 
                <%=KeyFieldEditable%> >
            </td>
            <td nowrap width="6%" align="right">Description : </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01CDRDSC" size="31" maxlength="30" value="<%= ecd0009.getE01CDRDSC()%>" 
                <%=FieldEditable%> >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>General Information</h4>

  <table class="tableinfo">
    <tr > 
      <td width="100%">
		<table cellspacing="0" cellpadding="2" border="0" width="100%">
			<tr id="trdark">
				<td width="25%">
				<div align="right">Product Type :</div>
				</td>
				<td width="25%">
				<% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRDOC().equals("D")?"Debit":"Credit"%>
				<%} else { %>
					<input type="radio" name="E01CDRDOC" value="D" <%= ecd0009.getE01CDRDOC().equals("D")?"Checked":""%><%=KeyFieldEditable2%>> Debit 
					<input type="radio" name="E01CDRDOC" value="C" <%= ecd0009.getE01CDRDOC().equals("C")?"Checked":""%><%=KeyFieldEditable2%>> Credit
				<%}%></td>
				<td width="25%">
				<div align="right">BIN Number :</div>
				</td>
				<td width="25%"><input type="text" name="E01CDRBIN" size="7"
					maxlength="6" value="<%= ecd0009.getE01CDRBIN()%>"
					<%=KeyFieldEditable%>></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Issuer Code :</div>
				</td>
				<td><input type="text" name="E01CDREMI" size="5"
					maxlength="4" value="<%= ecd0009.getE01CDREMI()%>"
					<%=KeyFieldEditable%>></td>
				<td>
				<div align="right">Numbering Type :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%=ecd0009.getE01CDRTPC()+" "%>
				<% if (ecd0009.getE01CDRTPC().equals(" ")) { out.print("Consecutivo"); } else if (ecd0009.getE01CDRTPC().equals("1")) { out.print("Agencia + '0'"); } else if (ecd0009.getE01CDRTPC().equals("2")) { out.print("'0' + Agencia"); } %>
				<%} else { %> <select name="E01CDRTPC" <%=KeyFieldEditable2%>>
					<option value=" "
						<%if (ecd0009.getE01CDRTPC().equals(" ")) { out.print("selected"); }%>>Consecutive</option>
					<option value="1"
						<%if (ecd0009.getE01CDRTPC().equals("1")) { out.print("selected"); }%>>Branch
					+ '0'</option>
					<option value="2"
						<%if (ecd0009.getE01CDRTPC().equals("2")) { out.print("selected"); }%>>'0'
					+ Branch</option>
				</select> <%}%></td>
			</tr>
			<%--
          <tr id="trdark"> 
            <td> 
              <div align="right">Card Type : </div>            </td>
            <td>
              <% if(ScreenMode.equals("Q")){ %>
                 <%= ecd0009.getE01CDRTYP().equals("A")?"Administrativa":"Venta al Cliente"%> 
               <%} else { %> 
                <input type="radio"  name="E01CDRTYP" value="A" <%= ecd0009.getE01CDRTYP().equals("A")?"Checked":""%>  > Administrative<input type="radio"  name="E01CDRTYP" value="V" <%= ecd0009.getE01CDRTYP().equals("V")?"Checked":""%> > Sell 
              <%}%>            </td>
            <td> 
            </td>
            <td>
            </td>
	      </tr>
          <tr id="trclear"> 
            <td> 
              <div align="right"> Activation Code : </div>            </td>
            <td> 
              <% if(ScreenMode.equals("Q")){ %>
                 <%= ecd0009.getE01CDRACT().equals("1")?"Impl&iacute;cita":"Expl&iacute;cita"%> 
               <%} else { %> 
                <input type="radio"  name="E01CDRACT" value="1" <%= ecd0009.getE01CDRACT().equals("1")?"Checked":""%>  > Implicit
                <input type="radio"  name="E01CDRACT" value="2" <%= ecd0009.getE01CDRACT().equals("2")?"":"Checked"%> > Explicit 
            <%}%>            </td>
            <td> 
              <div align="right">Duration of Card : </div>            </td>
            <td> 
              <% if(ScreenMode.equals("Q")){ %>
                <%=ecd0009.getE01CDRTRM()+" "%> <%=ecd0009.getE01CDRTRC().equals("D")?"D&iacute;as":"Meses"%> 
             <%} else { %>
             
               <input type="text"  name="E01CDRTRM" size="5" maxlength="4" value="<%= ecd0009.getE01CDRTRM()%>" <%=FieldEditable%> >
               <select name="E01CDRTRC"  >
                <option value="D" <%if (ecd0009.getE01CDRTRC().equals("D")) { out.print("selected"); }%>>Days</option>
                <option value="M" <%if (ecd0009.getE01CDRTRC().equals("M")) { out.print("selected"); }%>>Months</option>
              </select>
              <%} %>            </td>
		  </tr>
--%>
			<tr id="trdark">
				<%--
            <td> 
              <div align="right">Max. Number of Accounts :</div>            </td>
            <td> 
              <input type="text"  name="E01CDRMXC" size="3" maxlength="2" value="<%= ecd0009.getE01CDRMXC().trim()%>" <%=FieldEditable%>>            </td>
--%>
				<td>
				<div align="right">Generate CVC/CVC2 :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRCVC().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRCVC" value="Y"
					<%= ecd0009.getE01CDRCVC().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRCVC" value="N"
					<%= ecd0009.getE01CDRCVC().equals("Y")?"":"Checked"%>> No <%}%></td>
            <td> 
              <div align="right">Duration of Card : </div>            </td>
            <td> 
              <% if(ScreenMode.equals("Q")){ %>
                <%=ecd0009.getE01CDRTRM()+" "%> <%=ecd0009.getE01CDRTRC().equals("D")?"Days":
                	(ecd0009.getE01CDRTRC().equals("M") ? "Months" : "Years")%> 
             <%} else { %>
             
               <input type="text"  name="E01CDRTRM" size="5" maxlength="4" value="<%= ecd0009.getE01CDRTRM()%>" <%=FieldEditable%> >
               <select name="E01CDRTRC"  >
<%--                <option value="D" <%if (ecd0009.getE01CDRTRC().equals("D")) { out.print("selected"); }%>>Days</option>   --%>
                <option value="M" <%if (ecd0009.getE01CDRTRC().equals("M")) { out.print("selected"); }%>>Months</option>
                <option value="Y" <%if (ecd0009.getE01CDRTRC().equals("Y")) { out.print("selected"); }%>>Years</option>
              </select>
              <%} %>            
              </td>					
<%--				<td></td>
				<td></td>
--%>				
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Corporate Customer Allowed:</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRJUR().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRJUR" value="Y"
					<%= ecd0009.getE01CDRJUR().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRJUR" value="N"
					<%= ecd0009.getE01CDRJUR().equals("Y")?"":"Checked"%>> No <%}%></td>
				<td>
				<div align="right">Join signatures allowed :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRFIR().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRFIR" value="Y"
					<%= ecd0009.getE01CDRFIR().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRFIR" value="N"
					<%= ecd0009.getE01CDRFIR().equals("Y")?"":"Checked"%>> No <%}%></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Digits in Card :</div>
				</td>
				<td><input type="text" name="E01CDRDIG" size="3"
					maxlength="2" value="<%= ecd0009.getE01CDRDIG().trim()%>"
					<%=KeyFieldEditable%>></td>
				<td>
				<div align="right">Amount to Return :</div>
				</td>
				<td><input type="text" name="E01CDRDEV" size="18"
					maxlength="17" value="<%= ecd0009.getE01CDRDEV().trim()%>"
					<%=FieldEditable%> onkeyPress="enterDecimal()"></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Offline Allowed:</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDROFF().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDROFF" value="Y"
					<%= ecd0009.getE01CDROFF().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDROFF" value="N"
					<%= ecd0009.getE01CDROFF().equals("Y")?"":"Checked"%>> No <%}%></td>
				<td>
				<div align="right">Validate PIN without Card :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRPIN().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRPIN" value="Y"
					<%= ecd0009.getE01CDRPIN().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRPIN" value="N"
					<%= ecd0009.getE01CDRPIN().equals("Y")?"":"Checked"%>> No <%}%></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Validate CVC without Card :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRCV1().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRCV1" value="Y"
					<%= ecd0009.getE01CDRCV1().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRCV1" value="N"
					<%= ecd0009.getE01CDRCV1().equals("Y")?"":"Checked"%>> No <%}%></td>
				<td>
				<div align="right">Validate CVC2 without Card :</div>
				</td>
				<td><% if(ScreenMode.equals("Q")){ %> <%= ecd0009.getE01CDRCV2().equals("Y")?"Si":"No"%>
				<%} else { %> <input type="radio" name="E01CDRCV2" value="Y"
					<%= ecd0009.getE01CDRCV2().equals("Y")?"Checked":""%>> Yes <input
					type="radio" name="E01CDRCV2" value="N"
					<%= ecd0009.getE01CDRCV2().equals("Y")?"":"Checked"%>> No <%}%></td>
			</tr>
		</table>
		</td>
    </tr>
  </table>
  
  <p>
  <% if (!"Q".equals(ScreenMode)){ %>
    <div align="center"> 
      <input id="EIBSBTN" type="submit" name="Submit" value="Submit">
    </div>
  <% } %>  
</form>
</body>
</html>
