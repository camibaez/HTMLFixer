<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD> 
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<TITLE>ACH Recipients Help</TITLE>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/sortTables.js"> </SCRIPT>
<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<script language="javascript">
//<!-- Hide from old browsers
function a(benename,beneaddress,benecsz,beneemail,routing,externalacc,type) {

var form = top.opener.document.forms[0];

						
	form[top.opener.fieldAux1].value = benename;
	form[top.opener.fieldAux2].value = beneaddress;
	form[top.opener.fieldAux3].value = benecsz;
	form[top.opener.fieldAux4].value = beneemail;
	form[top.opener.fieldAux5].value = routing;
	form[top.opener.fieldAux6].value = externalacc;
	form[top.opener.fieldAux7].value = type;
	
	top.close();
 }

function goSearch() {
  window.location.href="<%=request.getContextPath()%>/pages/e/EWD0362_ACH_helpfile.jsp?customer=" + document.forms[0].customerFlag.value + "&FromRecord=0&SelNew=" + document.forms[0].SelNew.value + "&SelOld=" + document.forms[0].SelOld.value; 
}
//-->
</script>
<STYLE>
table.tableinfo a.sortheader {
    color:#666666;
    font-weight: bold;
    text-decoration: none;
    display: block;
}
table .sortable span.sortarrow {
    color: black;
    text-decoration: none;
}
</STYLE>
</HEAD>
<BODY>
<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="SelOld" VALUE="">
<INPUT TYPE=HIDDEN NAME="customerFlag" VALUE="">
<%
             	Socket s = null;
            	MessageContext mc = null;
            	String customer = "";
				int rows = 0;
				int posIni = 0;
              	int posEnd = 0;
              	String marker = "";
              	String selNew = "";
              	String selOld = "";
              	String fromRec = "0";
              	boolean firstTime = true;
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

               	MessageRecord newmessage = null;
               	EWD0362DSMessage msgHelp = null;
                 try {
                	selNew = request.getParameter("SelNew");
                	if (selNew == null) selNew="";
                }
                catch (Exception e)
               	{
               	   selNew = "";              	  
               	}
               	try {
                	selOld = request.getParameter("SelOld");
                	if (selOld == null) selOld="";
                }
                catch (Exception e)
               	{
               	   selOld = "";              	  
               	}
               	try {
                	fromRec = request.getParameter("FromRecord");
                	if (fromRec == null) fromRec="0";
                }
                catch (Exception e)
               	{
               	   fromRec = "0";              	  
               	}

               	try {
                	customer = request.getParameter("customer");
                	if (customer == null) customer="";
                }
                catch (Exception e)
               	{
               	   customer = "";              	  
               	}
               	// Send Request
               	try
               	{
               		msgHelp = (EWD0362DSMessage)mc.getMessageRecord("EWD0362DS");
               	 	
               	 	msgHelp.setRWDSHO(selOld);
					msgHelp.setRWDSHN(selNew);
					msgHelp.setRWDFRC(fromRec);
			
               	 	msgHelp.setRWDCUN(customer.trim());
               	 	msgHelp.setRWDTYP("");						

					msgHelp.send();	
               	 	msgHelp.destroy();
               	}		
               	catch (Exception e)
               	{
               	  e.printStackTrace();
               	  out.println("Send Client Header Information error " + e);
               	}
               		
               	// Receive Help
               	try
               	{
                 	newmessage = mc.receiveMessage();
                 	rows = 1;
                 	if (newmessage.getFormatName().equals("EWD0362DS")) 
            		{
                        msgHelp =  (EWD0362DSMessage)newmessage;
                       out.println("<h4></h4>");
				%>
			<table id="TBHELP">
				<tr>
				<td nowrap><b></b></td>
			  	<td nowrap>
					<input type="hidden" name="SelNew"  size=20 maxlength=20>
        			
      			</td>
    		  </tr>
			</table>				
			  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
    			<TD NOWRAP width="100%" >
  				<TABLE id="headTable" >
  				   <TR id="trdark">  
      					<TH ALIGN=CENTER NOWRAP>
      						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Beneficiary Inf.<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
      					</TH>
      					<TH ALIGN=CENTER NOWRAP>
      						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Routing<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
      					</TH>
      					<TH ALIGN=CENTER NOWRAP>
      						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">External <br>Account<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
      					</TH>
      					<TH ALIGN=CENTER NOWRAP>
      						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Type<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
      					</TH>      					
          			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
				<%               	
					}
                  	
                  	while(true)
                  	{
                  	   //newmessage = mc.receiveMessage();                  	  
                  	   if (newmessage.getFormatName().equals("EWD0362DS"))
                  	   {

                            msgHelp =  (EWD0362DSMessage)newmessage;
                            marker = msgHelp.getSWDOPE();
                              
    	     				if ( marker.equals("*") )
    	     					{
   										break;
								}
							  
							if (firstTime)
							  	{
									firstTime = false;
							        posIni= Integer.parseInt(msgHelp.getSWDREC().trim());
					     		}

                      		String myCode = null;
                      		String myType = "";
                      		String myParam = "";
                      		
                      		myParam = "'" + msgHelp.getSWDNME().trim() + "','" + msgHelp.getSWDADD().trim() + "','" + msgHelp.getSWDCSZ().trim() 
                      				+ "','" + msgHelp.getSWDEMA().trim() + "','" + msgHelp.getSWDROU().trim() + "','" + msgHelp.getSWDACC().trim()  
                      				+ "','" + msgHelp.getSWDACT().trim() + "'";
                             
                           	myCode = msgHelp.getSWDACC().trim();
                            selOld = msgHelp.getRWDSHO().trim();
                            
                            if (msgHelp.getSWDACT().equals("C")) {
                            	myType = "Checking";
                            } else if (msgHelp.getSWDACT().equals("S")) {
                            	myType = "Saving";
                            } else {
                            	myType = "";
                            }
                             	
           					out.println("<tr><td nowrap title='" + msgHelp.getSWDADD().trim() + " " + msgHelp.getSWDCSZ().trim() + " " + msgHelp.getSWDEMA().trim() + "'><A HREF=\"javascript:a(" + myParam + ")\">" + msgHelp.getSWDNME().trim() + "</a></td>");
           					out.println("<td nowrap><noBR><A HREF=\"javascript:a(" + myParam + ")\">"  + msgHelp.getSWDROU().trim() + "</a></noBR></td>");
           					out.println("<td nowrap><noBR><A HREF=\"javascript:a(" + myParam + ")\">"  + msgHelp.getSWDACC().trim() + "</a></noBR></td>");
	           				out.println("<td nowrap><noBR><A HREF=\"javascript:a(" + myParam + ")\">"  + myType + "</a></noBR></td></tr>");
    	       				rows++;
        	   				
           					if (marker.equals("+"))
           					{
           					 		posEnd= Integer.parseInt(msgHelp.getSWDREC().trim());
									break;
							} 		             						   
                 	   	}
                  	   	else
                  	   	{
                  		     out.println("Message " + newmessage.getFormatName() + " received.");
                  		     break;
    	           		}
                  	   newmessage = mc.receiveMessage();     	           		
               		}
                %>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

     <SCRIPT language="JavaScript">
			document.forms[0].totalRow.value="<%= rows %>";
			document.forms[0].customerFlag.value="<%= customer %>";
			document.forms[0].SelNew.value="<%= selNew %>";
			document.forms[0].SelOld.value="<%= selOld %>";
			function resizeDoc() {
      		 	divResize();
     		    adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
		    
	 <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( posIni > 30 ) {
      			int pos = posIni - 31;
      			   out.print("<A HREF=\""+request.getContextPath()+"/pages/e/EWD0362_ACH_helpfile.jsp?customer=" + customer + "&FromRecord=" + pos + "&SelNew=" + selNew + "&SelOld=" + selOld + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT  height="25"> <%       
        if (marker.equals("+")) {
      			int pos = posEnd;
      			out.print("<A HREF=\""+request.getContextPath()+"/pages/e/EWD0362_ACH_helpfile.jsp?customer=" + customer +  "&FromRecord=" + pos + "&SelNew=" + selNew + "&SelOld=" + selOld + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        } %>
      </TD>
	 </TR>
	 </TABLE>
                    <%
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
                	
%>
</form>
</BODY>
</HTML>
