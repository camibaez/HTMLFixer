<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%-- jsf:pagecode language="java" location="/JavaSource/pagecode/pages/e/EDL0106_cp_inq_payments.java" --%><%-- /jsf:pagecode --%>
<html>
<head>
<title>Payment Schedule</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

 <SCRIPT Language="Javascript"> 
 
   builtNewMenu(cp_m_opt);
	
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
<P>`</P>
<h3 align="center">Payment Schedule Inquire<img 
src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_inq_payment.jsp, EDL0106"></h3>
<hr size="4">
 
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0106" >
  <input type=HIDDEN name="SCREEN" value="1000">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE" value="<%= userPO.getIdentifier()%>">
  <input type=HIDDEN name="PAYSECU" value="<%= userPO.getIdentifier1()%>">
  <!-- <input type=HIDDEN name="DATE1">
  <input type=HIDDEN name="DATE2">
  <input type=HIDDEN name="DATE3">   --> 

    
  



  
 <h4>Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="9%" >              
            <div align="left"> <%= userPO.getHeader1()%> </div>  
            </td>
            <td nowrap width="12%" > 
              <div align="right">Name :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= userPO.getHeader2()%> </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right">Deal Type :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= userPO.getHeader5()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right">Account :</div>
            </td>
            <td nowrap width="9%">
              <div align="left"> <%= userPO.getIdentifier().trim()%> </div>               
            </td>
            <td nowrap width="12%"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader3()%> </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Product :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> <%= userPO.getHeader4()%> </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 

  <%
	if ( cdList.getNoResult() ) {
 %>
<TABLE class="tbenter" width="100%" height="50%" >
    <tr>
      <TD > 
        <div align="center"> 
          <p><b>There is no payments defined at this time, please select one of 
            the following options </b></p>
          <table  class="tbenter" width=100% align=center>
            <tr >              
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

          
  
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
             <th align=CENTER nowrap >&nbsp;</th>   
            
            <th align=CENTER nowrap > 
              <div align="center">Type</div>
            </th>
            
            <th align=CENTER nowrap > 
              <div align="center">Date</div>
            </th>
            
            <th align=CENTER nowrap > 
              <div align="center">Sequence</div>
            </th>
                                                 
          </tr>
        </table>
        
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                cdList.initRow();
				int k=1;
                while (cdList.getNextRow()) {
                 
                  out.println(cdList.getRecord());
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
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>

<%}%>

 <p>
  
  </form>

</body>
</html>

