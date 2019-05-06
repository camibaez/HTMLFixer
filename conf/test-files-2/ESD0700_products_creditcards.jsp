<html>
<head>
<title>Credit Cards Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

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

<h3 align="center">Credit Cards Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_creditcards.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Bank: </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right">Product: </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left"> 
				<input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%=prd.getE01APCTYP()%>" readonly>
				<input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information</h4>

  <table class="tableinfo">
    <tr> 
      <td> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TR id="trdark"> 
            <TD> 
              <DIV align="right">Description :</DIV>
            </TD>
            <TD> 
              <INPUT type="text" name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </TD>
            <TD> 
              <DIV align="right">Marketing Name :</DIV>
            </TD>
            <TD> 
              <INPUT type="text" name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD> 
              <DIV align="right">Currency :</DIV>
            </TD>
            <TD> 
              <INPUT type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <A href="javascript:GetCurrency('E01APCCCY','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A> 
            </TD>
            <TD nowrap="nowrap"> 
              <DIV align="right">Offered Via Internet :</DIV>
            </TD>
            <TD> 
              <INPUT type="radio" name="H01FLGWK3" value="Y" <%if (prd.getH01FLGWK3().equals("Y")) out.print("checked"); %>>
              	Yes 
              	<INPUT type="radio" name="H01FLGWK3" value="N" <%if (prd.getH01FLGWK3().equals("N")) out.print("checked"); %>>
              	No   
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD> 
              <DIV align="right"> General Ledger :</DIV>
            </TD>
            <TD> 
              <INPUT type="text" name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <A href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A> 
            </TD>
            <TD> 
              <DIV align="right">Withholding Taxes :</DIV>
            </TD>
            <TD> 
              <INPUT type="text" name="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>">
              <A href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A> 
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap="nowrap"> 
              <DIV align="right" >Table of Documents :</DIV>
            </TD>
            <TD> 
              	<INPUT type="text" name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            	<A href="javascript:GetDocInv('E01APCFTF')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A> 
            </TD>
            <TD> 
              <DIV align="right"></DIV>
            </TD>
            <TD nowrap="nowrap"> 
            </TD>
          </TR>
          <TR id="trdark">
            <TD> 
              <DIV align="right">Card Type:</DIV>
            </TD>
            <TD> 
              	<INPUT type="text" name="E01APCTLN" size="4" maxlength="2" value="<%= prd.getE01APCTLN()%>">
				<A href="javascript:GetDescATMCard('E01APCTLN','','C')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0"></A>
            </TD>
            <TD>
            	<DIV align="right">Use Form :</DIV>
            </TD>
           	<TD width="18%"><INPUT type="text" name="E01APCMCP" size="4" maxlength="2" value="<%= prd.getE01APCMCP().trim()%>">
          	<A href="javascript:GetCode('E01APCMCP','STATIC_tc_form_use.jsp')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A>          
          	</TD>
          </TR>
          <TR id="trclear">
            <TD>
           		<DIV align="right">Draft :</DIV>
            </TD>
            <TD>
            	<INPUT type="text" name="E01APCAMO" size="4" maxlength="2" value="<%= prd.getE01APCAMO().trim()%>">
            	<A href="javascript:GetCode('E01APCAMO','STATIC_tc_drafts.jsp')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A>   
            </TD>
          	<TD>
           		<DIV align="right">Draft Limit :</DIV>
            </TD>
            <TD>
            	<SELECT name="E01APCICT">
               	 	<OPTION value="0" <%if (prd.getE01APCICT().equals("0")) { out.print("selected"); }%>>No Aplica</OPTION>
                	<OPTION value="1" <%if (prd.getE01APCICT().equals("1")) { out.print("selected"); }%>>Limite Diario</OPTION>
                	<OPTION value="2" <%if (prd.getE01APCICT().equals("2")) { out.print("selected"); }%>>Limite Semanal</OPTION>
              	</SELECT>
            </TD>   
          </TR>
          <TR id="trdark">
          	<TD>
          		<DIV align="right">Transfer Allowed :</DIV>
          	</TD>
          	<TD>
          		<INPUT type="text" name="E01APCITP" size="4" maxlength="2" value="<%= prd.getE01APCITP().trim()%>">
          		<A href="javascript:GetCode('E01APCITP','STATIC_tc_transfers.jsp')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A>   
          	</TD>
            <TD> 
              	<DIV align="right">Type :</DIV>
            </TD><TD> 
              <SELECT name="E01APCFL4">
				<OPTION value="E" <%if (prd.getE01APCFL4().equals("E")) { out.print("selected"); }%>>Elite</OPTION>
				<OPTION value="I" <%if (prd.getE01APCFL4().equals("I")) { out.print("selected"); }%>>International</OPTION>
				<OPTION value="P" <%if (prd.getE01APCFL4().equals("P")) { out.print("selected"); }%>>Premier</OPTION>
                <OPTION value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporate</OPTION>
                <OPTION value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</OPTION>
                <OPTION value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Not Aplicable</OPTION>
              </SELECT>
            </TD>
            
          	
          </TR>
                    <TR id="trclear">
          	<TD>
          		<DIV align="right">Agents Commission :</DIV>
          	</TD>
          	<TD width="25%" nowrap="nowrap"> 
              <INPUT type="text" name="E01APCGEC" size="4" maxlength="3" value="<%= prd.getE01APCGEC().trim()%>">
               <A href="javascript:GetAgentCommissionTable('E01APCGEC','E01APCAD1')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></A> 
            </TD>
          	<TD>
                <DIV align="right">Product Family :</DIV>
                </TD><TD>
                	<INPUT type="text" name="E01APCUC1" size="4" maxlength="3" value="<%= prd.getE01APCUC1().trim()%>">
                		<A href="javascript:GetCodeCNOFC('E01APCUC1','68')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0">
						</A>
				</TD>
          	
          </TR>  
        </TABLE>
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  
 </form>
</body>

</html>
