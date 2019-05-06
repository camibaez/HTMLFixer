<html>
<head>
<title>Account Holders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "rtTit" class= "datapro.eibs.beans.ESD000006Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>



</head>


<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
    
%> 
<h3 align="center">Account Holders <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_inq_tit.jsp,EDD0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <h4>Account Holders for account <%= userPO.getAccNum()%></h4>
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
                <input type="text" name="E06CU<%= name %>" size="9" maxlength="9" value="<%= rtTit.getField("E06CU"+name).getString().trim()%>" 
				readonly>
              </div>
            </td>
            <td nowrap width="46%"> 
              <div align="center"> 
                <input type="text" name="E06MA<%= name %>" size="40" maxlength="45" value="<%= rtTit.getField("E06MA"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="27%"> 
              <div align="center"> 
                <input type="text" name="E06ID<%= name %>" size="15" maxlength="15" value="<%= rtTit.getField("E06ID"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="18%"> 
              <div align="center"> 
                <input type="text" name="E06TY<%= name %>" size="20"  maxlength="15" 
				  value="<% if (rtTit.getField("E06TY"+name).getString().trim().equals("B")) out.print("Beneficiary");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("C")) out.print("Custodian");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("D")) out.print("Protected");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("E")) out.print("Representative");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("G")) out.print("Guardian");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("Minor");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("N")) out.print("Agent");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("S")) out.print("Personal Rep.");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("T")) out.print("Principal");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("U")) out.print("Executor");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("X")) out.print("Executrix");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("V")) out.print("Conservator");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("A")) out.print("AND");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("I")) out.print("ITF");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("L")) out.print("POA");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("O")) out.print("OR");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("1")) out.print("Trustee");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("2")) out.print("F/B/O");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("P")) out.print("POD");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("IRA");
							else if (rtTit.getField("E06TY"+name).getString().trim().equals("M")) out.print("WARD"); %>" 
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
  <p align="center">&nbsp; </p>
</form>
</body>
</html>
