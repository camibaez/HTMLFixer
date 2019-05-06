<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Currency Rates</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0328Help" class= "datapro.eibs.beans.JBList" scope="session"/>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>
<body>
<form>
  <div align="center"> 
    <center>
      <h3 align="center">Currency Rates Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="currency_help.jsp,ewd0328F"> 
      </h3>
      <hr size="4">
      <h4>
        <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
        <%
	if ( ewd0328Help.getNoResult() ) {
 %> </h4>
      </center> 
    </div>
  <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
        <TABLE id="headTable" >
          <TR id="trdark"> 
            <th nowrap rowspan="2">Currency</th>
            <th nowrap rowspan="2">Description</th>
            <th nowrap rowspan="2">Exchange <BR>
              Rate</th>
            <th nowrap rowspan="2">Rate <BR>
              Tolerance</th>
            <th nowrap rowspan="2">Mult. /<BR>
              Div.</th>
            <th nowrap rowspan="2">Base<BR>
              Days</th>
            <th nowrap colspan="2">C. Value Rate</th>
            <th nowrap colspan="2">Fx. Rate</th>
            <th nowrap colspan="10">Future Exchange Rate</th>
          </tr>
          <TR id="trdark"> 
            <th nowrap>Purchase</th>
            <th nowrap>Sale</th>
            <th nowrap>Purchase</th>
            <th nowrap>Sale</th>
            <th nowrap>07<br>
              Days</th>
            <th nowrap>15<br>
              Days</th>
            <th nowrap>30<br>
              Days</th>
            <th nowrap>60<br>
              Days</th>
            <th nowrap>90<br>
              Days</th>
            <th nowrap>120<br>
              Days</th>
            <th nowrap>150<br>
              Days</th>
            <th nowrap>180<br>
              Days</th>
            <th nowrap>270<br>
              Days</th>
            <th nowrap>1<br>
              Year</th>
          </tr>
        </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >		
<%
                ewd0328Help.initRow();
		  int i=0;
                while (ewd0328Help.getNextRow()) {
                    if (ewd0328Help.getFlag().equals("")) {
                    		out.println(ewd0328Help.getRecord());
				i++;
                    }

                }
    %> 

  </table>
   </div>
   </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= i %>";
     divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);     
</SCRIPT>
<%
   }
%>
</form>
</body>
</html>			
