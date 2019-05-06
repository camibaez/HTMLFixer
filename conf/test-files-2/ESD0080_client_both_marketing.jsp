<html>
<head>
<title>Marketing</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="marketing" class="datapro.eibs.beans.ESD008009Message"  scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>
	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 }
%> 

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="48">

  <h3 align="center">Marketing<img src="<%=request.getContextPath()%>/images/e_ibs.gif"  align="left" name="EIBS_GIF" ALT="client_both_marketing, ESD0080"></h3>
<hr size="4">
  <h4 align="left">Would you like to invest? </h4>
<table class="tableinfo">
    <tr > 
      <td nowrap wrap >
        <table  cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">What is your choice in investments ? </div>
            </td>
            <td nowrap width="50%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="hidden" name="E09INV" value="<%= marketing.getE09INV()%>">
              <input type="radio" name="CE09INV" value="1" onClick="document.forms[0].E09INV.value='1'"
			  <%if(marketing.getE09INV().equals("1")) out.print("checked");%>>
              Fix Rate Products</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09INV" value="2" onClick="document.forms[0].E09INV.value='2'"
			  <%if(marketing.getE09INV().equals("2")) out.print("checked");%>>
              Variable Rate Products</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Would you take any risk ?:</div>
            </td>
            <td nowrap width="50%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="hidden" name="E09RSG" value="<%= marketing.getE09RSG()%>">
              <input type="radio" name="CE09RSG" value="1" onClick="document.forms[0].E09RSG.value='1'"
			  <%if(marketing.getE09RSG().equals("1")) out.print("checked");%>>
              High</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09RSG" value="2" onClick="document.forms[0].E09RSG.value='2'"
			  <%if(marketing.getE09RSG().equals("2")) out.print("checked");%>>
              Medium </td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09RSG" value="2" onClick="document.forms[0].E09RSG.value='2'"
			  <%if(marketing.getE09RSG().equals("3")) out.print("checked");%>>
              None</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Activities</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap wrap >
        <table cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">TV Channel :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CTV" value="<%= marketing.getE09CTV().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Favorite Sport :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09DPA" size="20" maxlength="20" value="<%= marketing.getE09DPA().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="25%"> 
              <div align="right">Cable Channel :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CNT" size="20" maxlength="20" value="<%= marketing.getE09CNT().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Current Sport :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09DPP" size="20" maxlength="20" value="<%= marketing.getE09DPP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">AM Radio :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09RD1" value="<%= marketing.getE09RD1().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Favorite Newspaper :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09PER" size="20" maxlength="20" value="<%= marketing.getE09PER().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="25%"> 
              <div align="right">FM Radio :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09RD2" value="<%= marketing.getE09RD2().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Social Club :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CLB" size="20" maxlength="20" value="<%= marketing.getE09CLB().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Favorite Hobby :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09PTP" value="<%= marketing.getE09PTP().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cultural Event :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09EVC" size="20" maxlength="20" value="<%= marketing.getE09EVC().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="25%" rowspan="4"> 
              <div align="right">Charity :</div>
            </td>
            <td nowrap width="25%" rowspan="4"> 
              <input type="text" name="E09OBR" size="20" maxlength="20" value="<%= marketing.getE09OBR().trim()%>">
            </td>
            <td nowrap width="25%" rowspan="4"> 
              <div align="right">Languages :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09LN1" size="20" maxlength="15" value="<%= marketing.getE09LN1().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN2" size="20" maxlength="15" value="<%= marketing.getE09LN2().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN3" size="20" maxlength="15" value="<%= marketing.getE09LN3().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN4" size="20" maxlength="15" value="<%= marketing.getE09LN4().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Internet Preferences </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap wrap >
        <table cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">Do you have internet connection ? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09INT" value="<%= marketing.getE09INT()%>">
              <input type="radio" name="CE09INT" value="Y" onClick="document.forms[0].E09INT.value='Y'"
			  <%if(marketing.getE09INT().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE09INT" value="N" onClick="document.forms[0].E09INT.value='N'"
			  <%if(marketing.getE09INT().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right">What browser do you use the most ? :</div>
            </td>
            <td nowrap width="26%"> 
              <select name="E09NVG">
                <option value=" " <% if (!(marketing.getE09NVG().equals("1") ||marketing.getE09NVG().equals("2")||marketing.getE09NVG().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (marketing.getE09NVG().equals("1")) out.print("selected"); %>>Microsoft Internet Explorer</option>
                <option value="2" <% if (marketing.getE09NVG().equals("2")) out.print("selected"); %>>Netscape Navigator</option>
                <option value="3" <% if (marketing.getE09NVG().equals("3")) out.print("selected"); %>>Other</option>
              </select>
            </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">Do you shop on - line ? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09CIN" value="<%= marketing.getE09CIN()%>">
              <input type="radio" name="CE09CIN" value="Y" onClick="document.forms[0].E09CIN.value='Y'"
			  <%if(marketing.getE09CIN().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE09CIN" value="N" onClick="document.forms[0].E09CIN.value='N'"
			  <%if(marketing.getE09CIN().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right">Would you be interesting in shopping on - line 
                ? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09DCI" value="<%= marketing.getE09DCI()%>">
              <input type="radio" name="CE09DCI" value="Y" onClick="document.forms[0].E09DCI.value='Y'"
			  <%if(marketing.getE09DCI().equals("Y")) out.print("checked");%>>
              Yes 
              <input type="radio" name="CE09DCI" value="N" onClick="document.forms[0].E09DCI.value='N'"
			  <%if(marketing.getE09DCI().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">What kind of sites would you like to visit ? 
              </div>
            </td>
            <td nowrap width="26%">&nbsp; </td>
            <td nowrap width="26%">&nbsp; </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFI"  onClick="document.forms[0].E09PFI.value='X'"
				<%if(marketing.getE09PFI().equals("X")) out.print("checked");%>>
              Finance </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCE"  onClick="document.forms[0].E09PCE.value='X'"
				<%if(marketing.getE09PCE().equals("X")) out.print("checked");%>>
              Science </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PTE"  onClick="document.forms[0].E09PTE.value='X'"
				<%if(marketing.getE09PTE().equals("X")) out.print("checked");%>>
              Technology</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCO"  onClick="document.forms[0].E09PCO.value='X'"
				<%if(marketing.getE09PCO().equals("X")) out.print("checked");%>>
              Computer</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PEL"  onClick="document.forms[0].E09PEL.value='X'"
				<%if(marketing.getE09PEL().equals("X")) out.print("checked");%>>
              Electronic</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PNE"  onClick="document.forms[0].E09PNE.value='X'"
				<%if(marketing.getE09PNE().equals("X")) out.print("checked");%>>
              Business </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCI"  onClick="document.forms[0].E09PCI.value='X'"
				<%if(marketing.getE09PCI().equals("X")) out.print("checked");%>>
              Movies and TV</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PAU"  onClick="document.forms[0].E09PAU.value='X'"
				<%if(marketing.getE09PAU().equals("X")) out.print("checked");%>>
              Cars </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PDE"  onClick="document.forms[0].E09PDE.value='X'"
				<%if(marketing.getE09PDE().equals("X")) out.print("checked");%>>
              Sports </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFO"  onClick="document.forms[0].E09PFO.value='X'"
				<%if(marketing.getE09PFO().equals("X")) out.print("checked");%>>
              Forums</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFA"  onClick="document.forms[0].E09PFA.value='X'"
				<%if(marketing.getE09PFA().equals("X")) out.print("checked");%>>
              Family</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PMU"  onClick="document.forms[0].E09PMU.value='X'"
				<%if(marketing.getE09PMU().equals("X")) out.print("checked");%>>
              Music </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">What areas do you prefer for on - line shopping 
                ? </div>
            </td>
            <td nowrap width="26%">&nbsp;</td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CIV"  onClick="document.forms[0].E09CIV.value='X'"
				<%if(marketing.getE09CIV().equals("X")) out.print("checked");%>>
              Investments </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CLI"  onClick="document.forms[0].E09CLI.value='X'"
				<%if(marketing.getE09CLI().equals("X")) out.print("checked");%>>
              Books </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CTE"  onClick="document.forms[0].E09CTE.value='X'"
				<%if(marketing.getE09CTE().equals("X")) out.print("checked");%>>
              Technology</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CPA"  onClick="document.forms[0].E09CPA.value='X'"
				<%if(marketing.getE09CPA().equals("X")) out.print("checked");%>>
              Flights Tickets</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CRE"  onClick="document.forms[0].E09CRE.value='X'"
				<%if(marketing.getE09CRE().equals("X")) out.print("checked");%>>
              Magazines</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CVI"  onClick="document.forms[0].E09CVI.value='X'"
				<%if(marketing.getE09CVI().equals("X")) out.print("checked");%>>
              Videos </td>
          </tr>
          <tr> 
            <td nowrap width="48%" height="26">&nbsp;</td>
            <td nowrap width="26%" height="26"> 
              <input type="checkbox" name="E09CAU"  onClick="document.forms[0].E09CAU.value='X'"
				<%if(marketing.getE09CAU().equals("X")) out.print("checked");%>>
              Cars </td>
            <td nowrap width="26%" height="26"> 
              <input type="checkbox" name="E09CTR"  onClick="document.forms[0].E09CTR.value='X'"
				<%if(marketing.getE09CTR().equals("X")) out.print("checked");%>>
              Other</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
 <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<BR>
</form>
</body>
</html>
