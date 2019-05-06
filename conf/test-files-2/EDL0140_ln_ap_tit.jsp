<html>
<head>
<title>Approval of Account Holders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnTit" class= "datapro.eibs.beans.ESD000006Message"  scope="session" />


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);

 </SCRIPT>

</head>


<body nowrap bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">Account Holders Information of <%= userPO.getHeader4().trim()%></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
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
                <input type="text" readonly name="E02CUN2" size="9" maxlength="9"  value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly name="E02NA12" size="45" maxlength="45"  value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" readonly name="E06ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E02PRO2" size="4" maxlength="4"  value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Account Holders</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <td nowrap width="9%"> 
              <div align="center">Number</div>
            </td>
            <td nowrap width="46%"> 
              <div align="center">First and Last Name</div>
            </td>
            <td nowrap width="27%"> 
              <div align="center"> Identification </div>
            </td>
            <td nowrap width="18%"> 
              <div align="center">Relationship</div>
            </td>
          </tr>
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" name="E06CU<%= name %>" size="9" maxlength="9" value="<%= lnTit.getField("E06CU"+name).getString().trim()%>" 
				readonly>
              </div>
            </td>
            <td nowrap width="46%"> 
              <div align="center"> 
                <input type="text" name="E06MA<%= name %>" size="40" maxlength="45" value="<%= lnTit.getField("E06MA"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="27%"> 
              <div align="center"> 
                <input type="text" name="E06ID<%= name %>" size="15" maxlength="15" value="<%= lnTit.getField("E06ID"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="18%"> 
              <div align="center"> 
                <input type="text" name="E06TY<%= name %>" size="20"  maxlength="15" 
				  value="<% if (lnTit.getField("E06TY"+name).getString().trim().equals("B")) out.print("Beneficiary");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("C")) out.print("Custodian");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("D")) out.print("Protected");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("E")) out.print("Representative");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("G")) out.print("Guardian");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("Minor");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("N")) out.print("Agent");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("S")) out.print("Personal Rep.");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("T")) out.print("Principal");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("U")) out.print("Executor");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("X")) out.print("Executrix");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("V")) out.print("Conservator");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("A")) out.print("AND");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("I")) out.print("ITF");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("L")) out.print("POA");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("1")) out.print("Trustee");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("2")) out.print("F/B/O");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("O")) out.print("Guarantor");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("P")) out.print("POD");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("IRA");
							else if (lnTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("WARD"); %>" 
				readonly>
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
