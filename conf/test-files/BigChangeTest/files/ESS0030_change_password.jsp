<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Password Maintenance</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function validate() {
  var ok = true;
  var err = "";
  if (document.forms[0].LoginPassword_1.value != document.forms[0].LoginPassword_2.value) {
    err = "Access password: \n\tNew and Confirm Password \n\tMust be the same.\n";
    ok = false;
  }
  if ((document.forms[0].LoginPassword_1.value != '' && document.forms[0].LoginPassword.value == '') || (document.forms[0].LoginPassword_1.value == '' && document.forms[0].LoginPassword.value != '')) {
    err += "Access password: \n\tMust enter the three fields.\n";
    ok = false;
  }
  if (document.forms[0].AppPassword_1.value != document.forms[0].AppPassword_2.value) {
    err += "Confirm password: \n\tNew and Confirm Password \n\tMust be the same.\n";
    ok = false;
  }
  if ((document.forms[0].AppPassword_1.value != '' && document.forms[0].AppPassword.value == '') || (document.forms[0].AppPassword_1.value == '' && document.forms[0].AppPassword.value != '')) {
    err += "Confirm password: \n\tMust enter the three fields.\n";
    ok = false;
  }
  if ( ok == true) {
    document.forms[0].submit();   
  }
  else {
    alert(err);
  }

}
</SCRIPT>
</HEAD>
<BODY>
<H3 align="center">Password Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="change_password, ESS0030"></H3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0030">
  <INPUT TYPE="hidden" NAME="SCREEN" VALUE="6">
  <CENTER>
  <TABLE CLASS="tbenter" WIDTH=98% HEIGHT=85% BORDER=0>
    <TR>
    <TD HEIGHT="45%">
    <h4>eIBS Access Password</h4>
    <TABLE WIDTH="100%"  BORDER=0>
	   <TR  id="trdark">    
              <TD ALIGN=right width="50%" > Password : </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=10 NAME="LoginPassword">
        </TD>
   	  </TR>
	   <TR  id="trclear">    
        <TD ALIGN=right width="50%" > 
           New Password : 
        </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=10 NAME="LoginPassword_1">
        </TD>
   	  </TR>
	    <TR id="trdark">
        <TD ALIGN=right width="50%" > 
            Confirm Password : 
        </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=10 NAME="LoginPassword_2">
        </TD>
   	  </TR>
     </TABLE>
    </TD>
    </TR>
    <TR>
    <TD HEIGHT="45%">
    <h4>Approval Password</h4>
    <TABLE WIDTH="100%"  class="tbenter" BORDER=0>
	   <TR  id="trdark">    
              <TD ALIGN=right width="50%" > Password  : </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=4 NAME="AppPassword">
        </TD>
   	 </TR>
	   <TR  id="trclear">    
        <TD ALIGN=right width="50%" > 
            New Password : 
        </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=4 NAME="AppPassword_1">
        </TD>
   	 </TR>
	    <TR id="trdark">
        <TD ALIGN=right width="50%" > 
             Confirm Password : 
        </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=15 MAXLENGTH=4 NAME="AppPassword_2">
        </TD>
   	  </TR>
     </TABLE>
    </TD>
    </TR>
    <TR> 
      <TD HEIGHT="10%"> 
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
            <!-- imgDown('imgLogin', 'login_over.gif') --> </div>
      </TD>
    </TR>
   </TABLE>
   </CENTER>  
   <BR>
     
		 
 </FORM>  
<script language="JavaScript">
  document.forms[0].LoginPassword.focus();
  document.forms[0].LoginPassword.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</BODY>
</HTML>
