<html>
<head>
<title>Paying and Receiving Fee Structure</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD0660Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/graphical.js"> </SCRIPT>

<script language="JavaScript">

function closeEnter(){
	setVisibility(document.getElementById('enterFee'), "hidden");
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterFee.style.pixelTop=' + y);
     eval('enterFee.style.pixelLeft=' + x);
     setVisibility(document.getElementById('enterFee'), "visible");	 
}


function goAction(op,bnew) {

	if (bnew == true) {
		document.forms[0].TBL.value = document.forms[0].TBL1.value;
		document.forms[0].CUN.value = document.forms[0].CUN1.value;
		document.forms[0].TYP.value = document.forms[0].TYP1.value;
	}
	
	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(fcy, tbl, cun, typ) {

	document.forms[0].FCY.value = fcy;
	document.forms[0].TBL.value = tbl;
	document.forms[0].CUN.value = cun;
	document.forms[0].TYP.value = typ;
    
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Paying and Receiving Fee Structure<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fee_list.jsp, EDD0660"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0660" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="BNK" value="<%=userPO.getBank()%>">
  <input type=HIDDEN name="FCY" value="">
  <input type=HIDDEN name="TBL" value="">
  <input type=HIDDEN name="CUN" value="">
  <input type=HIDDEN name="TYP" value="">
  
  <div id="enterFee" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Fee Structure :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TBL1" size="4" maxlength="2" value="">
          </div>
        </td>
      </tr>
      
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Fee Type :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TYP1" size="4" maxlength="3" value="">
			<a href="javascript:GetCodeCNOFC('TYP1','68')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
          </div>
        </td>
      </tr>
      
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Customer :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="CUN1" size="11" maxlength="9" value="<%=userPO.getCusNum()%>">
			<a href="javascript:javascript:GetCustomerDescId('CUN1','','')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
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
	if ( EDD0660Help.getNoResult() ) {
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
        <div align="center"><a href="javascript:goAction(2, false)"><b>Maintenance</b></a></div>
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
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Bank</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Currency</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Fee Structure</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Customer</div>
            </th>
            <th align=CENTER nowrap width="40%">Description</th>
          </tr>
          <%
                EDD0660Help.initRow();
				int k=1;
                while (EDD0660Help.getNextRow()) {
                 
                  out.println(EDD0660Help.getRecord());
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
