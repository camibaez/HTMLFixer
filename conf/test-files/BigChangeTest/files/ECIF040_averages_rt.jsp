<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Averages</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="aveBean" class="datapro.eibs.beans.JBAverage"  scope="session" />

<jsp:useBean id="header" class= "datapro.eibs.beans.ECIF04002Message"   scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function showGraph()
{
	var pg = "<%=request.getContextPath()%>/pages/e/ECIF040_averages_rt_graph.jsp";
	CenterNamedWindow(pg,'graph',700,560,2);
}

<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	builtNewMenu(cd_i_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>

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

<%
}
%>

<%
}
%>
</SCRIPT>

</head>

<body>
<%@ page import = "datapro.eibs.master.Util" %>

<%
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");}
%> 

<h3 align="center">Averages<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="averages_rt.jsp,ECIF040"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
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
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= header.getE02CUSNUM().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= header.getE02CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="12" readonly maxlength="12" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= header.getE02CCYCDE().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= header.getE02ACCTYP().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Averages</h4>
  <table width="100%" border="0" cellspacing="2" cellpadding="0" id="tbhelp">
    <tr> 
      <td width="12%" nowrap>View Graphics</td>
      <td width="88%"><a href="javascript:showGraph()"><img src="<%=request.getContextPath()%>/images/graphic1.gif" border="0" width="32" height="32"></a></td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td width="17%"> 
              <div align="center"><b>Month</b></div>
            </td>
            <td width="43%"> 
              <div align="center"><b>Year : <%= aveBean.getCurrYear() %></b></div>
            </td>
            <td width="40%"> 
              <div align="center"><b>Year : <%= aveBean.getPrevYear() %></b></div>
            </td>
          </tr>
        </table>
		
        <table cellspacing=0 cellpadding=2 width="100%" border="1">
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="center"></div>
            </td>
            <td nowrap width="22%"> 
              <div align="center"> Monthly Average</div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Quarterly Average</div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Monthly Average</div>
            </td>
            <td nowrap width="22%"> 
              <div align="center">Quaterly Average</div>
            </td>
          </tr>
          <tr>
            <td id="trdark" nowrap width="18%"> 
              <div align="right">January : </div>
            </td>
            <td id="trclear" nowrap width="22%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(0)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYear3MAve(0)) %></div>
            </td>
            <td id="trclear" nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(0)) %></div>
            </td>
            <td id="trdark" nowrap rowspan="3" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYear3MAve(0)) %></div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="23"> 
              <div align="right">February : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(1)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="23">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(1)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">March : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(2)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(2)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">April : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(3)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYear3MAve(1)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(3)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYear3MAve(1)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">May : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(4)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(4)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">June : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(5)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(5)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="26"> 
              <div align="right">July : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="26"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(6)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYear3MAve(2)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="26"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(6)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYear3MAve(2)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">August : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(7)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(7)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">September : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(8)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(8)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">October : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(9)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYear3MAve(3)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(9)) %> </div>
            </td>
            <td id="trdark" nowrap rowspan="3" height="57" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYear3MAve(3)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">November : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(10)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(10)) %> </div>
            </td>
          </tr>
          <tr> 
            <td id="trdark" nowrap width="18%" height="19"> 
              <div align="right">December : </div>
            </td>
            <td id="trclear" nowrap width="22%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(aveBean.getCurrYearMAve(11)) %> </div>
            </td>
            <td id="trclear" nowrap width="20%" height="19">
              <div align="right"><%= Util.fcolorCCY(aveBean.getPrevYearMAve(11)) %> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
