<html>
<head>
<title>Offset Accounts</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="concept" class="datapro.eibs.beans.EGL034801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
	
	builtHPopUp();
	
	var pageNumber = 0;

	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}
   	
   	function first() {
   	    if (pageNumber > 1) {
	   	    var after = 1;
	   	    var present = pageNumber;
	   		document.getElementById("dataDiv" + after).style.display=""; 
			document.getElementById("dataDiv" + present).style.display="none"; 
			pageNumber = 1;
		}	
   	}
   	
   	function next() {
   		if (pageNumber < 10) {
	   	    var after = pageNumber + 1;
	   	    var present = pageNumber;
	   		document.getElementById("dataDiv" + after).style.display=""; 
	   	    if (present > 0) {
	   			document.getElementById("dataDiv" + present).style.display="none"; 
	   		}	
	   		pageNumber++;
	   	}	
   	}
   	
   	function previous() {
   		if (pageNumber > 1) {
	   	    var before = pageNumber - 1;
	   	    var present = pageNumber;
	   		document.getElementById("dataDiv" + before).style.display=""; 
	   		document.getElementById("dataDiv" + present).style.display="none"; 
	   		pageNumber--;
	   	}	
   	}
   	
   	function last() {
   	    if (pageNumber < 10) {
	   	    var after = 10;
	   	    var present = pageNumber;
	   		document.getElementById("dataDiv" + after).style.display=""; 
			document.getElementById("dataDiv" + present).style.display="none"; 
			pageNumber = 10;
		}	
   	}
   	
   	
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">eIBS Modules Offset Accounts <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="concepts_details.jsp, EGL0348"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0348" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" ><div align="right"><b>Bank :</b></div></td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01GLHB01" size="3" maxlength="2"  value="<%= concept.getE01GLHB01().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" ><div align="right"><b>Application :</b></div></td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E01GLHA01" size="3"  maxlength="3" value="<%= concept.getE01GLHA01().trim()%>">
                <input type="text" name="E01DESACD" maxlength="35" size="36" value="<%= concept.getE01DESACD().trim()%>" >
               </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>  
  
<%
	int pages = 10;
	for ( int p=1; p<=pages; p++ ) {
		int end = p * 10;
		if (end == 100) end = 99;
		int start = 1 + end - 10;
  		String name;
%>
  <div id="dataDiv<%=p%>" style="display=none"> 
  
  <div align="right">Page <%= p %></div>
  
  <br>
  
  <table id="mainTable" class="tableinfo" width="100%">
    <tr>
      <td> 
	          <table id="dataTable">
	            <tr id="trdark"> 
	              <td nowrap ><div align="center"><b><%=concept.getE01GLHA01().equals("FT")?"Class":"Seq."%></b></div></td>
	              <td nowrap ><div align="center"><b>Concept</b></div></td>
	              <td nowrap ><div align="center"><b>Type</b></div></td>
	              <td nowrap ><div align="center"><b>G/L</b></div></td>
	              <td nowrap ><div align="center"><b>Description</b></div></td>
	            </tr>
<%			   	
	  			for ( int i=start; i<=end; i++ ) {
	            	name = (i < 10) ? "0" + i : i + "";
%>
	            <tr id="trclear"> 
	              <td nowrap > 
	                <div align="center"> 
	                  <input type="text" name="E01GLHS<%= name %>" value="<%= concept.getField("E01GLHS"+name).getString().trim()%>" size="3" maxlength="2">
	                </div>
	              </td>
	              <td nowrap > 
	                <div align="center"> 
	                  <input type="text" name="E01GLHD<%= name %>" size="31" maxlength="30" value="<%= concept.getField("E01GLHD"+name).getString().trim()%>">
	                </div>
	              </td>
	              <td nowrap > 
	                <div align="center"> 
						<select name="E01GLHT<%= name %>" <%=concept.getE01GLHA01().equals("FT")?"Disabled":""%> >
			                <% if (concept.getE01GLHA01().equals("FT")) {%>
			                <option value="3">General Ledger Account</option>
			                <%} else {%>
			                <option value=" "> </option> 
			                <% } %> 
			                <option value="1" <% if (concept.getField("E01GLHT"+name).getString().trim().equals("1")) out.print("selected"); %>>Official Checks,Reconciliable,Other Documents</option>
			                <option value="2" <% if (concept.getField("E01GLHT"+name).getString().trim().equals("2")) out.print("selected"); %>>Retail Account</option>
			                <option value="3" <% if (concept.getField("E01GLHT"+name).getString().trim().equals("3")) out.print("selected"); %>>General Ledger Account</option>
			                <option value="4" <% if (concept.getField("E01GLHT"+name).getString().trim().equals("4")) out.print("selected"); %>>Default Cash Account</option>
			                <option value="9" <% if (concept.getField("E01GLHT"+name).getString().trim().equals("9")) out.print("selected"); %>>Wire Transfer</option>
		                </select>				   
	                </div>
	              </td>
	              <td nowrap > 
	                <div align="center"> 
	                  <input type="text" name="E01GLHG<%= name %>" size="17" maxlength="16" value="<%= concept.getField("E01GLHG"+name).getString().trim()%>"
	                	oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01GLHB01.value,'<%=currUser.getE01BCU()%>','NN','','')">
	                </div>
	              </td>
	              <td nowrap > 
	                <div align="center"> 
	                  <input type="text" name="E01DESD<%= name %>" size="40" maxlength="30"  value="<%= concept.getField("E01DESD"+name).getString().trim()%>" readonly>
	                </div>
            	  </td>
          		</tr>
<% 				} %>
          </table>
      </td>
    </tr>
  </table>
  </div>
<% } %>
  
  <br>
  <br>
  <br>

  <table align="center" width="100%">
  	<tr>
	  	<td align="center"><input id="EIBSBTN" type=button name="First" value="First" onclick="first()"></td>
	  	<td align="center"><input id="EIBSBTN" type=button name="Previous" value="Previous" onclick="previous()"></td>
	  	<td align="center"><input id="EIBSBTN" type=submit name="Submit" value="Submit"></td>
	  	<td align="center"><input id="EIBSBTN" type=button name="Next" value="Next" onclick="next()"></td>
	  	<td align="center"><input id="EIBSBTN" type=button name="Last" value="Last" onclick="last()"></td>
  	</tr>
  </table>
  
<SCRIPT LANGUAGE="JavaScript">
	next();
</SCRIPT>

</form>
</body>
</html>
