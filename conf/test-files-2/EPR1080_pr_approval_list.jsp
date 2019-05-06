<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">
 var reason = "";

 function showInqApprovalPR(refnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "REFNUM" && elementValue== refnum) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
 	 CenterWindow(page,600,500,2);
 }

 function showAddInfo(refernum,idxRow,wrg,ofa){

   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["TXTDATA"+idxRow].value;
   tbAddInfo.rows[0].cells[1].style.color="";
   for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].REFNUM.value = refernum;
   adjustEquTables(headTable, dataTable, dataDiv1,1,false);
   document.forms[0].WRGFL.value = wrg;
   document.forms[0].OFAFL.value = ofa;
   document.forms[0].TRANSREFNUM.value = refernum;
  } 
  
 function goApproval() {
 	if (document.forms[0].WRGFL.value == "A") {
 		var accnum = document.forms[0].TRANSREFNUM.value;
 		document.forms[0].WRGFL.value = "W"; //Force Approval.
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accnum+"&APP=1";
		CenterWindow(page,420,300,2);
 	} else {
   		document.forms[0].action.value = "A";
		document.forms[0].submit();
 	}
 }  
/* function goApproval() {
   	document.forms[0].action.value = "A";
	document.forms[0].submit();
 }
 */

 function goAction(op) {
 var op2 = '';
    
	if (op == 'Z') {
		document.forms[0].action.value = document.forms[0].OP2.value;
	} else {
		document.forms[0].OP2.value = op;
		document.forms[0].action.value = op;
	}
	 
     document.forms[0].reason.value = reason;
     if (document.forms[0].TRANSREFNUM.value !== "") {
		var accnum = document.forms[0].TRANSREFNUM.value;
            if (document.forms[0].OFAFL.value !== "" && op != 'Z' && op != 'D') {
		     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accnum + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		     CenterWindow(page,600,500,2);
            } else { 
		      if (document.forms[0].WRGFL.value !== "" && op == 'A') {
			   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accnum+"&APP=1";
			   CenterWindow(page,420,300,2);
                  }
               else {
                        document.forms[0].submit();
                  }
              }
     } else if(<%=""+Boolean.valueOf("APPROVAL_MASSIVE".equals(userPO.getPurpose()))%>==true){
     	document.forms[0].submit();
     } else {
		  alert("Select an account before  this operation ");	   
     }
  }  
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
  
function showOfac(fieldValue){
        document.forms[0].REFNUM.value=fieldValue;

	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "REFNUM" && elementValue== fieldValue) 
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }
  
function enter(recpos){
 document.forms[0].SCREEN.value = '5';
 document.forms[0].Pos.value = "" + recpos;
 document.forms[0].submit();
}
  
 function FilterType() {
 	document.forms[0].SCREEN.value = "5";
 	document.forms[0].Action = '<%=request.getContextPath()%>/servlet/datapro.eibs.approvals.JSEPR1080A';
    document.forms[0].submit();
 } 
 
</script>
</HEAD>



<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String opt = ""; 
%>

<%
String transTyp = "";
String customer = "";
String compliance = "";
try {
	 transTyp = request.getParameter("TRANSTYP");
	 customer = request.getParameter("CUSNUM");
	 compliance = request.getParameter("COMPLIANCE");
} catch (Exception e) {
	 transTyp = "";
	 customer = "";
	 compliance = "";
}
if (transTyp == null) transTyp = "";
if (customer == null) customer = "";
if (compliance == null) compliance = "";
%>

<h3 align="center"><%=(compliance.equals("Y"))?"Compliance Approvals":"Approvals" %>	
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_approval_list.jsp,EPR1080">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="OP2" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="WRGFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="OFAFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="COMPLIANCE" VALUE="<%=compliance%>">
  <input type=HIDDEN name="TRANSREFNUM" value="">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right"><b>Transference Type :</b></div>
            </td>
            <td nowrap width="10%" > 
             <select name="TRANSTYP">
                <option value="" <% if (!(transTyp.equals("I") ||transTyp.equals("O") ||transTyp.equals("B"))) out.print("selected"); %>>All</option>
                <option value="I" <%if (transTyp.equals("I")) out.print("selected"); %>>Incoming</option>
                <option value="O" <%if (transTyp.equals("O")) out.print("selected"); %>>Outgoing</option>
                <option value="B" <%if (transTyp.equals("B")) out.print("selected"); %>>Internals</option>
              </select>
              
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Customer Number :</b></div>
            </td>
            <td nowrap width="10%" > 
				<input type="text" name="CUSNUM" size="11" maxlength="10" value="<%= customer %>" >
				<a href="javascript:javascript:GetCustomerDescId('CUSNUM','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="50%" > 
              <input id="EIBSBTN" type=button name="Submit" value="Submit" OnClick="FilterType();">
            </td>
			 
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <table class="tbenter">
    <tr> 
      <td class=TDBKG width="25%" > 
        <div align="center" >
        	<a href="javascript:goAction('A')" id="linkApproval"><b>Approval</b></a>
        </div>
      </td>
      <%  if (!compliance.equals("Y")) { // Compliance Approval just Appove and Exit options available%> 
      
	      <td class=TDBKG width="25%" > 
	        <div align="center" ><a href="javascript:enterReason('R')" id="linkReject"><b>Reject</b></a></div>
	      </td>
		<td class=TDBKG width="25%" > 
	        <div align="center" ><a href="javascript:goAction('D')"><b>Delete</b></a></div>
	      </td>
      <%}%>
      <td class=TDBKG width="25%" > 
        <div align="center" ><a href="javascript:goExit()"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <table  id="mainTable" class="tableinfo" align=CENTER >
    <tr> 
      <td NOWRAP valign="top" width="100%" > 
        <table id="headTable" >
          <tr id="trdark"> 
            <th align=CENTER NOWRAP><input type="checkbox" onclick="toggle(this)"/></th>
            <th align=CENTER NOWRAP>Reference</th>
            <th align=CENTER NOWRAP>Amount</th>
            <th align=CENTER NOWRAP>Name</th>
			<th align=CENTER NOWRAP>Description</th>
          </tr>
        </table>
        <div id="dataDiv1" class="scbarcolor" > 
          <table id="dataTable" >
            <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
    %> 
          </table>
        </div>
      </td>
      <td nowrap align="RIGHT" valign="top"> 
        <table id="tbAddInfoH" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >Basic Information </th>
          </tr>
        </table>
        <table id="tbAddInfo" >
          <tr id="trclear" > 
            <td  align="RIGHT"  valign="middle" nowrap ><b>Date Transfer : <br>
              Debit Account : <br>

              Currency : <br>
              Bank : <br>
              Branch : <br>
			  Beneficiary : <br>
              Batch : <br>
              User : </b></td>
            <td align="LEFT" valign="middle" nowrap class="tdaddinfo"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <SCRIPT language="JavaScript">
	document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
     showChecked("REFNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
	function toggle(source) {
		var length = formatFloat(document.forms[0].totalRow.value);
		for(var i=0, n=length;i<n;i++) {
			document.getElementById('REFNUM_'+i).checked = source.checked;
		}
 	}
     
</SCRIPT>


<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>

</FORM>

</BODY>
</HTML>
