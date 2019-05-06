<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "lcCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  builtNewMenu(lc_i_opt);

</SCRIPT>
</head>
<body  nowrap bgcolor="#FFFFFF">


 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Letters Of Credit [Comissions] </h3>
<hr size="4">
 <FORM >
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account  :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Comissions</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="center"><b>Concept</b></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><b>Amount</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>Minimum</b></div>
            </td>
            <td nowrap width="22%"> 
              <div align="center"><b>Paib by</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Amendment :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ACC2" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Advising Amendment :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select2">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Discrepancy :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ACC13" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select3">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%"> 
              <div align="right">Extension of Validity :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select4">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Postage :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select5">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%"> 
              <div align="right">Courier :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select6">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Issuance Swift :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select7">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%"> 
              <div align="right">Additional Swift :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select8">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Funds Transfer :</div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="12" maxlength="12" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <select name="select9">
                  <option>Applicant</option>
                  <option>Beneficiary</option>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
</p>
</form>
</body>
</html>

