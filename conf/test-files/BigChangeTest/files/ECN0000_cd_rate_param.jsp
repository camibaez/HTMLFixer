<html>
<head>
<title>Rates Structure</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.ECN0000DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     error.setERRNUM("0");
     out.println("  	 top.close();");
     out.println("</SCRIPT>");
     }
%> 
<h3 align="center">Rates Structure Parameters<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_rate_param, ECN0030"></h3>
<hr size="4">

<form>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <p>
  </p>
	
  <h4>Terms</h4>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="16%"> 
        <div align="right"><b>Up to : </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDUA1" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA1().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDUA2" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA2().trim()%>"
				>
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDUA3" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA3().trim()%>"
				>
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDUA4" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA4().trim()%>"
				>
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDUA5" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA5().trim()%>"
				>
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDUA6" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA6().trim()%>"
				>
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDUA7" size="15" maxlength="13" value="<%= cdRenRat.getE01CDUA7().trim()%>"
				>
        </div>
      </td>
    </tr>
  </table>
  <h4><b>Days </b></h4>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="16%"> 
        <div align="right"><b>Number of Days : </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD01" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD01().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD02" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD02().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDD03" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD03().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD04" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD04().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD05" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD05().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDD06" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD06().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD07" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD07().trim()%>">
        </div>
      </td>
    </tr>
    <tr> 
      <td width="16%">&nbsp;</td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD08" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD08().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD09" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD09().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDD10" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD10().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD011" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD11().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD012" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD12().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01CDD013" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD13().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD014" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD14().trim()%>">
        </div>
      </td>
    </tr>
    <tr>
      <td width="16%">&nbsp;</td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01CDD015" size="15" maxlength="13" value="<%= cdRenRat.getE01CDD15().trim()%>">
        </div>
      </td>
      <td width="16%">&nbsp;</td>
      <td width="16%">&nbsp;</td>
      <td width="16%">&nbsp;</td>
      <td width="16%">&nbsp;</td>
      <td width="16%">&nbsp;</td>
      <td width="16%">&nbsp;</td>
    </tr>
  </table>
  <h4><b>Spread</b></h4>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="16%"> 
        <div align="right"><b>Spread : </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01SPR01" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR01().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01SPR02" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR02().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01SPR03" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR03().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01SPR04" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR04().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01SPR05" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR05().trim()%>">
        </div>
      </td>
      <td width="16%"> 
        <div align="center"><b> 
          <input type="text" name="E01SPR06" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR06().trim()%>">
          </b></div>
      </td>
      <td width="16%"> 
        <div align="center"> 
          <input type="text" name="E01SPR07" size="15" maxlength="13" value="<%= cdRenRat.getE01SPR07().trim()%>">
        </div>
      </td>
    </tr> 
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
  </div>
  </form>
</body>
</html>
