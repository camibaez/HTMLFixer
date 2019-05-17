<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Investments Product Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
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

<h3 align="center">Portfolio Product Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_portfolio.jsp, ESD0700"></h3>
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
            <td nowrap width="6%" align="right"> Product: </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Product Type : </td>
            <td nowrap width="50%"align="left"> 
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              - 
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
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
            <td > 
              <div align="right">Description :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td > 
              <div align="right">Marketing Name :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td > 
              <div align="right">Currency :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
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
            </td>
          </tr>
          <tr id="trdark"> 
            <td > 
              <div align="right"> General Ledger :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCGLN" size="16" maxlength="12" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a> 
            </td>
            <td > 
              <div align="right">Table of Documents :</div>
            </td>
            <td ><INPUT type="text" name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            <a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td > 
              <div align="right"> Corporate/Personal :</div>
            </td>
            <td > 
               <select name="E01APCFL4">
                <option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporate</option>
                <option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</option>
                <option value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Not Aplicable</option>
              </select>
             </td>
            <td > 
              <div align="right"></div>
            </td>
            <td >
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>

  <table class="tableinfo">
    <tr > 
      <td >
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Commision Table:</div>
            </td>
            <td width="330"><INPUT type="text" name="E01APCTLN" size="3" maxlength="3" value="<%= prd.getE01APCTLN().trim()%>">
              	<a href="javascript:GetCommCustodyTable('E01APCTLN',document.forms[0].E01APCTYP.value,document.forms[0].E01APCTYP.value,'',document.forms[0].E01APCBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"></a> 
            </td>
                    </tr>
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Support Interest Payments:</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCFRN" value="Y" <%if (prd.getE01APCFRN().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCFRN" value="N" <%if (prd.getE01APCFRN().equals("N")) out.print("checked"); %>=""> No </td>
                    </tr>
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Support Principal Payments:</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCMCI" value="Y" <%if (prd.getE01APCMCI().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCMCI" value="N" <%if (prd.getE01APCMCI().equals("N")) out.print("checked"); %>=""> No </td>
                    </tr>                   
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Support Dividends Payments:</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCMCP" value="Y" <%if (prd.getE01APCMCP().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCMCP" value="N" <%if (prd.getE01APCMCP().equals("N")) out.print("checked"); %>="">
              No
          	</td>
                    </tr>                   
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Banks Product Type:</div>
            </td>
                        <td width="330"><SELECT name="E01APCICT">
                            <OPTION value="1" <%if (prd.getE01APCICT().equals("1")) { out.print("selected"); }%>="">Certificate/Deposit</OPTION>
                            <OPTION value="2" <%if (prd.getE01APCICT().equals("2")) { out.print("selected"); }%>="">Interbank Investment</OPTION>
                            <OPTION value="3" <%if (prd.getE01APCICT().equals("3")) { out.print("selected"); }%>="">Investment 24 Hours</OPTION>
                            <OPTION value="N" <%if (prd.getE01APCICT().equals("N")) { out.print("selected"); }%>="">None</OPTION>
                        </SELECT></td>
                    </tr>                   
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Reevaluation Frequency:</div>
            </td>
                        <td width="330"><SELECT name="E01APCAMO">
                            <OPTION value="D" <%if (prd.getE01APCAMO().equals("D")) { out.print("selected"); }%>="">Day</OPTION>
                            <OPTION value="M" <%if (prd.getE01APCAMO().equals("M")) { out.print("selected"); }%>="">Month</OPTION>
                            <OPTION value="Q" <%if (prd.getE01APCAMO().equals("Q")) { out.print("selected"); }%>="">Quarter</OPTION>
                            <OPTION value="S" <%if (prd.getE01APCAMO().equals("S")) { out.print("selected"); }%>="">Semester</OPTION>
                            <OPTION value="Y" <%if (prd.getE01APCAMO().equals("Y")) { out.print("selected"); }%>="">Year</OPTION>
                        </SELECT></td>
                    </tr>                   
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Use Margin Account :</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCCHR" value="Y" <%if (prd.getE01APCCHR().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCCHR" value="N" <%if (prd.getE01APCCHR().equals("N")) out.print("checked"); %>="">
              No
          	</td>
                    </tr>                   
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">General Investment Code:</div>
            </td>
            <td width="330"><INPUT type="text" name="E01APCGEC" size="3" maxlength="3" value="<%= prd.getE01APCGEC().trim()%>">
              	<a href="javascript:GetCodeCNOFC('E01APCGEC','64')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absbottom" border="0"></a> 
            </td>
          </tr>                   
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Product Attribute:</div>
            </td>
                        <td width="430"><SELECT name="E01APCFL3">
                            <OPTION value="N" <%if (prd.getE01APCFL3().equals("N")) { out.print("selected"); }%>="">None</OPTION>
                            <OPTION value="1" <%if (prd.getE01APCFL3().equals("1")) { out.print("selected"); }%>="">Held by the Bank</OPTION>
                        </SELECT></td>
                    </tr>                   
<%--  These lines were deleted becasue the custody fee table will be entered by product type,
	  it means; it will be registered by the option reference codes table "D". The field is
	  CNOSCY from CNOFC file.  (Henry G. 12/06/07).                 
          <tr id="trdark">
            <td width="354"> 
                <div align="right">Custody Fee Table: </div>
            </td>
            <td width="430">
                        <INPUT type="text" name="E01APCIPD" size="4"
					maxlength="2" value="<%= prd.getE01APCIPD().trim()%>"><A
					href="javascript:GetCommCustodyTable('E01APCIPD','CST','','')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
					align="absmiddle" border="0"></A>
			</td>
          </tr>                   
--%>          
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