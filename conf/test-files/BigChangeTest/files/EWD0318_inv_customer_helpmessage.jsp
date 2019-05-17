<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head><title>Investments by Customer</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0318Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script language="javascript">
//<!-- Hide from old browsers
function enter(code1,code2,code3,code4,code5,code6,code7,code8,code9,code10,code11,code12,code13,code14,code15,code16) {

  if(top.opener.fieldAux1 !== ""){top.opener.document.forms[0][top.opener.fieldAux1].value = code1}
 
  if(top.opener.fieldAux2 !== ""){top.opener.document.forms[0][top.opener.fieldAux2].value = code2}
  
  if(top.opener.fieldAux3 !== ""){top.opener.document.forms[0][top.opener.fieldAux3].value = code3}
  
  if(top.opener.fieldAux4 !== ""){top.opener.document.forms[0][top.opener.fieldAux4].value = code4}
  
  if(top.opener.fieldAux5 !== ""){top.opener.document.forms[0][top.opener.fieldAux5].value = code5}
  
  if(top.opener.fieldAux6 !== ""){top.opener.document.forms[0][top.opener.fieldAux6].value = code6}
  
  if(top.opener.fieldAux7 !== ""){top.opener.document.forms[0][top.opener.fieldAux7].value = code7}
  
  if(top.opener.fieldAux8 !== ""){top.opener.document.forms[0][top.opener.fieldAux8].value = code8}
  
  if(top.opener.fieldAux9 !== ""){top.opener.document.forms[0][top.opener.fieldAux9].value = code9}
  
  if(top.opener.fieldAux10 !== ""){top.opener.document.forms[0][top.opener.fieldAux10].value = code10}
  
  if(top.opener.fieldAux11 !== ""){top.opener.document.forms[0][top.opener.fieldAux11].value = code11}
  
  if(top.opener.fieldAux12 !== ""){top.opener.document.forms[0][top.opener.fieldAux12].value = code12}
  
  if(top.opener.fieldAux13 !== ""){top.opener.document.forms[0][top.opener.fieldAux13].value = code13}
 
  if(top.opener.fieldAux14 !== ""){top.opener.document.forms[0][top.opener.fieldAux14].value = code14}
  
  if(top.opener.fieldAux15 !== ""){top.opener.document.forms[0][top.opener.fieldAux15].value = code15}
  
  if(top.opener.fieldAux16 !== ""){top.opener.document.forms[0][top.opener.fieldAux16].value = code16}
  
 
  
  top.close();
 }
//-->
</script>
</head>
<body>
<form>
<%
	if ( EWD0318Help.getNoResult() ) {
 %>
   		
<h4 align="center">&nbsp;</h4>
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
<div align="center">
  <h4>Investment Balance Inquiry by Customer</h4>
</div>
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Portfolio </th>
    <th> 
      <div align="center">Instrument </div>
    </th>
    <th>Custodian</th>
    <th> 
      <div align="center">CCY</div>
    </th>
    <th> 
      <div align="center">Nominal <br> Value </div>
    </th>
    <th> 
      <div align="center">Quantity </div>
    </th>
    <th> 
      <div align="center">Collateral <br> Amount </div>
    </th>
    <th> 
      <div align="center">Market <br> Price </div>
    </th>
    <th> 
      
  </tr>
  <%
              EWD0318Help.initRow();
                while (EWD0318Help.getNextRow()) {
                    if (EWD0318Help.getFlag().equals("")) {
                    		out.println(EWD0318Help.getRecord());
                    }
                }
    %> 
</TABLE>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0318Help.getShowPrev() ) {
      			int pos = EWD0318Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0318?Pos=" + pos +  "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0318Help.getShowNext() ) {
      			int pos = EWD0318Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0318?Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>

<%
   }  
%>
</form>
</body>
</html>