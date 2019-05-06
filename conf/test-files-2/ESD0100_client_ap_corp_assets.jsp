<html>
<head>
<title>Customer Assets </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "assets" class= "datapro.eibs.beans.ESD000004Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>


<SCRIPT Language="Javascript">

  builtNewMenu(client_ap_corp_opt);

</SCRIPT>

</head>

<body onbeforeprint="showOpt(true)" onafterprint="showOpt(false)">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();</SCRIPT>");
 }
%> 
<h3 align="center">Customer Assets <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_ap_corp_assets, ESD0100"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="18">
  </p>
   
<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"  align="center">
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

<BR>
<div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  int bene_amount = 9;
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
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>");
   out.println("</h4>"); 
  out.println("</td>");   
  out.println("</tr>");
  out.println("</table>"); 
%>

  <table id="mainTable<%= name %>" class="tableinfo" >
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= assets.getField("E" + name + "4MA1").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Address :</div>
            </td>
            <td nowrap width="66%"> 
              <input type="text" readonly name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= assets.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= assets.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">City :</div>
            </td>
            <td nowrap width="66%"> 
              <input type="text" readonly name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= assets.getField("E" + name + "4CTY").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right">State :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4STE" maxlength="4" size="5" value="<%= assets.getField("E" + name + "4STE").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" readonly name="E<%= name %>4CTR" maxlength="30" size="31" value="<%= assets.getField("E" + name + "4CTR").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">P.O.Box :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4ZPC").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Telephone :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= assets.getField("E" + name + "4HPN").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right">Purchase Value :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4AM1" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4AM1").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Actual Value :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" readonly name="E<%= name %>4AM2" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4AM2").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%">
              <div align="right">Purchase Date :</div>
            </td>
            <td nowrap width="66%" >
              <div align="left">
                <input type="text" readonly name="E<%= name %>4DT1" size="2" maxlength="2" value="<%= assets.getField("E" + name + "4DT1").getString().trim()%>">
                <input type="text" readonly name="E<%= name %>4DT2" size="2" maxlength="2" value="<%= assets.getField("E" + name + "4DT2").getString().trim()%>">
                <input type="text" readonly name="E<%= name %>4DT3" size="2" maxlength="2" value="<%= assets.getField("E" + name + "4DT3").getString().trim()%>">
              </div>
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
