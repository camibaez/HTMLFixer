<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Projected Pay-Off</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqProj"  class= "datapro.eibs.beans.EDL016007Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function PrintPDF() {
  <%out.println("var mm = " + inqProj.getE07TRNVD1().trim() + ";");%>
  <%out.println("var dd = " + inqProj.getE07TRNVD2().trim() + ";");%>
  <%out.println("var yy = " + inqProj.getE07TRNVD3().trim() + ";");%>
  <%out.println("var tt = " + Util.takeComa(inqProj.getE07TRNTOT().trim()) + ";");%>
  <%out.println("var lf = " + Util.takeComa(inqProj.getE07TRNWHL().trim()) + ";");%>
  <%out.println("var mf = " + Util.takeComa(inqProj.getE07TRNREA().trim()) + ";");%>
  
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=22&E07TRNVD1=' + mm + '&E07TRNVD2=' + dd + '&E07TRNVD3=' + yy + '&E07TRNTOT=' + tt + '&E07TRNWHL=' + lf + '&E07TRNREA=' + mf,600,500,4);
  //CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=22&E07TRNVD1=' + mm + '&E07TRNVD2=' + dd + '&E07TRNVD3=' + yy + '&E07TRNWHL=' + lf + '&E07TRNREA=' + mf,600,500,4);
}

<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}
else  {
%>
	builtNewMenu(ln_i_2_opt);
<%   
}
%>

</SCRIPT>




</head>


<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 


<h3 align="center">Projected Pay-Off Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_inq_projected_payoff, EDL0160"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="21">
  <p></p>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E07DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E07CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E07DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E07DEAACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E07DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b> </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                
                </b> </div>
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%" > 
              <div align="right">Requested Pay-off Date :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07TRNVD1" size="3" maxlength="2" readonly value="<%= inqProj.getE07TRNVD1().trim()%>">
              <input type="text" name="E07TRNVD2" size="3" maxlength="2" readonly value="<%= inqProj.getE07TRNVD2().trim()%>">
              <input type="text" name="E07TRNVD3" size="3" maxlength="2" readonly value="<%= inqProj.getE07TRNVD3().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Projected Net Pay-off :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07TRNTOT" size="17" maxlength="16"  readonly value="<%= inqProj.getE07TRNTOT().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Current Net Pay-off :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07TRNAVL" size="17" maxlength="16"  readonly value="<%= inqProj.getE07TRNAVL().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Principal Balance :</div>
            </td>
            <td nowrapwidth="50%" > 
              <input type="text" name="E07DEAMEP" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEAMEP().trim()%>">
            </td>
		  </tr>
          <tr id="trdark">             
            <td nowrap width="50%"> 
              <div align="right">Accrued Interest :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07DEAMEI" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEAMEI().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Daily Factor :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07DEAREA" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEAREA().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Uncollected Late Charges :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07TRNPEN" size="17" maxlength="16"  readonly value="<%= inqProj.getE07TRNPEN().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Unapplied Funds (Partial/Early Payment) :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07DEATDA" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEATDA().trim()%>">
            </td>
         </tr>
          <tr id="trdark">
            <td nowrap width="50%"> 
              <div align="right">Loan Fees Due :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07TRNWHL" size="17" maxlength="16"  value="<%= inqProj.getE07TRNWHL().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%" > 
              <div align="right">Early Pay-off Fees :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07TRNADJ" size="17" maxlength="16"  readonly value="<%= inqProj.getE07TRNADJ().trim()%>">
            </td>
         </tr>
          <tr id="trdark">
            <td nowrap width="50%"> 
              <div align="right">Miscellaneous Fees :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07TRNREA" size="17" maxlength="16"  value="<%= inqProj.getE07TRNREA().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Escrow Balance :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07TRNTAX" size="17" maxlength="16"  readonly value="<%= inqProj.getE07TRNTAX().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"> 
              <div align="right">Projected Late Charge Date :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07DEAOD1" size="3" maxlength="2" readonly value="<%= inqProj.getE07DEAOD1().trim()%>">
              <input type="text" name="E07DEAOD2" size="3" maxlength="2" readonly value="<%= inqProj.getE07DEAOD2().trim()%>">
              <input type="text" name="E07DEAOD3" size="3" maxlength="2" readonly value="<%= inqProj.getE07DEAOD3().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Projected Late Charge Amount :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E07DEATAX" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEATAX().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="50%"> 
              <div align="right">Actual Rate :</div>
            </td>
            <td width="50%"> 
              <input type="text" name="E07DEARTE" size="17" maxlength="16"  readonly value="<%= inqProj.getE07DEARTE().trim()%>">
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>

  <p align="center">&nbsp;</p>
  <div align="center"> 
  	   <input id="EIBSBTN" type=button name="pdf" value="Print" OnClick="PrintPDF();">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>  
  </form>
</body>
</html>
