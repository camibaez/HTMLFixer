<html>
<head>
<title>Deals Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Deals Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_tds.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr >
      <td>
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr>
            <td nowrap width="10%" align="right"> Bank : </td>
            <td nowrap width="12%" align="left">
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="6%" align="right">Product : </td>
            <td nowrap width="14%" align="left">
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left">
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
              -
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information</h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td>
              <div align="right">Description :</div>
            </td>
            <td> <div align="left">
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
              </div>
            </td>
            <td>
              <div align="right">Marketing Name :</div>
            </td>
            <td> <div align="left">
              <input type="text"  name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
			</div>
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Currency :</div>
            </td>
            <td >
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td >
              <div align="right">Offered Via :</div>
            </td>
            <td >
               <SELECT name="H01FLGWK3">
               	    <option value="1" <%if (prd.getH01FLGWK3().equals("1")) { out.print("selected"); }%>>Internet</option>
              	    <option value="3" <%if (prd.getH01FLGWK3().equals("3")) { out.print("selected"); }%>>Plattform</option>
                    <option value="5" <%if (prd.getH01FLGWK3().equals("5")) { out.print("selected"); }%>>Both</option>
              	    <option value="N" <%if (prd.getH01FLGWK3().equals("N")) { out.print("selected"); }%>>None</option>
				</SELECT> 
                     <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trdark">
            <td >
              <div align="right"> General Ledger :</div>
            </td>
            <td >
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td >
            </td>
            <td >
            </td>
          </tr>
          <tr id="trclear">
            <td >
              <div align="right">Table of Documents :</div>
            </td>
            <td >
              	<input type="text"  name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            	<a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td >
            </td>
            <td >
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </table>

  <h4>Additional Information </h4>

  <table class="tableinfo">
    <tr >
      <td >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
         	 <td>
            	<div align="right">Rates Table :</div>
          	 </td>
            <td>
             	<input type="text"  name="E01APCCDT" size="4" maxlength="2" value="<%= prd.getE01APCCDT()%>">
             	<a href="javascript:GetRateTable('E01APCCDT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
             	              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          	<td>
          		<div align="right">Floating Rate Table :</div>
          	</td>
            <td width="18%">
              <input type="text" name="E01APCFRT" size="3" maxlength="2" value="<%= prd.getE01APCFRT().trim() %>">
              <a href="javascript:GetFloating('E01APCFRT')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
            <tr id="trdark">
            <td>
          		<div align="right">Accrual Basis  :</div>
          	</td>
          	<td>
          	  <select name="E01APCPPD">
                <option value="360" <%if (prd.getE01APCPPD().equals("360")) { out.print("selected"); }%>>360</option>
                <option value="366" <%if (prd.getE01APCPPD().equals("366")) { out.print("selected"); }%>>366</option>
                <option value="365" <%if (prd.getE01APCPPD().equals("365")) { out.print("selected"); }%>>365</option>
              </select>
               <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
          	</td>
            <td width="26%">
              <div align="right">Floating Rate Type :</div>
            </td>
            <td width="18%">
              <select name="E01APCFTY">
                <option value="FP" <%if (prd.getE01APCFTY().equals("FP")) { out.print("selected"); }%>>Primary
                Float</option>
                <option value="FS" <%if (prd.getE01APCFTY().equals("FS")) { out.print("selected"); }%>>Secondary
                Float</option>
              </select>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
          </tr>
          <tr id="trclear">
            <td>
          		<div align="right">Interest Type :</div>
          	</td>
          	<td width="25%">
            	<input type="text"  name="E01APCMCP" size="4" maxlength="2" value="<%= prd.getE01APCMCP().trim()%>">
            	<a href="javascript:GetCode('E01APCMCP','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td width="26%">
              <div align="right">IRA Type :</div>
            </td>
          	<td width="18%">
              <input type="radio" name="E01APCAMO" value="Y"  <%if (!prd.getE01APCAMO().equals("")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCAMO" value=""  <%if (prd.getE01APCAMO().equals("")) out.print("checked"); %>>
              No</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Interest Accrual :</div>
          	</td>
          	<td width="25%">
            	<input type="text"  name="E01APCMCI" size="4" maxlength="2" value="<%= prd.getE01APCMCI().trim()%>">
            	<a href="javascript:GetCode('E01APCMCI','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" >
            </td>
            <td>
              <div align="right">Minimum Terms in Days : </div>
            </td>
            <td>
            	<input type="text"  name="E01APCROY" size="4" maxlength="2" value="<%= prd.getE01APCROY()%>">
            </td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Passbook :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCITP" value="Y"  <%if (prd.getE01APCITP().equals("Y")) out.print("checked"); %>>
              Yes
              <input type="radio" name="E01APCITP" value="N"  <%if (prd.getE01APCITP().equals("N")) out.print("checked"); %>>
              No</td>
            <td>
            	<div align="right">Minimum Opening Amount</div>
            </td>
            <td>
            	<input type="text"  name="E01APCAM1" size="25" maxlength="20" value="<%= prd.getE01APCAM1()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="31%">
              <div align="right">Discount Type :</div>
            </td>
            <td width="25%">
              <input type="text"  name="E01APCFL3" size="3" maxlength="1" value="<%= prd.getE01APCFL3() %>" >
              <a href="javascript:GetCode('E01APCFL3','STATIC_ln_discount_type.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
              </td>
          	<td>
          		<div align="right">Revision Rate Cycle :</div>
          	</td>
            <td width="18%">
              <input type="text" name="E01APCRRD" size="3" maxlength="3" value="<%= prd.getE01APCRRD().trim() %>">
              <a href="javascript:GetCode('E01APCRRD','STATIC_cycle_rev.jsp')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
            </td>
          </tr>
			<TR>
				<TD width="31%" align="right">Default Rollover Code :</TD>
				<TD width="25%"><INPUT type="text" name="E01APCCHR" size="1"
					maxlength="1" value="<%= prd.getE01APCCHR() %>"><A
					href="javascript:GetCode('E01APCCHR','STATIC_cd_rollover_codes.jsp')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Help"
					align="bottom" border="0"></A></TD>
				<TD></TD>
				<TD width="18%"></TD>
			</TR>
			<% if ((prd.getE01APCTYP().equals("ACP")) || (prd.getE01APCTYP().equals("ACP"))) { %>
           <tr id="trclear">
            <td width="31%">
              <div align="right">Charges Table :</div>
            </td>
            <td width="25%">
              <input type="text" name="E01APCTLN" size="3" maxlength="2" value="<%= prd.getE01APCTLN()%>">
              <a href="javascript:GetLoanTable('E01APCTLN',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a></td>
            <td width="26%">

            </td>
            <td width="18%">
             </td>
          </tr>
          <%}%>

			</table>
      </td>
    </tr>
 </table>
 <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
 </p>
 </form>
</body>
</html>
