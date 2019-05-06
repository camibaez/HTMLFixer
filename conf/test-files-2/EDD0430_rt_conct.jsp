
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Concentración de Cuentas
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "EWDRAC") 
      	{
        		ok = true;
        		break;
      	}
      }
	 if ( ok || (op == 3) ) {
          document.forms[0].submit();
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
     }

  }
</SCRIPT>
</HEAD>


<BODY onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/e/new_over.gif','<%=request.getContextPath()%>/images/e/maintenance_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif')">

<h3 align="center">Accounts Relationship<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rt_conct.jsp,EDD0430"> 
  </h3>
  <hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430">
  <input TYPE=HIDDEN name="SCREEN" value="500">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<%
	if ( cifList.getNoResult() ) {
%>
 		
<TABLE class="tbenter" height=60% width="100%">
  <TR>      
    <TD> 
      <div align="center"> 
          <p><B>There is no match for your search criteria</B></p>
        <table class="tbenter" width="100%">
          <div align="center"></div>
          <tr> 
            <td align=CENTER > <a href="javascript:goAction(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image11" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" align="absmiddle" ></a> 
            </td>
            <td align=CENTER ><a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image51" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a> 
            </td>
          </tr>
        </table>
      </div>
    </TD>
  </TR>
</TABLE>
<%
	}
	else {
%> 
<BR> 
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap > 
              <input type="text" name="E02ACMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >               
              <div align="right"><b>Accout :</b></div>
            </td>
            <td nowrap > 
              <input type="text" name="E02ACMACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>">
            </td>
            <td nowrap> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02ACMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<TABLE class="tbenter">
 <TR>        
  <TD ALIGN=CENTER> 
    <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a>
  </TD>
  <TD ALIGN=CENTER>
  	<a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/maintenance_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/maintenance_over.gif" ></a>
  </TD>
  <TD ALIGN=CENTER>
    <a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
  </TD>
 </TR>
</TABLE>
<TABLE class="tableinfo">
	<TBODY>
		<TR id="trdark">
			<TH align="CENTER" nowrap>&nbsp;</TH>
			<TH align="CENTER" nowrap>Related <br>Account </TH>
			<TH align="CENTER" nowrap>Name</TH>
			
      <TH align="CENTER" nowrap>Currency</TH>
			<TH align="CENTER" nowrap>Maximum <br>Amount</TH>
			<TH align="CENTER" nowrap>Expiration <br> Date</TH>
		</TR>
		<%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %>
	</TBODY>
</TABLE>

<%
  }
%> 
</FORM>

</BODY>
</HTML>
