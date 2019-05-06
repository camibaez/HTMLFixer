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
<h3 align="center">Promotions Control<BR>Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="promotions_inq.jsp, ECD0017"> 
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
                <input type="text" name="E01CDPCOD" size="5" maxlength="4" value="<%= msgCD.getE01CDPCOD() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Description : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPDSC" size="36" maxlength="35" value="<%= msgCD.getE01CDPDSC() %>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Initial Date : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="hidden" name="E01CDPINI" size="6" value="<%= msgCD.getE01CDPINI() %>">
                <input type="text" name="E01CDPIN1" size="3" maxlength="2" value="<%= msgCD.getE01CDPINI().substring(3,5) %>" readonly>
                <input type="text" name="E01CDPIN2" size="3" maxlength="2" value="<%= msgCD.getE01CDPINI().substring(1,3) %>" readonly>
                <input type="text" name="E01CDPIN3" size="3" maxlength="2" value="<%= msgCD.getE01CDPINI().substring(0,1) %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Card Type : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="hidden" name="E01CDPTPL" size="2" value="<%= msgCD.getE01CDPTPL() %>">
                <input type="text" name="E01CDPNPL" size="36" maxlength="35" value="<%= msgCD.getE01CDPNPL() %>" readonly>
              </div>
            </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"> Final Date : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="hidden" name="E01CDPFIN" size="6" value="<%= msgCD.getE01CDPFIN() %>">
                <input type="text" name="E01CDPFI1" size="3" maxlength="2" value="<%= msgCD.getE01CDPFIN().substring(3,5) %>" readonly>
                <input type="text" name="E01CDPFI2" size="3" maxlength="2" value="<%= msgCD.getE01CDPFIN().substring(1,3) %>" readonly>
                <input type="text" name="E01CDPFI3" size="3" maxlength="2" value="<%= msgCD.getE01CDPFIN().substring(0,1) %>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Points Amount : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CDPPTO" size="7" maxlength="6" value="<%= msgCD.getE01CDPPTO() %>" readonly>
                por cada
                <input type="text" name="E01CDPMTO" size="18" maxlength="17" value="<%= msgCD.getE01CDPMTO() %>" onKeyPress="enterDecimal()" readonly>
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
                <input type="text" name="E01CDPUSR" size="11" maxlength="10" value="<%= msgCD.getE01CDPUSR() %>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
            </td>
            <td nowrap width="20%" > 
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Record Date : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="hidden" name="E01CDPFEC" size="6" value="<%= msgCD.getE01CDPFEC() %>">
                <input type="text" name="E01CDPFE1" size="3" maxlength="2" value="<%= msgCD.getE01CDPFEC().substring(3,5) %>" readonly>
                <input type="text" name="E01CDPFE2" size="3" maxlength="2" value="<%= msgCD.getE01CDPFEC().substring(1,3) %>" readonly>
                <input type="text" name="E01CDPFE3" size="3" maxlength="2" value="<%= msgCD.getE01CDPFEC().substring(0,1) %>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Record Time : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="hidden" name="E01CDPHOR" size="6" value="<%= msgCD.getE01CDPHOR() %>">
                <input type="text" name="E01CDPHO1" size="3" maxlength="2" value="<%= msgCD.getE01CDPHOR().substring(0,2) %>" readonly>:
                <input type="text" name="E01CDPHO2" size="3" maxlength="2" value="<%= msgCD.getE01CDPHOR().substring(2,4) %>" readonly>:
                <input type="text" name="E01CDPHO3" size="3" maxlength="2" value="<%= msgCD.getE01CDPHOR().substring(4,6) %>" readonly>
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
