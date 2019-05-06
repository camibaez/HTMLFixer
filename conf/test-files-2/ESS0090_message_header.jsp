<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 //EN">
<HTML>
<HEAD>
<TITLE>
Message Header
</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
  var reason = '';

  function goAction(op) {

         parent.msgList.document.forms[0].opt.value = op;
  		 parent.msgList.document.forms[0].reason.value = reason;
         
         var formLength=parent.msgList.document.forms[0].elements.length;
         var ok = false;
         for(n=0;n<formLength;n++)
         {
          	var elementName=parent.msgList.document.forms[0].elements[n].name;
          	if(elementName == "ACCNUM") 
          	{
            		ok = true;
            		break;
          	}
         }
    	   if ( ok ) {
              parent.msgList.document.forms[0].submit();
              top.close();
         }
         else {
    			alert("Select a message before click an option");	   
         }

  }

function validate(op) {
  
  
  if ( op == 2 ) {
     var msg = parent.msgList.document.forms[0].msgCode.value;  
     if ( msg == "E" ) {
		parent.msgList.document.forms[0].target = "";
		//enterReason(2);
		if (confirm("Are you Sure you Want to Remove this Message?")) {
			goAction(op);
		}
     }
     else {
   		alert("This Operation is not Valid for this Message.");	   
     }

  }
  else {
  
  	var app = parent.msgList.document.forms[0].appCode.value;
  	if (app == "IN") {
  		alert("This Operation is not Valid for Alarm Message.");
  	} else {
		parent.msgList.document.forms[0].target = "main";
   		goAction(op);
   	}	
  }


}

</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/set_it_fixed_over.gif','<%=request.getContextPath()%>/images/e/go_to_action_over.gif')">
  <TABLE width="100%" class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:validate(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/go_to_action_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/go_to_action.gif" ></a>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:validate(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/set_it_fixed_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/set_it_fixed.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="34%">
  			<a href="javascript:top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  <TABLE>
</BODY>
</HTML>
