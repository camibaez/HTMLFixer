<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Control de Promociones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0017DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Promotions Control<BR>New<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="promotions_new.jsp, ECD0017"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECD0017" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Promotion Code : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPCOD" size="5" maxlength="4" value="<%= msgCD.getE01CDPCOD() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Description : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPDSC" size="36" maxlength="35" value="<%= msgCD.getE01CDPDSC() %>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Initial Date : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="hidden" name="E01CDPINI" size="6" value="">
                <input type="text" name="E01CDPIN1" size="3" maxlength="2" value="">
                <input type="text" name="E01CDPIN2" size="3" maxlength="2" value="">
                <input type="text" name="E01CDPIN3" size="3" maxlength="2" value="">
                <a href="javascript:DatePicker(document.forms[0].E01CDPIN1, document.forms[0].E01CDPIN2, document.forms[0].E01CDPIN3)">
                <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Card Type : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="hidden" name="E01CDPTPL" size="2" value="">
                <input type="text" name="E01CDPNPL" size="36" maxlength="35" value="<%= msgCD.getE01CDPNPL() %>">
				<A href="javascript:GetDescATMCard('E01CDPTPL','E01CDPNPL','D ')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0"></A>
              </div>
            </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Final Date : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="hidden" name="E01CDPFIN" size="6" value="">
                <input type="text" name="E01CDPFI1" size="3" maxlength="2" value="">
                <input type="text" name="E01CDPFI2" size="3" maxlength="2" value="">
                <input type="text" name="E01CDPFI3" size="3" maxlength="2" value="">
                <a href="javascript:DatePicker(document.forms[0].E01CDPFI1, document.forms[0].E01CDPFI2, document.forms[0].E01CDPFI3)">
                <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Points Amount : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPPTO" size="7" maxlength="6" value="<%= msgCD.getE01CDPPTO() %>">
                por cada
                <input type="text" name="E01CDPMTO" size="18" maxlength="17" value="<%= msgCD.getE01CDPMTO() %>" onKeyPress="enterDecimal()">
				<%= msgCD.getE01CDPCCY() %>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">User : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPUSR" size="11" maxlength="10" value="<%= currUser.getH01USR() %>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
            </td>
            <td nowrap width="20%" > 
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
