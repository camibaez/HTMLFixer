<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESWF0200Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">
  function goAction(op) {

		  if(document.forms[0].dealer.value == '' && op==2){
             alert("A valid transaction must be selected"); 
             return; 
          }
         
        if(op==1){
		 document.forms[0].opt.value = 1;
        }  
		else if(op==2){
		 document.forms[0].opt.value = 2;
        }  
		if(op==3){
		 document.forms[0].opt.value = 3;
        }  
		document.forms[0].submit();

  }

</SCRIPT>  

<script language="JavaScript">
  function getValor(Reference,Dealer,Type) {

    document.forms[0].ref.value = Reference;
	document.forms[0].dealer.value = Dealer;
	document.forms[0].typ.value = Type;
    
  }

</SCRIPT>
</head>

<BODY onLoad="">
<h3 align="center">Free Formats List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_position.jsp,ECIF010"></h3>
<hr size="4">
<%
	if ( ESWF0200Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
  <form>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
    
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="opt">
  <input type=HIDDEN name="REFERENCE">
  <input type=HIDDEN name="FORMAT">
  <input type=HIDDEN name="USERID">
  <input type=HIDDEN name="totalRow" value="0">
  <p> 
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
           
            <th align=CENTER nowrap >Format</th>
            <th align=CENTER nowrap > 
              <div align="center">Swift ID</div>
            </th>
            <th align=CENTER nowrap >Reference</th>
            <th align=CENTER nowrap > 
              <div align="center">Date</div>
            </th>
            <th align=CENTER nowrap >User ID</th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                ESWF0200Help.initRow();
				int k=1;
				String USERSWIFT = (String)session.getAttribute("USERSWIFT");
				String SWIFTID = (String)session.getAttribute("SWIFTID");
				String DATE1 = (String)session.getAttribute("DATE1");
				String DATE2 = (String)session.getAttribute("DATE2");
				String DATE3 = (String)session.getAttribute("DATE3");
				String FORMAT = (String)session.getAttribute("FORMAT");
				String REFERENCE = (String)session.getAttribute("REFERENCE");
				
				
                while (ESWF0200Help.getNextRow()) {
                 
                  out.println(ESWF0200Help.getRecord());
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
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ESWF0200Help.getShowPrev() ) {
      			int pos =ESWF0200Help.getFirstRec() - 101;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSESWF0200?USERSWIFT=" + USERSWIFT + "&FromRecord=" + pos + "&SWIFTID=" + SWIFTID + "&DATE1=" + DATE1 + "&DATE2=" + DATE2 + "&DATE3=" + DATE3 + "&FORMAT=" + FORMAT + "&REFERENCE=" + REFERENCE + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ESWF0200Help.getShowNext() ) {
      			int pos = ESWF0200Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSESWF0200?USERSWIFT=" + USERSWIFT + "&FromRecord=" + pos + "&SWIFTID=" + SWIFTID + "&DATE1=" + DATE1 + "&DATE2=" + DATE2 + "&DATE3=" + DATE3 + "&FORMAT=" + FORMAT + "&REFERENCE=" + REFERENCE + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
  </form>
<%}%>
</body>
</html>
