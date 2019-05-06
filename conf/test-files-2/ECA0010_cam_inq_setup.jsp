<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="cam" class="datapro.eibs.beans.ECA002001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="JavaScript">

function closeEnterACC(){
   	 enterACC.filters[0].apply();
     enterACC.style.visibility="hidden";
     enterACC.filters[0].Play();

  	 enterACCLoans.filters[0].apply();
     enterACCLoans.style.visibility="hidden";
     enterACCLoans.filters[0].Play();

	 enterACCSV.filters[0].apply();
     enterACCSV.style.visibility="hidden";
     enterACCSV.filters[0].Play();

	 enterACCCD.filters[0].apply();
     enterACCCD.style.visibility="hidden";
     enterACCCD.filters[0].Play();


}

function ShowEnterACC() {
	 var y=10 + document.body.scrollTop;
     var x=10 + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();

}

function cancelBub(){
  event.cancelBubble = true;
}


function ShowEnterACCLoans() {
	 var y=10 + document.body.scrollTop;
     var x=10 + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACCLoans.style.pixelTop=' + y);
     eval('enterACCLoans.style.pixelLeft=' + x);
	 enterACCLoans.filters[0].apply();
     enterACCLoans.style.visibility="visible";
     enterACCLoans.filters[0].Play();

}

function ShowEnterACCSV() {
	 var y=10 + document.body.scrollTop;
     var x=10 + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACCSV.style.pixelTop=' + y);
     eval('enterACCSV.style.pixelLeft=' + x);
	 enterACCSV.filters[0].apply();
     enterACCSV.style.visibility="visible";
     enterACCSV.filters[0].Play();

}

function ShowEnterACCCD() {
	 var y=10 + document.body.scrollTop;
     var x=10 + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACCCD.style.pixelTop=' + y);
     eval('enterACCCD.style.pixelLeft=' + x);
	 enterACCCD.filters[0].apply();
     enterACCCD.style.visibility="visible";
     enterACCCD.filters[0].Play();

}


document.onclick= closeEnterACC;

function GetPrimNumber(){
  document.forms[0].E01CAMPRI.value = document.forms[0].E01CAMPAC.value;
  document.forms[0].E01CAMPRIL.value = document.forms[0].E01CAMPAC.value;
  document.forms[0].E01CAMPRID.value = document.forms[0].E01CAMPAC.value;
}

function GetMinBal(){
  document.forms[0].E01MINBAL.value = document.forms[0].E01CAMLWT.value;
  document.forms[0].E01MINBA1.value = document.forms[0].E01CAMLWT.value;
  document.forms[0].E01MINBA2.value = document.forms[0].E01CAMLWT.value;
}
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECA0010" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <input type=HIDDEN name="E01ACMCUN" value="<%= cam.getE01ACMCUN().trim()%>">

  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()">
   <table  class="tableinfo" >
    <tr >
      <td nowrap>
   <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;

	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <table  class="tableinfo" >
        <tr id="trdark">
          <td nowrap >
            <div align="left"><b>Primary Account - <%= cam.getE01CAMPAC()%> -
              <%= cam.getE01ACMPRO()%></b></div>
          </td>

        </tr>
        <tr >
          <td nowrap>
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark">
                <td nowrap >
                  <div align="right"><b>Service Charge Frequency</b></div>
                </td>
                <td nowrap >
                  <div align="center"><b>Type</b></div>
                </td>
                <td nowrap >
                  <div align="center"><b>Factor </b></div>
                </td>
                <td nowrap >&nbsp;</td>
                <td nowrap >
                  <div align="left"></div>
                </td>
              </tr>
              <tr id="trclear">
                <td nowrap >
                  <div align="right">Per Transaction :</div>
                </td>
                <td nowrap >
                  <div align="left"></div>
                </td>
                <td nowrap >
                  <div align="center">
                    <input type="text" readonly  name="E01CAMPSF" size="10" maxlength="9" value="<%= cam.getE01CAMPSF()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">End Entire Relation on :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMERM" size="2" maxlength="2" value="<%= cam.getE01CAMERM().trim()%>" onKeyPress="enterInteger()">
                    <input type="text" readonly  name="E01CAMERD" size="2" maxlength="2" value="<%= cam.getE01CAMERD().trim()%>" onKeyPress="enterInteger()">
                    <input type="text" readonly  name="E01CAMERY" size="2" maxlength="2" value="<%= cam.getE01CAMERY().trim()%>" onKeyPress="enterInteger()">
                    </div>
                </td>
              </tr>
              <tr id="trdark">
                <td nowrap >
                  <div align="right">Per Month Statement Cycle :</div>
                </td>
                <td nowrap >
                  <div align="center">
                    <input type="text" readonly  name="E01CAMSTM" size="2" maxlength="1" value="<%= cam.getE01CAMSTM()%>">
                    (F%) </div>
                </td>
                <td nowrap >
                  <div align="center">
                    <input type="text" readonly  name="E01CAMMSF" size="10" maxlength="9" value="<%= cam.getE01CAMMSF()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">Entire Relation Status :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <select disabled name="E01CAMRST">
                      <option value="" <% if (cam.getE01CAMRST().equals("")) out.print("selected"); %>></option>
                      <option value="A" <% if (cam.getE01CAMRST().equals("A")) out.print("selected"); %>>Active</option>
                      <option value="H" <% if (cam.getE01CAMRST().equals("H")) out.print("selected"); %>>Held</option>
                      <option value="E" <% if (cam.getE01CAMRST().equals("E")) out.print("selected"); %>>Ended</option>
                    </select>
                  </div>
                </td>
              </tr>
              <tr id="trclear">
                <td nowrap >
                  <div align="right">Per Year :</div>
                </td>
                <td nowrap >
                  <div align="left"></div>
                </td>
                <td nowrap >
                  <div align="center">
                    <input type="text" readonly  name="E01CAMYSF" size="10" maxlength="9" value="<%= cam.getE01CAMYSF()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">Corporation/Personal :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <select disabled name="E01CAMCOP">
                      <option value="" <% if (cam.getE01CAMCOP().equals("")) out.print("selected"); %>></option>
                      <option value="C" <% if (cam.getE01CAMCOP().equals("A")) out.print("selected"); %>>Corporate</option>
                      <option value="P" <% if (cam.getE01CAMCOP().equals("H")) out.print("selected"); %>>Personal</option>
                    </select>
                  </div>
                </td>
              </tr>
              <tr id="trdark">
                <td nowrap colspan="5" >&nbsp;</td>
              </tr>
              <tr id="trclear">
                <td nowrap >
                  <div align="right">Maximum Service Charge Amount :</div>
                </td>
                <td nowrap >
                  <input type="text" readonly  name="E01CAMXSC" size="10" maxlength="9" value="<%= cam.getE01CAMXSC()%>">
                </td>
                <td nowrap >&nbsp;</td>
                <td nowrap >
                  <div align="right">Minimum Service Charge Amount :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMISC" size="10" maxlength="9" value="<%= cam.getE01CAMISC()%>">
                  </div>
                </td>
              </tr>
              <tr id="trdark">
                <td nowrap >
                  <div align="right">Primary Account Minimum Balance :</div>
                </td>
                <td nowrap >
                  <input type="text" readonly  name="E01CAMLWT" size="10" maxlength="9" value="<%= cam.getE01CAMLWT()%>"
			  onChange="javascript:GetMinBal()">
                </td>
                <td nowrap colspan="3" >
                  <div align="left">(Year to Date)</div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h4>Credit Card Information</h4>
      <table  class="tableinfo" width="545">
        <tr >
          <td nowrap>
            <table cellpadding=2 cellspacing=0 width="100%" border="0">
              <tr id="trdark">
                <td nowrap >
                  <div align="right">Credit Card Number :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMCCN" size="21" maxlength="20" value="<%= cam.getE01CAMCCN()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">Type :</div>
                </td>
                <td nowrap >
                  <select disabled name="E01CAMCCT">
                    <option value="" <% if (cam.getE01CAMCCT().equals("")) out.print("selected"); %>></option>
                    <option value="VI" <% if (cam.getE01CAMCCT().equals("VI")) out.print("selected"); %>>Visa</option>
                    <option value="MC" <% if (cam.getE01CAMCCT().equals("MC")) out.print("selected"); %>>Master
                    Card</option>
                    <option value="AE" <% if (cam.getE01CAMCCT().equals("AE")) out.print("selected"); %>>American
                    Express</option>
                    <option value="DI" <% if (cam.getE01CAMCCT().equals("DI")) out.print("selected"); %>>Discovery</option>
                  </select>
                </td>
              </tr>
              <tr id="trclear">
                <td nowrap >
                  <div align="right">Credit Limit :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMCCL" size="15" maxlength="13" value="<%= cam.getE01CAMCCL()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">Balance :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMCCB" size="15" maxlength="13" value="<%= cam.getE01CAMCCB()%>">
                  </div>
                </td>
              </tr>
              <tr id="trdark">
                <td nowrap >
                  <div align="right">Rate Percentage :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMCCR" size="12" maxlength="11" value="<%= cam.getE01CAMCCR()%>">
                  </div>
                </td>
                <td nowrap >
                  <div align="right">Interest Paid :</div>
                </td>
                <td nowrap >
                  <div align="left">
                    <input type="text" readonly  name="E01CAMCCI" size="15" maxlength="13" value="<%= cam.getE01CAMCCI()%>">
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </table>
	</td>
	</tr>
	</table>
  </div>

  <div id="enterACCLoans" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <table  class="tableinfo" >
    <tr >
      <td nowrap>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;

	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">

<table  class="tableinfo" >
    <tr id="trdark">
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="3" ><b>Setup Demand Loan Relationship</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="center">Cr (Daily Payments) Dr</div>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center"><b>Demand Loan </b></div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/left2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center"><b>Primary Account </b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="E01CAMPRI" size="17" maxlength="15"  value="<%= userPO.getHeader1()%>" >
              </div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/right2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="E01CAMLNS" size="17" maxlength="15" value="<%= cam.getE01CAMSACL()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >&nbsp;</td>
            <td nowrap >
              <div align="center">Dr (Daily Transfer) Cr</div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>

  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Minimum Transfer Amount :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMITAL" size="10" maxlength="9" value="<%= cam.getE01CAMITAL()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">In Multiples Of :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMTMOL" size="8" maxlength="7" value="<%= cam.getE01CAMTMOL()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">End Relation On :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMER1L" size="2" maxlength="2" value="<%= cam.getE01CAMER1L().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER2L" size="2" maxlength="2" value="<%= cam.getE01CAMER2L().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER3L" size="2" maxlength="2" value="<%= cam.getE01CAMER3L().trim()%>" onKeyPress="enterInteger()">

              </div>
            </td>
            <td nowrap >
              <div align="right">Relation Status :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select disabled name="E01CAMRSTL">
                  <option value="" <% if (cam.getE01CAMRSTL().equals("")) out.print("selected"); %>></option>
                  <option value="A" <% if (cam.getE01CAMRSTL().equals("A")) out.print("selected"); %>>Active</option>
                  <option value="H" <% if (cam.getE01CAMRSTL().equals("H")) out.print("selected"); %>>Held</option>
                  <option value="E" <% if (cam.getE01CAMRSTL().equals("E")) out.print("selected"); %>>Ended</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Maximum Loan Amount :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMMLAL" size="10" maxlength="9" value="<%= cam.getE01CAMMLAL()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">Primary Account Min/ Bal :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01MINBAL" size="10" maxlength="9"  >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Principal Payment Cycle :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select disabled name="E01CAMPPCL">
                  <option value="" <% if (cam.getE01CAMPPCL().equals("")) out.print("selected"); %>></option>
                  <option value="C" <% if (cam.getE01CAMPPCL().equals("D")) out.print("selected"); %>>Daily</option>
                  <option value="P" <% if (cam.getE01CAMPPCL().equals("M")) out.print("selected"); %>>Monthly</option>
                  <option value="Q" <% if (cam.getE01CAMPPCL().equals("Q")) out.print("selected"); %>>Quaterly</option>
                </select>
              </div>
            </td>
            <td nowrap >
              <div align="right">Interest Payment Cycle :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select disabled name="E01CAMIPCL">
                  <option value="" <% if (cam.getE01CAMIPCL().equals("")) out.print("selected"); %>></option>
                  <option value="C" <% if (cam.getE01CAMIPCL().equals("D")) out.print("selected"); %>>Daily</option>
                  <option value="P" <% if (cam.getE01CAMIPCL().equals("M")) out.print("selected"); %>>Monthly</option>
                  <option value="Q" <% if (cam.getE01CAMIPCL().equals("Q")) out.print("selected"); %>>Quaterly</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Minimum Payment Cycle :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMMPAL" size="15" maxlength="13" value="<%= cam.getE01CAMMPAL()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">Maximum Number of Payments :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMNIPL" size="5" maxlength="3" value="<%= cam.getE01CAMNIPL()%>" >
                (*)</div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK1L" size="71" maxlength="70" value="<%= cam.getE01CAMRK1L()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >&nbsp;</td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK2L" size="71" maxlength="70" value="<%= cam.getE01CAMRK2L()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="4" >
              <div align="left">(*) For Average Payment</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  </table>

</td>
</tr>
</table>

  </div>



  <div id="enterACCSV" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">

 <table  class="tableinfo" >
    <tr >
      <td nowrap>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;

	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">

<table  class="tableinfo" >
    <tr id="trdark">
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="3" ><b>Set-Up SWEEP Accounts Relationship</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="center">Dr (Upper Threshold) Cr</div>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center"><b>Primary Account</b></div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/right2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center"><b>Secondary Account </b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="E01CAMPRIL" size="17" maxlength="15"  value="<%= userPO.getHeader1()%>" >
              </div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/left2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="E01CAMLNS2" size="17" maxlength="15" value="<%= cam.getE01CAMSACS()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >&nbsp;</td>
            <td nowrap >
              <div align="center">Cr (Cover O/D M/Bal) Cr</div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <br>
  <table  class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Upper Threshold :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMUPTS" size="10" maxlength="9" value="<%= cam.getE01CAMUPTS()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">Second Account Min/Bal :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMLWTS" size="10" maxlength="9" value="<%= cam.getE01CAMLWTS()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">End Relation On :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMER1S" size="2" maxlength="2" value="<%= cam.getE01CAMER1S().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER1S" size="2" maxlength="2" value="<%= cam.getE01CAMER2S().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER3S" size="2" maxlength="2" value="<%= cam.getE01CAMER3S().trim()%>" onKeyPress="enterInteger()">

              </div>
            </td>
            <td nowrap >
              <div align="right">Relation Status :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select disabled name="E01CAMRSTS">
                  <option value="" <% if (cam.getE01CAMRSTS().equals("")) out.print("selected"); %>></option>
                  <option value="A" <% if (cam.getE01CAMRSTS().equals("A")) out.print("selected"); %>>Active</option>
                  <option value="H" <% if (cam.getE01CAMRSTS().equals("H")) out.print("selected"); %>>Held</option>
                  <option value="E" <% if (cam.getE01CAMRSTS().equals("E")) out.print("selected"); %>>Ended</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Minimum Transfer Amount :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMITAS" size="10" maxlength="9" value="<%= cam.getE01CAMITAS()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">In Multiples of :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMTMOS" size="8" maxlength="7" value="<%= cam.getE01CAMTMOS()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Primary Account Min/ Bal :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01MINBA1" size="15" maxlength="13" >
              </div>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="left"> </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK1S" size="71" maxlength="70" value="<%= cam.getE01CAMRK1S()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK2S" size="71" maxlength="70" value="<%= cam.getE01CAMRK2S()%>" >
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  </table>

	</td>
	</tr>
	</table>

  </div>


   <div id="enterACCCD" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <table  class="tableinfo" >
    <tr >
      <td nowrap>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;

	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">

<table  class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="3" ><b>CD's Investments Parameters</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
              <div align="center">Dr (Upper Threshold) Cr</div>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center"><b>Primary Account</b></div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/right2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center"><b>Secondary Account </b></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center">
                <input type="text" readonly  name="E01CAMPRID" size="17" maxlength="15" value="<%= userPO.getHeader1()%>" >
              </div>
            </td>
            <td nowrap >
              <div align="center"><img src="<%=request.getContextPath()%>/images/left2.gif"  align="absbottom" border="0"></div>
            </td>
            <td nowrap >
              <div align="center">
                <div align="center"><b>CDS</b></div>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >&nbsp;</td>
            <td nowrap >
              <div align="center">Cr (Repayments) Dr</div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap >
              <div align="right">Upper Threshold :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMUPTT" size="10" maxlength="9" value="<%= cam.getE01CAMUPTT()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">Primary Account Min/Bal :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01MINBA2" size="10" maxlength="9">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">End Relation On :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMER1T" size="2" maxlength="2" value="<%= cam.getE01CAMER1T().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER2T" size="2" maxlength="2" value="<%= cam.getE01CAMER2T().trim()%>" onKeyPress="enterInteger()">
                <input type="text" readonly  name="E01CAMER3T" size="2" maxlength="2" value="<%= cam.getE01CAMER3T().trim()%>" onKeyPress="enterInteger()">

              </div>
            </td>
            <td nowrap >
              <div align="right">Relation Status :</div>
            </td>
            <td nowrap >
              <div align="left">
                <select disabled name="E01CAMRSTT">
                  <option value="" <% if (cam.getE01CAMRSTT().equals("")) out.print("selected"); %>></option>
                  <option value="A" <% if (cam.getE01CAMRSTT().equals("A")) out.print("selected"); %>>Active</option>
                  <option value="H" <% if (cam.getE01CAMRSTT().equals("H")) out.print("selected"); %>>Held</option>
                  <option value="E" <% if (cam.getE01CAMRSTT().equals("E")) out.print("selected"); %>>Ended</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Minimum Investment Amount :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMITAT" size="10" maxlength="9" value="<%= cam.getE01CAMITAT()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">In Multiples of :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMTMOT" size="8" maxlength="7" value="<%= cam.getE01CAMTMOT()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">CD Investment Spread Rate :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMCDRT" size="12" maxlength="11" value="<%= cam.getE01CAMCDRT()%>">
              </div>
            </td>
            <td nowrap >
              <div align="right">CD Investment Spread Rate Sign :</div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" readonly  name="E01CAMPOMT" size="2" maxlength="1" value="<%= cam.getE01CAMPOMT()%>">
                (+/-)</div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">CD Investment Days :</div>
            </td>
            <td nowrap >
              <input type="text" readonly  name="E01CAMCDDT" size="4" maxlength="3" value="<%= cam.getE01CAMCDDT()%>">
            </td>
            <td nowrap >
              <div align="right">CD Investment Rate Table :</div>
            </td>
            <td nowrap >
              <input type="text" readonly  name="E01CAMCDTT" size="3" maxlength="1" value="<%= cam.getE01CAMCDTT()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Corporation / Personal :</div>
            </td>
            <td nowrap ><select disabled name="E01CAMCOPT">
                  <option value="" <% if (cam.getE01CAMCOPT().equals("")) out.print("selected"); %>></option>
                  <option value="C" <% if (cam.getE01CAMCOPT().equals("A")) out.print("selected"); %>>Corporate</option>
                  <option value="P" <% if (cam.getE01CAMCOPT().equals("H")) out.print("selected"); %>>Personal</option>
                </select></td>
            <td nowrap >&nbsp;</td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Remarks :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK1T" size="71" maxlength="70" value="<%= cam.getE01CAMRK1T()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" readonly  name="E01CAMRK2T" size="71" maxlength="70" value="<%= cam.getE01CAMRK2T()%>" >
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  </table>
	</td>
	</tr>
	</table>

  </div>







  <h3 align="center">Set - Up Account Relationship - Inquiry</h3>
  <table class="tableinfo" width="100%" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><a href="javascript:showCustomerInq(document.forms[0].E01ACMCUN.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
                Customer :</a></div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <div align="left"> <%= cam.getE01ACMCUN()%> - <%= cam.getE01CUSNA1()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tbenter" width=100% align=center bgcolor="#FFFFFF">
    <tr>
      <td  width="0%"> </td>
      <td class=TDBKG width="0%">
        <div align="center">
          <div align="center" onClick="ShowEnterACC()"><b>Primary Account <%= cam.getE01ACMPRO()%></b></div>
        </div>
      </td>
      <td  width="33%">&nbsp;</td>
    </tr>
    <tr>
      <td  width="33%" >
        <div align="center"><img src="<%=request.getContextPath()%>/images/left.gif"  align="absbottom" border="0"></div>
      </td>
      <td  width="33%">
        <div align="center"><a href="javascript:showRetAccountInq(document.forms[0].E01CAMPAC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
          Account Number : </a>
          <input type="text" readonly  name="E01CAMPAC" size="12" maxlength="9" value="<%= cam.getE01CAMPAC()%>"
		  onChange="javascript:GetPrimNumber();">
        </div>
      </td>
      <td  width="33%" >
        <div align="center"><img src="<%=request.getContextPath()%>/images/right.gif"  align="absbottom" border="0"></div>
      </td>
    </tr>
    <tr>
      <td width="33%">&nbsp;</td>
      <td  rowspan="2">
        <div align="center"><img src="<%=request.getContextPath()%>/images/center.gif"  align="absbottom" border="0"></div>
      </td>
      <td  width="33%">&nbsp;</td>
    </tr>
    <tr>
      <td  width="33%">
        <div align="center">DEMAND LOAN <b><%= cam.getE01ACMPRO()%></b></div>
      </td>
      <td  width="33%">
        <div align="center">SWEEP <b><%= cam.getE01ACMPROL()%></b></div>
      </td>
    </tr>
    <tr>
      <td class=TDBKG width="33%">
        <div align="center">
          <div align="center">
            <div align="center">
          <div align="center" onClick="ShowEnterACCLoans()"><b>Secondary Account</b></div>
        </div>
          </div>
        </div>
      </td>
      <td class=TDBKG width="33%">
        <div align="center" onClick="ShowEnterACCCD()"><b>CD's Investment</b></div>
      </td>
      <td class=TDBKG width="33%">
        <div align="center" onClick="ShowEnterACCSV()"><b>Secondary Account</b></div>
      </td>
    </tr>
    <tr>
      <td width="33%">
        <div align="center"><a href="javascript:showLoanInq(document.forms[0].E01CAMSACL.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
          Loan Number : </a>
          <input type="text" readonly  name="E01CAMSACL" size="12" maxlength="9" value="<%= cam.getE01CAMSACL()%>">
        </div>
      </td>
      <td  width="33%">
        <div align="center"></div>
      </td>
      <td  width="33%">
        <div align="center"> <a href="javascript:showRetAccountInq(document.forms[0].E01CAMSACS.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" alt="Help" border="0" >
          Account Number : </a>
          <input type="text" readonly  name="E01CAMSACS" size="12" maxlength="9" value="<%= cam.getE01CAMSACS()%>">
        </div>
      </td>
    </tr>
  </table>
  <br>
</form>
</body>
</html>
