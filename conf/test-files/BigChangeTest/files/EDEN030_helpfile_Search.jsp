<%@page import="datapro.eibs.beans.*"%>
<%@page import="java.net.*"%>
<%@page import="datapro.eibs.sockets.*"%>
<%@page import="datapro.eibs.master.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<html>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT SRC="<%= request.getContextPath() %>/e/pages/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

function enter(code,name) {
	var form = top.opener.document.getElementById("ibsForm");
	if(!form){
		form = top.opener.document.forms[0];
	}
	form[top.opener.fieldName].value = code;
  	if(top.opener.fieldDesc !== ""){
  		form[top.opener.fieldDesc].value = name;
  	}
  	top.close();
}
 
function goSearch() {
	var form = document.forms[0];
	var nameSearch = form.NameSearch.value;
	window.location.href="<%=request.getContextPath()%>/pages/e/EDEN030_helpfile_Search.jsp?NameSearch=" +nameSearch ; 
}

function nextRecord(pos){
	var form = document.forms[0];
	var nameSearch = form.NameSearch.value;
	window.location.href="<%=request.getContextPath()%>/pages/e/EDEN030_helpfile_Search.jsp?FromRecord="+pos;
}
</script>
</head>

<body>
 
<script language="Javascript1.1" src="<%=request.getContextPath()%>/e/pages/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	Socket s = null;
	MessageContext mc = null;
	MessageRecord newmessage = null;
	EDEN03001Message msgHelp = null;
	String marker = "";
	int fromRecord = 0;
		
	session = (HttpSession) request.getSession(false);
	int i = 0;
	if (session == null) {
		try {
			response.setContentType("text/html");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} else {
		try{
			s = new Socket(SuperServlet.hostIP, SuperServlet.iniSocket + 1);
	  	    mc = new MessageContext(new DataInputStream(new BufferedInputStream(s.getInputStream())),
			 	    new DataOutputStream(new BufferedOutputStream(s.getOutputStream())), "datapro.eibs.beans");
        }catch (Exception e){
            out.println("Connection error " + e);
        }
        try{              
			msgHelp = (EDEN03001Message) mc.getMessageRecord("EDEN03001");
			msgHelp.setH01USERID(currUser.getH01USR());
			String nameSearch = request.getParameter("NameSearch") == null?"":request.getParameter("NameSearch").toUpperCase();
			if(nameSearch.length() > 0){
				if(nameSearch.length() > 128)
					nameSearch = nameSearch.substring(0, 127);
				msgHelp.setE01DNCDS(nameSearch);
			}
			msgHelp.setH01OPECOD("0001");
		
			try{
				fromRecord = Integer.parseInt(request.getParameter("FromRecord"));
			}catch(Exception e){
				fromRecord = 0;
			}
			try {
				msgHelp.setE01NUMREC(Integer.toString(fromRecord));
			} catch (Exception e) {
				msgHelp.setE01NUMREC("0"); 
			}
			
			System.out.println(msgHelp);
			mc.sendMessage(msgHelp);
		} catch (Exception e) {
			e.printStackTrace();
		}

    	// Receiving
		try {
			newmessage = mc.receiveMessage();//(EDEN03001Message)
			boolean firstTime = true;
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";

				
	%>
<table id="TBHELP" align="center">
	<tr>
		<td nowrap>
			<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0>
				<tr>
					<td nowrap>
						<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
							<tr>
							   <th nowrap id="THHELP">Fast Search</th>
							   <td nowrap>
									<input type="text" name="NameSearch"  size=25 maxlength="20">
			&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="goSearch()" width="25" height="21"> 
		</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
    </tr>
</table>
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 	<TR id="trdark"> 
		<th nowrap width="10%">Code</th> 
		<th nowrap width="90%">Country</th>
	</TR>
	<TR>
		<td colspan='2'>
	    	<div style="width:100%; height:350px; overflow:auto;">
	      		<table cellspacing="0" cellpadding="2" width="100%" border="0" >
    	<% 
    		marker = ((EDEN03001Message)newmessage).getE01INDOPE();
			while (!marker.equals("*") && !marker.equals("+")) {
				
				if(i%2 == 0){
					out.println("<tr id='trdark' >");
				}else{
					out.println("<tr id='trclear' >");
				}
				out.println("<td nowrap aling='center'>"
						+"<A HREF=\"javascript:enter('" + ((EDEN03001Message)newmessage).getE01DNCDE().trim() +"', '" + 
						((EDEN03001Message)newmessage).getE01DNCDS().trim() + "')\">"  + ((EDEN03001Message)newmessage).getE01DNCDE().trim() + "</a></td>");
				out.println("<td nowrap aling='center'>"
						+"<A HREF=\"javascript:enter('" + ((EDEN03001Message)newmessage).getE01DNCDE().trim() +"', '" +
						 ((EDEN03001Message)newmessage).getE01DNCDS().trim() + "')\">"  + ((EDEN03001Message)newmessage).getE01DNCDS().trim() + "</a></td>");
				out.println("</tr>");
										
				i++;
				
				newmessage = mc.receiveMessage();
				marker = ((EDEN03001Message)newmessage).getE01INDOPE();
			}
		%>
				</table>
   			</div>
   		</TD>
   	</TR>	
</TABLE>

<%      } catch (Exception e) {
			e.printStackTrace() ;
		} finally {
			s.close();
		}
	}
%> 

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 		
		if ( fromRecord > 0 ) {
  			int pos = fromRecord - i;
  			out.print("<A HREF=\"javascript:nextRecord(" + pos + ") \" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (marker.equals("+")) {
  			int pos = fromRecord + i;
  			out.print("<A HREF=\"javascript:nextRecord(" + pos + ") \" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
</FORM>

</BODY>
</HTML>

