<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>ACH Transaction Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EACH500Record" class="datapro.eibs.beans.EACH50002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function showOfac(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }

function goTransfer(refnum) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=3&REFNUM="+ refnum;
	 CenterWindow(page,600,500,2);
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


<H3 align="center">Inquiry - Transaction <%= EACH500Record.getE02ACUNUM().trim()%>  
	<% if (EACH500Record.getE02REQTYP().equals("I")) out.print("<B><FONT color=\"red\">INCOMING</FONT></B>");%>
	<% if (EACH500Record.getE02REQTYP().equals("O")) out.print("<B><FONT color=\"green\">OUTGOING</FONT></B>");%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_detail.jsp, EACH500">
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
    <%int row = 1; %>
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right">Entry Class : </td>
            <td nowrap width="30%" align="left"> 
                <INPUT type="text" name="E02ACUECD" size="4"  value="<%= EACH500Record.getE02ACUECD().trim()%>" readonly> 
				<INPUT type="text" name="E02ECDDSC" size="40" value="<%= EACH500Record.getE02ECDDSC().trim()%>" readonly>
			</td>
            <TD nowrap width="10%" align="right">Value Date : </TD>
            <TD nowrap width="20%" align="left">
		 		<INPUT type="text" name="E02ACUVDM" size="3" value="<%= EACH500Record.getE02ACUVDM().trim()%>" readonly>
				<INPUT type="text" name="E02ACUVDD" size="3" value="<%= EACH500Record.getE02ACUVDD().trim()%>" readonly>
				<INPUT type="text" name="E02ACUVDY" size="3" value="<%= EACH500Record.getE02ACUVDY().trim()%>" readonly>
            </TD>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right">Company : </td>
            <td nowrap width="30%" align="left"> 
                <INPUT type="text" name="E02ACUOCD" size="10"  value="<%= EACH500Record.getE02ACUOCD().trim()%>" readonly> 
				<INPUT type="text" name="E02OCDDSC" size="40" value="<%= EACH500Record.getE02OCDDSC().trim()%>" readonly>
			</td>
            <TD nowrap width="10%" align="right">Run Date : </TD>
            <TD nowrap width="20%" align="left">
		 		<INPUT type="text" name="E02ACURDM" size="3" value="<%= EACH500Record.getE02ACURDM().trim()%>" readonly>
				<INPUT type="text" name="E02ACURDD" size="3" value="<%= EACH500Record.getE02ACURDD().trim()%>" readonly>
				<INPUT type="text" name="E02ACURDY" size="3" value="<%= EACH500Record.getE02ACURDY().trim()%>" readonly>
            </TD>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TD nowrap width="10%" align="right">Process Time : </TD>
			<TD nowrap width="20%" align="left">			
			<%= Util.formatDateTime(currUser.getE01DTF(), EACH500Record.getE02ACUPTS().trim())%></TD>		
			<TD nowrap width="10%" align="right">Record Time : </TD>
			<TD nowrap width="20%" align="left">			
			<%= Util.formatDateTime(currUser.getE01DTF(), EACH500Record.getE02ACURTS().trim())%></TD>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TD nowrap width="10%" align="right">Status : </TD>
			<TD nowrap width="20%" align="left">
			 <% if(EACH500Record.getE02REQSTS().equals("P")) { out.print("Pending to Approve");
				} else if (EACH500Record.getE02REQSTS().equals("A")) { out.print("Approve to Send");		
				} else if (EACH500Record.getE02REQSTS().equals("*")) { out.print("Processed");				
				} else if (EACH500Record.getE02REQSTS().equals("R")) { out.print("In Return Process");
				} 
			 %> - <%= EACH500Record.getE02ACUSTC().trim()%>			
			</TD>	
            <TD nowrap width="10%" align="right"> Batch : </TD>
            <TD nowrap width="20%" align="left">
            <INPUT type="text" name="E02ACUBTH" size="5" maxlength="4"
					value="<%= EACH500Record.getE02ACUBTH().trim()%>" readonly></TD>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Transaction Information</h4>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="15%" align="right">ACH Transaction : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUCDE" size="3"  maxlength="2" value="<%= EACH500Record.getE02ACUCDE().trim()%>" readonly>
				<INPUT type="text" name="E02CDEDSC" value="<%= EACH500Record.getE02CDEDSC().trim()%>" size="35" readonly>
			</TD>
				<TD nowrap width="15%" align="right">Amount : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E02ACUAMT" size="16" maxlength="15" value="<%= EACH500Record.getE02ACUAMT().trim()%>" readonly> 	
				 	<INPUT type="text" name="E02ACUCCY" size="4" maxlength="3" value="<%= EACH500Record.getE02ACUCCY().trim()%>" readonly> 	
				</TD>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD nowrap width="15%" align="right">Routing : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E02ACUROU" size="11" maxlength="10" value="<%= EACH500Record.getE02ACUROU().trim()%>" readonly>
			</TD>
            <td nowrap width="15%" align="right">IBS Reference : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUREF" size="10" maxlength="9" value="<%= EACH500Record.getE02ACUREF().trim()%>" readonly>
				<A href="javascript:goTransfer(<%= EACH500Record.getE02ACUREF().trim()%>)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Inquiry" border="0"></A>
			</td>
          </TR>
        </table> 
      </td>  
    </tr>
  </table>
  
  <h4>Parties Information </h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap colspan="2" align="center"> 
                <b>Ordering</b>&nbsp;
            </td>
            <td nowrap colspan="2" align="center">  
                <b>Beneficiary</b>&nbsp;
            </td>
		</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">IBS Account: </td>
            <td nowrap align="left" width="35%">
				<INPUT type="text" name="E02ACUBNK" size="5"  maxlength="2" value="<%= EACH500Record.getE02ACUBNK().trim()%>" readonly>
            	<INPUT type="text" name="E02ACUBRN" size="5"  maxlength="3" value="<%= EACH500Record.getE02ACUBRN().trim()%>" readonly>
            	<INPUT type="text" name="E02ACUACC" size="15"  maxlength="12" value="<%= EACH500Record.getE02ACUACC().trim()%>" readonly>

			</td>
			<TD nowrap width="15%" align="right">Account : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUDAC" size="21" maxlength="20" value="<%= EACH500Record.getE02ACUDAC().trim()%>" readonly> 
				<SELECT name="E02ACUACT" disabled>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("C")?"Selected":"" %> value="C">Checks</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("S")?"Selected":"" %> value="S">Saving</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("L")?"Selected":"" %> value="L">Loans</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("R")?"Selected":"" %> value="R">Credit Card</OPTION>
				</SELECT> 
			</TD>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="15%" align="right">Name: </td>
          	<td align="left">
          		<INPUT type="text" name="E02CUNDSC" value="<%= EACH500Record.getE02CUNDSC().trim()%>" size="35" readonly>
          	</td>
            <td nowrap width="15%" align="right">Name : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUNME" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUNME().trim()%>" readonly> 
				<% if (EACH500Record.getH02FLGWK3().trim().equals("3")) { %>
					<IMG border="0" src="<%=request.getContextPath()%>/images/warning_16.jpg" title="OFAC Match List" onClick="showOfac('<%= EACH500Record.getE02ACUNUM()%>')">
				<% } %>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
				<TD nowrap width="15%" align="right">Identification : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E02ACUIDN" size="16" maxlength="15" value="<%= EACH500Record.getE02ACUIDN().trim()%>" readonly> 
				</TD>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
            <td nowrap width="15%" align="right">Address :  </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUADR" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUADR().trim()%>" readonly> 
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
            <td nowrap width="15%" align="right">City : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUCSZ" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUCSZ().trim()%>" readonly> 
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
            <td nowrap width="15%" align="right">Country : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACRCTR" size="5" maxlength="3" value="<%= EACH500Record.getE02ACRCTR().trim()%>" readonly>
				<a href="javascript:GetCodeCNOFC('E02ACRCTR','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="top" border="0"></a>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td>  
            <td nowrap width="15%" align="right">State : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACRSTE" size="5" maxlength="3" value="<%= EACH500Record.getE02ACRSTE().trim()%>" readonly>
                <a href="javascript:GetCodeCNOFC('E02ACRSTE','27')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
            <td nowrap width="15%" align="right">Zip code: </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACRZPC" size="12" maxlength="10" value="<%= EACH500Record.getE02ACRZPC().trim()%>" readonly></td>
          </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td> 
            <td nowrap width="15%" align="right">Mail Address : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUEMA" size="50" maxlength="60" value="<%= EACH500Record.getE02ACUEMA().trim()%>" readonly> 
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  <h4>Addenda(s)</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" align="left"><b>(1)</b> <%= EACH500Record.getE02ACUAD1().trim()%></td>
			<td nowrap width="50%" align="left"><b>(7)</b> <%= EACH500Record.getE02ACUAD7().trim()%></td>
          </tr>
		  <TR id="clear">
            <td nowrap width="50%" align="left"><b>(2)</b> <%= EACH500Record.getE02ACUAD2().trim()%></td>
			<td nowrap width="50%" align="left"><b>(8)</b> <%= EACH500Record.getE02ACUAD8().trim()%></td>
		  </TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%" align="left"><b>(3)</b> <%= EACH500Record.getE02ACUAD3().trim()%></td>
			<td nowrap width="50%" align="left"><b>(9)</b> <%= EACH500Record.getE02ACUAD9().trim()%></td>
		  </TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" align="left"><b>(4)</b> <%= EACH500Record.getE02ACUAD4().trim()%></td>
			<td nowrap width="50%" align="left"><b>(10)</b> <%= EACH500Record.getE02ACUADA().trim()%></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" align="left"><b>(5)</b> <%= EACH500Record.getE02ACUAD5().trim()%></td>
			<td nowrap width="50%" align="left"><b>(11)</b> <%= EACH500Record.getE02ACUADB().trim()%></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" align="left"><b>(6)</b> <%= EACH500Record.getE02ACUAD6().trim()%></td>
			<td nowrap width="50%" align="left"><b>(12)</b> <%= EACH500Record.getE02ACUADC().trim()%></td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  
  </form>
</body>
</html>
