<html>
<head>
<title>Stop Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="stpchk" class= "datapro.eibs.beans.EOF010001Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

<% 
if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <input type=HIDDEN name="SCREEN" value="10">
  
  <h3 align="center">Official Checks Stop Payments<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="of_stop_pay_det.jsp, EFE1000"></h3>
  <hr size="4">
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Beneficiary :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E01STPBNF" size="30" maxlength="30" value="<%= stpchk.getE01STPBNF()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Applicant :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01STPAPL" size="45" maxlength="45" readonly value="<%= stpchk.getE01STPAPL()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Check :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01STPCKN" size="9" maxlength="9" value="<%= stpchk.getE01STPCKN()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01STPCCY" size="4" maxlength="3" value="<%= stpchk.getE01STPCCY()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Amount : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01STPAMT" size="15" maxlength="15" readonly value="<%= stpchk.getE01STPAMT()%>">
                </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Bank / Branch :</b></div>
            </td>
            <td nowrap width="20%">
              <input type="text" name="E01STPBNK" size="4" maxlength="3" value="<%= stpchk.getE01STPBNK()%>" readonly>
              / 
              <input type="text" name="E01STPBRN" size="4" maxlength="3" value="<%= stpchk.getE01STPBRN()%>" readonly>
            </td>
            <td nowrap width="16%"><b>General Ledger :</b></td>
            <td nowrap colspan="3">
              <input type="text" name="E01STPGLN" size="16" maxlength="12" value="<%= stpchk.getE01STPGLN()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="44%" height="19"> 
              <div align="right">Check Date :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <div align="left"> 
                <input type="text" name="E01STPCK1" size="3" maxlength="2" value="<%= stpchk.getE01STPCK1()%>">
                <input type="text" name="E01STPCK2" size="3" maxlength="2" value="<%= stpchk.getE01STPCK2()%>">
                <input type="text" name="E01STPCK3" size="3" maxlength="2" value="<%= stpchk.getE01STPCK3()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%" height="19"> 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E01STPRMK" size="35" maxlength="30" value="<%= stpchk.getE01STPRMK()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%" height="19"> 
              <div align="right">Cause :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E01STPF02" size="16" maxlength="14" value="<%= stpchk.getE01STPF02()%>">
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
