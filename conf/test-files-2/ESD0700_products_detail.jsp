<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<TITLE>Ayuda</TITLE>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<%
  	// Parameter entries
  	String bank = request.getParameter("bank");
  	String appCode = request.getParameter("appcode");
  	String typeCode = request.getParameter("typecode");
  	String generic = request.getParameter("generic");
  	String title = request.getParameter("title");
  	String sel = request.getParameter("sel"); if ( sel == null ) sel = "";
	String accnum = request.getParameter("accnum"); if ( accnum == null ) accnum = "";
	int k=0; 
  	boolean displayTypes=typeCode.equals("") ? true : false;
%>
<script language="javascript">

function closeEnterACC(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}


function cancelBub(){
  event.cancelBubble = true;
}

function ShowEnterProd() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 document.forms[0].newprod.focus();
}

  function goAction(s) {

	  document.forms[0].SCREEN.value = s;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "PROD_CODE") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok || (s == 12) || (s == 2)) {   // HG: Validation with 2 has been added in order to allow creation of new product when the list is empty
     	  switch ( s ) {
             case 2 : 
             case 4 : 
             case 6 : 
                 document.forms[0].target="detail";
                 document.forms[0].submit();
                 break;
             case 12 : 
                 parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
                 break;
             default : 
          }
     }
     else {
			alert("select a product");	   
     }

  }

  document.onclick= closeEnterACC;
</script>

</HEAD>
<BODY >

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Enter Product Code : 
          <input type="text" maxlength=4 size=4 name="newprod" value="">
      </TD>
	  <TD ALIGN=right nowrap>
          Bank : 
          <input type="text" maxlength=2 size=4 name="newbank" value="" onblur="document.forms[0].bank.value=this.value;" >
      </TD> 
      
      <TD ALIGN=Left nowrap>
	     <a href="javascript:goAction(2)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<%
   try {
            if ( !error.getERRNUM().equals("0") ) {
                out.println("<SCRIPT Language=\"Javascript\">");
                out.println("       showErrors()");
                error.setERRNUM("0");
                out.println("</SCRIPT>");
            }
            else {
               	String action = null;
               	try {
               	 			action = userPO.getHeader2();
               	 			userPO.setHeader2("");
               	}
               	catch (Exception e) {
               	 			action = "";
               	}
               	String mypage = null;
               	try {
               	 			mypage = userPO.getHeader3();
               	 			userPO.setHeader3("");
               	}
               	catch (Exception e) {
               	 			mypage = "";
               	}
               
                  if ( action.equals("DO_NEW") || action.equals("DO_MAINT")) {
                  	 if ( !mypage.equals("") ) {
%>
		       			<SCRIPT Language="Javascript">	
							CenterWindow('<%= mypage %>',780,500,2);
              			</SCRIPT>

<%
                    	 }
                  }

            }
   }
   catch (Exception e) {
   }
%>

<INPUT TYPE=HIDDEN NAME="bank" VALUE="<%= bank %>">
<INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%= appCode %>">
<INPUT TYPE=HIDDEN NAME="typecode" VALUE="<%= typeCode %>">
<INPUT TYPE=HIDDEN NAME="generic" VALUE="<%= generic %>">
<INPUT TYPE=HIDDEN NAME="title" VALUE="<%= title %>">
<INPUT TYPE=HIDDEN NAME="sel" VALUE="<%= sel %>">

<% 	if ( displayTypes ) {  // Types Detail %>

         <table class="tbenter" width=100% align=center>
	     	<tr>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(8)"><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(9)"><b>Maintenance</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(10)"><b>Delete</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(12)"><b>Exit</b></a></div>
            </tr>
         </table>
         
          
         <table cellspacing="0" cellpadding="2" width="100%" border="1">
           <tr > 
             <td nowrap> 
               <table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  align="center">
         			<tr><td align=left colspan=5 NOWRAP> <%= title %> </td></tr>
                </table>
              </td>
            </tr>
         </table>
         
         
	 <TABLE  id="mainTable" class="tableinfo" >
      	<TR> 
      		<TD >
		      <TABLE id="headTable" >
		       <TR id="trdark">  
					<TD align="center" nowrap></TD>
					<TD align="center" nowrap>Type</TD>
					<TD align="center" nowrap>Description</TD>
				 </TR>
		      </TABLE>
  
		      <div id="dataDiv1" class="scbarcolor" >
		      	<table id="dataTable" >
		      		<tr>		
            			<td>
<% } else {  // Products Detail  %>

         <table class="tbenter" width=100% align=center>
           <tr>
              <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="ShowEnterProd()"><a><b>New</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(4)"><b>Maintenance</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(6)"><b>Delete</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="javascript:goAction(12)"><b>Exit</b></a></div>
              </td>
           </tr>
         </table>
          
         <table cellspacing="0" cellpadding="2" width="100%" border="1">
           <tr> 
             <td nowrap> 
               <table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  align="center">
						<tr><td align=left colspan=5 NOWRAP> <%=typeCode %>  - <%= title %> </td></tr>
                </table>
              </td>
            </tr>
         </table>
        
  	   <TABLE  id="mainTable" class="tableinfo" >
		 	<TR>
		 		<TD>
  					<TABLE id="headTable" >
 			 			<TR id="trdark">  
						  <TD align="center" nowrap></TD>
					      <TD align="center" nowrap>Product</TD>
					      <TD align="center" nowrap>Bank</TD>
					      <TD align="center" nowrap>Currency</TD>
					      <TD align="center" nowrap>Description</TD>
					      <TD align="center" nowrap><div>Marketing Name</div></TD>
		     			</TR>
					</TABLE>
				</TD>	
	     	</TR>
		</TABLE>

<%	} %>  
   		<div id="dataDiv1" class="scbarcolor" >
    		<table id="dataTable" >		
<%
	// HttpSession session;
  	Socket s = null;
  	MessageContext mc = null;

  	MessageRecord newmessage = null;
  	ESD071102Message msgHelp = null;
	ESS0030DSMessage msgUser = null;
   
	session = (HttpSession)request.getSession(false);
	
	if (session != null) {

					msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");
					
              	try
               	{
							s = new Socket(JSEIBSProp.getHostIP(), JSEIBSProp.getIniSocket() + 1);
               	  	mc = new MessageContext(new DataInputStream(new BufferedInputStream(s.getInputStream())),
               					      	    new DataOutputStream(new BufferedOutputStream(s.getOutputStream())),
               							    "datapro.eibs.beans");
               	}
               	catch (Exception e)
               	{
               	  out.println("Connection error " + e);
               	}

               	// Send Request
               	try
               	{
               		msgHelp = (ESD071102Message)mc.getMessageRecord("ESD071102");
            		 	msgHelp.setE02USERID(msgUser.getH01USR());
            		 	msgHelp.setE02SELACD(appCode); 
           		 		msgHelp.setE02GENERI(generic);
           		 		msgHelp.setE02SELTYP(typeCode); 
               	 	msgHelp.send();	
               	 	msgHelp.destroy();
               	}		
               	catch (Exception e)
               	{
               	  e.printStackTrace();
               	  out.println("Send Client Header Information error " + e);
               	}
						
						boolean firstItem = true;
						String chk = "";
						String col = "";
										
               	
               	// Receive Help
               	try
               	{         
                  	while(true) {
                  	   newmessage = mc.receiveMessage();
                  	  
                  	   if (newmessage.getFormatName().equals("ESD071102")) {

                              msgHelp =  (ESD071102Message)newmessage;
                             
           						   if ( msgHelp.getE02OPERAC().equals("*") ) {
   										break;
										}
										
           							out.println("<tr id=\"trclear\">");
           							if ( displayTypes ) {
           								col = msgHelp.getE02APCTYP().trim(); if ( col.equals("") ) col = "&nbsp;";
    										if ( sel.equals("") ) {
    											chk = firstItem?"checked":"";
               							firstItem = false;
                                  }
                                  else if ( sel.equals(col) ) {
    											chk = firstItem?"checked":"";
               							firstItem = false;
                                  }
                                  else {
                                    chk = "";
                                  }
           								out.println("<td NOWRAP><input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " + chk + "></td>"); // radio button
           								out.println("<td NOWRAP>" + col + "</td>"); // Type Code
           								col = msgHelp.getE02DESCRI().trim(); if ( col.equals("") ) col = "&nbsp;";
           							   out.println("<td NOWRAP><div nowrap>"  + col + "</div></td>"); // Description
                              }
                              else {
           								col = msgHelp.getE02APCCDE().trim(); if ( col.equals("") ) col = "&nbsp;";
    										if ( sel.equals("") ) {
    											chk = firstItem?"checked":"";
               							firstItem = false;
                                  }
                                  else if ( sel.equals(col) ) {
    											chk = firstItem?"checked":"";
                                  }
                                  else {
                                    chk = "";
                                  }
           								out.println("<td NOWRAP><input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " + chk + "></td>"); // radio button
           								out.println("<td NOWRAP>" + col + "</td>"); // Prod Code
           								col = msgHelp.getE02APCBNK().trim(); if ( col.equals("") ) col = "&nbsp;";
           								out.println("<td NOWRAP>" + col + "</td>"); // Bank Code
           								col = msgHelp.getE02CURREN().trim(); if ( col.equals("") ) col = "&nbsp;";
            							out.println("<td NOWRAP>" + col + "</td>"); // Currency Code
            							col = msgHelp.getE02DESCRI().trim(); if ( col.equals("") ) col = "&nbsp;";
           							   out.println("<td NOWRAP><div nowrap>"  + col + "</div></td>"); // Description
           								col = msgHelp.getE02NICNME().trim(); if ( col.equals("") ) col = "&nbsp;";
            							out.println("<td NOWRAP><div nowrap>" + col + "</div></td>"); // Nick Name
                              }
        								out.println("</tr>");
           							k++;
           						   
                 		   }
                  	   else {
                  		     out.println("Message " + newmessage.getFormatName() + " received.");
                  		     break;
                  		}
               		}
               			
               	}
               	catch (Exception e)
               	{
               	  out.println("Read error " + e);
               	}	

                	try
                	{
                	  s.close();
                	}
                	catch (Exception e) {
                	  out.println("Error closing socket connection " + e);
                	}
	}
                	
%>
   			</table>
  			</div>
   
	  		</TD>
	  	</TR>	
 			</table>
  			</div>
  		</TD>
  	</TR>	
</TABLE>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize();
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
	 if ( getMSIEVer() < 5.5 ) {
		enterACC.style.filter="blendTrans(duration=1)"; 
	 }
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>
</BODY>
</HTML>
