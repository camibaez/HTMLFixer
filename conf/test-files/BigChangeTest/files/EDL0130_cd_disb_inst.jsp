<html>
<head>
<title>Payment Disbursement Instructions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdDisb" class= "datapro.eibs.beans.ESD000008Message"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
    builtNewMenu(cd_m_opt);
    initMenu();
</script>

</head>

<body onbeforeprint="showOpt(true)" onafterprint="showOpt(false)">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Payment Disbursement Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_disb_inst.jsp, EDL0130"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="51">
<p>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Portfolio/Customer :</b></div>
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
                <input type="text" name="E01NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E08ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
  int paym_amount = 9;
  String name;
  for ( int i=1; i<=paym_amount; i++ ) {
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
    <tr >
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Beneficiary Number :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E<%= name %>1BCU" maxlength="9" size="10" value="<%= cdDisb.getField("E" + name + "1BCU").getString().trim()%>" onKeypress="enterInteger()">
              <a href="javascript:GetCustomerDescId('E<%= name %>1BCU','E<%= name %>1BN1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
			</td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Beneficiary Name :</div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BN1" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1BN1").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Address :</div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BN2" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1BN2").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right"></div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BN3" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1BN3").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right"></div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BN4" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1BN4").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right"></div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BN5" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1BN5").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Amount / Percentage :</div>
            </td>
            <td width="58%" nowrap>
              <input type="text" name="E<%= name %>1AMP" maxlength="13" size="15" value="<%= cdDisb.getField("E" + name + "1AMP").getString().trim()%>">
             </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Amount / Percentage Flag :</div>
            </td>
            <td width="58%" nowrap >
              <input type="radio" name="E<%= name %>1FLG" value="F" <% if (cdDisb.getField("E" + name + "1FLG").getString().equals("F")) out.print("checked"); %> >
              Fixed
              <input type="radio" name="E<%= name %>1FLG" value="%" <% if (cdDisb.getField("E" + name + "1FLG").getString().equals("%")) out.print("checked"); %> >
              Percentage
			</td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Payment Via :</div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1PVI" maxlength="4" size="5" value="<%= cdDisb.getField("E" + name + "1PVI").getString().trim()%>">
              <a href="javascript:GetCode('E<%= name %>1PVI','STATIC_cd_pmnt_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a>
              </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Credit Account :</div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1BAC" maxlength="9" size="10" value="<%= cdDisb.getField("E" + name + "1BAC").getString().trim()%>" onKeypress="enterInteger()">
			  <a href="javascript:GetAccount('E<%= name %>1BAC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
              </td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">P/O Reference No. :</div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1POR" maxlength="20" size="21" value="<%= cdDisb.getField("E" + name + "1POR").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear">
            <td width="42%" nowrap>
              <div align="right">Principal / Interest Flag :</div>
            </td>
            <td width="58%" nowrap >
              <input type="radio" name="E<%= name %>1PIN" value="P" <% if (cdDisb.getField("E" + name + "1PIN").getString().equals("P")) out.print("checked"); %> >
              Principal
              <input type="radio" name="E<%= name %>1PIN" value="I" <% if (cdDisb.getField("E" + name + "1PIN").getString().equals("I")) out.print("checked"); %> >
              Interest
			</td>
          </tr>
          <tr id="trdark">
            <td width="42%" nowrap>
              <div align="right">Remarks : </div>
            </td>
            <td width="58%" nowrap >
              <input type="text" name="E<%= name %>1RM1" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1RM1").getString().trim()%>"> </td>
          </tr>
          <TR id="trclear">
            <TD></TD>
            <TD><input type="text" name="E<%= name %>1RM2" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1RM2").getString().trim()%>"></TD>
          </TR>
          <TR id="trdark">
            <TD></TD>
            <TD><input type="text" name="E<%= name %>1RM3" maxlength="35" size="36" value="<%= cdDisb.getField("E" + name + "1RM3").getString().trim()%>"></TD>
          </TR>
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
