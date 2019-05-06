<html>
<head>
<title>General Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnGenInf" class="datapro.eibs.beans.EDL015005Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(ln_m_opt);

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
<h3 align="center">General Information of <%= lnGenInf.getE05DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_gen_inf.jsp,EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="24">
  <INPUT TYPE=HIDDEN NAME="E05DEABNK"  value="<%= lnGenInf.getE05DEABNK().trim()%>">
  <input type=HIDDEN name="E05DEATYP"  value="<%= lnGenInf.getE05DEATYP().trim()%>">
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
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E05DEACCY2" size="3" maxlength="3" value="<%= lnGenInf.getE05DEACCY().trim()%>" >
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
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Interest Type :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAICT" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAICT().trim()%>">
              <a href="javascript:GetCode('E05DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
            <td nowrap width="24%" >
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEABAS" size="4" maxlength="3" value="<%= lnGenInf.getE05DEABAS().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Interest Accrual Flag :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAIFL" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAIFL().trim()%>">
              <a href="javascript:lnGetOver('E05DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Penalty Interest Type :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEAPCL" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAPCL().trim()%>" >
              <a href="javascript:lnGetOver('E05DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Taxes and Withholding :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAWHF" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAWHF().trim()%>">
              <a href="javascript:GetCode('E05DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Penalty Grace Days :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEAGPD" size="3" maxlength="2" value="<%= lnGenInf.getE05DEAGPD().trim()%>"  onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEABRK" size="4" maxlength="3" value="<%= lnGenInf.getE05DEABRK().trim()%>">
              <a href="javascript:GetBroker('E05DEABRK')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEAMLA" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E05DEAMLA',document.forms[0].E05DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Direcciones de Correo del Cliente" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Percentage at Commission :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEABCP" size="10" maxlength="9" value="<%= lnGenInf.getE05DEABCP().trim()%>"  onkeypress="enterDecimal()">
            </td>
            <td nowrap width="24%" >
              <div align="right">Allow Payments in Holidays :</div>
            </td>
            <td nowrap width="27%" >
              <input type="hidden" name="E05DEAHFQ" value="<%= lnGenInf.getE05DEAHFQ()%>">
              <input type="radio" name="CE05DEAHFQ" value="1" onClick="document.forms[0].E05DEAHFQ.value='1'"
			  <%if(lnGenInf.getE05DEAHFQ().equals("1")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE05DEAHFQ" value="2" onClick="document.forms[0].E05DEAHFQ.value='2'"
			  <%if(lnGenInf.getE05DEAHFQ().equals("2")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Charges Table :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEATLN" size="2" maxlength="2" value="<%= lnGenInf.getE05DEATLN().trim()%>">
              <a href="javascript:GetLoanTable('E05DEATLN',document.forms[0].E05DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Obligor Code :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEAOBL" size="3" maxlength="2" value="<%= lnGenInf.getE05DEAOBL().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Relation Type 1 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAPAR" size="2" maxlength="1" value="<%= lnGenInf.getE05DEAPAR().trim()%>">
              <a href="javascript:GetRel1('E05DEAPAR','STATIC_ln_rel1.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Risk Code :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEARRC" size="3" maxlength="2" value="<%= lnGenInf.getE05DEARRC().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Relation Account 1 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAPAC" size="12" maxlength="9" value="<%= lnGenInf.getE05DEAPAC().trim()%>">
              <a href="javascript:GetAccount('E05DEAPAC',document.forms[0].E05DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Rate Table :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEARTB" size="2" maxlength="1" value="<%= lnGenInf.getE05DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E05DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="32%" >
              <div align="right">Relation Type 2 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEARET" size="2" maxlength="1" value="<%= lnGenInf.getE05DEARET().trim()%>">
              <a href="javascript:GetRel2('E05DEARET','STATIC_ln_rel2.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Loan Status :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E05DEADLC" size="2" maxlength="1" value="<%= lnGenInf.getE05DEADLC().trim()%>">
              <a href="javascript:GetCredCond('E05DEADLC','STATIC_ln_contr.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="32%" >
              <div align="right">Relation Account 2 : </div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E05DEAREA" size="12" maxlength="9" value="<%= lnGenInf.getE05DEAREA().trim()%>">
              <a href="javascript:GetAccount('E05DEAREA',document.forms[0].E05DEABNK.value,'10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
            </td>
            <td nowrap width="24%" >
              <div align="right">Demand Loan :</div>
            </td>
            <td nowrap width="27%">
              <input type="hidden" name="E05DEALNC" value="<%= lnGenInf.getE05DEALNC()%>">
              <input type="radio" name="CE05DEALNC" value="Y" onClick="document.forms[0].E05DEALNC.value='Y'"
			  <%if(lnGenInf.getE05DEALNC().equals("Y")) out.print("checked");%>>
              Yes
              <input type="radio" name="CE05DEALNC" value="N" onClick="document.forms[0].E05DEALNC.value='N'"
			  <%if(lnGenInf.getE05DEALNC().equals("N")) out.print("checked");%>>
              No </td>
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
