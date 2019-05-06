<html>
<head>
<title>Reference Code</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

	
	function  checkValues(){
	if (document.forms[0].E02CNOCPF.value != "1" &&
		(document.forms[0].DAY1.value.length > 1 || document.forms[0].DAY2.value.length > 1 ||
		 document.forms[0].FREQ1.value.length > 1 || document.forms[0].FREQ2.value.length > 1)) {
		alert("Statement Frequency valid only for retail accounts module");
		document.forms[0].E02CNOCPF.focus();
		return false;
	} else {
 		document.forms[0].E02CNOCPC.value = document.forms[0].DAY1.value + document.forms[0].DAY2.value;
		document.forms[0].E02CNODCC.value = document.forms[0].FREQ1.value + document.forms[0].FREQ2.value;
		document.forms[0].submit();
	}
 } 
</script>



<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">System Reference Codes - Process<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_process_types_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E02CNODCC" >
  <input type=HIDDEN name="E02CNOCPC" >
  <INPUT TYPE=HIDDEN NAME="SCRUSRBNK"  value="<%= currUser.getE01UBK().trim()%>">
  

  
 
  <h4>Basic Information</h4>  
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Classification :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Code :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="4" maxlength="3" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Module Codes</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
  
		    <tr id="trdark"> 
		      <td align=CENTER width="18%">       
        		 <div align="right">Application Module Code :</div>
		      </td>
		      <td align=LEFT width="34%">
		         <input type="text" name="E02CNOCPF" size="3" maxlength="1" value="<%= refCodes.getE02CNOCPF().trim()%>">
        		 <a href="javascript:GetAppModule('E02CNOCPF',document.forms[0].SCRUSRBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
		      </td>
		   </tr>    
		  
	     </table>
    	</td>
   	</tr>
    
  </table>

<H4>Parameter for Portfolio/Investments Module Only</H4>
<TABLE class="tableinfo">
          	<tr id="trdark">
            	<td width="354"> 
                <div align="right">Custody Fee Table: </div>
            	</td>
        	    <td width="430">
                        <INPUT type="text" name="E02CNOSCY" size="3"
					maxlength="2" value="<%= refCodes.getE02CNOSCY().trim()%>"><A
					href="javascript:GetCommCustodyTable('E02CNOSCY','CST','','')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absmiddle" border="0"></A>
				</td>
	          </tr>                   
</TABLE>
<h4>Parameters for Retail Accounts Module Only</h4>
  <table class="tableinfo">
    <tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Personal Account Statement Frequency :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
          <select name="FREQ1">
            <option value="" <%if (userPO.getHeader8().equals("")) { out.print("selected"); }%>></option>
            <option value="D" <%if (userPO.getHeader8().equals("D")) out.print("selected"); %>>Daily</option>
            <option value="W" <%if (userPO.getHeader8().equals("W")) out.print("selected"); %>>Weekly</option>
            <option value="B" <%if (userPO.getHeader8().equals("B")) out.print("selected"); %>>Bi-Weekly</option>
            <option value="M" <%if (userPO.getHeader8().equals("M")) out.print("selected"); %>>Monthly</option>
            <option value="Q" <%if (userPO.getHeader8().equals("Q")) out.print("selected"); %>>Quarterly</option>
          </select>
          <input type="text" name="DAY1" size="4" maxlength="2" value="<%= userPO.getHeader9().trim()%>">
          </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Corporate Account Statement Frequency :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
          <select name="FREQ2">
            <option value="" <%if (userPO.getHeader10().equals("")) { out.print("selected"); }%>></option>
            <option value="D" <%if (userPO.getHeader10().equals("D")) out.print("selected"); %>>Daily</option>
            <option value="W" <%if (userPO.getHeader10().equals("W")) out.print("selected"); %>>Weekly</option>
            <option value="B" <%if (userPO.getHeader10().equals("B")) out.print("selected"); %>>Bi-Weekly</option>
            <option value="M" <%if (userPO.getHeader10().equals("M")) out.print("selected"); %>>Monthly</option>
            <option value="Q" <%if (userPO.getHeader10().equals("Q")) out.print("selected"); %>>Quarterly</option>
          </select>
          <input type="text" name="DAY2" size="4" maxlength="2" value="<%= userPO.getHeader11().trim()%>">
          </div>
      </td>
    </tr>
  </table>
  <br>
  
  <br>
<BR>
<p align="center">
    <input id="EIBSBTN" type=button name="Button" value="Submit" onClick="checkValues()">
  </p>
  </form>
</body>
</html>
