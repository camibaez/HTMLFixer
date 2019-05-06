<html>
<head>
<title>Hold & Uncollected Issuance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "holduncoll" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "huBasic" class= "datapro.eibs.beans.EDD030001Message"  scope="session" />

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


<H3 align="center">Hold & Uncollected Issuance
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="hold_uncollected_det_new.jsp , EDD0300"> 
</H3><hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0300" >
  <input type=HIDDEN name="SCREEN" value="4">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

   <input type=HIDDEN name="E01STPBNK" value="<%= userPO.getHeader10().trim()%>">
  <input type=HIDDEN name="E01STPBRN" value="<%= userPO.getHeader11().trim()%>">
  <input type=HIDDEN name="E01STPGLN" value="<%= userPO.getHeader12().trim()%>">

  <%
        int row;
		  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
		  holduncoll.setCurrentRow(row);
    %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E01UNCCUN" size="9" maxlength="9" value="<%= userPO.getHeader1().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader5().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01UNCACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01UNCCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01UNCPRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader6().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <BR>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Sequence :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01UNCF01" size="4" readonly maxlength="3" value="<%= userPO.getHeader19().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Type :</div>
            </td>
            <td nowrap width="56%"> 
              <div align="left"> 
			    <select name="E01UNCFLG">
				  <option value="H" <% if (huBasic.getE01UNCFLG().equals("H")) out.print("selected"); %>>Hold</option>
				  <option value=" " <% if (huBasic.getE01UNCFLG().equals(" ")) out.print("selected"); %>>Uncollected</option>
				</select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Process Date :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01UNCRD1" size="2" maxlength="2" value="<%=huBasic.getE01UNCRD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01UNCRD2" size="2" maxlength="2" value="<%=huBasic.getE01UNCRD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01UNCRD3" size="2" maxlength="2" value="<%=huBasic.getE01UNCRD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01UNCRD1,document.forms[0].E01UNCRD2,document.forms[0].E01UNCRD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01UNCMD1" size="2" maxlength="2" value="<%=huBasic.getE01UNCMD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01UNCMD2" size="2" maxlength="2" value="<%=huBasic.getE01UNCMD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01UNCMD3" size="2" maxlength="2" value="<%=huBasic.getE01UNCMD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01UNCMD1,document.forms[0].E01UNCMD2,document.forms[0].E01UNCMD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Days :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01UNCDYS" size="5" maxlength="4" value="<%=huBasic.getE01UNCDYS().trim()%>" onkeypress="enterInteger()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="56%"> 
              <div align="left"> 
                <input type="text" name="E01UNCAMN" size="17" maxlength="15" value="<%=huBasic.getE01UNCAMN().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Reason :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01UNCRSN" size="17" maxlength="15" value="<%=huBasic.getE01UNCRSN().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Reference :</div>
            </td>
            <td nowrap width="56%"> 
              <div align="left"> 
                <input type="text" name="E01UNCCKN" size="10" maxlength="9" value="<%=huBasic.getE01UNCCKN().trim()%>">
              </div>
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
