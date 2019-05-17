<html>
<head>
<title>Swift Interim Messages</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "rtSwift" class= "datapro.eibs.beans.ESW000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
%>

</SCRIPT>

</head>
<body bgcolor="#FFFFFF">

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

<h3 align="center">Swift Interim Messages Account <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_swift_msg,ESW0000" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESW0000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
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
                <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= rtSwift.getE01SWIACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
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
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Swift Id :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" name="E01SWITID" size="13" maxlength="12" value="<%= rtSwift.getE01SWITID().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Send MT-941 :</div>
            </td>
            <td nowrap width="70%" > 
 			  <input type="radio" disabled name="E01SWI941" value="Y" <%if(rtSwift.getE01SWI941().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWI941" value="N" <%if(!rtSwift.getE01SWI941().equals("Y")) out.print("checked");%>>No
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <h4>MT-942 Parameters</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Send MT-942 :</div>
            </td>
            <td nowrap width="25%"> 
 			  <input type="radio" disabled name="E01SWI942" value="Y" <%if(rtSwift.getE01SWI942().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWI942" value="N" <%if(!rtSwift.getE01SWI942().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%"> 
              <div align="right">Inclusive :</div>
            </td>
            <td nowrap width="25%"> 
 			  <input type="radio" disabled name="E01SWISTP" value="Y" <%if(rtSwift.getE01SWISTP().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWISTP" value="N" <%if(!rtSwift.getE01SWISTP().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Starting Time :</div>
            </td>
            <td nowrap width="25%"> 
			  <input type="text" name="E01SWISTI" size="5" maxlength="4" value="<%= rtSwift.getE01SWISTI().trim()%>" readonly><b>(HH:MM)</b>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Include Transaction :</div>
            </td>
            <td nowrap width="25%"> 
              <select name="E01SWIDCI" disabled>
                <option value=" " <% if (!(rtSwift.getE01SWIDCI().equals("D") ||rtSwift.getE01SWIDCI().equals("C")||rtSwift.getE01SWIDCI().equals("B"))) out.print("selected"); %>></option>
                <option value="D" <% if (rtSwift.getE01SWIDCI().equals("D")) out.print("selected"); %>>Debit Only</option>
                <option value="C" <% if (rtSwift.getE01SWIDCI().equals("C")) out.print("selected"); %>>Credit Only</option>
                <option value="B" <% if (rtSwift.getE01SWIDCI().equals("B")) out.print("selected"); %>>Both</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Intervals :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" name="E01SWIITM" size="5" maxlength="4" value="<%= rtSwift.getE01SWIITM().trim()%>" readonly><b>(HH:MM)</b>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ending Time :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" name="E01SWIETI" size="5" maxlength="4" value="<%= rtSwift.getE01SWIETI().trim()%>" readonly><b>(HH:MM)</b>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Minimum Debit Amount :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" name="E01SWIMXF" size="18" maxlength="17" value="<%= rtSwift.getE01SWIMXF().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Minimum Credit Amount :</div>
            </td>
            <td nowrap width="25%"> 
				<input type="text" name="E01SWIMIF" size="18" maxlength="17" value="<%= rtSwift.getE01SWIMIF().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br> 
  <h4>Windows Times to Send Messages from 1 to 15 in HH:MM</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW01" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW01().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW02" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW02().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW03" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW03().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW04" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW04().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW05" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW05().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW06" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW06().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW07" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW07().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW08" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW08().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW09" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW09().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW10" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW10().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW11" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW11().trim()%>" readonly>
            </td>
            <td nowrap width="12%"> 
			  <input type="text" name="E01SWIW12" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW12().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW13" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW13().trim()%>" readonly>
            </td>
            <td nowrap width="13%"> 
			  <input type="text" name="E01SWIW14" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW14().trim()%>" readonly>
            </td>
            <td nowrap width="23%" colspan="2"> 
			  <input type="text" name="E01SWIW15" size="5" maxlength="4" value="<%= rtSwift.getE01SWIW15().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>   
  <h4>MT-900/910 Parameters</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Send MT-900/910 :</div>
            </td>
            <td nowrap width="25%"> 
 			  <input type="radio" disabled name="E01SWI910" value="Y" <%if(rtSwift.getE01SWI910().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWI910" value="N" <%if(!rtSwift.getE01SWI910().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Debit Advise :</div>
            </td>
            <td nowrap width="25%"> 
 			  <input type="radio" disabled name="E01SWIDRI" value="Y" <%if(rtSwift.getE01SWIDRI().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWIDRI" value="N" <%if(!rtSwift.getE01SWIDRI().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="25%"> 
              <div align="right">Credit Advise</div>
            </td>
            <td nowrap width="25%"> 
 			  <input type="radio" disabled name="E01SWICRI" value="Y" <%if(rtSwift.getE01SWICRI().equals("Y")) out.print("checked");%>>Yes 
              <input type="radio" disabled name="E01SWICRI" value="N" <%if(!rtSwift.getE01SWICRI().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Low/High Range :</div>
            </td>
            <td nowrap width="75%" colspan="3"> 
				<input type="text" name="E01SWILWL" size="18" maxlength="17" value="<%= rtSwift.getE01SWILWL().trim()%>"  readonly>/
				<input type="text" name="E01SWIHIL" size="18" maxlength="17" value="<%= rtSwift.getE01SWIHIL().trim()%>"  readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <h4>Additional Swift ID's</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="43"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Swift ID 910 :</div>
            </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWIID1" size="13" maxlength="12" value="<%= rtSwift.getE01SWIID1().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWIID2" size="13" maxlength="12" value="<%= rtSwift.getE01SWIID2().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWIID3" size="13" maxlength="12" value="<%= rtSwift.getE01SWIID3().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWIID4" size="13" maxlength="12" value="<%= rtSwift.getE01SWIID4().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWIID5" size="13" maxlength="12" value="<%= rtSwift.getE01SWIID5().trim()%>"  readonly>
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Swift ID 941 :</div>
            </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII11" size="13" maxlength="12" value="<%= rtSwift.getE01SWII11().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII12" size="13" maxlength="12" value="<%= rtSwift.getE01SWII12().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII13" size="13" maxlength="12" value="<%= rtSwift.getE01SWII13().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII14" size="13" maxlength="12" value="<%= rtSwift.getE01SWII14().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII15" size="13" maxlength="12" value="<%= rtSwift.getE01SWII15().trim()%>"  readonly>
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Swift ID 942 :</div>
            </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII21" size="13" maxlength="12" value="<%= rtSwift.getE01SWII21().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII22" size="13" maxlength="12" value="<%= rtSwift.getE01SWII22().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII23" size="13" maxlength="12" value="<%= rtSwift.getE01SWII23().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII24" size="13" maxlength="12" value="<%= rtSwift.getE01SWII24().trim()%>"  readonly>
             </td>
            <td nowrap width="16%"> 
 				<input type="text" name="E01SWII25" size="13" maxlength="12" value="<%= rtSwift.getE01SWII25().trim()%>"  readonly>
             </td>
          </tr>
 
        </table>
      </td>
    </tr>
  </table>
  <br>    
</form>
</body>
</html>

