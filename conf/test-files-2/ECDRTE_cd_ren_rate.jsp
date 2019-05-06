<html>
<head>
<title>Rates Structure</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.CDRTEMessage"  scope="session" />

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
            <td width="15%"> 
              <input type="text" name="CDRRTB" size="4" maxlength="2" value="<%= cdRenRat.getCDRRTB()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
            </td>
            <td width="28%"> 
              <div align="right">Processing Date :</div>
            </td>
            <td width="33%"> 
              <input type="text" name="CDRRDM" size="3" maxlength="2" value="<%= cdRenRat.getCDRRDM()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              <input type="text" name="CDRRDD" size="3" maxlength="2" value="<%= cdRenRat.getCDRRDD()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              <input type="text" name="CDRRDY" size="3" maxlength="2" value="<%= cdRenRat.getCDRRDY()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
            </td>
            <td width="33%"> 
              <div align="right">Currency :</div>
            </td>
            <td width="33%">
              <input type="text" name="CDRCCY" size="4" maxlength="3" value="<%= cdRenRat.getCDRCCY()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
            </td>
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
              <div align="center"> 
                <input type="text" name="CDRUA1" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA1()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA2" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA2()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA3" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA3()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA4" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA4()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA5" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA5()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA6" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA6()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRUA7" size="17" maxlength="15" value="<%= cdRenRat.getCDRUA7()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
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
              <div align="center"> 
                <input type="text" name="CDRD01" size="5" maxlength="4" value="<%= cdRenRat.getCDRD01()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR101" size="10" maxlength="9" value="<%= cdRenRat.getCDR101()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR201" size="10" maxlength="9" value="<%= cdRenRat.getCDR201()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR301" size="10" maxlength="9" value="<%= cdRenRat.getCDR301()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR401" size="10" maxlength="9" value="<%= cdRenRat.getCDR401()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center">
                <input type="text" name="CDR501" size="10" maxlength="9" value="<%= cdRenRat.getCDR501()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR601" size="10" maxlength="9" value="<%= cdRenRat.getCDR601()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR701" size="10" maxlength="9" value="<%= cdRenRat.getCDR701()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD02" size="5" maxlength="4" value="<%= cdRenRat.getCDRD02()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR102" size="10" maxlength="9" value="<%= cdRenRat.getCDR102()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR202" size="10" maxlength="9" value="<%= cdRenRat.getCDR202()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR302" size="10" maxlength="9" value="<%= cdRenRat.getCDR302()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR402" size="10" maxlength="9" value="<%= cdRenRat.getCDR402()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR502" size="10" maxlength="9" value="<%= cdRenRat.getCDR502()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR602" size="10" maxlength="9" value="<%= cdRenRat.getCDR602()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR702" size="10" maxlength="9" value="<%= cdRenRat.getCDR702()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD03" size="5" maxlength="4" value="<%= cdRenRat.getCDRD03()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR103" size="10" maxlength="9" value="<%= cdRenRat.getCDR103()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR203" size="10" maxlength="9" value="<%= cdRenRat.getCDR203()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR303" size="10" maxlength="9" value="<%= cdRenRat.getCDR303()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR403" size="10" maxlength="9" value="<%= cdRenRat.getCDR403()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR503" size="10" maxlength="9" value="<%= cdRenRat.getCDR503()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR603" size="10" maxlength="9" value="<%= cdRenRat.getCDR603()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR703" size="10" maxlength="9" value="<%= cdRenRat.getCDR703()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD04" size="5" maxlength="4" value="<%= cdRenRat.getCDRD04()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR104" size="10" maxlength="9" value="<%= cdRenRat.getCDR104()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR204" size="10" maxlength="9" value="<%= cdRenRat.getCDR204()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR304" size="10" maxlength="9" value="<%= cdRenRat.getCDR304()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR404" size="10" maxlength="9" value="<%= cdRenRat.getCDR404()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR504" size="10" maxlength="9" value="<%= cdRenRat.getCDR504()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR604" size="10" maxlength="9" value="<%= cdRenRat.getCDR604()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR704" size="10" maxlength="9" value="<%= cdRenRat.getCDR704()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD05" size="5" maxlength="4" value="<%= cdRenRat.getCDRD05()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR105" size="10" maxlength="9" value="<%= cdRenRat.getCDR105()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR205" size="10" maxlength="9" value="<%= cdRenRat.getCDR205()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR305" size="10" maxlength="9" value="<%= cdRenRat.getCDR305()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR405" size="10" maxlength="9" value="<%= cdRenRat.getCDR405()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR505" size="10" maxlength="9" value="<%= cdRenRat.getCDR505()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR605" size="10" maxlength="9" value="<%= cdRenRat.getCDR605()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR705" size="10" maxlength="9" value="<%= cdRenRat.getCDR705()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD06" size="5" maxlength="4" value="<%= cdRenRat.getCDRD06()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR106" size="10" maxlength="9" value="<%= cdRenRat.getCDR106()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR206" size="10" maxlength="9" value="<%= cdRenRat.getCDR206()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR306" size="10" maxlength="9" value="<%= cdRenRat.getCDR306()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR406" size="10" maxlength="9" value="<%= cdRenRat.getCDR406()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR506" size="10" maxlength="9" value="<%= cdRenRat.getCDR506()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR606" size="10" maxlength="9" value="<%= cdRenRat.getCDR606()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR706" size="10" maxlength="9" value="<%= cdRenRat.getCDR706()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD07" size="5" maxlength="4" value="<%= cdRenRat.getCDRD07()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR107" size="10" maxlength="9" value="<%= cdRenRat.getCDR107()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR207" size="10" maxlength="9" value="<%= cdRenRat.getCDR207()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR307" size="10" maxlength="9" value="<%= cdRenRat.getCDR307()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR407" size="10" maxlength="9" value="<%= cdRenRat.getCDR407()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR507" size="10" maxlength="9" value="<%= cdRenRat.getCDR507()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR607" size="10" maxlength="9" value="<%= cdRenRat.getCDR607()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR707" size="10" maxlength="9" value="<%= cdRenRat.getCDR707()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD08" size="5" maxlength="4" value="<%= cdRenRat.getCDRD08()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR108" size="10" maxlength="9" value="<%= cdRenRat.getCDR108()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR208" size="10" maxlength="9" value="<%= cdRenRat.getCDR208()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR308" size="10" maxlength="9" value="<%= cdRenRat.getCDR308()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR408" size="10" maxlength="9" value="<%= cdRenRat.getCDR408()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR508" size="10" maxlength="9" value="<%= cdRenRat.getCDR508()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR608" size="10" maxlength="9" value="<%= cdRenRat.getCDR608()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR708" size="10" maxlength="9" value="<%= cdRenRat.getCDR708()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD09" size="5" maxlength="4" value="<%= cdRenRat.getCDRD09()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR109" size="10" maxlength="9" value="<%= cdRenRat.getCDR109()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR209" size="10" maxlength="9" value="<%= cdRenRat.getCDR209()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR309" size="10" maxlength="9" value="<%= cdRenRat.getCDR309()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR409" size="10" maxlength="9" value="<%= cdRenRat.getCDR409()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR509" size="10" maxlength="9" value="<%= cdRenRat.getCDR509()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR609" size="10" maxlength="9" value="<%= cdRenRat.getCDR609()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR709" size="10" maxlength="9" value="<%= cdRenRat.getCDR709()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD10" size="5" maxlength="4" value="<%= cdRenRat.getCDRD10()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR110" size="10" maxlength="9" value="<%= cdRenRat.getCDR110()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR210" size="10" maxlength="9" value="<%= cdRenRat.getCDR210()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR310" size="10" maxlength="9" value="<%= cdRenRat.getCDR310()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR410" size="10" maxlength="9" value="<%= cdRenRat.getCDR410()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR510" size="10" maxlength="9" value="<%= cdRenRat.getCDR510()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR610" size="10" maxlength="9" value="<%= cdRenRat.getCDR610()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR710" size="10" maxlength="9" value="<%= cdRenRat.getCDR710()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD11" size="5" maxlength="4" value="<%= cdRenRat.getCDRD11()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR111" size="10" maxlength="9" value="<%= cdRenRat.getCDR111()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR211" size="10" maxlength="9" value="<%= cdRenRat.getCDR211()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR311" size="10" maxlength="9" value="<%= cdRenRat.getCDR311()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR411" size="10" maxlength="9" value="<%= cdRenRat.getCDR411()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR511" size="10" maxlength="9" value="<%= cdRenRat.getCDR511()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR611" size="10" maxlength="9" value="<%= cdRenRat.getCDR611()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR711" size="10" maxlength="9" value="<%= cdRenRat.getCDR711()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDRD12" size="5" maxlength="4" value="<%= cdRenRat.getCDRD12()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR112" size="10" maxlength="9" value="<%= cdRenRat.getCDR112()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR212" size="10" maxlength="9" value="<%= cdRenRat.getCDR212()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR312" size="10" maxlength="9" value="<%= cdRenRat.getCDR312()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR412" size="10" maxlength="9" value="<%= cdRenRat.getCDR412()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR512" size="10" maxlength="9" value="<%= cdRenRat.getCDR512()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR612" size="10" maxlength="9" value="<%= cdRenRat.getCDR612()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%" height="39"> 
              <div align="center"> 
                <input type="text" name="CDR712" size="10" maxlength="9" value="<%= cdRenRat.getCDR712()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD13" size="5" maxlength="4" value="<%= cdRenRat.getCDRD13()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR113" size="10" maxlength="9" value="<%= cdRenRat.getCDR113()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR213" size="10" maxlength="9" value="<%= cdRenRat.getCDR213()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR313" size="10" maxlength="9" value="<%= cdRenRat.getCDR313()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR413" size="10" maxlength="9" value="<%= cdRenRat.getCDR413()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR513" size="10" maxlength="9" value="<%= cdRenRat.getCDR513()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR613" size="10" maxlength="9" value="<%= cdRenRat.getCDR613()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR713" size="10" maxlength="9" value="<%= cdRenRat.getCDR713()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD014" size="5" maxlength="4" value="<%= cdRenRat.getCDRD14()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR114" size="10" maxlength="9" value="<%= cdRenRat.getCDR114()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR214" size="10" maxlength="9" value="<%= cdRenRat.getCDR214()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR314" size="10" maxlength="9" value="<%= cdRenRat.getCDR314()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR414" size="10" maxlength="9" value="<%= cdRenRat.getCDR414()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR514" size="10" maxlength="9" value="<%= cdRenRat.getCDR514()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR614" size="10" maxlength="9" value="<%= cdRenRat.getCDR614()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR714" size="10" maxlength="9" value="<%= cdRenRat.getCDR714()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDRD015" size="5" maxlength="4" value="<%= cdRenRat.getCDRD15()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR115" size="10" maxlength="9" value="<%= cdRenRat.getCDR115()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR215" size="10" maxlength="9" value="<%= cdRenRat.getCDR215()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR315" size="10" maxlength="9" value="<%= cdRenRat.getCDR315()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR415" size="10" maxlength="9" value="<%= cdRenRat.getCDR415()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR515" size="10" maxlength="9" value="<%= cdRenRat.getCDR515()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR615" size="10" maxlength="9" value="<%= cdRenRat.getCDR615()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
            <td width="13%"> 
              <div align="center"> 
                <input type="text" name="CDR715" size="10" maxlength="9" value="<%= cdRenRat.getCDR715()%>"
				<% if (cdRenRat.getE01CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="50%"> 
        <div align="center"> 
          <input type="button" name="Button" value="Submit">
        </div>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
