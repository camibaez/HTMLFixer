<html>
<head>
<title>Document Tables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDI010Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function valTableNum(){
  var tab=document.forms[0].TABLEN.value;
  if (tab == '' || tab == 0){
    alert("Table number can not be blank or zero");
    return false;
  }
  else 
    return true;  
}

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 
}

function goAction(op) {

	document.forms[0].opt.value = op;
	
	if (op == 1 ){
	  if(valTableNum())
	    document.forms[0].submit();
	}
	else
	  document.forms[0].submit();  
  
}


function getParams(code) {

    document.forms[0].TABLE.value = code;
    
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Document Tables</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDI010"  >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  
<input type=HIDDEN name="TABLE" >
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Table Number :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="TABLEN" size="4" maxlength="2">       
        </div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Descripción :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="DESCRIPTION" size="35" maxlength="35">       
        </div>
      </td>
    </tr>

	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Code :</div>
      </td>
      <td align=CENTER width="34%"> 
          <div align="left"> 
            <select name="CODE">
			  <option value=""></option>
              <option value="A">Corporate Account</option>
              <option value="B">Personal Account</option>
              <option value="C">Corporate Customer</option>
              <option value="P">Personal Customer</option>
              <option value="F">Fixed Assets</option>
            </select>
          </div>
      </td>
    </tr>

   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1)"> 
   </TD>
   
   </tr>
 </TABLE>
</div>




  <%
	if ( EDI010Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>New</b></a></div>
              </td>
              <td class=TDBKG>
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

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Table</div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center">Code</div>
            </th>
            <th align=CENTER nowrap width="40%"> 
              <div align="center">Description</div>
            </th>
          </tr>
          		<%
                EDI010Help.initRow();
				int k=1;
                while (EDI010Help.getNextRow()) {
                 
                  out.println(EDI010Help.getRecord());
                  k++;   
                }
              %> 
          
        </table>
    </table>
     
  <%}%>
<SCRIPT language="JavaScript">
  
  showChecked("ACCNUM");
  
</SCRIPT>
  
</form>

</body>
</html>
