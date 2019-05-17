<HTML>
<HEAD>
<TITLE>Product Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
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
	String offnum = request.getParameter("offnum"); if ( offnum == null ) offnum = "";
	String deapac = request.getParameter("deapac"); if ( deapac == null ) deapac = "";
	int k=0; 
  	boolean displayTypes=typeCode.equals("") ? true : false;
%>

<script language="javascript">

function closeHiddenDivNew(){
	setVisibility(document.getElementById("enterACC"), "hidden");
}

function closeHiddenDivParam(){
	setVisibility(document.getElementById("enterPAR"), "hidden");
}
function closeHiddenDivOffer(){
	setVisibility(document.getElementById("enterOFFER"), "hidden");
}

function closeHiddenDivs(){
	closeEnter();
}

function setPAR(p) {
  document.forms[0].par.value=p;
}


function closeEnter(){
      document.getElementById("enterACC").style.visibility="hidden";
      document.getElementById("enterPAR").style.visibility="hidden";
      document.getElementById("enterOFFER").style.visibility="hidden";
      
}


function cancelBub(){
  event.cancelBubble = true;
}

function ShowEnterAcc(evt) {	 
	 evt = (evt) ? evt : ((window.event) ? window.event : "");
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft - document.getElementById("enterACC").clientWidth;
	 cancelBub(evt);
	 document.getElementById("enterACC").style.pixelTop=y;
     document.getElementById("enterACC").style.pixelLeft=x;
     document.getElementById("enterACC").style.visibility="visible";
	 document.forms[0].accnum.focus();
}

function ShowEnterPar(evt) {	 
	 evt = (evt) ? evt : ((window.event) ? window.event : "");
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft - document.getElementById("enterPAR").clientWidth;
	 cancelBub(evt);
	 document.getElementById("enterPAR").style.pixelTop=y;
     document.getElementById("enterPAR").style.pixelLeft=x;
     document.getElementById("enterPAR").style.visibility="visible";
	 document.forms[0].deapac.focus();
}

function ShowEnterOffer(evt) {	 
	 evt = (evt) ? evt : ((window.event) ? window.event : "");
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft - document.getElementById("enterOFFER").clientWidth;
	 cancelBub(evt);
	 document.getElementById("enterOFFER").style.pixelTop=y;
     document.getElementById("enterOFFER").style.pixelLeft=x;
     document.getElementById("enterOFFER").style.visibility="visible";
	 document.forms[0].offnum.focus();
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
	  if ( ok || (s == 12)) {
     	  switch ( s ) {
             case 2 : 
             case 4 : 
             case 6 :
                 document.forms[0].target="detail";
                 document.forms[0].submit();
                 break;
             case 8 : 
                 document.forms[0].target="detail";
                 document.forms[0].submit();
                 break;
             case 10 : 
                 document.forms[0].target="detail";
                 document.forms[0].submit();
                 break;
             case 12 : 
                 parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
                 break;
             case 20 : 
                 document.forms[0].target="detail";
                 document.forms[0].submit();
                 break;
                 
             default : 
          }
     }
     else {
			alert("Please select a product to continue.");	   
     }

  }

 function goNew(){
   <% 
        int appCod = 0;
        boolean autoNum = false;
  		try {
	  		appCod = Integer.parseInt(appCode);
  		}
  		catch (Exception e) {
  		}
		switch (appCod) {
				case 11 :
				case 12 :  
					autoNum = JSEIBSProp.getAutoNumCD();
					break;
				case 1 :	
				case 2 :
				case 3 :
				case 5 :
					autoNum = JSEIBSProp.getAutoNumRT();
					break;
				case 4 :	
					autoNum = JSEIBSProp.getAutoNumSV();
					break;
				case 10 :	
					autoNum = JSEIBSProp.getAutoNumLN();
					break;
				default :
					autoNum = false;
  		}

	if (autoNum){ %>
	  ShowEnterAcc();
   <%} else { %>
	  goNewPAR();
   <%}%>
  }

  function goNewPAR(){
  	closeEnter();
  	if (document.forms[0].par.value == 'P') {
  		ShowEnterPar();
  	} else {
  		goAction(10);
  	}
  }
    function goOffering(){
  	closeEnter();
	ShowEnterOffer();
  }
  
  
  document.onclick= closeEnter;

</script>

</HEAD>
<BODY>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0711" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
	<TABLE id=tbhelp 
		style="border-top-width : 1px;
			   border-right-width : 1px;
			   border-bottom-width : 1px;
			   border-left-width : 1px;
			   border-color: #0b23b5;
		       border-style : solid solid solid solid;
		       filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
		  	<TD ALIGN=right nowrap>Enter Account Number : 
	          	<input type="text" maxlength=12 size=13 name="accnum" onKeyPress="enterInteger()" value="<%= accnum %>">
	      	</TD>
	      	<TD ALIGN=Left nowrap>
		     	<img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif" onclick="javascript:goAction(10)"> 
			</TD>
		</TR>
	</TABLE>
</div>

<div id="enterPAR" 
	style="position:absolute;visibility:hidden;left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
	<TABLE id=tbhelp 
			style="border-top-width : 1px;
				   border-right-width : 1px;
				   border-bottom-width : 1px;
				   border-left-width : 1px;
			       border-color: #0b23b5;
	               border-style : solid solid solid solid;
	               filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
	  		<TD ALIGN=right nowrap>Enter Participated Loan Number : 
          		<input type="text" maxlength=9 size=11 name="deapac" onKeyPress="enterInteger()" value="<%= accnum %>">
          		<a href="javascript:GetParticipation('deapac')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a> 
      		</TD>
      		<TD ALIGN=Left nowrap>
	     		<a href="javascript:goAction(10)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif"></a> 
	  		</TD>
   		</TR>
 	</TABLE>
</div>
<div id="enterOFFER" 
	style="position:absolute;visibility:hidden;left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
	<TABLE id=tbhelp 
			style="border-top-width : 1px;
				   border-right-width : 1px;
				   border-bottom-width : 1px;
				   border-left-width : 1px;
			       border-color: #0b23b5;
	               border-style : solid solid solid solid;
	               filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
	  		<TD ALIGN=right nowrap>Enter Offering : 
          		<input type="text" maxlength=9 size=11 name="offnum" onKeyPress="enterInteger()" value="<%= offnum %>">
          		<a href="javascript:GetOffering('offnum')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a> 
      		</TD>
      		<TD ALIGN=Left nowrap>
	     		<a href="javascript:goAction(10)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif"></a> 
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
               	String newpage = null;
               	try {
               	 			newpage = userPO.getHeader3();
               	 			userPO.setHeader3("");
               	}
               	catch (Exception e) {
               	 			newpage = "";
               	}
               
                  if ( action.equals("DO_INQ") ) {
                      out.println("<SCRIPT Language=\"Javascript\">");
                  	 if ( !newpage.equals("") ) {
                 		 			out.println("CenterWindow('" + newpage + "',620,500,2);");
                    	 }
                      out.println("</SCRIPT>");
                  }
                  else if ( action.equals("DO_NEW") ) {
                      out.println("<SCRIPT Language=\"Javascript\">");
                  	 if ( !newpage.equals("") ) {
               		 			out.println("parent.window.location.href=\"" + newpage + "\";");
                    	 }
                      out.println("</SCRIPT>");
                  }
                  else if ( action.equals("DO_HTML") ) {
                      out.println("<SCRIPT Language=\"Javascript\">");
                  	 if ( !newpage.equals("") ) {
                 		 			out.println("CenterWindow('" + newpage + "',620,500,2);");
                    	 }
                      out.println("</SCRIPT>");
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
<INPUT TYPE=HIDDEN NAME="par">

<%
  	if ( displayTypes ) {  // Types Detail
%>
   		<table class="tbenter" width=100% align=center>
  	     	<tr>
              <td width="25%">
                <div align="center"><a href="javascript:goAction(2)"><img src="<%=request.getContextPath()%>/images/e/prod_audio.gif" align="middle" border="0"></a></div>
              </td>
              <td width="25%">
                <div align="center"><a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/e/prod_video.gif" align="middle" border="0"></a></div>
              </td>
              <td width="25%">
                <div align="center"><a href="javascript:goAction(6)"><img src="<%=request.getContextPath()%>/images/e/prod_html.gif" align="middle" border="0"></a></div>
              </td>
              <td width="25%">
                <div align="center"><a href="javascript:goAction(12)"><img src="<%=request.getContextPath()%>/images/e/prod_exit.gif" align="middle" border="0"></a></div>
            </tr>
         </table>
         
         <table cellspacing="0" cellpadding="2" width="100%" border="1">
           <tr>
             <td nowrap> 
               <table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
         			<tr><td align=left colspan=5 > <%= title %> </td></tr>
                </table>
              </td>
            </tr>
         </table>
         
         
	 <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
      	<TR> 
      		<TD NOWRAP>
      			<TABLE id="headTable" >
       				<TR id="trdark">  
						<td align=center NOWRAP> </td>
						<td align=center NOWRAP>Type</td>
						<td align=center NOWRAP>Description</td>
					</tr>
   				</TABLE>
   				
<%
   } else {  // Products Detail
%>
		<table class="tbenter" width=100% align=center>
			<tr>
  				<td width="2%"></td>
  				<td width="14%">
		            <div align="center"><a href="javascript:goAction(2)"><img src="<%=request.getContextPath()%>/images/e/prod_audio.gif" align="middle" border="0"></a></div>
		        </td>
  				<td width="14%">
    				<div align="center"><a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/e/prod_video.gif" align="middle" border="0"></a></div>
  				</td>
  				<td width="14%">
    				<div align="center"><a href="javascript:goAction(6)"><img src="<%=request.getContextPath()%>/images/e/prod_html.gif" align="middle" border="0"></a></div>
  				</td>
  				<td width="14%">
    				<div align="center"><a href="javascript:goAction(8)"><img src="<%=request.getContextPath()%>/images/e/prod_inquiry.gif" align="middle" border="0"></a></div>
  				</td>
  				<td width="14%">
    				<div id="eibsNew" align="center"><img src="<%=request.getContextPath()%>/images/e/prod_new.gif" align="middle" border="0" style="cursor:hand" ></div>
  				</td>
  				<% if (appCode.equals("10")){	// Offering solo aplica para LOANS%>
  				<td width="14%">
    				<div id="eibsOffer" align="center"><img src="<%=request.getContextPath()%>/images/e/prod_offer.gif" align="middle" border="0" style="cursor:hand" ></div>
  				</td>
  				<%} %>
  				<td width="14%">
    				<div align="center"><a href="javascript:goAction(12)"><img src="<%=request.getContextPath()%>/images/e/prod_exit.gif" align="middle" border="0"></a></div>
      			</td>
      			<td width="2%"></td>
    		</tr>
  		</table>
         
		<table cellspacing="0" cellpadding="2" width="100%" border="1">
			<tr>
            	<td nowrap> 
            		<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
						<tr>
							<td align=left colspan=5 > <%=typeCode %>  - <%= title %> </td>
						</tr>
               		</table>
              	</td>
           	</tr>
         </table>

		 <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
		 	<TR> 
  		  		<TD NOWRAP>
  					<TABLE id="headTable" >
 						<TR id="trdark">  
							<td align=center NOWRAP> </td>
							<td align=center NOWRAP>Product</td>
							<td align=center NOWRAP>Bank</td>
							<td align=center NOWRAP>Currency</td>
							<td align=center NOWRAP>Description</td>
							<td align=center NOWRAP><div >Marketing Name</div></td>
						</tr>
		   			</TABLE>
<%
  }
%>
					<div id="dataDiv1" class="scbarcolor" >
						<table id="dataTable" >
<%  

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
					      	    new DataOutputStream(new BufferedOutputStream(s.getOutputStream())), "datapro.eibs.beans");
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
           		 	msgHelp.setE02APCBNK(bank);  
               	 	msgHelp.send();	
               	 	msgHelp.destroy();
               	}		
               	catch (Exception e)
               	{
               	  e.printStackTrace();
               	  out.println("Send Customer Header Information error " + e);
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
           								out.println("<td nowrap><input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " + chk + "></td>"); // radio button
           								out.println("<td nowrap>" + col + "</td>"); // Type Code
           								col = msgHelp.getE02DESCRI().trim(); if ( col.equals("") ) col = "&nbsp;";
           							   out.println("<td nowrap><div nowrap>"  + col + "</div></td>"); // Description
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
           								out.println("<td nowrap><input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " + chk + " onClick=\"setPAR('" + msgHelp.getE02GENERI() + "')\"></td>"); // radio button
           								out.println("<td nowrap>" + col + "</td>"); // Prod Code
           								col = msgHelp.getE02APCBNK().trim(); if ( col.equals("") ) col = "&nbsp;";
           								out.println("<td NOWRAP>" + col + "</td>"); // Bank Code
           								col = msgHelp.getE02CURREN().trim(); if ( col.equals("") ) col = "&nbsp;";
            							out.println("<td nowrap>" + col + "</td>"); // Currency Code
            							col = msgHelp.getE02DESCRI().trim(); if ( col.equals("") ) col = "&nbsp;";
           							   out.println("<td nowrap><div nowrap>"  + col + "</div></td>"); // Description
           								col = msgHelp.getE02NICNME().trim(); if ( col.equals("") ) col = "&nbsp;";
            							out.println("<td nowrap><div nowrap>" + col + "</div></td>"); // Nick Name
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
<%
	if ( displayTypes ) {  // Types Detail
%>
  		</TD>
  	</TR>	
</TABLE>
<% } else {%>
  		</TD>
  	</TR>	
</TABLE>
<% } %>

</FORM>

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
     showChecked("PROD_CODE");
     window.onresize=resizeDoc;

   	document.onclick= closeHiddenDivs;
     
 	document.getElementById("enterACC").onclick=cancelBub;
 	document.getElementById("enterPAR").onclick=cancelBub;
 	if (document.getElementById("eibsNew")) 
 		document.getElementById("eibsNew").onclick=goNew;

 	document.getElementById("enterOFFER").onclick=cancelBub;
 	if (document.getElementById("eibsOffer")) 
 		document.getElementById("eibsOffer").onclick=ShowEnterOffer;
 		
</SCRIPT>

</BODY>
</HTML>
