<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<script>
function fnGoExit() {
   if (document.forms[0].E01TLMTID.value == ""){alert("Teller ID is empty."); return false;
   } else if (document.forms[0].E01TLMCCY.value == ""){alert("Teller Currency is empty."); return false;
   } else if (document.forms[0].E01TLMTYP.value == " "){alert("Teller Type is empty."); return false; 
   } else return true;    
}
</SCRIPT>  

<H3 align="center">Teller New <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_maintenance.jsp, EDD0310"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0310" onsubmit="return fnGoExit()">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Teller ID :</b></div>
            </td>
            <td nowrap width="14%"> 
              <div align="left"> 
                <input type="text" name="E01TLMTID" size="3"
					maxlength="3" value=""
					 >
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Teller Currency :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01TLMCCY" size="3"
					maxlength="3" value="">					
                    <a href="javascript:GetCurrency('E01TLMCCY','')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
                </font></font></font></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Teller Type :</b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"> 
              <select name="E01TLMTYP" size="1"  >
					<option value=" "></option>
					<option value="T">Regular Teller</option>
					<option value="H">Head Teller</option>
					<option value="O">O/D Official</option>
					<option value="S">Operations Supervisor</option>
					<option value="I">Teller Interface</option>
				</select>
              </div>
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
