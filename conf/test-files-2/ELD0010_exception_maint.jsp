<html>
<head>
<title>Exception</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="exMaint" class="datapro.eibs.beans.ELD001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
</head>
<body>
<% if ( !error.getERRNUM().equals("0")  ) {
 	  error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
 <SCRIPT LANGUAGE="JavaScript" >
   function checkLength(field) {
   if ( field.value.length < 140 ) {
     return true
	}
	else {
     return false
	}
	}
 </SCRIPT>
<H3 align="center"><% if (userPO.getPurpose().equals("NEW")) out.print("New Exception");
   else if (userPO.getPurpose().equals("MAINTENANCE")) out.print("Maintenance of Exceptions");
   else out.print("");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="exception_maint.jsp, ELD0010"></H3>
<hr>
<BR>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSELD0010" >
<p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    </p>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="12%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="13%" > 
              <div align="left"> 
                <input type="text" name="E01LDECUN" size="9" maxlength="9" readonly value="<%= exMaint.getE01LDECUN().trim()%>" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="21%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" readonly size="45" maxlength="45" value="<%= exMaint.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="3"> 
              <div align="right"></div>
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01LDEACC" readonly size="12" maxlength="12" value="<%= exMaint.getE01LDEACC().trim()%>"  onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="3"> 
              <div align="right"></div>
              <div align="right"><b>Month/ Year of Exception :</b></div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01LDEBDM" readonly size="2" maxlength="2" value="<%=exMaint.getE01LDEBDM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01LDEBDY" readonly size="4" maxlength="4" value="<%= exMaint.getE01LDEBDY().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="3"> 
              <div align="right"><b>Sequence :</b></div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" size="2" maxlength="1" readonly value="<%= exMaint.getE01LDESEQ().trim()%>" name="E01LDESEQ" onkeypress="enterInteger()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Exceptions</H4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="46%"> 
              <div align="right">Type of Exception :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01LDETPY" size="30" maxlength="30" value="<%= exMaint.getE01LDETPY().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap valign="top"> 
              <div align="right">Narrative :</div>
            </td>
            <td nowrap > 
              <textarea name="E01LDERM" cols="35" rows="4"  wrap="PHYSICAL" onKeyPress = "return checkLength(this)"><%= exMaint.getE01LDERM1().trim() + exMaint.getE01LDERM2().trim() + exMaint.getE01LDERM3().trim() + exMaint.getE01LDERM4().trim()%></textarea>
            </td>
          </tr>        
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
	 <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
  </form>
</body>
</html>
