<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Confirmation of Opening</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="7;url='javascript:document.forms[0].submit();">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtFinish" class= "datapro.eibs.beans.EFT000015Message"   scope="session"/>
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<SCRIPT Language="Javascript">
	
	function goMaintenance() {
		document.forms[0].submit();
	}
	
</SCRIPT>

<body onload="setTimeout('goMaintenance()', 2000);">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<h3 align="center"><%if(userPO.getOption().equals("RT")){out.print("Retail Account");} else {out.print("Saving Account");} %></h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_confirm.jsp,EDD0000" width="35" height="35"> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="44">
  <table class="tableinfo">
    <tr > 
      <td height="409"> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr> 
            <td width="5%" height="20">&nbsp;</td>
            <td width="18%" height="20"> 
              <div align="right"></div>
            </td>
            <td width="77%" height="20"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="77%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Account :</div>
            </td>
            <td width="77%"><%= datapro.eibs.master.Util.justifyRight(rtFinish.getE15ACCNUM().trim(),9)%> 
              </td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="77%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="5%" height="15">&nbsp;</td>
            <td width="18%" height="15"> 
              <div align="right">In Favor of :</div>
            </td>
            <td width="77%" height="15"> 
              <div align="left"> <%= rtFinish.getE15CUSNA1().trim()%> </div>
            </td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Customer Number :</div>
            </td>
            <td width="77%"><%= datapro.eibs.master.Util.justifyRight(rtFinish.getE15CUSCUN().trim(),9)%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Currency :</div>
            </td>
            <td width="77%"> <%= rtFinish.getE15CCYCDE().trim()%> - <%= rtFinish.getE15DSCCCY().trim()%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="77%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Bank :</div>
            </td>
            <td width="77%"> <%= rtFinish.getE15BANKNM().trim()%> </td>
          </tr>
          <tr> 
            <td width="5%" height="21">&nbsp;</td>
            <td width="18%" height="21"> 
              <div align="right">Branch :</div>
            </td>
            <td width="77%" height="21"><%= rtFinish.getE15BRNNUM().trim()%> - 
              <%= rtFinish.getE15BRNNME().trim()%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Product :</div>
            </td>
            <td width="77%"><%= rtFinish.getE15PROCDE().trim()%> - <%= rtFinish.getE15DSCPRO().trim()%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="77%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td width="77%"> <%= Util.formatDate(rtFinish.getE15OPNDT1(),rtFinish.getE15OPNDT2(),rtFinish.getE15OPNDT3())%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right">Initial Deposit :</div>
            </td>
            <td width="77%"><%= Util.fcolorCCY(rtFinish.getE15OPNAMT().trim())%></td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%">&nbsp;</td>
            <td width="77%"><%= rtFinish.getE15LETOAM().trim()%></td>
          </tr>
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="18%">&nbsp;</td>
            <td width="77%">&nbsp;</td>
          </tr>
          <tr> 
            <td width="5%">&nbsp;</td>
            <td width="18%"> 
              <div align="right"></div>
            </td>
            <td width="77%"> 
              <div align="center">This account has been processed successfully. Please wait...</div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <BR>
</form>
</body>
</html>
