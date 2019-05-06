<html>
<head>
<title>Debit Cards List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "EWD0343Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

   function goUpdate(acc,cun) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0040?SCREEN=6&ACC=" + acc + "&CUN=" + cun;
     window.location = page
   }

   function goInquiry(acc,cun) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0040?SCREEN=5&ACC=" + acc + "&CUN=" + cun;
     window.location = page
   }

   function goAction() {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0040?SCREEN=6";
     window.location = page
   }

   function goActivate(acc,cun) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050?SCREEN=11&ACC=" + acc + "&CUN=" + cun;
     window.location = page
   }

   function goChangeStatus(acc,cun) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050?SCREEN=21&ACC=" + acc + "&CUN=" + cun;
     window.location = page
   }

   function goReplace(acc,cun) {
     page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0050?SCREEN=31&ACC=" + acc + "&CUN=" + cun;
     window.location = page
   }

<%
	if (userPO.getOption().equals("RT")) {
		if (userPO.getHeader5().equals("M")) {
			// Maintenance
			out.println("builtNewMenu(rt_m_opt);");
		} else if (userPO.getHeader5().equals("A")) {
					// Approval Inquiry
					out.println("builtNewMenu(rt_a_opt);");
				} else {
					//Inquiry
					out.println("builtNewMenu(rt_i_opt);");
				}
	} else if ( userPO.getOption().equals("SV") ) {
				if(userPO.getHeader5().equals("M")){
					// Maintenance
					out.println("builtNewMenu(sv_m_opt);");
				} else if(userPO.getHeader5().equals("A")){
							// Approval Inquiry
							out.println("builtNewMenu(sv_a_opt);");
				} else {
					// Inquiry
					out.println("builtNewMenu(sv_i_opt);");
				}
			}
%>
</SCRIPT>  


</head>

<BODY onLoad="">
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
	 	error.setERRNUM("0");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
 	
 	if (userPO.getOption().equals("RT") || userPO.getOption().equals("SV")) {
    	out.println("<SCRIPT> initMenu();  </SCRIPT>");
    }	

%>
<h3 align="center">Debit Cards List<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ccards_list.jsp, EWD0343"></h3>
<hr size="4">
<p>
	<table class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          			<tr id="trdark"> 
            			<td nowrap width="20%" ><div align="right"><b>Customer / Portfolio :</b></div></td>
            			<td nowrap width="30%" > 
              				<div align="left"> 
                				<input type="text" name="E01ACMCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
							</div>
            			</td>
            			<td nowrap width="20%" ><div align="right"><b>Name :</b></div></td>
            			<td nowrap width="30%" colspan="3"> 
              				<div align="left"> 
                				<input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>" readonly>
              				</div>
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap width="20%"><div align="right"><b>Account :</b></div></td>
            			<td nowrap width="30%"> 
              				<div align="left"> 
                				<input type="text" name="E01ACMACC" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" readonly>
              				</div>
            			</td>
            			<td nowrap width="20%"><div align="right"><b>Currency :</b></div></td>
            			<td nowrap width="30%"> 
              				<div align="left">
                				<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                			</div>
            			</td>
          			</tr>
          			<TR id="trdark">
            			<td nowrap width="20%"><div align="right"><b>Product : </b></div></td>
            			<td nowrap width="30%"> 
              				<div align="left">
                				<input type="text" name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>" readonly>
                			</div>
            			</td>
            			<td nowrap width="20%"><div align="right"><b>Available Amount :</b></div></td>
            			<td nowrap width="30%"> 
              				<div align="left">
                				<input type="text" name="E01AVALBL" size="20" maxlength="15" value="<%= Util.formatCCY(userPO.getHeader12()) %>" readonly>
                			</div>
            			</td>
					</TR>
        		</table>
      		</td>
    	</tr>
  	</table>
  	
  	<br>

<% if ( EWD0343Help.getNoResult() ) {  %>
		<TABLE class="tbenter" width=100% >
   			<TR>
      			<TD><div align="center"><p><b> There is no match for your search criteria </b></p></div>
      			<br>
         
<%	  			if (userPO.getHeader5().equals("M")) { 
				 	if (userPO.getPurpose().equals("NEW")) {
%>      
	     				<table class="tbenter" width=100% align=center>
	      					<tr>    
	        					<td ALIGN=CENTER width="50%">
	        						<div align="center">
	        							<a href="javascript:goAction()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/new_over.gif',1)">
	        							<img name="Image1" alt="New" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a>
	        						</div>
	        					</td>
	        					<td ALIGN=CENTER width="50%">
	        						<div align="center">
	        							<a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/EXIT1.gif',1)">
	        							<img name="Image2" alt="Exit" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
	        						</div>
	        					</td>
	      					</tr>
	    				</table>
<%  				 } else { %>	    				
	     				<table class="tbenter" width=100% align=center>
	      					<tr>    
	        					<td ALIGN=CENTER width="100%">
	        						<div align="center">
	        							<a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/EXIT1.gif',1)">
	        							<img name="Image2" alt="Exit" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
	        						</div>
	        					</td>
	      					</tr>
	    				</table>
<%					} %>    				
    				<p>&nbsp;</p>
<%				} %>
      			</TD>
      		</TR>
   		</TABLE>
<% } else { %>	

<form>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }

%> 

  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
    <INPUT TYPE=HIDDEN NAME="opt">
    <input type=HIDDEN name="totalRow" value="0">
  </p>  

<% if ( userPO.getHeader5().equals("M") ) { 
		if (userPO.getPurpose().equals("NEW")) {
%>
		   	<table class="tbenter" width=100% align=center>
		      	<tr> 
					<td ALIGN=CENTER width="50%">
						<div align="center">
							<a href="javascript:goAction()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/new_over.gif',1)">
							<img name="Image1" alt="New" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a>
						</div>
					</td>
					<td ALIGN=CENTER width="50%">
						<div align="center">
							<a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/EXIT1.gif',1)">
							<img name="Image2" alt="Exit" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
						</div>
					</td>
		      	</tr>
		    </table>
<% 		} else { %>	
		   	<table class="tbenter" width=100% align=center>
		      	<tr> 
					<td ALIGN=CENTER width="100%">
						<div align="center">
							<a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/EXIT1.gif',1)">
							<img name="Image2" alt="Exit" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
						</div>
					</td>
		      	</tr>
		    </table>
<% 		}
	} 
%>	
     
<br> 

  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"><div align="center">Customer<br>Code</div></th>
            <th align=CENTER nowrap width="30%">Customer<BR>Name</th>
            <th align=CENTER nowrap width="20%">Card<BR>Product</th>
            <th align=CENTER nowrap width="10%">Card<br>Number</th>
            <th align=CENTER nowrap width="10%">Card<br>Type</th>
            <th align=CENTER nowrap width="20%">Status</th>
          </tr>
        </table>
        <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
     	<%
        EWD0343Help.initRow(); 
		boolean firstTime = true;
		int k = 0;
		String chk = "";
        while (EWD0343Help.getNextRow()) {
	        k++;
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
			datapro.eibs.beans.EWD0343DSMessage msgList = (datapro.eibs.beans.EWD0343DSMessage) EWD0343Help.getRecord();
			String action = "goUpdate";
			if (msgList.getRWDTYP().equals("1"))  {
				action = "goUpdate";
			} else {
				if (msgList.getRWDTYP().equals("4")) {
				    action = "goActivate";
				} else {
					if (msgList.getRWDTYP().equals("5")) {
					    action = "goChangeStatus";
					} else {
						if (msgList.getRWDTYP().equals("6")) {
						    action = "goReplace";
						} else {
							action = "goInquiry";
						}
					}
				}
			}		
			if (!userPO.getPurpose().equals("NEW")) {
		%>
	    	  <TR>	
				<TD NOWRAP  ALIGN=CENTER width="10%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')"><%= msgList.getSWDCUN()%></A></TD>
				<TD NOWRAP  ALIGN=LEFT width="30%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')"><%= msgList.getSWDNA1()%></A></TD>
				<TD NOWRAP  ALIGN=CENTER width="20%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')"><%= msgList.getSWDDSC()%></A></TD>
				<TD NOWRAP  ALIGN=LEFT width="10%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')"><%= msgList.getSWDPCN()%></A></TD>
				<TD NOWRAP  ALIGN=CENTER width="10%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')"><%= msgList.getSWDVIP().equals("P") ? "PRIMARY" : "ADDITIONAL" %></A></TD>
				<TD NOWRAP  ALIGN=LEFT width="20%"><A HREF="javascript:<%= action %>('<%= msgList.getSWDACC()%>', '<%= msgList.getSWDCUN()%>')">
					<% 	if(msgList.getSWDSTS().equals("0")) 	out.println("REQUESTED BY CLIENT"); 
						else if(msgList.getSWDSTS().equals("A")) out.println("REQUESTED TO PROVIDER");
						else if(msgList.getSWDSTS().equals("B")) out.println("PREACTIVATED");
						else if(msgList.getSWDSTS().equals("C")) out.println("EMBOSSED"); 
						else if(msgList.getSWDSTS().equals("D")) out.println("SENT TO PROVIDER"); 
						else if(msgList.getSWDSTS().equals("E")) out.println("RECEIVED AT BANK"); 
						else if(msgList.getSWDSTS().equals("F")) out.println("SENT TO REGIONAL OFFICE"); 
						else if(msgList.getSWDSTS().equals("G")) out.println("SENT TO CLIENT"); 
						else if(msgList.getSWDSTS().equals("1")) out.println("ACTIVATED"); 
						else if(msgList.getSWDSTS().equals("2")) out.println("LOST"); 
						else if(msgList.getSWDSTS().equals("3")) out.println("BLOCKED"); 
						else if(msgList.getSWDSTS().equals("H")) out.println("BLOCKED BY CLIENT"); 
						else if(msgList.getSWDSTS().equals("I")) out.println("BLOCKED BY BANK"); 
						else if(msgList.getSWDSTS().equals("4")) out.println("STOLEN"); 
						else if(msgList.getSWDSTS().equals("5")) out.println("EXPIRED"); 
						else if(msgList.getSWDSTS().equals("6")) out.println("DESTROYED"); 
						else if(msgList.getSWDSTS().equals("7")) out.println("NULIFIED"); 
						else if(msgList.getSWDSTS().equals("8")) out.println("DENIED"); 
						else out.println(msgList.getSWDSTS());%></A></TD>
				</TR>
			<% } else { %>				
		    	  <TR>	
					<TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getSWDCUN()%></TD>
					<TD NOWRAP  ALIGN=LEFT width="30%"><%= msgList.getSWDNA1()%></TD>
					<TD NOWRAP  ALIGN=CENTER width="20%"><%= msgList.getSWDDSC()%></TD>
					<TD NOWRAP  ALIGN=LEFT width="10%"><%= msgList.getSWDPCN()%></TD>
					<TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getSWDVIP().equals("P") ? "PRIMARY" : "ADDITIONAL" %></TD>
					<TD NOWRAP  ALIGN=LEFT width="20%">
						<% 	if(msgList.getSWDSTS().equals("0")) 	out.println("REQUESTED BY CLIENT"); 
							else if(msgList.getSWDSTS().equals("A")) out.println("REQUESTED TO PROVIDER");
							else if(msgList.getSWDSTS().equals("B")) out.println("PREACTIVATED");
							else if(msgList.getSWDSTS().equals("C")) out.println("EMBOSSED"); 
							else if(msgList.getSWDSTS().equals("D")) out.println("SENT TO PROVIDER"); 
							else if(msgList.getSWDSTS().equals("E")) out.println("RECEIVED AT BANK"); 
							else if(msgList.getSWDSTS().equals("F")) out.println("SENT TO REGIONAL OFFICE"); 
							else if(msgList.getSWDSTS().equals("G")) out.println("SENT TO CLIENT"); 
							else if(msgList.getSWDSTS().equals("1")) out.println("ACTIVATED"); 
							else if(msgList.getSWDSTS().equals("2")) out.println("LOST"); 
							else if(msgList.getSWDSTS().equals("3")) out.println("BLOCKED"); 
							else if(msgList.getSWDSTS().equals("H")) out.println("BLOCKED BY CLIENT"); 
							else if(msgList.getSWDSTS().equals("I")) out.println("BLOCKED BY BANK"); 
							else if(msgList.getSWDSTS().equals("4")) out.println("STOLEN"); 
							else if(msgList.getSWDSTS().equals("5")) out.println("EXPIRED"); 
							else if(msgList.getSWDSTS().equals("6")) out.println("DESTROYED"); 
							else if(msgList.getSWDSTS().equals("7")) out.println("NULIFIED"); 
							else if(msgList.getSWDSTS().equals("8")) out.println("DENIED"); 
							else out.println(msgList.getSWDSTS());%></TD>
					</TR>
    	<%		}
    	  	}	%>   
  </table>

 </div>
</Table>
  <br>
  <table class="tbenter" width="98%" align=CENTER>
    <tr> 
      <td width="50%" align=LEFT> <%
        if ( EWD0343Help.getShowPrev() ) {
      			int pos = EWD0343Help.getFirstRec() - 21;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSEWD0343?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %> </td>
      <td width="50%" align=RIGHT> <% 
        if ( EWD0343Help.getShowNext() ) {
      			int pos = EWD0343Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cards.JSEWD0343?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> </td>
    </tr>
  </table>
  <p>&nbsp;</p>

<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
</SCRIPT>

</form>
<% } %>
</body>
</html>
