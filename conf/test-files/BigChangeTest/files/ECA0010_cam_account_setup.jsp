<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Customer Account Management</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="cam" class="datapro.eibs.beans.ECA001001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT Language="Javascript">

  

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


</SCRIPT>

</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%> 
<h3 align="center"> Control Parameters for CD's Investments - Control Parameters for 
  CD's Investments</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECA0010" >
  <h4> 
    <input type="hidden" name="E01CAMBNK" value="<%= cam.getE01CAMBNK()%>"
                >
    <input type="hidden" name="SCREEN" value="400">
  </h4>
  <h4>Corporations</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <h5 align="center">G/L</h5>
            </td>
            <td nowrap > 
              <h5 align="center">Description</h5>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Up-to $100,000.00 :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL1" size="15" maxlength="13" value="<%= cam.getE01CAMGL1()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL1" size="36" maxlength="35" value="<%= cam.getE01DSCGL1()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Over $100,000.00 :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL2" size="15" maxlength="13" value="<%= cam.getE01CAMGL2()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL2" size="36" maxlength="35" value="<%= cam.getE01DSCGL2()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Service Charge Income :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL3" size="15" maxlength="13" value="<%= cam.getE01CAMGL3()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL3" size="36" maxlength="35" value="<%= cam.getE01DSCGL3()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Income Amortization :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL4" size="15" maxlength="13" value="<%= cam.getE01CAMGL4()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL4" size="36" maxlength="35" value="<%= cam.getE01DSCGL4()%>"
                >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Personals</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <h5 align="center">G/L</h5>
            </td>
            <td nowrap > 
              <h5 align="center">Description</h5>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Up-to $100,000.00 :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL5" size="15" maxlength="13" value="<%= cam.getE01CAMGL5()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL5" size="36" maxlength="35" value="<%= cam.getE01DSCGL5()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Over $100,000.00 :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL6" size="15" maxlength="13" value="<%= cam.getE01CAMGL6()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL6" size="36" maxlength="35" value="<%= cam.getE01DSCGL6()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Service Charge Income :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL7" size="15" maxlength="13" value="<%= cam.getE01CAMGL7()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL7" size="36" maxlength="35" value="<%= cam.getE01DSCGL7()%>"
                >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Income Amortization :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CAMGL8" size="15" maxlength="13" value="<%= cam.getE01CAMGL8()%>" 
				oncontextmenu="showPopUp(ledgerHelp,this.name,document.forms[0].E01CAMBNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01DSCGL8" size="36" maxlength="35" value="<%= cam.getE01DSCGL8()%>"
                >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><br>
  </p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <p><BR>
  </p>
</form>
</body>
</html>
