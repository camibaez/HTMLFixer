<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Signers</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtFirm" class= "datapro.eibs.beans.ESD000004Message"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT Language="Javascript">
<%
	if(userPO.getOption().equals("RT")){
%>
     builtNewMenu(rt_m_opt);
<%
	}
	else if(userPO.getOption().equals("SV")){
%>
    builtNewMenu(sv_m_opt);
<%
	}
%>

   function checkDel(obj){
     if (obj.checked) obj.value="X"; else obj.value="";
   }
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

    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Signers<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_firm, EDD0000"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
<p>
</p>

  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E04CUN" size="12" maxlength="12" value="<%= rtFirm.getE04CUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
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
 <td align="left"><h4>Fourth</h4></td>
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
    <tr>
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Customer Number : </div>
            </td>
            <td nowrap>
              <input type="text" name="E<%= name %>4RCN" maxlength="9" size="9" value="<%= rtFirm.getField("E" + name + "4RCN").getString().trim()%>">
			  <a href="javascript:javascript:GetCustomerDescId('E<%= name %>4RCN','E<%= name %>4MA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>            </td>
            <td nowrap align=right>
              Delete Data <input type="checkbox" name="E<%= name %>4FL3" value="" onClick="checkDel(this)">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">Legal Name : </div>
            </td>
            <td nowrap colspan=2>
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= rtFirm.getField("E" + name + "4MA1").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Address : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= rtFirm.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right"></div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= rtFirm.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>         
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">City : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= rtFirm.getField("E" + name + "4CTY").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">State : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= rtFirm.getField("E" + name + "4STE").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Country : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= rtFirm.getField("E" + name + "4CTR").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">P.O. Box : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= rtFirm.getField("E" + name + "4POB").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Zip Code : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= rtFirm.getField("E" + name + "4ZPC").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">D.O.B. :</div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4DT1" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT1").getString().trim()%>">
              <input type="text" name="E<%= name %>4DT2" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT2").getString().trim()%>">
              <input type="text" name="E<%= name %>4DT3" maxlength="2" size="4" value="<%= rtFirm.getField("E" + name + "4DT3").getString().trim()%>">
              <a href="javascript:DatePicker(document.forms[0].E<%= name %>4DT1,document.forms[0].E<%= name %>4DT2,document.forms[0].E<%= name %>4DT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Identification : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4BNI" maxlength="15" size="15" value="<%= rtFirm.getField("E" + name + "4BNI").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">Telephone : </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= rtFirm.getField("E" + name + "4HPN").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap>
              <div align="right">Type of Signature: </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <select name="E<%= name %>4FL1">
                <option value=" " <% if (!(rtFirm.getField("E" + name + "4FL1").getString().equals("1") ||rtFirm.getField("E" + name + "4FL1").getString().equals("2"))) out.print("selected"); %>></option>
                <option value="1" <%if (rtFirm.getField("E" + name + "4FL1").getString().equals("1")) out.print("selected"); %>>Individual Sign</option>
                <option value="2" <% if (rtFirm.getField("E" + name + "4FL1").getString().equals("2")) out.print("selected"); %>>Joint Sign</option>
              </select>
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">Title/Position: </div>
            </td>
            <td width="23%" nowrap colspan=2>
 				<input type="text" name="E<%= name %>4MLC" value="<%= rtFirm.getField("E" + name + "4MLC").getString().trim()%>" size="4" maxlength="3">
 				<a href="javascript:GetCodeCNOFC('E<%= name %>4MLC','32')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
             </td>
          </tr>
          <tr id="trdark">
            <td width="13%" nowrap >
              <div align="right">Limit Amount: </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4AM1" value="<%= rtFirm.getField("E" + name + "4AM1").getString().trim()%>" size="15" maxlength="15">
            </td>
          </tr>
          <tr id="trclear">
            <td width="13%" nowrap>
              <div align="right">Narrative: </div>
            </td>
            <td width="23%" nowrap colspan=2>
              <input type="text" name="E<%= name %>4MA4" size="35" maxlength="35" value="<%= rtFirm.getField("E" + name + "4MA4").getString().trim()%>">
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
  <br>
 <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
