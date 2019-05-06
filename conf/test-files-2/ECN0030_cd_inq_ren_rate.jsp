
<%@ page  import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>CD Products Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  function showTab(index){  
  	for(var i=0;i<2;i++){
   		document.all["Tab"+i].className="tabnormal";
   		document.all["dataTab"+i].style.display="none";
   	}
  
    document.all["Tab"+index].className="tabhighlight";  
  	document.all["dataTab"+index].style.display="";
  }
</SCRIPT>
</head>

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.ECN0030DSMessage"  scope="session" />
<jsp:useBean id="cdAPY" class="datapro.eibs.beans.ECN0030DSMessage"  scope="session" />

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
<h3 align="center">Certificates of Deposit Rate Structure Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_inq_ren_rate, ECN0030"></h3>
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
              <div align="right"><b>Processing Date :</b></div>
            </td>
            <td width="15%"> <%=Util.formatDate( cdRenRat.getE02CDRDT1().trim(),cdRenRat.getE02CDRDT2().trim(), 
              cdRenRat.getE02CDRDT3().trim())%> </td>
            <td width="28%"> 
              <div align="right"><b>Maximum Rate :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRMXR().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td width="24%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td width="15%"> <%= cdRenRat.getE02CDRCCY().trim()%> </td>
            <td width="28%"> 
              <div align="right"><b>Penalty Days :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRDPE().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td width="24%"> 
              <div align="right"><b>Minimum Rate :</b></div>
            </td>
            <td width="15%"> <%= cdRenRat.getE02CDRMIR().trim()%> </td>
            <td width="28%"> 
              <div align="right"><b>Penalty Rate :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRPRT().trim()%> </td>
          </tr>
          <tr id="trclear">
            <td width="28%"> 
              <div align="right"><b>Base Rate Tier To :</b></div>
            </td>
            <td width="33%"><%= cdRenRat.getE02CDBRTN().trim()%> </td>
            <td width="28%">&nbsp;</td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Rates & Terms</h4>
  
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr> 
       <td nowrap> 
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
                <tr> 
                    <td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0)"> 
                            <div nowrap>&nbsp;Nominal&nbsp;</div>
                    </td> 
                    <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1)"> 
                            <div nowrap>&nbsp;A.P.Y.&nbsp;</div>
                    </td> 
                    <td class="tabempty" width="100%">&nbsp;                        
                    </td> 
                 </tr>
            </table>
       </td>
    </tr>
  </table>
  
  <table class="tabdata" width="100%">
    <tr>
     <td nowrap>        
  	   <div id="dataTab0">
   		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr id="trclear"> 
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
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Terms</b></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA1().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA2().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA3().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA4().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA5().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA6().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA7().trim())%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"><b>Spread</b></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR01().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR02().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR03().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR04().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR05().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR06().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>><%= cdRenRat.getE02SPR07().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Days </b></div>
            </td>
            <td colspan="7" valign="middle"> 
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"><b>Rates</b></div>
              </td>
          </tr>
		  <%if (!cdRenRat.getE02CDD01().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD01().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL101().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL201().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL301().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL401().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL501().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL601().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL701().trim()%> </div>
            </td>
          </tr>
          <%}%>
		  <%if (!cdRenRat.getE02CDD02().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD02().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL102().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL202().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL302().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL402().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL502().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL602().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL702().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD03().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD03().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL103().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL203().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL303().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL403().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL503().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL603().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL703().trim()%> </div>
            </td>
          </tr>
		<%}%>
		   <%if (!cdRenRat.getE02CDD04().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD04().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL104().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL204().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL304().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL404().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL504().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL604().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL704().trim()%> </div>
            </td>
          </tr>
		   <%}%>
		   <%if (!cdRenRat.getE02CDD05().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD05().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL105().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL205().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL305().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL405().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL505().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL605().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL705().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD06().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD06().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL106().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL206().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL306().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL406().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL506().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL606().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL706().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD07().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center" > <%= cdRenRat.getE02CDD07().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL107().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL207().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL307().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL407().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL507().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL607().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL707().trim()%> </div>
            </td>
          </tr>
  		  <%}%>
		   <%if (!cdRenRat.getE02CDD08().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD08().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL108().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL208().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL308().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL408().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL508().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL608().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL708().trim()%> </div>
            </td>
          </tr>
  		  <%}%>
		   <%if (!cdRenRat.getE02CDD09().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD09().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL109().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL209().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL309().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL409().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL509().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL609().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL709().trim()%> </div>
            </td>
          </tr>
 		  <%}%>
		   <%if (!cdRenRat.getE02CDD10().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD10().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL110().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL210().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL310().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL410().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL510().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL610().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL710().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD11().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD11().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL111().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL211().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL311().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL411().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL511().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL611().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL711().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		  <%if (!cdRenRat.getE02CDD12().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%" height="22"> 
              <div align="center"> <%= cdRenRat.getE02CDD12().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL112().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL212().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL312().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL412().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL512().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL612().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL712().trim()%> </div>
            </td>
          </tr>
		 <%}%>
		  <%if (!cdRenRat.getE02CDD13().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD13().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL113().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL213().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL313().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL413().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL513().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL613().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL713().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD14().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD14().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL114().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL214().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL314().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL414().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL514().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL614().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL714().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdRenRat.getE02CDD15().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD15().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL115().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL215().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL315().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL415().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL515().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL615().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL715().trim()%> </div>
            </td>
          </tr>
		<%}%>
        </table>
        </div>
        <div id="dataTab1" style="display: none"> 
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr id="trclear"> 
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
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Terms</b></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA1().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA2().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA3().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA4().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA5().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA6().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdAPY.getE02CDUA7().trim())%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"><b>Spread</b></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR01().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR02().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR03().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR04().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR05().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR06().trim()%></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>><%= cdAPY.getE02SPR07().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Days </b></div>
            </td>
            <td colspan="7" valign="middle"> 
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"><b>Rates</b></div>
              </td>
          </tr>
		  <%if (!cdAPY.getE02CDD01().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD01().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL101().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL201().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL301().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL401().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL501().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL601().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL701().trim()%> </div>
            </td>
          </tr>
          <%}%>
		  <%if (!cdAPY.getE02CDD02().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD02().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL102().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL202().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL302().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL402().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL502().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL602().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL702().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD03().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD03().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL103().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL203().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL303().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL403().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL503().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL603().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL703().trim()%> </div>
            </td>
          </tr>
		<%}%>
		   <%if (!cdAPY.getE02CDD04().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD04().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL104().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL204().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL304().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL404().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL504().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL604().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL704().trim()%> </div>
            </td>
          </tr>
		   <%}%>
		   <%if (!cdAPY.getE02CDD05().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD05().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL105().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL205().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL305().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL405().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL505().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL605().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL705().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD06().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD06().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL106().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL206().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL306().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL406().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL506().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL606().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL706().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD07().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center" > <%= cdAPY.getE02CDD07().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL107().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL207().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL307().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL407().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL507().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL607().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL707().trim()%> </div>
            </td>
          </tr>
  		  <%}%>
		   <%if (!cdAPY.getE02CDD08().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD08().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL108().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL208().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL308().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL408().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL508().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL608().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL708().trim()%> </div>
            </td>
          </tr>
  		  <%}%>
		   <%if (!cdAPY.getE02CDD09().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD09().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL109().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL209().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL309().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL409().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL509().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL609().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL709().trim()%> </div>
            </td>
          </tr>
 		  <%}%>
		   <%if (!cdAPY.getE02CDD10().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD10().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL110().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL210().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL310().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL410().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL510().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL610().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL710().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD11().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD11().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL111().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL211().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL311().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL411().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL511().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL611().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL711().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		  <%if (!cdAPY.getE02CDD12().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%" height="22"> 
              <div align="center"> <%= cdAPY.getE02CDD12().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL112().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL212().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL312().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL412().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL512().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL612().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL712().trim()%> </div>
            </td>
          </tr>
		 <%}%>
		  <%if (!cdAPY.getE02CDD13().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD13().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL113().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL213().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL313().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL413().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL513().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL613().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL713().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD14().trim().equals("0")){%>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD14().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL114().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL214().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL314().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL414().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL514().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL614().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL714().trim()%> </div>
            </td>
          </tr>
		  <%}%>
		   <%if (!cdAPY.getE02CDD15().trim().equals("0")){%>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdAPY.getE02CDD15().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL115().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL215().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL315().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL415().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL515().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL615().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdAPY.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdAPY.getE02CL715().trim()%> </div>
            </td>
          </tr>
		<%}%>
        </table>
          
          
        </div>
      </td>
    </tr>
  </table>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
  </div>
  </form>
</body>
</html>
