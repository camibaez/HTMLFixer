<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Log In</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="request" />

<SCRIPT LANGUAGE="JavaScript">
	function imgDown(image, imgName) {
    	if(image.src != imgName){
    		image.src = imgName;
    		//image.disabled = true;
    		return true;
	    }
	    //image.disabled = true;
	    return false;
	}
	function setCenterSize(w1,h1) {
			top.resizeTo(w1,h1);
			var w=screen.width;
			var h=screen.height;
			var posTop=(h-h1)/2;
			var posLeft=(w-w1)/2;
			top.moveTo(posLeft,posTop);
	}
document.onkeyup=function(event) {
	event = (event) ? event : ((window.event) ? window.event : "");
	var elem=event.srcElement;
	var coll=document.forms[0];
	var i=0;
	if (event.keyCode==9 || event.keyCode==16) return; //TAB=9 and SHIFT=16
	if (elem.type=="text" || elem.type=="password") {
		if (elem.value.length > (elem.maxLength-1)){
			while (i<coll.length){
				if (coll[i]==elem) { break;} else {i++;}
			}
			i++;
			while (i < coll.length) {
				if (elem.type=="text" || elem.type=="password") {
					coll[i].focus();
					coll[i].select();
					break;
				}
			}
		}
	}
 }
</SCRIPT>
</HEAD>
<BODY onLoad="setLayout()">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0030">
  <INPUT TYPE="hidden" NAME="Language" VALUE="E">
  <INPUT TYPE="hidden" NAME="LOGIN" VALUE="NO">
  
  <% 
    if ( !error.getERRNUM().equals("0")  ) {
%> 
	<SCRIPT LANGUAGE="JavaScript">
	  function setLayout() {
			setCenterSize(470,420);
	  }  
	</SCRIPT>

    <table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
       				<font color="red"><B> <%= error.getERDS01()%> </B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
      </tr>
    </table>
    <br>
<% 
    }
    else {
%> 
	<SCRIPT LANGUAGE="JavaScript">
	
	  function setLayout() {
			setCenterSize(470,250);
	  }
	
	</SCRIPT>

<% 
    }
%>
  
  
    <TABLE WIDTH="100%"  class="tbenter" BORDER=0>
      <TR>
	       
        <TD ALIGN=right width="40%" valign="middle"> <B>User ID</B> </TD>
	       
        <TD width="60%"> 
          <INPUT type="text" SIZE=15 MAXLENGTH=10 NAME="UserId" autocomplete="off">
          </TD>
   	 </TR>
	    <TR>
	       
        <TD ALIGN=right width="40%" > <b>Password</b></TD>
	       
        <TD width="60%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=10 NAME="Password" autocomplete="off">
        </TD>
   	  </TR>
     </TABLE>
     
   <BR>
   
     
    <TABLE class="tbenter" WIDTH="100%" BORDER=0>
      
      <TR> 
        <TD vALIGN=middle> 
          <div align="center"> 
            <input type=image name="imgLogin" src="<%=request.getContextPath()%>/images/e/login.gif" onClick="imgDown(this, '<%=request.getContextPath()%>/images/e/login_over.gif')">
          </div>
        </TD>
      </TR>
    </TABLE>
    
		 
 </FORM>  
<script language="JavaScript">
  document.forms[0].UserId.focus();
  document.forms[0].UserId.select();
</script>
</BODY>
</HTML>
