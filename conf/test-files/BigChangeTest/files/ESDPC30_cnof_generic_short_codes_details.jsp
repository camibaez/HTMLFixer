<html>
<head>
<title>Reference Codes - Credit Proposal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESDPC3002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
function send() {
	var frm = document.forms[0];
	<% if (refCodes.getE02CNOCFL().trim().equals("PP")){ %>
		frm.E02CNOMIC.value = frm.DAY.value + frm.MONTH.value + frm.YEAR.value;
	<% } %>
}
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Reference Codes Table <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_generic_short_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESDPC30" onsubmit="return(send())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Basic Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Clasification :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Code :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <%  if (!refCodes.getE02CNOCFL().trim().equals("51")) {%>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
              </div>
            </td>
          </tr>
          
          <% } %>
          
          <%  if (refCodes.getE02CNOCFL().trim().equals("PP")) {
				String day = "";
				String month = "";
				String year = "";
          		if(refCodes.getE02CNOMIC().length() == 6){
					day = refCodes.getE02CNOMIC().substring(0,2);
					month = refCodes.getE02CNOMIC().substring(2,4);
					year = refCodes.getE02CNOMIC().substring(4,6);
				}          
          %>
          
          <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Promotion Expire :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
				<input type="hidden" name="E02CNOMIC" value="<%= refCodes.getE02CNOMIC() %>">
                <input type="text" name="DAY" size="2" maxlength="2" value="<%= day %>" onKeypress="enterInteger()" readonly>
				<input type="text" name="MONTH" size="2" maxlength="2" value="<%= month %>" onKeypress="enterInteger()" readonly>
				<input type="text" name="YEAR" size="2" maxlength="2" value="<%= year %>" onKeypress="enterInteger()" readonly>
              	<a href="javascript:DatePicker(document.forms[0].DAY,document.forms[0].MONTH,document.forms[0].YEAR)">
              	<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="..." align="bottom" border="0" ></a>
             </div>
            </td>
            
          </tr>         
          
          <% }%>
          

          <%  if (refCodes.getE02CNOCFL().trim().equals("51")) {%>
          
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Order Type :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                
                <select name="E02CNOF04">
                <option value="N" <% if (!(refCodes.getE02CNOF04().equals("1") ||refCodes.getE02CNOF04().equals("2")||refCodes.getE02CNOF04().equals("3"))) out.print("selected"); %>> No Apply</option>
                <option value="1" <% if(refCodes.getE02CNOF04().equals("1")) out.print("selected");%>>Legal</option>
                <option value="2" <% if(refCodes.getE02CNOF04().equals("2")) out.print("selected");%>>No Legal</option>
                <option value="3" <% if(refCodes.getE02CNOF04().equals("3")) out.print("selected");%>>Credit Card Guarantee</option>
              </select>
          
          
          
             </div>
            </td>
            
          </tr>
          
          
          <% }%>


          
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
