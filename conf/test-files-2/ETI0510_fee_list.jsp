<html>
<head>
<title>Estructura de Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "ETI0510Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
function closeEnter(){
      document.getElementById("enterFee").style.visibility = "hidden";
}
function ShowEnterCod(evt) {
	 var event = getEvent(evt);	
	 var y = event.clientY + document.body.scrollTop;
     var x = event.clientX + document.body.scrollLeft;
     cancelEvent(event);
	 document.getElementById("enterFee").style.pixelTop = y;
	 document.getElementById("enterFee").style.pixelLeft = x;
	 document.getElementById("enterFee").style.visibility = "visible";
}
function goAction(op,bnew) {
	if (bnew) {
		document.forms[0].TBL.value = document.forms[0].TBL1.value;
		document.forms[0].FCY.value = document.forms[0].FCY1.value;
		document.forms[0].CII.value = document.forms[0].CII1.value;
	}
	document.forms[0].opt.value = op;
	if (op == 3) {
		if (confirm('Are you sure you want to delete this Record')) {
			document.forms[0].submit();
		}	
	} else {
		document.forms[0].submit();
	}
}

function cancelBub(evt) {
	var evt = getEvent(evt);
	evt.cancelBubble = true;
}

function getParams(fcy, tbl, cii) {
	document.forms[0].FCY.value = fcy;
	document.forms[0].TBL.value = tbl;
	document.forms[0].CII.value = cii;
}
document.onclick = closeEnter;
</SCRIPT>  
</head>
<BODY>
<h3 align="center">Structure of Commissions</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSETI0510" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="BNK" value="<%=userPO.getBank()%>">
  <input type=HIDDEN name="TBL" value="">
  <input type=HIDDEN name="FCY" value="">
  <input type=HIDDEN name="CII" value="">
  <div id="enterFee" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub(event)"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Commission Structure :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TBL1" size="3" maxlength="2" value="">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Currency :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="FCY1" size="4" maxlength="3" value="">
	        	<a href="javascript:GetCurrency('FCY1','')">
	        		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Teller Transaction Code :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="CII1" size="5" maxlength="4" value="">
          </div>
        </td>
      </tr>
       <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1,true)">
        </td>
      </tr>
    </table>
  </div>
  <%
	if ( ETI0510Help.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>Your search criteria does not exist in files.</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
           <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="ShowEnterCod(event)"><a><b>New</b></a></div>
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
   	  <td class=TDBKG width="25%">
        <div align="center" style="cursor:hand" onClick="ShowEnterCod(event)"><a><b>New</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2, false)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3, false)"><b>Delete</b></a></div>
      </td>      
      <td class=TDBKG width="25%"> 
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
            <th align=CENTER nowrap width="10%">Bank</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Structure of Commissions</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Currency</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Teller Transaction Code</div>
            </th>
            <th align=CENTER nowrap width="60%">Description</th>
          </tr>
          <%
                ETI0510Help.initRow();
                while (ETI0510Help.getNextRow()) {
                  out.println(ETI0510Help.getRecord());
                }
              %>
        </table>
    </table>
  <%}%>

</form>
<script type="text/javascript">
	showChecked("ACCNUM");
</script>
</body>
</html>