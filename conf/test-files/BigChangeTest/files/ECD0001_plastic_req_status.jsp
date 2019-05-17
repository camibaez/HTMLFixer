<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Solicitud de Plastico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD000101Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Card Request<BR>
Change Status<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ECD0001_plastic_req_status.jsp"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0001" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="110">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Request #:</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRNUM" size="15" maxlength="13" readonly value="<%= msgCD.getE02CDRNUM() %>">
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Card Number :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRINI" size="20" maxlength="19" readonly value="<%= msgCD.getE02CDRINI() %>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Source Branch :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRBRN" size="5" maxlength="4" readonly value="<%= msgCD.getE02CDRBRN() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Destiny Branch :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E02CDRBRD" size="5" maxlength="4" readonly value="<%= msgCD.getE02CDRBRD() %>">
                 </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Send Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CDRDAY" size="2" maxlength="2" readonly value="<%= msgCD.getE02CDRDAY() %>">
                <input type="text" name="E02CDRMON" size="2" maxlength="2" readonly value="<%= msgCD.getE02CDRMON() %>">
                <input type="text" name="E02CDRYEA" size="4" maxlength="4" readonly value="<%= datapro.eibs.master.Util.formatYear(msgCD.getE02CDRYEA()) %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Receipt Date :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CDRDAR" size="2" maxlength="2" readonly value="<%= msgCD.getE02CDRDAR() %>">
                <input type="text" name="E02CDRMOR" size="2" maxlength="2" readonly value="<%= msgCD.getE02CDRMOR() %>">
                <input type="text" name="E02CDRYER" size="4" maxlength="4" readonly value="<%= datapro.eibs.master.Util.formatYear(msgCD.getE02CDRYER()) %>">
			  </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Receipt User :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CDRUSR" size="20" maxlength="19" readonly value="<%= msgCD.getE02CDRUSR() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Status :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
				<input type="hidden" name="E02CDRSTS" size="5" maxlength="4" value="<%= msgCD.getE02CDRSTS() %>">
                <input type="text" name="E02CDRSTD" size="17" maxlength="15" value="<%= msgCD.getE02CDRSTD() %>">
				<a href="javascript:GetCodeDescCNOFC('E02CDRSTS', 'E02CDRSTD', '17')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0" ></a>
			  </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Notes : </div>
            </td>
			<td nowrap width="20%" colspan="3">
				<div align="left">
					<input type="text" name="E02CDROBS" size="40" maxlength="35" value="<%= msgCD.getE02CDROBS() %>"></div>
			</td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
