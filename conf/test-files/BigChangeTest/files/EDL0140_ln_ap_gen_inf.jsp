<html>
<head>
<title>General Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnGenInf" class="datapro.eibs.beans.EDL015005Message"   scope="session"/>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_a_opt);

</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">General Information of <%= lnGenInf.getE05DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_ap_gen_inf.jsp,EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="E05DEABNK"  value="<%= lnGenInf.getE05DEABNK().trim()%>">
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
                <input type="text" name="E05DEACUN" size="9" maxlength="9" value="<%= lnGenInf.getE05DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E05CUSNA1" size="45" maxlength="45" value="<%= lnGenInf.getE05CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E05DEAACC" size="12" maxlength="12" value="<%= lnGenInf.getE05DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E05DEACCY2" size="4" maxlength="3" value="<%= lnGenInf.getE05DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E05DEAPRO" size="4" maxlength="4" value="<%= lnGenInf.getE05DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information </h4>
      
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAICT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAICT" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE05DEAICT().equals("S")) out.print("Simple Interest");
							else if (lnGenInf.getE05DEAICT().equals("M")) out.print("Simple Interest Commercial Months");
							else if (lnGenInf.getE05DEAICT().equals("P")) out.print("Prepaid Interest");
							else if (lnGenInf.getE05DEAICT().equals("A")) out.print("Prepaid Interest Commercial Months");
							else if (lnGenInf.getE05DEAICT().equals("D")) out.print("Discount Interest Calendar Months");
							else if (lnGenInf.getE05DEAICT().equals("T")) out.print("Discount Interest Commercial Months");
							else if (lnGenInf.getE05DEAICT().equals("R")) out.print("Reinvestment for (CD'S Only)");
							else if (lnGenInf.getE05DEAICT().equals("8")) out.print("Rule 78");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E05DEABAS" size="4" maxlength="3" <% if (lnGenInf.getF05DEABAS().equals("Y")) out.print("id=\"txtchanged\""); %> value="<%= lnGenInf.getE05DEABAS().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Interest Accrual Flag :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAIFL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAIFL" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE05DEAIFL().equals("1")) out.print("Outstanding Principal");
							else if (lnGenInf.getE05DEAIFL().equals("2")) out.print("Original Principal");
							else if (lnGenInf.getE05DEAIFL().equals("3")) out.print("Outstanding Principal Less Principal Due");
							else if (lnGenInf.getE05DEAIFL().equals("N")) out.print("None Accrual");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Penalty Interest Type :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAPCL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAPCL" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE05DEAPCL().equals("1")) out.print("Principal Due");
							else if (lnGenInf.getE05DEAPCL().equals("2")) out.print("Original Principal");
							else if (lnGenInf.getE05DEAPCL().equals("3")) out.print("Outstanding Principal");
							else if (lnGenInf.getE05DEAPCL().equals("4")) out.print("Payment Amount P+I");
							else if (lnGenInf.getE05DEAPCL().equals("N")) out.print("No penalty");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAWHF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAWHF" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE05DEAWHF().equals("1")) out.print("Withholding Deduction");
							else if (lnGenInf.getE05DEAWHF().equals("2")) out.print("Sales Tax");
							else if (lnGenInf.getE05DEAWHF().equals("3")) out.print("Both (Withholding & Taxes)");
							else if (lnGenInf.getE05DEAWHF().equals("4")) out.print("Taxes in Commissions");
							else if (lnGenInf.getE05DEAWHF().equals("5")) out.print("Taxes in Interest");
							else if (lnGenInf.getE05DEAWHF().equals("N")) out.print("None");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Penalty Grace Days :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAGPD().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAGPD" size="3" maxlength="2" value="<%= lnGenInf.getE05DEAGPD().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEABRK().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEABRK" size="4" maxlength="3" value="<%= lnGenInf.getE05DEABRK().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAMLA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAMLA" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAMLA().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Percentaje at Commission :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEABCP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEABCP" size="10" maxlength="9" value="<%= lnGenInf.getE05DEABCP().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Allow Payments in Holidays :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="hidden" name="E05DEAHFQ" value="<%= lnGenInf.getE05DEAHFQ()%>">
              <input type="radio" name="CE05DEAHFQ" value="1" onClick="document.forms[0].E05DEAHFQ.value='1'"
			  <%if(lnGenInf.getE05DEAHFQ().equals("1")) out.print("checked");%> disabled>
              Yes 
              <input type="radio" name="CE05DEAHFQ" value="2" onClick="document.forms[0].E05DEAHFQ.value='2'"
			  <%if(lnGenInf.getE05DEAHFQ().equals("2")) out.print("checked");%> disabled>
              No </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Charges Table :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEATLN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEATLN" size="2" maxlength="2" value="<%= lnGenInf.getE05DEATLN().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Obligor Code :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAOBL().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAOBL" size="3" maxlength="2" value="<%= lnGenInf.getE05DEAOBL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right"> Type of Relation 1 :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E05DEAPAR" size="25" maxlength="25" readonly
			  	value="<% if (lnGenInf.getE05DEAPAR().equals("F")) out.print("Funding");
							else if (lnGenInf.getE05DEAPAR().equals("S")) out.print("Sindicated");
							else if (lnGenInf.getE05DEAPAR().equals("P")) out.print("Participation");
							else if (lnGenInf.getE05DEAPAR().equals("T")) out.print("Tied to a CDS or a TDS");
							else out.print("None");%>>" 
>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Risk Code :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEARRC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEARRC" size="3" maxlength="2" value="<%= lnGenInf.getE05DEARRC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Relation Account 1 :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEAPAC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEAPAC" size="12" maxlength="12" value="<%= lnGenInf.getE05DEAPAC().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Rate Table :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF05DEARTB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E05DEARTB" size="2" maxlength="1" value="<%= lnGenInf.getE05DEARTB().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Type of Relation 2 :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E05DEARET" size="25" maxlength="25" readonly
			  			  	value="<% if (lnGenInf.getE05DEARET().equals("P")) out.print("Re-Payments of Loans");
							else if (lnGenInf.getE05DEARET().equals("R")) out.print("Loan Renewal");
							else if (lnGenInf.getE05DEARET().equals("E")) out.print("Negotiation of Debt");
							else out.print("None");%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Loan Status :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E05DEADLC" size="20" maxlength="20" readonly
			  value="<% if (lnGenInf.getE05DEADLC().equals("1")) out.print("Current");
				else if (lnGenInf.getE05DEADLC().equals("2")) out.print("Past Due");
				else if (lnGenInf.getE05DEADLC().equals("3")) out.print("Legal Department");
				else if (lnGenInf.getE05DEADLC().equals("4")) out.print("Juditial Process");
				else if (lnGenInf.getE05DEADLC().equals("5")) out.print("Recovery Process");
				else out.print("Others");%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Relation Account 2 :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E05DEAREA" size="7" maxlength="7" value="<%= lnGenInf.getE05DEAREA().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Loan On Demand :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="hidden" name="E05DEALNC" value="<%= lnGenInf.getE05DEALNC()%>">
              <input type="radio" name="CE05DEALNC" value="Y" onClick="document.forms[0].E05DEALNC.value='Y'"
			  <%if(lnGenInf.getE05DEALNC().equals("Y")) out.print("checked");%> disabled>
              Yes 
              <input type="radio" name="CE05DEALNC" value="N" onClick="document.forms[0].E05DEALNC.value='N'"
			  <%if(lnGenInf.getE05DEALNC().equals("N")) out.print("checked");%> disabled>
              No </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
