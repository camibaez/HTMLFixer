<html>
<head>
<title>Telex Document</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqTelex" class="datapro.eibs.beans.EDD061004Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<h3 align="center">Telex Document<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDD0610_tr_inq_telex.jsp"></h3>
<hr size="4" width="100%">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <p> <b>W/T Regular Telex</b></p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="23%" >Orig Department:</td>
            <td nowrap width="23%" > 
              <div align="left">Telex Number:</div>
            </td>
            <td nowrap width="20%" >Value Date : </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" readonly name="E04TLXORD" size="10" maxlength="12" value="<%= inqTelex.getE04TLXORD().trim()%>" >
              </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" readonly size="6" maxlength="6" name="E04TLX" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly size="1" maxlength="2" name="E04INSDT1" value="<%= inqTelex.getE04INSDT1().trim()%>" >
              <input type="text" readonly name="E04INSDT2" size="1" maxlength="2" value="<%= inqTelex.getE04INSDT2().trim()%>" >
              <input type="text" readonly name="E04INSDT3" size="1" maxlength="2" value="<%= inqTelex.getE04INSDT2().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="left">Receiver Bank:</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> Telex Log Ref: </div>
            </td>
            <td nowrap width="20%">Amount: </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E04TLXCNU" size="10" maxlength="9" value="<%= inqTelex.getE04TLXCNU().trim()%>" >
              </div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly size="12" maxlength="12" name="E04TLXLOG" value="<%= inqTelex.getE04TLXLOG().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E04WRTCAM" size="12" maxlength="15" value="<%= inqTelex.getE04WRTCAM().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%">Name:</td>
            <td nowrap width="23%">Short Name:</td>
            <td nowrap width="20%">Advise Via: </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%"> 
              <input type="text" readonly name="E04TLXTO1" size="20" maxlength="25" value="<%= inqTelex.getE04TLXTO1().trim()%>" >
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly size="15" maxlength="15" name="E04TLXCSN" value="<%= inqTelex.getE04TLXCSN().trim()%>" >
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E04TLXVIA" size="12" maxlength="15" value="<%= inqTelex.getE04TLXVIA().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" readonly name="E04TLXTO2" size="20" maxlength="25" value="<%= inqTelex.getE04TLXTO2().trim()%>" >
              </div>
            </td>
            <td nowrap width="23%">&nbsp; </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4><b>Please Effect the Fallowing Payment</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="26%" >Test No:</td>
            <td nowrap width="17%" > 
              <div align="left">By Order of: </div>
            </td>
            <td nowrap width="19%" >Issue Bank : </td>
            <td nowrap width="38%" >Our Reference: </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" > 
              <div align="left"> 
                <input type="text" readonly name="E04TLXTYN" size="18" maxlength="20" value="<%= inqTelex.getE04TLXTYN().trim()%>" >
                <input type="text" readonly size="1" maxlength="20" name="E04TLXTSN" value="<%= inqTelex.getE04TLXTSN().trim()%>" >
              </div>
            </td>
            <td nowrap width="17%" > 
              <div align="left"> 
                <input type="text" readonly size="20" maxlength="20" name="E05WRTBYO" value="<%= userPO.getHeader4().trim()%>" >
              </div>
            <td nowrap width="19%" > 
              <div align="<font size="2"> 
                <input type="text" readonly name="E04TLXORB" size="20" maxlength="30" value="<%= inqTelex.getE04TLXORB().trim()%>" >
              </div>
            </td>
            <td nowrap width="38%" > 
              <input type="text" readonly name="E04WRTORF" size="20" maxlength="30" value="<%= inqTelex.getE04WRTORF().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%">Beneficiary's Bank:</td>
            <td nowrap width="17%"> 
              <div align="left"> Benef Customer: </div>
            </td>
            <td nowrap colspan="2"> 
              <div align="left"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" readonly name="E04TLXBF1" size="30" maxlength="35" value="<%= inqTelex.getE04TLXBF1().trim()%>" >
              </div>
            </td>
            <td nowrap colspan="3" height="41"> 
              <div align="left"> 
                <input type="text" readonly size="45" maxlength="30" name="E04TLXBNA" value="<%= inqTelex.getE04TLXBNA().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%"> 
              <input type="text" readonly name="E04TLXBF2" size="30" maxlength="35" value="<%= inqTelex.getE04TLXBF2().trim()%>" >
            </td>
            <td nowrap colspan="3" height="41"> 
              <div align="left"> 
                <input type="text" readonly size="45" maxlength="30" name="E04TLXBNB" value="<%= inqTelex.getE04TLXBNB().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <input type="text" readonly name="E04TLXBB1" size="30" maxlength="35" value="<%= inqTelex.getE04TLXBB1().trim()%>" >
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly size="45" maxlength="30" name="E04TLXBN1" value="<%= inqTelex.getE04TLXBN1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%">Datail's of Payments:</td>
            <td nowrap colspan="3">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4"> 
              <input type="text" readonly size="45" maxlength="30" name="E04TLXDT1" value="<%= inqTelex.getE04TLXDT1().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="4"> 
              <div align="left"> 
                <input type="text" readonly size="45" maxlength="30" name="E04TLXDT2" value="<%= inqTelex.getE04TLXDT2().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Reimbursement Instructions</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">We Cr Your Ac W/US</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" readonly name="E04TLXOUA" size="10" maxlength="12" value="<%= inqTelex.getE04TLXOUA().trim()%>" >
            </td>
            <td nowrap width="19%" > 
              <div align="right">Chg Our Acc W/you: </div>
            </td>
            <td nowrap width="47%" > 
              <input type="text" readonly size="13" maxlength="13" name="E04TLXOU1" value="<%= inqTelex.getE04TLXOU1().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">Any Charges for Acc of: Our :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" readonly name="E04TLXCHO" size="1" maxlength="2" value="<%= inqTelex.getE04TLXCHO().trim()%>" >
              Bene.: 
              <input type="text" readonly size="1" maxlength="2" name="E04TLXCHB2" value="<%= inqTelex.getE04TLXCHB().trim()%>" >
            </td>
            <td nowrap width="19%" > 
              <div align="right">Cover Provided with :Our </div>
            </td>
            <td nowrap width="47%" > 
              <input type="text" readonly name="E04TLXOTC" size="19" maxlength="20" value="<%= inqTelex.getE04TLXOTC().trim()%>" >
              Bene: 
              <input type="text" readonly name="E04TLXCVP" size="20" maxlength="30" value="<%= inqTelex.getE04TLXCVP().trim()%>" >
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
