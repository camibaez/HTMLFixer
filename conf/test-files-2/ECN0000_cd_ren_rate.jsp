<html>
<head>
<title>Rates Structure</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.ECN0001DSMessage"  scope="session" />

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
<h3 align="center">Rates Structure <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_inq_ren_rate, ECN0030"></h3>
<hr size="4">

<form>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <p>
  </p>
	
  <h4>General Information</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="24%"> 
              <div align="right">Table Code :</div>
            </td>
            <td width="15%"> <%= cdRenRat.getE01CDRRTB().trim()%> </td>
            <td width="28%"> 
              <div align="right">Effective Rate Date :</div>
            </td>
            <td width="33%"> <%= cdRenRat.getE01CDRDT1().trim()%>/ <%= cdRenRat.getE01CDRDT2().trim()%>/ 
              <%= cdRenRat.getE01CDRDT3().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td width="24%"> 
              <div align="right">Currency :</div>
            </td>
            <td width="15%"> <%= cdRenRat.getE01CDRCCY().trim()%> </td>
            <td width="28%"> 
              <div align="right">Base Rate Tier To :</div>
            </td>
            <td width="33%"><%= cdRenRat.getE01CDBRTN().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td width="24%"> 
              <div align="right">Minimum Rate :</div>
            </td>
            <td width="15%"> 
              <div align="left"><%= cdRenRat.getE01CDRMIR().trim()%></div>
            </td>
            <td width="28%"> 
              <div align="right">Maximum Rate :</div>
            </td>
            <td width="33%"> 
              <div align="left"><%= cdRenRat.getE01CDRMXR().trim()%></div>
            </td>
          </tr>
          <tr id="trclear">
            <td width="24%">
              <div align="right">Penalty Days :</div>
            </td>
            <td width="15%"><%= cdRenRat.getE01CDRDPE().trim()%></td>
            <td width="28%">
              <div align="right">Penalty Rate :</div>
            </td>
            <td width="33%"><%= cdRenRat.getE01CDRPRT().trim()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Rates & Terms</h4>
  <table class="tableinfo" width="100%">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="13%" height="22"> 
              <div align="center"></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Up to:</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"><b>Terms</b></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA1().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA2().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA3().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA4().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA5().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA6().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDUA7().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Spread</b></div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR01().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR02().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR03().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR04().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR05().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR06().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01SPR07().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"><b>Days </b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
            <td width="13%"> 
              <div align="center"><b>Rates</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD01().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL101" size="10" maxlength="9" value="<%= cdRenRat.getE01CL101().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL201" size="10" maxlength="9" value="<%= cdRenRat.getE01CL201().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL301" size="10" maxlength="9" value="<%= cdRenRat.getE01CL301().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL401" size="10" maxlength="9" value="<%= cdRenRat.getE01CL401().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL501" size="10" maxlength="9" value="<%= cdRenRat.getE01CL501().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL601" size="10" maxlength="9" value="<%= cdRenRat.getE01CL601().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL701" size="10" maxlength="9" value="<%= cdRenRat.getE01CL701().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD02().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL102" size="10" maxlength="9" value="<%= cdRenRat.getE01CL102().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL202" size="10" maxlength="9" value="<%= cdRenRat.getE01CL202().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL302" size="10" maxlength="9" value="<%= cdRenRat.getE01CL302().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL402" size="10" maxlength="9" value="<%= cdRenRat.getE01CL402().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL502" size="10" maxlength="9" value="<%= cdRenRat.getE01CL502().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL602" size="10" maxlength="9" value="<%= cdRenRat.getE01CL602().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL702" size="10" maxlength="9" value="<%= cdRenRat.getE01CL702().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD03().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL103" size="10" maxlength="9" value="<%= cdRenRat.getE01CL103().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL203" size="10" maxlength="9" value="<%= cdRenRat.getE01CL203().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL303" size="10" maxlength="9" value="<%= cdRenRat.getE01CL303().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL403" size="10" maxlength="9" value="<%= cdRenRat.getE01CL403().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL503" size="10" maxlength="9" value="<%= cdRenRat.getE01CL503().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL603" size="10" maxlength="9" value="<%= cdRenRat.getE01CL603().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL703" size="10" maxlength="9" value="<%= cdRenRat.getE01CL703().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD04().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL104" size="10" maxlength="9" value="<%= cdRenRat.getE01CL104().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL204" size="10" maxlength="9" value="<%= cdRenRat.getE01CL204().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL304" size="10" maxlength="9" value="<%= cdRenRat.getE01CL304().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL404" size="10" maxlength="9" value="<%= cdRenRat.getE01CL404().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL504" size="10" maxlength="9" value="<%= cdRenRat.getE01CL504().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL604" size="10" maxlength="9" value="<%= cdRenRat.getE01CL604().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL704" size="10" maxlength="9" value="<%= cdRenRat.getE01CL704().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD05().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL105" size="10" maxlength="9" value="<%= cdRenRat.getE01CL105().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL205" size="10" maxlength="9" value="<%= cdRenRat.getE01CL205().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL305" size="10" maxlength="9" value="<%= cdRenRat.getE01CL305().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL405" size="10" maxlength="9" value="<%= cdRenRat.getE01CL405().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL505" size="10" maxlength="9" value="<%= cdRenRat.getE01CL505().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL605" size="10" maxlength="9" value="<%= cdRenRat.getE01CL605().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL705" size="10" maxlength="9" value="<%= cdRenRat.getE01CL705().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD06().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL106" size="10" maxlength="9" value="<%= cdRenRat.getE01CL106().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL206" size="10" maxlength="9" value="<%= cdRenRat.getE01CL206().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL306" size="10" maxlength="9" value="<%= cdRenRat.getE01CL306().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL406" size="10" maxlength="9" value="<%= cdRenRat.getE01CL406().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL506" size="10" maxlength="9" value="<%= cdRenRat.getE01CL506().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL606" size="10" maxlength="9" value="<%= cdRenRat.getE01CL606().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL706" size="10" maxlength="9" value="<%= cdRenRat.getE01CL706().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD07().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL107" size="10" maxlength="9" value="<%= cdRenRat.getE01CL107().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL207" size="10" maxlength="9" value="<%= cdRenRat.getE01CL207().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL307" size="10" maxlength="9" value="<%= cdRenRat.getE01CL307().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL407" size="10" maxlength="9" value="<%= cdRenRat.getE01CL407().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL507" size="10" maxlength="9" value="<%= cdRenRat.getE01CL507().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL607" size="10" maxlength="9" value="<%= cdRenRat.getE01CL607().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL707" size="10" maxlength="9" value="<%= cdRenRat.getE01CL707().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD08().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL108" size="10" maxlength="9" value="<%= cdRenRat.getE01CL108().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL208" size="10" maxlength="9" value="<%= cdRenRat.getE01CL208().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL308" size="10" maxlength="9" value="<%= cdRenRat.getE01CL308().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL408" size="10" maxlength="9" value="<%= cdRenRat.getE01CL408().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL508" size="10" maxlength="9" value="<%= cdRenRat.getE01CL508().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL608" size="10" maxlength="9" value="<%= cdRenRat.getE01CL608().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL708" size="10" maxlength="9" value="<%= cdRenRat.getE01CL708().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD09().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL109" size="10" maxlength="9" value="<%= cdRenRat.getE01CL109().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL209" size="10" maxlength="9" value="<%= cdRenRat.getE01CL209().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL309" size="10" maxlength="9" value="<%= cdRenRat.getE01CL309().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL409" size="10" maxlength="9" value="<%= cdRenRat.getE01CL409().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL509" size="10" maxlength="9" value="<%= cdRenRat.getE01CL509().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL609" size="10" maxlength="9" value="<%= cdRenRat.getE01CL609().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL709" size="10" maxlength="9" value="<%= cdRenRat.getE01CL709().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD10().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL110" size="10" maxlength="9" value="<%= cdRenRat.getE01CL110().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL210" size="10" maxlength="9" value="<%= cdRenRat.getE01CL210().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL310" size="10" maxlength="9" value="<%= cdRenRat.getE01CL310().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL410" size="10" maxlength="9" value="<%= cdRenRat.getE01CL410().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL510" size="10" maxlength="9" value="<%= cdRenRat.getE01CL510().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL610" size="10" maxlength="9" value="<%= cdRenRat.getE01CL610().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL710" size="10" maxlength="9" value="<%= cdRenRat.getE01CL710().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD11().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL111" size="10" maxlength="9" value="<%= cdRenRat.getE01CL111().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL211" size="10" maxlength="9" value="<%= cdRenRat.getE01CL211().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL311" size="10" maxlength="9" value="<%= cdRenRat.getE01CL311().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL411" size="10" maxlength="9" value="<%= cdRenRat.getE01CL411().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL511" size="10" maxlength="9" value="<%= cdRenRat.getE01CL511().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL611" size="10" maxlength="9" value="<%= cdRenRat.getE01CL611().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL711" size="10" maxlength="9" value="<%= cdRenRat.getE01CL711().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" height="39"> 
              <div align="center"> <%= cdRenRat.getE01CDD12().trim()%> </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL112" size="10" maxlength="9" value="<%= cdRenRat.getE01CL112().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL212" size="10" maxlength="9" value="<%= cdRenRat.getE01CL212().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL312" size="10" maxlength="9" value="<%= cdRenRat.getE01CL312().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL412" size="10" maxlength="9" value="<%= cdRenRat.getE01CL412().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL512" size="10" maxlength="9" value="<%= cdRenRat.getE01CL512().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL612" size="10" maxlength="9" value="<%= cdRenRat.getE01CL612().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="E01CL712" size="10" maxlength="9" value="<%= cdRenRat.getE01CL712().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD13().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL113" size="10" maxlength="9" value="<%= cdRenRat.getE01CL113().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL213" size="10" maxlength="9" value="<%= cdRenRat.getE01CL213().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL313" size="10" maxlength="9" value="<%= cdRenRat.getE01CL313().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL413" size="10" maxlength="9" value="<%= cdRenRat.getE01CL413().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL513" size="10" maxlength="9" value="<%= cdRenRat.getE01CL513().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL613" size="10" maxlength="9" value="<%= cdRenRat.getE01CL613().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL713" size="10" maxlength="9" value="<%= cdRenRat.getE01CL713().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD14().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL114" size="10" maxlength="9" value="<%= cdRenRat.getE01CL114().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL214" size="10" maxlength="9" value="<%= cdRenRat.getE01CL214().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL314" size="10" maxlength="9" value="<%= cdRenRat.getE01CL314().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL414" size="10" maxlength="9" value="<%= cdRenRat.getE01CL414().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL514" size="10" maxlength="9" value="<%= cdRenRat.getE01CL514().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL614" size="10" maxlength="9" value="<%= cdRenRat.getE01CL614().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL714" size="10" maxlength="9" value="<%= cdRenRat.getE01CL714().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE01CDD15().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL115" size="10" maxlength="9" value="<%= cdRenRat.getE01CL115().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL215" size="10" maxlength="9" value="<%= cdRenRat.getE01CL215().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL315" size="10" maxlength="9" value="<%= cdRenRat.getE01CL315().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL415" size="10" maxlength="9" value="<%= cdRenRat.getE01CL415().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL515" size="10" maxlength="9" value="<%= cdRenRat.getE01CL515().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL615" size="10" maxlength="9" value="<%= cdRenRat.getE01CL615().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="E01CL715" size="10" maxlength="9" value="<%= cdRenRat.getE01CL715().trim()%>"
				<% if (cdRenRat.getE01CDBRTN().trim().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td> 
        <div align="center">
          <input type="button" name="Submit2" value="Change Settings">
        </div>
      </td>
      <td>
        <div align="center"> 
	      <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
  </div>
      </td>
      <td> 
        <div align="center">
          <input type="button" name="Button" value="Calculate">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="center">&nbsp; </p>
  </form>
</body>
</html>
