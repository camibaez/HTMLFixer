<html>
<head>
<title>Corporate Officers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "stockHolder" class= "datapro.eibs.beans.ESD000004Message"  scope="session"/>

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
    out.println("<SCRIPT>  initMenu();</SCRIPT>");
 }
%> 
<h3 align="center">Corporate Officers<img src="<%=request.getContextPath()%>/images/e_ibs.gif"  align="left" name="EIBS_GIF" ALT="client_ap_corp_stock_holder, ESD0100"></h3>
<hr size="4">

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">

<p>
<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
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
</p>
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

  <table id="mainTable<%= name %>" class="tableinfo">
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
         <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Customer Number :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4RCN" maxlength="9" size="10" value="<%= stockHolder.getField("E" + name + "4RCN").getString().trim()%>" readonly>
              </td>
          </tr>
		  <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Name :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" readonly name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= stockHolder.getField("E" + name + "4MA1").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Address :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4MA2").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right"></div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4MA3").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">City :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= stockHolder.getField("E" + name + "4CTY").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">State :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4STE" maxlength="4" size="5" value="<%= stockHolder.getField("E" + name + "4STE").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Country :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= stockHolder.getField("E" + name + "4CTR").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">P.o. Box :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4POB" maxlength="10" size="11" value="<%= stockHolder.getField("E" + name + "4POB").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Zip Code : </div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= stockHolder.getField("E" + name + "4ZPC").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Citizenship :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= stockHolder.getField("E" + name + "4BNC").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Title :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4MA4" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4MA4").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Date :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4DT1" maxlength="2" size="2" value="<%= stockHolder.getField("E" + name + "4DT1").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4DT2" maxlength="2" size="2" value="<%= stockHolder.getField("E" + name + "4DT2").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4DT3" maxlength="2" size="2" value="<%= stockHolder.getField("E" + name + "4DT3").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Profession :</div>
            </td>
            <td width="58%" nowrap > 
              <p> 
                <input type="text" readonly name="E<%= name %>4MLC" value="<%= stockHolder.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4">
              </p>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">In the Capacity of :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4INC" maxlength="4" size="5" value="<%= stockHolder.getField("E" + name + "4INC").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Marital Status :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" readonly  name="E<%= name %>4BMS" size="25" maxlength="30" 
				  value="<% if (stockHolder.getField("E" + name + "4BMS").getString().equals("1")) out.print("Married");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("2")) out.print("Single");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("3")) out.print("Divorced");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("4")) out.print("Widower");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("5")) out.print("Cohabitant");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Gender :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly  name="E<%= name %>4BSX" size="20" maxlength="25" 
				  value="<% if (stockHolder.getField("E" + name + "4BSX").getString().equals("F")) out.print("Female");
							else if (stockHolder.getField("E" + name + "4BSX").getString().equals("M")) out.print("Male");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Telephone :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= stockHolder.getField("E" + name + "4HPN").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Identification :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNI" maxlength="15" size="16" value="<%= stockHolder.getField("E" + name + "4BNI").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" > 
              <div align="right">Type :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" readonly name="E<%= name %>4TID" value="<%= stockHolder.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Country :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4PID" size="5" maxlength="4" value="<%= stockHolder.getField("E" + name + "4PID").getString().trim()%>">
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
