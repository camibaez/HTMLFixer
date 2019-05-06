<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Classification Table of Modules</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
</head>
<BODY>
<%
	 trans.initRow();
    int blank_row = Integer.parseInt(transData.getTrNum());
    int max_row = 9999;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans.getLastRow()) ) {
      total_row = trans.getLastRow() + 1 + blank_row;
    }
    else {
		total_row = row;       
    }
%> 

<script language="JavaScript">

function getParams(currrow,cacti,dacti) {
	document.forms[0].CURRENTROW.value = currrow;
}

function submitThis(option) {
  var okdel = false;
  document.forms[0].opt.value = option;
  document.forms[0].SCREEN.value="2";
  if ( option==4) { 
    okdel = confirm("This Option Deletes All Batch Transactions");
    if ( okdel ) { document.forms[0].submit();}
  } 
  else if ( option==1) {
     okdel = confirm("This option deletes the selected transactions");
      if ( okdel ) { document.forms[0].submit();	}
    } else { document.forms[0].submit();}
 }

function checkRowValue() {
  var r = <%= total_row %> + parseInt(document.forms[0].TEMP_ROW.value);
  if (r > <%= max_row %>) {
    alert("Value out of range records. Max number is 9999");
  }
  else {
    document.forms[0].ROW.value = r + "";
  }
}

</SCRIPT>  

<h3 align="center">Classification Table of Modules</h3>
<h3 align="center">
<% if (userPO.getHeader2().trim().equals("1")) {;
%>
Legal
<% }; %>
<% if (userPO.getHeader2().trim().equals("2")) {;
%>
Person
<% }; %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="modules_list,EDP0820"></h3>

<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0820" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt">
    <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%= total_row %>">
    <INPUT TYPE=HIDDEN NAME="E01MODLGT" VALUE="<%= userPO.getHeader2().trim() %>">
  </p>
  <p> 
<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
  
  <table class="tbenter" width=100% align=center>
    <tr> 
    <td class=TDBKG width="20%">
        <div align="center">
        <a href="javascript:submitThis(7)"><b>Submit</b></a>
        </div> 
    </td> 
	 <td class=TDBKG width="20%"> 
        <a href="javascript:submitThis(1)">Delete Selection</a>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  
  
  <table  id=mainTable class="tableinfo">
    <tr > 
     <td NOWRAP > 
   <TABLE id="headTable" NOWRAP>
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap > <div align="center">Code</div> </th>
            <th align=CENTER nowrap >Description</th>
            <th align=CENTER nowrap > <div align="center">Percentaje
              <input type=TEXT name="T01MODPER" size=10 maxlength=9 value="<%= userPO.getHeader1().trim() %>" readonly >
            </div> </th>
           </tr>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" NOWRAP>
    <%
		int i = 0;
    %> 

    <table id="dataTable" NOWRAP> 

          <%
	 			trans.initRow();
                while (trans.getNextRow()) {
		 %>
          <tr> 
	        <td align="center" nowrap > 
		        <input type="checkbox" name="TRANSROW_<%= trans.getCurrentRow() %>"  value="checked">
            </td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01MODCOD_<%= trans.getCurrentRow() %>"  size="4" maxlength="4"  value="<%= trans.getRecord(1) %>" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" onkeypress=enterInteger() > 
      		</td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01MODDSC_<%= trans.getCurrentRow() %>"  size="40" maxlength="40"  value="<%= trans.getRecord(2) %>" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" > 
      		</td>
	      	<td align="center" nowrap >  
    	      <input type="text" name="E01MODPER_<%= trans.getCurrentRow() %>"  size="10" maxlength="9"  value="<%= trans.getRecord(3) %>" onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')" onkeypress=enterDecimal() > 
      		</td>
          </tr>
    <%
                }
			for ( i=trans.getRow(); i < trans.getCurrentRow() + 10 ; i++) {
    %> 
          <tr> 
		    <td align="center" nowrap  > 
		        <input type="checkbox" name="TRANSROW_<%= i %>"  value="checked">
            </td>
	      	<td align="center" nowrap  >  
    	      <input type="text" name="E01MODCOD_<%= i %>"  size="4" maxlength="4" onkeypress=enterInteger() > 
      		</td>
	      	<td align="center" nowrap  >  
    	      <input type="text" name="E01MODDSC_<%= i %>" size="40" maxlength="40" > 
      		</td>
	      	<td align="center" nowrap  >  
    	      <input type="text" name="E01MODPER_<%= i %>"  size="10" maxlength="9" onkeypress=enterDecimal()> 
      		</td>
          </tr>
    <%
                }
    %> 
         </table>
    <input type="HIDDEN" name="RECNUM" value="<%=i%>">
  </TD>
  </TR>	
  </table>
  <BR>
  <table class="tbenter" width="100%" >
    <tr> 
<%--
      <td align="right" nowrap width="20%"  >Total Registros 
        :</td>
      <td align="right" nowrap width="20%" > 
        <div align="left"> 
          <input type="text" name="ROW" size="5" maxlength="5" id="txtright" readonly value="<%= i+1 %>">
--%>
      <td align="right" nowrap > 
	    <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= i+1 %>">
      </td>
<%--
        </div>
      </td>
--%>
<%--
      <td   width="60%"> 
        <div align="right">Cantidad de Registros a A&ntilde;adir : 
          <input type="text" name="TEMP_ROW" size="4" maxlength="4" value="0" onKeypress="enterInteger()" onBlur="checkRowValue()">
        </div>
      </td>
      <td bordercolor="#FFFFFF"  class="TDBKG" width="8%"><a href="javascript:submitThis(3)">Adicionar</a></td>
--%>
    </tr>
  </table>


 <SCRIPT language="JavaScript">

 showChecked("CURRCODE");
     function resizeDoc() {
       	divResize();
     	adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>