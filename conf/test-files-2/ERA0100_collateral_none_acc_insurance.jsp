<html>
<head>
<title>Collaterals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "collIns" class= "datapro.eibs.beans.ERA010003Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	var myhtml = 
			  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100?SCREEN=1>Basic Information </A> <BR>"+
			  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100?SCREEN=3>Collateral Detail </A> <BR>"+
			  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100?SCREEN=5>Insurance Policy of Collaterals</A> <BR>"+
           "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
	builtNewMenu(myhtml);

</SCRIPT>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Collateral Insurance Policy Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_inq_insurance.jsp, ERA0100"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <input type=HIDDEN name="BNKNUM" value="<%= collIns.getE03ROCBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Line Type: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getType().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
      <tr > 
        <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td width=12%> 
              <div align="right">Insurance : </div>
            </td>
            <td width=30%> 
              <div align="left">
                <input type="text" name="E03ROCICM" readonly size="37" maxlength="35" value="<%= collIns.getE03ROCICM().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">Number : </div>
            </td>
            <td width=33% nowrap> 
              <div align="left"> 
                <input type="text" name="E03ROCICN" readonly size="7" maxlength="5" value="<%= collIns.getE03ROCICN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=12%> 
              <div align="right">Description : </div>
            </td>
            <td width=30%> 
              <div align="left">
                <input type="text" name="E03ROCIPD" readonly size="32" maxlength="30" value="<%= collIns.getE03ROCIPD().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">Policy : </div>
            </td>
            <td width=33% nowrap> 
              <div align="left">
                <input type="text" name="E03ROCCIN" readonly size="14" maxlength="12" value="<%= collIns.getE03ROCCIN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=12%> 
              <div align="right">Currency : </div>
            </td>
            <td width=30%> 
              <div align="left">
                <input type="text" name="E03ROCICY" readonly size="5" maxlength="3" value="<%= collIns.getE03ROCICY().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">Issue Date: </div>
            </td>
            <td width=33% nowrap> 
              <div align="left">
                <input type="text" name="E03ROCEM1" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCEM1().trim()%>">
                <input type="text" name="E03ROCEM2" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCEM2().trim()%>">
                <input type="text" name="E03ROCEM3" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCEM3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=12%> 
              <div align="right">Policy Value: </div>
            </td>
            <td width=30%> 
              <div align="left"> 
                <input type="text" id="txtright" name="E03ROCIPA" readonly size="17" maxlength="15" value="<%= collIns.getE03ROCIPA().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">Maturity Date: </div>
            </td>
            <td width=33% nowrap> 
              <div align="left"> 
                <input type="text" name="E03ROCMD1" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCMD1().trim()%>">
                <input type="text" name="E03ROCMD2" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCMD2().trim()%>">
                <input type="text" name="E03ROCMD3" readonly size="4" maxlength="2" value="<%= collIns.getE03ROCMD3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=12%> 
              <div align="right">Exception : </div>
            </td>
            <td width=30%> 
              <div align="left">
                <input type="text" name="E03ROCRGK" readonly size="3" maxlength="1" value="<%= collIns.getE03ROCRGK().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">Maturity Advice: </div>
            </td>
            <td width=33%> 
              <div align="left"> 
                <input type="text" name="E03ROCCLF" readonly size="3" maxlength="1" value="<%= collIns.getE03ROCCLF().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=12%> 
              <div align="right">Issue by: </div>
            </td>
            <td width=30%> 
              <div align="left">
                <input type="text" name="E03ROCEMB" readonly size="6" maxlength="4" value="<%= collIns.getE03ROCEMB().trim()%>">
              </div>
            </td>
            <td width=25%> 
              <div align="right">User Code: </div>
            </td>
            <td width=33% nowrap> 
              <div align="left"> 
                <input type="text" name="E03ROCUSC" readonly size="6" maxlength="4" value="<%= collIns.getE03ROCUSC().trim()%>">
              </div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>

  
</form>
</body>
</html>

