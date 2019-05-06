<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0092DSMessage"%>
<%@page import="datapro.eibs.master.Util"%><html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<TITLE>Lista de Control</TITLE>
</head>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "EWD0092HelpDetail" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<BODY>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
function goDetail(coun) {
	CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN000?SCREEN=3&E01DCOUN=' + coun + '&H01USR=<%=currUser.getH01USR().trim()%>',600,500,2);
}

</script>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/wz_tooltip.js"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/tip_centerwindows.js"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/tip_followscroll.js"> </SCRIPT>
<FORM>
<%
	String shrAcc = request.getParameter("shrAcc");
	String shrCategory = request.getParameter("shrCategory");
	String shrAction = request.getParameter("shrAction");
	String shrSeq = request.getParameter("Seq");
	String shrName = request.getParameter("Name");
%>
  <h3 align="center">Control List Detail</h3>
	<TABLE class="tableinfo" align="center" width="95%" height="40" style="width:'95%'">
    <TR>
    	<TH width="30%" align="right">Search   name:</TH>
    	<TH width="70%" align="left"><%=shrName%></TH>
    </TR>
  </TABLE>
<%
if ( EWD0092HelpDetail.getNoResult() ) {
%>
     <TABLE class="tbenter" width="100%" height="100%" >
     <TR>
     <TD> 
     <div align="center"><b>There are not registers to shown</b> 
     </div>
     </TD>
    </TR>
     </TABLE>
<%
} else { %>
<TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
          <TH ALIGN=CENTER  nowrap width="35%">Name in list   </TH>
          <TH ALIGN=CENTER  nowrap width="15%">List</TH>
		  <TH ALIGN=CENTER  nowrap width="15%">Class</TH>
     </TR>
    <%
    	String strSearch = "";
   		EWD0092HelpDetail.initRow();
        while (EWD0092HelpDetail.getNextRow()) {
        	EWD0092DSMessage msgHelp = (EWD0092DSMessage)EWD0092HelpDetail.getRecord();
					
			String strClass = ""; 
			int count = 0;
			try {
				count = Util.parseInt(msgHelp.getEWDCLS().substring(1));																			
   				strClass = (msgHelp.getEWDCLS().charAt(0) == 'H' ? 
					"HIGH" : (msgHelp.getEWDCLS().charAt(0) == 'M' ? 
						"MODERATE" : (msgHelp.getEWDCLS().charAt(0) == 'W' ? 
							"LOW" : "")));
			} catch (Exception e) {}
	%>
     	<TR>
	<%
				if(count > 1){
	%>
		<TD align="left" valign="top">
			<span style='cursor:pointer' style="color: red"
				onmouseover="TagToTip('addinfo<%=msgHelp.getEWDDCOUN()%>', SHADOW, true, COPYCONTENT, false, FOLLOWMOUSE, false, CLICKCLOSE, true, STICKY, true, LEFT, true, SHADOWWIDTH, 10)"
				onmouseout='UnTip()'> 
				<%=msgHelp.getEWDMFN()%>
			</span>
		</TD>
		<TD NOWRAP align="center">
			<span style='cursor:pointer' style="color: red"
				onmouseover="TagToTip('addinfo<%=msgHelp.getEWDDCOUN()%>', SHADOW, true, COPYCONTENT, false, FOLLOWMOUSE, false, CLICKCLOSE, true, STICKY, true, LEFT, true, SHADOWWIDTH, 10)"
				onmouseout='UnTip()'> 
				<%=" ("+count+")"%>
			</span>
			<div id='addinfo<%=msgHelp.getEWDDCOUN()%>' style='width:300;display:none' >
				<table width='100%' style='white-space:nowrap' >
					<tr>
					<th>List</th>
					<th>Class</th>
					</tr>
	<%
					for(int i=0;i<count;i++) {
        				strClass = (msgHelp.getEWDCLS().charAt(0) == 'H' ? 
							"HIGH" : (msgHelp.getEWDCLS().charAt(0) == 'M' ? 
								"MODERATE" : (msgHelp.getEWDCLS().charAt(0) == 'W' ? 
									"LOW" : "")));
	%>
					<tr>
					<td align="center"><A HREF="javascript:goDetail('<%=msgHelp.getEWDDCOUN().trim()%>')"><%=msgHelp.getEWDOTC()%></A></td>
					<td align="center"><A HREF="javascript:goDetail('<%=msgHelp.getEWDDCOUN().trim()%>')"><%=strClass%></A></td>
					</tr>
	<%
						if(EWD0092HelpDetail.getNextRow()){
        					msgHelp = (EWD0092DSMessage)EWD0092HelpDetail.getRecord();
						}
            		} 
	%>
				</table>
			</div>
		</TD>
		<TD NOWRAP align="center"></TD>
	<%	
				} else {
	%>
		<TD align="left" valign="top">
			<A HREF="javascript:goDetail('<%=msgHelp.getEWDDCOUN().trim()%>')"><%=msgHelp.getEWDMFN()%></A>
		</TD>
		<TD NOWRAP align="center">
			<A HREF="javascript:goDetail('<%=msgHelp.getEWDDCOUN().trim()%>')"><%=msgHelp.getEWDOTC()%></A>
		</TD>
		<TD NOWRAP align="center">
			<A HREF="javascript:goDetail('<%=msgHelp.getEWDDCOUN().trim()%>')"><%=strClass%></A>
		</TD>
	<%		
				}
	%>
		</TR> 
	<%
			strSearch = msgHelp.getEWDMFN();
		}
     %>
  </TABLE>
  <TABLE  class="tbenter" WIDTH="95%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0092HelpDetail.getShowPrev() ) {
      		int pos =EWD0092HelpDetail.getFirstRec() - 51;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + shrAcc + "&shrCategory="+shrCategory+"&Seq="+shrSeq+"&Name="+shrName+"&FromRecord="+pos+"&shrAction="+shrAction+"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");        
        }
    %> 
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0092HelpDetail.getShowNext() ) {
      		int pos = EWD0092HelpDetail.getLastRec();
		    out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + shrAcc + "&shrCategory="+shrCategory+"&Seq="+shrSeq+"&Name="+shrName+"&FromRecord="+pos+"&shrAction="+shrAction+"\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");
        }
%> 
  </TD>
  </TR>
	<TR>
  		<TD width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Close" onClick="self.close();">
     	  </div>	
  		</TD>
	</TR>	
  </TABLE>
<%      
  }
%> 

</FORM>
</BODY>
</HTML>