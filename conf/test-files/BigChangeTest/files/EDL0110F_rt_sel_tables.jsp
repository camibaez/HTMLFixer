<html>
<head>
<title>TABLAS DE SERVICIOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL0110FHelp" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function closeEnter(){
   	  enterTBL.filters[0].apply();
      enterTBL.style.visibility="hidden";
      enterTBL.filters[0].Play();
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterTBL.style.pixelTop=' + y);
     eval('enterTBL.style.pixelLeft=' + x);
	 enterTBL.filters[0].apply();
     enterTBL.style.visibility="visible";
     enterTBL.filters[0].Play();
	 
}

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(tar,des1,type1,rtPry1,rtSec1,pryMonth1,pryDay1,pryYear1,prtMonth1,prtDay1,prtYear1, prrapp)
{

	document.forms[0].TABLEN.value = tar;
	document.forms[0].DSC.value = des1;
	document.forms[0].TYPE.value = type1;
	
	document.forms[0].RT_PRY.value = rtPry1;
	document.forms[0].RT_SEC.value = rtSec1;
		
	document.forms[0].PRY_MONTH.value = pryMonth1;
	document.forms[0].PRY_DAY.value = pryDay1;
	document.forms[0].PRY_YEAR.value = pryYear1;
	
	document.forms[0].PRT_MONTH.value = prtMonth1;
	document.forms[0].PRT_DAY.value = prtDay1;
	document.forms[0].PRT_YEAR.value = prtYear1;
	
	
	document.forms[0].PRRAPP.value = prrapp;
	
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Floating Rates<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_sel_tables,EDL0110F" ></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0110F" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  
  <input type=HIDDEN name="TABLEN" value="">
  <input type=HIDDEN name="DSC" value="">
  <input type=HIDDEN name="TYPE" value="">
  
  <input type=HIDDEN name="RT_PRY" value="">
  <input type=HIDDEN name="RT_SEC" value="">
  <input type=HIDDEN name="PRY_MONTH" value="">
  <input type=HIDDEN name="PRY_DAY" value="">
  <input type=HIDDEN name="PRY_YEAR" value="">
  <input type=HIDDEN name="PRT_MONTH" value="">
  <input type=HIDDEN name="PRT_DAY" value="">
  <input type=HIDDEN name="PRT_YEAR" value="">
  
  <input type=HIDDEN name="PRRAPP" value="">

  
  
  <div id="enterTBL" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Table Number :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="4" maxlength="2">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Description :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left">                                    
            <input type="text" name="DESCRIPTION" size="35" maxlength="35">
          </div>
        </td>
      </tr>
      
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1)">
        </td>
      </tr>
    </table>
  </div>
  <%
	if ( EDL0110FHelp.getNoResult() ) {
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
 
          <tr id="trdark"> 
            <th align=CENTER   nowrap>&nbsp;</th>
            <th align=CENTER  nowrap> 
              <div align="center">Table</div>
            </th>
            <th align=CENTER   nowrap> 
              <div align="center">Description</div>
            </th>
            <th align=CENTER   nowrap>Type</th>
            
            <th align=CENTER    nowrap> 
              <div align="center">Primary<br>Rate</div>
            </th>
            <th align=CENTER   nowrap> 
              <div align="center">Secondary<br>Rate</div>
            </th> 
            <th align=CENTER   nowrap> 
               <div align="center">Date</div>
            </th>        
          </tr>
          <%
                EDL0110FHelp.initRow();
				int k=1;
                while (EDL0110FHelp.getNextRow()) {
                 
                  out.println(EDL0110FHelp.getRecord());
                  k++;   
                }
              %>
   
</TABLE>
     
  <%}%>

<SCRIPT language="JavaScript">
  
  showChecked("TBL");
  
</SCRIPT>
</form>

</body>
</html>
