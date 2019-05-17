<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Retail Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="aba" class="datapro.eibs.beans.EDD600001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


</SCRIPT>
<%
	int row = 0;
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}


%>
<H3 align="center"><% if (userPO.getPurpose().equals("ABA")) out.print("ABA Number Maintenance");
   else  out.print("Swift ID Maintenance");
  %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="aba_swift_basic, EDD6000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD6000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="3">

<table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <%if(userPO.getPurpose().equals("ABA")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
           		<div align="right">
           			ABA Number :
           		</div>
            </td>
            <td nowrap width="70%" >
       			<input type="text" name="E01INSAB9" size="14" value="<%= aba.getE01INSAB9().trim()%>" 
		           <% if (userPO.getPurpose().equals("ABA")) out.print("readonly"); %> >
            </td>
          </tr>
          <%} %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
           		<div align="right">
           			<%=userPO.getPurpose().equals("SWIFT")?"SWIFT ID NUMBER :":"Identification :"%>
           		</div>
            </td>
            <td nowrap width="70%" >
       			<input type="text" name="E01INSSWF" size="14" value="<%= aba.getE01INSSWF().trim()%>" 
		           <% if (userPO.getPurpose().equals("SWIFT")) out.print("readonly"); %> >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">Bank Name :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSNAM" size="45" maxlength="40" value="<%= aba.getE01INSNAM().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">Address :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSAD1" size="45" maxlength="35" value="<%= aba.getE01INSAD1().trim()%>" >
           		
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right"></div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSAD2" size="45" maxlength="35" value="<%= aba.getE01INSAD2().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right"></div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSAD3" size="45" maxlength="35" value="<%= aba.getE01INSAD3().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right"></div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSAD4" size="45" maxlength="35" value="<%= aba.getE01INSAD4().trim()%>" >
            </td>
          </tr>
          <%if (userPO.getPurpose().equals("SWIFT")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">Country :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSCNT" size="45" maxlength="30" value="<%= aba.getE01INSCNT().trim()%>" >
           		<a href="javascript:GetCountryCodeOfac('','E01INSCNT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <%} %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">City :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSCTY" size="45" maxlength="30" value="<%= aba.getE01INSCTY().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">State :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSTAT" size="3" maxlength="2" value="<%= aba.getE01INSTAT().trim()%>" >
           		<a href="javascript:GetCodeCNOFC('E01INSTAT', '27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"	align="absbottom" border="0"></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              	<div align="right">Telephone Number :</div>
            </td>
            <td nowrap width="70%" >
           		<input type="text" name="E01INSPHN" size="12" maxlength="10" value="<%= aba.getE01INSPHN().trim()%>" >
            </td>
          </tr>
		  <% if (!aba.getE01INSAB9().equals("")) { 
		  		if(userPO.getPurpose().equals("ABA")){ %>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="30%" >
	              	<div align="right">FED Wire Member :</div>
	            </td>
	            <td nowrap width="70%" >
	              <select name="E01INSMBR">
					<option value=" " <% if (!(aba.getE01INSMBR().equals("1") ||aba.getE01INSMBR().equals("2")||aba.getE01INSMBR().equals("3"))) out.print("selected"); %>></option>
	                <option value="1" <%if (aba.getE01INSMBR().equals("1")) out.print("selected"); %>>FEDWIRE NOT ONLINE</option>
	                <option value="2" <%if (aba.getE01INSMBR().equals("2")) out.print("selected"); %>>FEDWIRE ON LINE</option>
	                <option value="3" <%if (aba.getE01INSMBR().equals("3")) out.print("selected"); %>>BRANCH</option>
	              </select>
	            </td>
	          </tr>
		  <% 	}
		  	} else { %>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="30%" >
	              	<div align="right">Account Number :</div>
	            </td>
	            <td nowrap width="70%" >
	           		<input type="text" name="E01INSAD6" size="45" maxlength="35" value="<%= aba.getE01INSAD6().trim()%>" >
	            </td>
	          </tr>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="30%" >
	              	<div align="right">BB Branch Number :</div>
	            </td>
	            <td nowrap width="70%" >
	           		<input type="text" name="E01INSBRN" size="5" maxlength="4" value="<%= aba.getE01INSBRN().trim()%>" >
	            </td>
	          </tr>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="30%" >
	              	<div align="right">Correspondent Bank Swift ID :</div>
	            </td>
	            <td nowrap width="70%" >
	           		<input type="text" name="E01INSCSI" size="14" maxlength="12" value="<%= aba.getE01INSCSI().trim()%>" >
	           		<a href="javascript:GetSwiftId('E01INSCSI')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></a>
	            </td>
	          </tr>

		  <%}%>
        </table>
      </td>
    </tr>
  </table>

 <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
