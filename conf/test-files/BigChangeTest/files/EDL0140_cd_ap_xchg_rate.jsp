<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Change Rate</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdRate" class= "datapro.eibs.beans.EDL013006Message"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  
   <% 
    if (userPO.getOption().equals("CD_TREASURY") && userPO.getHeader16().equals("N")) {  
   %>
		builtNewMenu(cdt_a_act_opt);
  <%      
   }
    else if (userPO.getOption().equals("CD_TREASURY") && (!userPO.getHeader16().equals("N"))) {
   %>
		builtNewMenu(cdt_a_opt);
   <%
   }
    else if (!userPO.getOption().equals("CD_TREASURY")) {
   %>
		builtNewMenu(cd_a_opt);
   <%
   }
   %>


</SCRIPT>


</head>




<body nowrap>



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 
%>

<h3 align="center">Rate Change<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_ap__xchg_rate.jsp, EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E06DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E06CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06DEAACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E06DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Rates</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="39%"> 
              <div align="right">Current Rate :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E06OLDRTE" size="15" maxlength="15" value="<%= cdRate.getE06OLDRTE().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%"> 
              <div align="right">New Rate :</div>
            </td>
            <td width="61%"> 
              <input type="text" name="E06NEWRTE" size="15" maxlength="15" value="<%= cdRate.getE06NEWRTE().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="39%" > 
              <div align="right">Value Date :</div>
            </td>
            <td width="61%">
              <input type="text" name="E06TRNVD1" size="2" maxlength="2" value="<%= cdRate.getE06TRNVD1().trim()%>">
              <input type="text" name="E06TRNVD2" size="2" maxlength="2" value="<%= cdRate.getE06TRNVD2().trim()%>">
              <input type="text" name="E06TRNVD3" size="2" maxlength="2" value="<%= cdRate.getE06TRNVD3().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="39%" > 
              <div align="right">Narrative :</div>
            </td>
            <td width="61%" > 
              <input type="text" name="E06DEANR1" size="30" maxlength="30" value="<%= cdRate.getE06DEANR1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="39%"> 
              <div align="right"></div>
            </td>
            <td width="61%"> 
              <input type="text" name="E06DEANR2" size="30" maxlength="30" value="<%= cdRate.getE06DEANR2().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>