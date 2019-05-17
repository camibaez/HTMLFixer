<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="Microsoft FrontPage 4.0">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH030501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id="rtBasic_1" class="datapro.eibs.beans.EDD000001Message"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  )
 {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }


%>
<H3 align="center">Checkbook Request <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_Solicitud.jsp, ECH0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0000" onsubmit="return(valida_contenido())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="30">
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
                <input type="text" name="E01CHPCUN" size="9" maxlength="9" value="<%= rtBasic.getE01CHPCUN().trim()%>" readonly>
			</div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CHPNA1" size="45" maxlength="45" readonly value="<%= rtBasic.getE01CHPNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01CHPACC" size="12" maxlength="12" value="<%= rtBasic.getE01CHPACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01CHPCCY" size="3" maxlength="3" value="<%= rtBasic.getE01CHPCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01CHPPRO" size="4" maxlength="4" readonly value="<%= rtBasic.getE01CHPPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
  <h4>Relevant Information</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">Last Request :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHPNTC" size="15" maxlength="15" value="<%= rtBasic.getE01CHPNTC().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right">Accounting Balance :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMMGB" readonly value="<%= rtBasic.getE01CHMMGB().trim()%>" size="15" maxlength="15">
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Minimum Stock :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHPMSK" size="15" maxlength="15" value="<%= rtBasic.getE01CHPMSK().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right">Available Balance :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMMNB" size="15" maxlength="15" value="<%= rtBasic.getE01CHMMNB().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Current Stock :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHPASK" size="15" maxlength="15" value="<%= rtBasic.getE01CHPASK().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right">Overdraft Date :</div>
            </td>
            <td nowrap>
              <input type="text" maxlength="2" size="2" name="E01LSTOD1" value="<%= rtBasic.getE01LSTOD1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTOD2" value="<%= rtBasic.getE01LSTOD2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01LSTOD3" value="<%= rtBasic.getE01LSTOD3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">With Charges :</div>
            </td>
            <td nowrap>
            	<SELECT name="E01CHPCBC" disabled>
                            <OPTION value="Y" <% if (rtBasic.getE01CHPCBC().equals("S")) out.print("selected"); %>="" selected>YES</OPTION>
                            <OPTION value="N" <% if (rtBasic.getE01CHPCBC().equals("N")) out.print("selected"); %>="">NO</OPTION>
                        </SELECT></td>
            <td nowrap>
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap>
              <input type="text" maxlength="2" size="2" name="E01OPNDT1" value="<%= rtBasic.getE01OPNDT1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01OPNDT2" value="<%= rtBasic.getE01OPNDT2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01OPNDT3" value="<%= rtBasic.getE01OPNDT3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Checkbook Type :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHPTCB" size="3" maxlength="2" value="<%= rtBasic.getE01CHPTCB().trim()%>">
				<!--<A href="javascript:GetTypCHK('E01CHPTCB','','<%= rtBasic_1.getE01ACMATY().trim()%>','<%= rtBasic_1.getE01ACMCCY().trim()%>')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0"></A> -->
                <a href="javascript:GetTypCodeCHK('E01CHPTCB','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>

            </td>
            <td nowrap>
              <div align="right">Number of Overdrafts :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMTNS" size="15" maxlength="15" value="<%= rtBasic.getE01CHMTNS().trim()%>" readonly>
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Date of Request :</div>
            </td>
            <td nowrap>
              <input type="text" maxlength="2" size="2" name="E01CHPDT1" value="<%= rtBasic.getE01CHPDT1().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01CHPDT2" value="<%= rtBasic.getE01CHPDT2().trim()%>" readonly>
              <input type="text" maxlength="2" size="2" name="E01CHPDT3" value="<%= rtBasic.getE01CHPDT3().trim()%>" readonly>
            </td>
            <td nowrap>
              <div align="right">Amount Last Deposit :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMLDA" size="15" maxlength="15" value="<%= rtBasic.getE01CHMLDA().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Request</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">Number of Checkbooks</div>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMNCH" size="15" maxlength="15" value="<%= rtBasic.getE01CHMNCH().trim()%>">
            </td>
          </tr>
             <input type="hidden" name="E01CHMTCH" size="15" maxlength="15">
			<INPUT size="25" type="hidden" name="DESNJMOET" maxlength="20" value="">

        </table>
      </td>
    </tr>
  </table>


   <p align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
   </p>

  <SCRIPT Language="Javascript">

  function valida_contenido()
  {
		document.forms[0].E01CHMTCH.value    = document.forms[0].E01CHPTCB.value ;
		return valida_cheq();
  }

  function valida_cheq()
  {
   	var stock = trim(document.forms[0].E01CHMNCH.value);

   	if (stock > 10) {
   		alert("Number of Checkbooks must be less or equal to 10");
   		document.forms[0].E01CHMNCH.focus();
   		return false;
   	}
   	else return true;
  }


</SCRIPT>

  </form>
</body>
</html>
