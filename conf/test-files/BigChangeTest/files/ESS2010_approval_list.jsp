<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Approval User List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="/eIBS_R04M03/pages/style.css" rel="stylesheet">


<jsp:useBean id= "usrList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="/eIBS_R04M03/pages/e/javascripts/eIBS.js"> </SCRIPT>
<script language="javascript">
  var reason = '';

  function goAction(op) {
     var op2 = '';
     if (op == 'Z') {op2 = 'A';} else {op2 = op;}
	
     document.forms[0].action.value = op2;
     document.forms[0].reason.value = reason;
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "USERID") 
      	{
        		ok = true;
        		break;
      	}
      }
      if ( ok ) {
             document.forms[0].submit();
         
      }
      else {
 	alert("Select user before this operation");	   
      }

 }
 
 function goExit(){
  window.location.href="/eIBS_R04M03/pages/background.jsp";
  }
  
function showInqUsr(user, type) {

	page = "/eIBS_R04M03/servlet/com.datapro.eibs.internet.JSESS2000?SCREEN=602&userid=" + user + "&type=" + type;
	CenterWindow(page,600,500,2);
 
}  
  
</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('/eIBS_R04M03/images/e/approve_over.gif','/eIBS_R04M03/images/e/reject_over.gif')">
<h3 align="center">User Approval<img src="/eIBS_R04M03/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval_list.jsp,ESS2010"> 
  </h3>
<hr size="4">
  
  
<FORM Method="post" Action="/eIBS_R04M03/servlet/com.datapro.eibs.internet.JSESS2000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="601">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

   <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goAction('A')" id="linkApproval" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','/eIBS_R04M03/images/e/approve_over.gif',1)"><img name="Image1" alt="Approve" border="0" src="/eIBS_R04M03/images/e/approve.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:enterReason('R')" id="linkReject" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','/eIBS_R04M03/images/e/reject_over.gif',1)"><img name="Image2" alt="Rejectr" border="0" src="/eIBS_R04M03/images/e/reject.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goAction('D')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','/eIBS_R04M03/images/e/delete_over.gif',1)"><img name="Image4" border="0" src="/eIBS_R04M03/images/e/delete.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="25%">
  			<a href="javascript:goExit()"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','/eIBS_R04M03/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="/eIBS_R04M03/images/e/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
  
 <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">  
		      <TH ALIGN=CENTER width=10%> </TH>
		      <TH ALIGN=CENTER width=20%>User ID</TH>
		      <TH ALIGN=CENTER width=50%>Name</TH>
		      <TH ALIGN=CENTER width=10%>Status</TH>
		      <TH ALIGN=CENTER width=10%>Type</TH>
		  </TR>

<%
                usrList.initRow();
                int k=1;
                while (usrList.getNextRow()) {
                    if (usrList.getFlag().equals("")) {
                    		out.println(usrList.getRecord());
                    k++;
                    }        
                }
%> 
 		</table>
  </table>

<SCRIPT language="JavaScript">
	showChecked("USERID");
</SCRIPT>

</FORM>

</BODY>
</HTML>
