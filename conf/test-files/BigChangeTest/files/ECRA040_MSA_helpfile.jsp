<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<TITLE>MSA Codes by State Help</TITLE>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/e/javascripts/sortTables.js"> </SCRIPT>

<SCRIPT language="JavaScript">

setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)

function a(code,desc) {
var form = top.opener.document.forms[0];
	
	form[top.opener.fieldName].value = code;
	
  	if(top.opener.fieldDesc != ""){form[top.opener.fieldDesc].value = desc;}
  		
	top.close();
	
 }

</SCRIPT>
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

<%      Socket s = null;
       	MessageContext mc = null;
		int rows = 0;
       	String marker = "";
       	String codeflag = "";

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
		ELEERRMessage msgError = null;
       	ECRA04001Message msgHelp = null;     
               	               	
       	session = (javax.servlet.http.HttpSession) request.getSession();
       	ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
               	
      	try {
        	codeflag = request.getParameter("codeflag");
       		if (codeflag == null) codeflag="";
        }
  		catch (Exception e)
       	{
       	   codeflag = "";              	  
      	}

       	// Send Request
       	try
       	{
       		msgHelp = (ECRA04001Message)mc.getMessageRecord("ECRA04001");
			msgHelp.setH01USERID(msgUser.getH01USR());
			msgHelp.setH01PROGRM("ECRA040");
			//msgHelp.setH01TIMSYS(getTimeStamp());
			msgHelp.setH01SCRCOD("01");
			msgHelp.setH01OPECOD("0015");

			msgHelp.setE01CRRSTC(codeflag);
					              	 	
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
			if (newmessage.getFormatName().equals("ELEERR")) 
			{
				msgError = (ELEERRMessage)newmessage;
			}		         	
           	else if (newmessage.getFormatName().equals("ECRA04001")) 
           	{

%>		 
	<table id="TBHELP">
		<tr>
			<td nowrap><b>  State : </b></td>
			  <td nowrap>
					<input type="text" name="D01STCDSC"  size=20 maxlength=20 value="<%= msgHelp.getD01STCDSC() %>" readonly> 
      		</td>
    	</tr>
	</table>

	<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
   		<TR> 
			<TD NOWRAP width="100%" >		
				<TABLE id="headTable" >
	   			<TR id="trdark">  
					<TH ALIGN=CENTER NOWRAP>					
					<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">MSA Code<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
					</TH>
					<TH ALIGN=CENTER NOWRAP>
					<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Description<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
    				</TH>
       			</TR>
    			</TABLE>
  
   				<div id="dataDiv1" class="scbarcolor">
   		 		<table id="dataTable" >   

<%            	
           		while(true)
                  		{
                  	   		//newmessage = mc.receiveMessage();                  	  
                            msgHelp =  (ECRA04001Message)newmessage;
                            marker = msgHelp.getH01FLGMAS();
                         
    	     				if (marker.equals("*") )
    	     				{	     				
								break;
							}
		%>
           	<tr>
           		<td nowrap><A HREF="javascript:a('<%=msgHelp.getE01CRRMSA().trim()%>', '<%=msgHelp.getD01MSADSC().trim()%>')"> <%=msgHelp.getE01CRRMSA().trim()%></a></td>
           		<td nowrap><A HREF="javascript:a('<%=msgHelp.getE01CRRMSA().trim()%>', '<%=msgHelp.getD01MSADSC().trim()%>')"> <%=msgHelp.getD01MSADSC().trim()%></a></td>       		
	        </tr>               
    	<%           	
    	       				rows++;
    	       				newmessage = mc.receiveMessage();
	               		}
              		}
                	else
                  	{
                  		out.println("Message " + newmessage.getFormatName() + " received.");
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
        	    catch (Exception e) 
            	{
                	out.println("Error closing socket connection " + e);
	            }        	    

   		%>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

<SCRIPT language="JavaScript">
	document.forms[0].totalRow.value="<%= rows %>";
	function resizeDoc() {
	 	divResize();
	    adjustEquTables(headTable, dataTable, dataDiv1,1,false);
	}
	resizeDoc();   			
	window.onresize=resizeDoc;        
</SCRIPT>
</form>
</BODY>
</HTML>
