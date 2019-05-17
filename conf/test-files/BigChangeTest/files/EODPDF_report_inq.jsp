<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>EOD Reports Selection</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="beanListRepUser" class="datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_m_opt);
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   /*showPopupHelp();*/
   }


function valDate(DTFMT, vdate){
//must be 3 array elements (d/m/y) depends on formatDate
var dateArray=vdate.value.split("/");
var day = 0;
var month = 0;
var year = 0;
if (dateArray.length == 3) {
 if (dateArray[0].length == 0 || dateArray[1].length == 0 || dateArray[2].length == 0) {
 invalidDate(vdate);
 }
 else if (DTFMT == 'MDY') {
        day = dateArray[1];
	 month =dateArray[0];
	 year =dateArray[2];
      } else if (DTFMT == 'DMY') {
               day = dateArray[0];
	        month =dateArray[1];
	        year =dateArray[2];
             } else if (DTFMT == 'YMD') {
                      day = dateArray[2];
	               month =dateArray[1];
	               year =dateArray[0];
	             } else {invalidDate(vdate);}
 if (!isDate(year,month,day)) invalidDate(vdate);
 else {
	vdate.value = fDate(vdate.value,DTFMT);
   	return true;
 }
}
 else invalidDate(vdate);
}

function invalidDate(vDate){
vDate.select();
vDate.focus();
alert("Invalid date!");
}


</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } else {
/*  int screen = Integer.parseInt(request.getParameter("SCREEN"));*/
	ESS0030DSMessage msgUser = null;
	session = (HttpSession)request.getSession(false);
	String formatDate = "MDY"; //default
	if (session != null) {
          msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getValue("currUser");
          formatDate = msgUser.getE01DTF();
	}
 
%>

<h3 align="center"> EOD Reports Selection </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEODPDF" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
      	  <tr id="trdark">
            <td nowrap width="11%" > 
              <div align="right"><b>Report :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
		<SELECT name="REPNAME" >
		 <% try {
                      beanListRepUser.initRow();
                      String sel = "";
		        String colData  = "";
			 boolean firstTime = true;
			 out.println("<OPTION selected value=\"\" >  </OPTION>");
                      while (beanListRepUser.getNextRow()){
                         colData = beanListRepUser.getRecord();
       		     if (beanListRepUser.getFlag().equals(""))
		              out.println("<OPTION value=\"" + colData.substring(0,10) + "\" " + " >" + colData + "</OPTION>");
                      }
                  } 
		    catch (Exception e){
                         out.println("Exception : " + e);
                  } %>
              </SELECT>
             </div>
            </td>
            <td > 
            </td>
          </tr>
   <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>From :</b></div>
            </td>
            <td nowrap width="7%" > 
              <div align="left"> 
                <input type="text" onBlur="valDate('<%=formatDate %>',document.forms[0].DATEFROM)" name="DATEFROM" size="10" value="">
              </div>
            </td>
	        <td nowrap width="20%" > 
              <div align="right"><b>To :</b></div>
            </td>
            <td nowrap width="7%" > 
              <div align="left"> 
                <INPUT type="text" onblur="valDate('<%=formatDate %>',document.forms[0].DATETO)" name="DATETO" size="14" value="">
              </div>
            </td>
            <td nowrap width="20%" > 
            </td>

        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<p> &nbsp</p>
<p> &nbsp</p>
<TABLE border="0" width="607" class="TBENTER">
  <TBODY>
    <TR>
      <TD></TD>
      <TD align="left">NOTE : <A href="http://www.acrobat.com" target="_blank">Adobe Acrobat Reader </A> is required to view the reports. If you do not have these programs installed in your system, you may click on the link below to download a free copy.</TD>
      <TD></TD>
    </TR>
    <TR>
      <TD></TD>
      <TD valign="middle" align="center"><A href="http://www.acrobat.com" target="_blank"><IMG src="<%=request.getContextPath()%>/images/e/getacro.gif" width="88" height="31" border="0"></A></TD>
      <TD></TD>
    </TR>
  </TBODY>
</TABLE>  
</form>
<%
out.println("<SCRIPT Language=\"Javascript\">");
out.println("var f1=getActualDate1(\"" + formatDate +"\",true);");
out.println("var f2=getActualDate1(\"" + formatDate +"\",false);");
out.println("document.forms[0].DATEFROM.value = fDate(f1,\"" + formatDate +"\");");
out.println("document.forms[0].DATETO.value = fDate(f2,\"" + formatDate +"\");");
out.println("</SCRIPT>");}
%>

</body>
</html>
