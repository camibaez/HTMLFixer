<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>IOTA Relationship Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.EDD057501Message"  	scope="session" />

<%
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT Language="Javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>

<body>

<h3 align="center">IOTA Relationship Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDD0575_iota_maintenance.jsp"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0575">
   	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="1">

  	<h4>Basic Information</h4>
	<table class="tableinfo">
	<tr >
	<td nowrap>
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right">
		        	IOTA Trust Account :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01FRMACC" size="18" readonly value="<%= account.getE01FRMACC()%>">
		    	</td>
		    	<td align="right">
		        	Product :
		        </td>
		    	<td align="left">
		    		<input type="text" name="E01FRMPRD" size="5" readonly value="<%= account.getE01FRMPRD()%>">

		    	</td>
		    </tr>
			<tr>
		    	<td align="right">
		        	Customer Name :
		        </td>
		    	<td align="left">
					<input type="text" name="E01FRMNME" size="35" readonly value="<%= account.getE01FRMNME()%>">
				</td>
		    	<td align="right">
		        	Currency :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01FRMCCY" size="4" readonly value="<%= account.getE01FRMCCY()%>">
		    	</td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
  	<br>
	<table class="tableinfo">
	<tr >
	<td nowrap>
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right">
		        	Bar Association Account :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01TOACC" size="18" value="<%= account.getE01TOACC()%>">
        			<a href="javascript:GetAccount('E01TOACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		    	</td>
		    	<td align="right">
		        	Product :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01TOPRD" size="5" readonly value="<%= account.getE01TOPRD()%>">
		    	</td>
		    </tr>
			<tr>
		    	<td align="right">
		        	Customer Name :
		        </td>
		    	<td align="left">
					<input type="text" name="E01TONME" size="35" readonly value="<%= account.getE01TONME()%>">
				</td>
		    	<td align="right">
		        	Currency :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01TOCCY" size="4" readonly value="<%= account.getE01TOCCY()%>">
		    	</td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
	<br>
	<table class="tableinfo">
	<tr >
	<td nowrap>
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right">
		        	Operating Account :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01OPEACC" size="18" value="<%= account.getE01OPEACC()%>">
        			<a href="javascript:GetAccount('E01OPEACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		    	</td>
		    	<td align="right">
		        	Product :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01OPEPRD" size="5" readonly value="<%= account.getE01OPEPRD()%>">
		    	</td>
		    </tr>
			<tr>
		    	<td align="right">
		        	Customer Name :
		        </td>
		    	<td align="left">
					<input type="text" name="E01OPENME" size="35" readonly value="<%= account.getE01OPENME()%>">
				</td>
		    	<td align="right">
		        	Currency :
		        </td>
		    	<td align="left">
		            <input type="text" name="E01OPECCY" size="4" readonly value="<%= account.getE01OPECCY()%>">
		    	</td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
 	<br>
	<table class="tableinfo">
	<tr >
	<td nowrap>
		<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
			<tr>
		    	<td align="right">
		            Expiration Date :
		        </td>
		    	<td align="left">
	                <input type="text" name="E01RETRD1" size="2" maxlength="2" value="<%= account.getE01RETRD1() %>">
	                <input type="text" name="E01RETRD2" size="2" maxlength="2" value="<%= account.getE01RETRD2() %>">
	                <input type="text" name="E01RETRD3" size="2" maxlength="2" value="<%= account.getE01RETRD3() %>">
		        </td>
		    </tr>
			<tr>
		    	<td align="right">
		            Status :
		        </td>
		    	<td align="left">
					<input type="radio" name="E01RETSTS" value="A" <%if (account.getE01RETSTS().equals("A")) {%> checked <%}%>>Active&nbsp;
					<input type="radio" name="E01RETSTS" value="I" <%if (account.getE01RETSTS().equals("I")) {%> checked <%}%>>Inactive
		        </td>
		    </tr>
		</table>
	</td>
	</tr>
	</table>
  	<p align="center">
		<input id="EIBSBTN" type="submit" name="Submit" value="Submit">
	</p>

</form>
</body>
</html>
