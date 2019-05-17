<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Portfolios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="cusPort" class="datapro.eibs.beans.ESD008801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language = "javascript">
function finish(){
	self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";

	return;
}
</SCRIPT>

</head>

<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088">
  <h3 align="center"> Customer Portfolio</h3>
<hr size="4">
  <table class="tableinfo">
    <tr> 
      <td> 
        <div align="center">The operation has been finished sucesfully</div>
      </td>
    </tr>
  </table>
        <input type="hidden" name="SCREEN"  value="200" >
        <input type="hidden" name="OPCODE"  value="0002" >
       <h4>Basic Information</h4>
      <table class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0" height="242">
              <tr id="trdark"> 
                <TD nowrap width="34%"> 
                  <DIV align="right">Portfolio / Description :</DIV>
                </TD><TD nowrap> 
                  <INPUT type="text" readonly name="E01PRFNUM" size="12" maxlength="9" value="<%= cusPort.getE01PRFNUM().trim()%>">
                  <INPUT type="text" readonly name="E01PRFDSC" size="35" maxlength="35" value="<%= cusPort.getE01PRFDSC()%>">
                </TD>
                
              </tr>
			<TR>
				<TD nowrap width="34%"> 
                  <DIV align="right">Main Customer :</DIV>
                </TD><TD nowrap> 
                  <INPUT type="text" readonly name="E01PRFCUN" size="12" maxlength="9" value="<%= cusPort.getE01PRFCUN().trim()%>">
                  <INPUT type="text" readonly name="D01CUSNA1" size="35" maxlength="35" value="<%= cusPort.getD01CUSNA1().trim()%>">
                </TD>
				
			</TR>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Account Officer :</div>
                </td>
                <td nowrap> 
                  <input type="text" readonly  name="E01PRFOFC" size="6" maxlength="4" value="<%= cusPort.getE01PRFOFC().trim()%>">
                  <input type="text" readonly  name="D01OFCNME" size="35" maxlength="35" value="<%= cusPort.getD01OFCNME()%>" >
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Default Cash Account :</div>
                </td>
                <td nowrap > 
               	  <input type="text" readonly  name="E01PRFCDE" size="5" maxlength="4" value="<%= cusPort.getE01PRFCDE()%>">
                  <input type="text" readonly  name="E01PRFHAC" size="12" maxlength="9" value="<%= cusPort.getE01PRFHAC()%>">
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="34%" > 
                  <div align="right">Opening Date :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFOP1" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP1().trim()%>" onKeyPress="enterInteger()">
                  <input type="text" readonly  name="E01PRFOP2" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP2().trim()%>" onKeyPress="enterInteger()">
                  <input type="text" readonly  name="E01PRFOP3" size="3" maxlength="2" value="<%= cusPort.getE01PRFOP3().trim()%>" onKeyPress="enterInteger()">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Portfolio Currency :</div>
                </td>
                <td nowrap > 
                  <input type="text" readonly  name="E01PRFVCY" size="4" maxlength="3" value="<%= cusPort.getE01PRFVCY().trim()%>">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="34%" > 
                  <div align="right">Statement Via :</div>
                </td>
                <td nowrap > 
                  <div align="left"> 
                    <select disabled  name="E01PRFSTM">
                      <option value="N" <%if (cusPort.getE01PRFSTM().equals("N")) { out.print("selected"); }%>>None</option>
                      <option value="E" <%if (cusPort.getE01PRFSTM().equals("E")) { out.print("selected"); }%>>e-Mail</option>
                      <option value="F" <%if (cusPort.getE01PRFSTM().equals("F")) { out.print("selected"); }%>>Fax</option>
                      <option value="P" <%if (cusPort.getE01PRFSTM().equals("P")) { out.print("selected"); }%>>Printer</option>
                      <option value="B" <%if (cusPort.getE01PRFSTM().equals("B")) { out.print("selected"); }%>>Printer/e-Mail<option>
                    </select>
                  </div>
                </td>
              </tr>
			<TR>
				<TD nowrap width="34%" align="right">Confirmation Via :</TD>
				<TD nowrap><SELECT disabled name="E01PRFCNF">
					<OPTION value="N" <%if (cusPort.getE01PRFCNF().equals("N")) { out.print("selected"); }%>>None</OPTION>
					<OPTION value="E" <%if (cusPort.getE01PRFCNF().equals("E")) { out.print("selected"); }%>>e-Mail</OPTION>
					<OPTION value="F" <%if (cusPort.getE01PRFCNF().equals("F")) { out.print("selected"); }%>>Fax</OPTION>
					<OPTION value="P" <%if (cusPort.getE01PRFCNF().equals("P")) { out.print("selected"); }%>>Printer</OPTION>
                    <option value="B" <%if (cusPort.getE01PRFCNF().equals("B")) { out.print("selected"); }%>>Printer/e-Mail<option>
				</SELECT></TD>
			</TR></table>
          </td>
        </tr>
      </table>
      <h4>Additional Information </h4><table  class="tableinfo">
        <tr > 
          <td nowrap> 
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap colspan="2"> 
                  <div align="left">Comments :</div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap colspan=2 align=center> 
                  <input type="text" readonly  name="E01PRFCM1" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM1() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM2" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM2() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM3" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM3() %>">
                  <br>
                  <input type="text" readonly  name="E01PRFCM4" size="80" maxlength="80" value="<%= cusPort.getE01PRFCM4() %>">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2">The portfolio has been sucesfully created, if you 
        want add more information press <b>Continue</b>, otherwise , click on 
        <b>Finish</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Finish" onClick="finish()">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit2" value="Continue">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
</html>
