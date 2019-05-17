<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Client Mail Address</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "mailA" class= "datapro.eibs.beans.ESD000004Message"  scope="session"/>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_inq_personal_opt);
  <%      
   } else {
   		if ( userPO.getCusType().equals("P") ) {
   %>
   		builtNewMenu(cus_port_opt);
  <% 	} else {   %>
			builtNewMenu(client_inq_corp_opt);
   <%
   		}
   }
   %>

</SCRIPT>

<body onbeforeprint="showOpt(true)" onafterprint="showOpt(false)">

 

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>

<h3 align="center">Mailing Address<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_both_mail_address, ESD0080" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="34">
  
<p>
<table  class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" align="center">
        <tr>
             
            <td nowrap width="10%" align="right"> Customer: </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Name: </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p></p>

<div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  int bene_amount = 8;
  String name;
  for ( int i=1; i<=bene_amount; i++ ) {
    if ( i == 10 ) {
      name = "A"; 
    }
    else {
      name = i + "";
    }
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%> 
 <td align="left"><h4>First</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Second</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Third</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Forth</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Fifth</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sixth</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>Seventh</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Eighth</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Ninth</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>Tenth</h4></td>
<%          
           break;
     }
  out.println("<td width=\"30%\" align=\"right\">");
  out.println("<h4>");
  out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>");
   out.println("</h4>"); 
  out.println("</td>");   
  out.println("</tr>");
  out.println("</table>"); 
%>

  <table id="mainTable<%= name %>" class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= mailA.getField("E" + name + "4MA1").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Address 
                :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA2").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA3").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA4" maxlength="35" size="36" value="<%= mailA.getField("E" + name + "4MA4").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= mailA.getField("E" + name + "4CTY").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">State :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= mailA.getField("E" + name + "4STE").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= mailA.getField("E" + name + "4CTR").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">P.O.Box :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= mailA.getField("E" + name + "4POB").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= mailA.getField("E" + name + "4ZPC").getString().trim()%>" readonly>
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Mailing Code :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MLC" maxlength="3" size="4" value="<%= mailA.getField("E" + name + "4MLC").getString().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <%
  }
%>
</div>
<SCRIPT Language="Javascript">
   showOpt(false);
</SCRIPT>
    </form>
</body>
</html>
