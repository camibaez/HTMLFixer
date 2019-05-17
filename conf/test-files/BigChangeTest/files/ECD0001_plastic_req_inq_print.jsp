<html> 
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function doPrint(){
	if(!window.print){
       var msg ="Update your navigator to print";
	   alert(msg);
	   return;
	}
	
    window.focus();
	window.print();

	return;
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Card Request<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="plastic_dist_recep_inq_list.jsp, ECD0002"></h3>
<hr size="4">
<FORM>
  
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Request # :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRNUM" size="15" maxlength="13" readonly value="<%= userPO.getHeader1() %>">
			  </div>
            </td>
            <td nowrap width="16%" > 
            </td>
            <td nowrap width="20%" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Source Branch :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRBRN" size="5" maxlength="4" readonly value="<%= userPO.getHeader2() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Destiny Branch :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E02CDRBRD" size="5" maxlength="4" readonly value="<%= userPO.getHeader3() %>">
                 </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Send Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CDRDAY" size="2" maxlength="2" readonly value="<%= userPO.getHeader4() %>">
                <input type="text" name="E02CDRMON" size="2" maxlength="2" readonly value="<%= userPO.getHeader5() %>">
                <input type="text" name="E02CDRYEA" size="4" maxlength="4" readonly value="<%= userPO.getHeader6() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Receipt Date :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRDAR" size="2" maxlength="2" readonly value="<%= userPO.getHeader7() %>">
                <input type="text" name="E02CDRMOR" size="2" maxlength="2" readonly value="<%= userPO.getHeader8() %>">
                <input type="text" name="E02CDRYER" size="4" maxlength="4" readonly value="<%= userPO.getHeader9() %>">
			  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <%
	if ( appList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There are not results</b></p>
	  </div>
	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> 
 
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="20%"><div align="center">Card Number</div></th>
            <th align=CENTER nowrap width="20%"><div align="center"> Receipt User</div></th>
            <th align=CENTER nowrap width="10%">Status</th>
			<th align=CENTER nowrap width="60%">Notes</th>
          </tr>
     	<%
        appList.initRow(); 
        while (appList.getNextRow()) {
           datapro.eibs.beans.ECD000101Message msgPart = (datapro.eibs.beans.ECD000101Message) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDRINI())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDRUSR())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDRSTD())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02CDROBS())%></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
     
  <%}%>

<script language="JavaScript">
	doPrint();
</SCRIPT>
</form>

</body>
</html>
