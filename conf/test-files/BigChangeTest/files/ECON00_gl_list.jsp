<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>General Ledger</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ECON0001Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<script language="JavaScript">



function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(bnk1,ccy1,gln1,bnk2,ccy2,gln2,seq) {

    document.forms[0].BNK1.value = bnk1;
    document.forms[0].CCY1.value = ccy1;
	document.forms[0].GLN1.value = gln1;
    document.forms[0].BNK2.value = bnk2;
    document.forms[0].CCY2.value = ccy2;
	document.forms[0].GLN2.value = gln2;
	document.forms[0].SEQ.value  = seq;

    
}



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Accounts to be Eliminated from the Consolidated Staments</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSECON00" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="BNK1">
  <input type=HIDDEN name="CCY1">
  <input type=HIDDEN name="GLN1">
  <input type=HIDDEN name="BNK2">
  <input type=HIDDEN name="CCY2">
  <input type=HIDDEN name="GLN2">
  <input type=HIDDEN name="SEQ">

  <h4>
    <%
	if ( ECON0001Help.getNoResult() ) {
 %>
  </h4>
  <TABLE class="tbenter" width="100%" height="50%" >
    <tr>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table  class="tbenter" width=100% align=center>
            <tr > 
              <td class=TDBKG width="29%" > 
                <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="37%" > 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
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
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<p> 

          
  <table class="tbenter" align=center>
    <tr> 
      <td class=TDBKG > 
        <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(3)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Bank</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Currency</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">General <br>
                Ledger</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Bank</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Currency</div>
            </th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">General <br>
                Ledger</div>
            </th>
			<th align=CENTER nowrap width="15%"> 
              <div align="center">Sequence</div>
            </th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                ECON0001Help.initRow();
				int k=1;
                while (ECON0001Help.getNextRow()) {
                 
                  out.println(ECON0001Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     

     
</SCRIPT>
  <%}%>
</form>

</body>
</html>
