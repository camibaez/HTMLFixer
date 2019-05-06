<html>
<head>
<title>Offering Memorandum</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgOff" class="datapro.eibs.beans.ELN018501Message" scope="session"/>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body>
<%

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>
<h3 align="center">Offering Memorandum<br>Exceptions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="offering_memo_exceptions.jsp, ELN0185"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0185" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Exceptions :</div>
            </td>
            <td nowrap width="28%" colspan="3">
				<input type="text" name="E01EXCP1" size="51" maxlength="50" value="<%= msgOff.getE01EXCP1() %>" readonly><br>
				<input type="text" name="E01EXCP2" size="51" maxlength="50" value="<%= msgOff.getE01EXCP2() %>" readonly><br>
				<input type="text" name="E01EXCP3" size="51" maxlength="50" value="<%= msgOff.getE01EXCP3() %>" readonly><br>
				<input type="text" name="E01EXCP4" size="51" maxlength="50" value="<%= msgOff.getE01EXCP4() %>" readonly><br>
				<input type="text" name="E01EXCP5" size="51" maxlength="50" value="<%= msgOff.getE01EXCP5() %>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Actual Outstandings :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OUTSB" size="20" maxlength="19" value="<%= msgOff.getE01OUTSB() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            </td>
            <td nowrap width="24%" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="24%" >
            	<div align="right">Regulation "K" Exceptions :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFRKE" size="20" maxlength="19" value="<%= msgOff.getE01OFFRKE() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">New Transaction :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01TRAEQV" size="20" maxlength="19" value="<%= msgOff.getE01TRAEQV() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="24%" >
            	<div align="right">Lending Limit :</div>
            </td>
            <td nowrap width="28%" >
				<input type="text" name="E01OFFLLM" size="20" maxlength="19" value="<%= msgOff.getE01OFFLLM() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
            <td nowrap width="24%" >
            	<div align="right">Ending Balance :</div>
            </td>
            <td nowrap width="24%" >
				<input type="text" name="E01EXCBAL" size="20" maxlength="19" value="<%= msgOff.getE01EXCBAL() %>" onKeyPress="enterDecimal()" readonly> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  </form>
</body>
</html>
