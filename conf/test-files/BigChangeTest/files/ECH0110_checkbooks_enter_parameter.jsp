<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
}
</script>

</head>
<body>
<% 
if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECH0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  <h3 align="center">Checkbook Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="checkbook_enter_parameter.jsp, ECH0110"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="18%" nowrap>&nbsp;</td>
            <td width="22%" nowrap> 
              <div align="right">Bank :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01CHKBNK" size="3" maxlength="2"  >
            </td>
          </tr>
          <tr>
            <td width="18%" nowrap>&nbsp;</td>
            <td width="22%" nowrap> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01CHKCCY" size="4" maxlength="3"  >
              <a href="javascript:GetCurrency('E01CHKCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
          </tr>
          <tr>
            <td nowrap width="18%">&nbsp;</td>
            <td nowrap width="22%"> 
              <div align="right"></div>
              <div align="right">Account Type:</div>
            </td>
            <td nowrap width="60%"> 
  
			  <select name="E01CHKATY">
                  <option value="" ></option>
                  <option value="DDA" >Demand Deposit Account</option>
                  <option value="MMK" >Money Market Account</option>
                  <option value="NOW" >Now Account</option>
				  <option value="SAV" >Savings Account</option>
                </select>
            </td>
          </tr>
          <tr>
            <td nowrap width="18%">&nbsp;</td>
            <td nowrap width="22%"> 
              <div align="right">Checkbook Type:</div>
            </td>
            <td nowrap width="60%"> 
         
			  <select name="E01CHKTCB">
                  <option value="" ></option>
                  <option value="1" >Standard</option>
                  <option value="2" >Continuos Paper and Left Checkstub </option>
                  <option value="3" >Continuos Paper and buttom checkstub</option>
		
                </select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
