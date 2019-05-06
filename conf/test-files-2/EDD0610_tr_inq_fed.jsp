<html>
<head>
<title>Fed Document </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqFed" class="datapro.eibs.beans.EDD061002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

<h3 align="center">Fed  Document<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDD0610_tr_inq_fed.jsp"></h3>

<hr size="4" width="100%">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <p><b>General Information</b></p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="17%" >Fecha Instrucciones:</td>
            <td nowrap width="10%" > 
              <input type="text" readonly name="E02INSDT1" size="1" maxlength="2" value="<%= inqFed.getE02INSDT1().trim()%>" >
              <input type="text" readonly name="E02INSDT2" size="1" maxlength="3" value="<%= inqFed.getE02INSDT2().trim()%>" >
              <input type="text" readonly name="E02INSDT3" size="1" maxlength="3" value="<%= inqFed.getE02INSDT3().trim()%>" >
            </td>
            <td nowrap width="10%" > 
              <div align="right">By Order: </div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" readonly size="25" maxlength="35" name="E02FEDORG" value="<%= inqFed.getE02FEDORG().trim()%>" >
            </td>
            <td nowrap width="12%" > 
              <div align="right">Ref. Number: </div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" readonly size="14" maxlength="16" name="E02FEDREF" value="<%= inqFed.getE02FEDREF().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Sender ABA: </div>
            </td>
            <td nowrap width="10%" > 
              <input type="text" readonly name="E02FEDSAB" size="10" maxlength="9" value="<%= inqFed.getE02FEDSAB().trim()%>" >
            </td>
            <td nowrap width="10%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" readonly size="25" maxlength="35" name="E02FEDOR1" value="<%= inqFed.getE02FEDOR1().trim()%>" >
            </td>
            <td nowrap width="12%" > 
              <div align="right">Name: </div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" readonly name="E02FEDSNM" size="14" maxlength="18" value="<%= inqFed.getE02FEDSNM().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%"> 
              <div align="right"> Receiver ABA: </div>
            </td>
            <td nowrap width="10%"> 
              <input type="text" readonly name="E02FEDRAB" size="10" maxlength="9" value="<%= inqFed.getE02FEDRAB().trim()%>" >
            </td>
            <td nowrap width="10%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" readonly size="25" maxlength="35" name="E02FEDOR2" value="<%= inqFed.getE02FEDOR2().trim()%>" >
            </td>
            <td nowrap width="12%"> 
              <div align="right">Name: </div>
            </td>
            <td nowrap width="29%"> 
              <input type="text" readonly name="E02FEDRNM" size="14" maxlength="18" value="<%= inqFed.getE02FEDRNM().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%"> 
              <div align="right">Type/ Subtype:</div>
            </td>
            <td nowrap width="10%"> 
              <input type="text" readonly name="E02FEDTS1" size="1" maxlength="2" value="<%= inqFed.getE02FEDTS1().trim()%>" >
              / 
              <input type="text" readonly name="E02FEDTS2" size="1" maxlength="2" value="<%= inqFed.getE02FEDTS2().trim()%>" >
            </td>
            <td nowrap width="10%"> 
              <div align="right">Number: </div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" readonly name="E03SWFSID" size="12" maxlength="15" >
            </td>
            <td nowrap width="12%"> 
              <div align="right">Amount: </div>
            </td>
            <td nowrap width="29%"> 
              <input type="text" readonly size="14" maxlength="18" name="E02WRTCAM" value="<%= inqFed.getE02WRTCAM().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Parameters</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="22%" >Issue Bank:</td>
            <td nowrap width="36%" > 
              <div align="left">Beneficiary Bank: </div>
            </td>
            <td nowrap width="42%" > Issue/ Benef Information.:</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="left"> 
                <input type="text" readonly name="E02FEDORB" size="30" maxlength="34" value="<%= inqFed.getE02FEDORB().trim()%>" >
              </div>
            </td>
            <td nowrap width="36%" > 
              <div align="left"> 
                <input type="text" readonly size="30" maxlength="35" name="E02FEDBBK" value="<%= inqFed.getE02FEDBBK().trim()%>" >
              </div>
            </td>
            <td nowrap width="42%" > 
              <div align="left"> 
                <input type="text" readonly name="E02FEDOBI" size="30" maxlength="35" value="<%= inqFed.getE02FEDOBI().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%">Product Code:</td>
            <td nowrap width="36%"> 
              <div align="left"> Beneficiary: </div>
            </td>
            <td nowrap width="42%"> 
              <div align="left">Bank to Bank Information:</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="left"> 
                <input type="text" readonly name="E02FEDPRC" size="3" maxlength="3" value="<%= inqFed.getE02FEDPRC().trim()%>" >
                <input type="text" readonly name="E02FEDIBK" size="25" maxlength="9" value="<%= inqFed.getE02FEDIBK().trim()%>" >
              </div>
            </td>
            <td nowrap width="36%" height="41"> 
              <div align="left"> 
                <input type="text" readonly size="30" maxlength="35" name="E02FEDBNF" value="<%= inqFed.getE02FEDBNF().trim()%>" >
              </div>
            </td>
            <td nowrap width="42%" > 
              <div align="left"> 
                <input type="text" readonly name="E02FEDBBI" size="30" maxlength="35" value="<%= inqFed.getE02FEDBBI().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap width="36%" height="41"> 
              <div align="left"> 
                <input type="text" readonly size="30" maxlength="35" name="E02FEDBN1" value="<%= inqFed.getE02FEDBN1().trim()%>" >
              </div>
            </td>
            <td nowrap width="42%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap width="36%">Beneficiary Ref. </td>
            <td nowrap width="42%">Bank Instructions: </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="left"> </div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" readonly size="30" maxlength="35" name="E02FEDBRF" value="<%= inqFed.getE02FEDBRF().trim()%>" >
              </div>
            </td>
            <td nowrap width="42%"> 
              <div align="left"> 
                <input type="text" readonly size="30" maxlength="35" name="E02FEDINS" value="<%= inqFed.getE02FEDINS().trim()%>" >
              </div>
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
