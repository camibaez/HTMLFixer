<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
 
 function enter(code,numc,id,prod,card,apc) {
	if (top.opener.document.forms[0] != null) {
		if (top.opener.document.forms[0].name == "loan_basic") {
			var form = top.opener.document.forms[0];
			form[top.opener.fieldName].value = code; 
			top.close();
		} else {
			parent.query.enterAction(code,numc,id,prod,card,apc);
		}
	} else {
		parent.query.enterAction(code,numc,id,prod,card,apc);
	}
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0005Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( ewd0005Help.getNoResult() ) {
		String sMsg = "";
		if (userPO.getHeader1().equals("*")) {
			sMsg = "User does not have authority level to see this account";
		} else {
			//sMsg = "There is no match for your search criteria";
			sMsg = "Your search criteria does not exist in files";
		}
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b><%= sMsg %> </b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
		
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="37%">Customer Name</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Account</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Branch</TH>
      <TH ALIGN=CENTER  nowrap width="3%">CCY</TH>
      <TH ALIGN=CENTER  nowrap width="3%">Type</TH>
      <TH ALIGN=CENTER  nowrap width="3%">Prod.</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Amount</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Remark</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Status</TH>
    </TR>
    <%
                String shrBank = (String)session.getAttribute("shrBank");
                String NameSearch = (String)session.getAttribute("NameSearch");
                String shrAppCode = (String)session.getAttribute("shrAppCode");
                String shrSelect = (String)session.getAttribute("shrSelect");
                String pageCalling = (String)session.getAttribute("pageCalling");                
                String shrAcc ="";         
                String shrClient = (String)session.getAttribute("shrClient");
                String shrType = (String)session.getAttribute("shrType"); 
                String shrSTATUS = (String)session.getAttribute("shrSTATUS");                
                ewd0005Help.initRow();               
                while (ewd0005Help.getNextRow()) {
                    EWD0005DSMessage msgHelp = (EWD0005DSMessage) ewd0005Help.getRecord();			 
                    
       %>             
                    
          <TR>
          <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
          							  <img src="<%=request.getContextPath()%>/images/title_16.gif" title="<%=msgHelp.getEWDTIT()%>" border="0">
          							  <%=Util.formatCell(msgHelp.getEWDNME())%></a>
		  </td>
		  <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDACC())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDBRN())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDCCY())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDATY())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDPRD())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.fcolorCCY(msgHelp.getEWDAMT())%></a>
		  </td>
		  <td NOWRAP title="<%=msgHelp.getEWDOCU()%>">
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')" >
									    <%=Util.formatCell(msgHelp.getEWDNAR())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDNTA()%>',
          							  '<%=msgHelp.getEWDSCA()%>')">
										<%=Util.formatCell(msgHelp.getEWDSTS())%></a>
		  </td>
		</TR>
        <%        }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0005Help.getShowPrev() ) {
      			int pos =ewd0005Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrSTATUS=" + shrSTATUS + "&pageCalling=" + pageCalling + "\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0005Help.getShowNext() ) {
      			int pos = ewd0005Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrSTATUS=" + shrSTATUS + "&pageCalling=" + pageCalling + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>