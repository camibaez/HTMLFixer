<html>
<head>
<title>Consulta de Excepciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="excDetails" class="datapro.eibs.beans.ELD010003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   
  
   
%>
<H3 align="center">Exceptions Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_money, EDD0000"></H3>
<hr size="4">
<form method="post" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  </p>
  
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
                <input type="text" name="E01LDMCUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E0CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E01LDMACC" size="12" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E01LDMPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Year :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E03LDEBDY" size="5" maxlength="4" value="<%= excDetails.getE03LDEBDY()%>">
                <font face="Arial"><font face="Arial"><font size="2"> </font></font></font></div>
            </td>
          </tr>


          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Month :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E03LDEBDM" size="3" maxlength="2" value="<%= excDetails.getE03LDEBDM()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Sequence :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E03LDESEQ" size="3" maxlength="2" value="<%= excDetails.getE03LDESEQ()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Exception Type :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E03LDETPY" size="35" maxlength="30" value="<%= excDetails.getE03LDETPY()%>">
                <font face="Arial"><font face="Arial"><font size="2"> </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E03LDERM1" size="40" maxlength="35" value="<%= excDetails.getE03LDERM1()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E03LDERM2" size="40" maxlength="35" value="<%= excDetails.getE03LDERM2()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <input type="text" name="E03LDERM3" size="40" maxlength="35" value="<%= excDetails.getE03LDERM3()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
