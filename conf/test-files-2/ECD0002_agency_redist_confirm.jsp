<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0002DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Cards Reallocations<BR>Confirmation</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12"><INPUT type="hidden"
	name="CONFIRM" value="0"><INPUT type="hidden" name="E02CDRNUM"
	value="<%= msgCD.getE02CDRNUM() %>">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <TR id="trdark">
				<TD nowrap width="16%">
				<DIV align="right">Request # :</DIV>
				</TD>
				<TD nowrap width="20%"><INPUT type="text" name="E02CDRNUMNEW"
					size="15" maxlength="13" readonly value="NEW"></TD>
				<TD nowrap width="16%" align="right">Card Type :</TD>
				<TD nowrap width="20%"><INPUT type="text" name="E02CDRTPL" size="3"
					maxlength="2" value="<%= msgCD.getE02CDRTPL() %>" readonly></TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%" align="right">Source Branch :</TD>
				<TD nowrap width="20%"><INPUT type="text" name="E02CDRBRN" size="5"
					maxlength="4" value="<%= msgCD.getE02CDRBRN() %>" readonly="readonly"></TD>
				<TD nowrap width="16%" align="right">Destiny Branch :</TD>
				<TD nowrap width="20%"><INPUT type="text" name="E02CDRBRD" size="5"
					maxlength="4" value="<%= msgCD.getE02CDRBRD() %>" readonly></TD>
			</TR>
			<tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Inital Card :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CDRINI" size="20" maxlength="19" readonly value="<%= msgCD.getE02CDRINI() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Final Card :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDREND" size="20" maxlength="19" readonly value="<%= msgCD.getE02CDREND() %>">
			  </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Send Amount :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRQTY" size="15" maxlength="13" readonly value="<%= msgCD.getE02CDRQTY() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
              </div>
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
