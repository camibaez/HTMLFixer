<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Parametros de Tarjeta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgFRate" class= "datapro.eibs.beans.EDL0157DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EDL015001Message"  scope="session" />

<script language="JavaScript">
	builtNewMenu(ln_m_opt);	
</script>

</head>
<body>
<h3 align="center">Floating Rates Schedule<BR>Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="floatRate_schedule_maint.jsp, EDL0157">
</h3>
<hr size="4">
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 out.println("<SCRIPT> initMenu();  </SCRIPT>");

%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0157" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
	<table class="tableinfo" >
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer : </b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01DEACUN" size="9" maxlength="9" value="<%out.print(lnBasic.getE01DEACUN().trim());%>" readonly >
                </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%out.print(lnBasic.getE01CUSNA1().trim());%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E01DLVACC" size="12" maxlength="12"  readonly
					value="<% out.print(lnBasic.getE01DEAACC().trim());%>">
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnBasic.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="7" maxlength="4" value="<%= lnBasic.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

       <br>

    <table cellpadding=2 cellspacing=0 width="100%" border="0" class="tableinfo" >
    <tr id="trclear">
            <td nowrap width="25%" >
              <div align="right">Effective Date :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLVSDM" size="2" maxlength="2" value="<%= msgFRate.getE01DLVSDM().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLVSDD" size="2" maxlength="2" value="<%= msgFRate.getE01DLVSDD().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01DLVSDY" size="2" maxlength="2" value="<%= msgFRate.getE01DLVSDY().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01DLVSDM,document.forms[0].E01DLVSDD,document.forms[0].E01DLVSDY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
            </td>
            <td ></td>
            <td ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%" >
	              <div align="right"> VIR Index Table :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DLVFTB" size="2" maxlength="2" value="<%= msgFRate.getE01DLVFTB().trim()%>">
              <a href="javascript:GetFloating('E01DLVFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a>
              <select name="E01DLVFTY">
                <option value=" " <% if (!(msgFRate.getE01DLVFTY().equals("FP") ||msgFRate.getE01DLVFTY().equals("FS") )) out.print("selected"); %>></option>
                <option value="FP" <% if (msgFRate.getE01DLVFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (msgFRate.getE01DLVFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
            </td>
                        <TD>
              <DIV align="right"> Days to Obtain VIR :</DIV>
            </TD><TD>
            <INPUT type="text" name="E01DLVDYS" size="3" maxlength="2" value="<%= msgFRate.getE01DLVDYS()%>" onkeypress="enterInteger()"></TD>



          </tr>

          <tr id="trclear">
                      <td nowrap width="25%" >
              <div align="right"> Rate/Spread :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DLVRTE" size="10" maxlength="9" value="<%= msgFRate.getE01DLVRTE().trim()%>" onKeypress="enterSignDecimal()" >
              <SELECT name="E01DLVFLG">
				<OPTION value=" " <%if (!(msgFRate.getE01DLVFLG().equals("+") ||msgFRate.getE01DLVFLG().equals("-")||msgFRate.getE01DLVFLG().equals("=") )) out.print("selected"); %>></OPTION>
				<OPTION value="+" <% if (msgFRate.getE01DLVFLG().equals("+")) out.print("selected"); %>>ADD</OPTION>
				<OPTION value="-" <% if (msgFRate.getE01DLVFLG().equals("-")) out.print("selected"); %>>SUBSTRACT</OPTION>
				<OPTION value="=" <% if (msgFRate.getE01DLVFLG().equals("=")) out.print("selected"); %>>REPLACE</OPTION>
			  </SELECT>
			</td>


            <TD nowrap width="25%">
              <DIV align="right">Rate Revision Cycle :</DIV>
            </TD><TD nowrap width="23%">
              <INPUT type="text" name="E01DLVRRP" size="3" maxlength="3" value="<%= msgFRate.getE01DLVRRP().trim()%>" onblur="rightAlignCharNumber()">
			  <A href="javascript:GetCode('E01DLVRRP','STATIC_ln_rate_rev.jsp')">
			  <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></A>
			  <SELECT name="E01DLVF03">
                <OPTION value=" " <% if (!(msgFRate.getE01DLVF03().equals("D") ||msgFRate.getE01DLVF03().equals("M") ||msgFRate.getE01DLVF03().equals("Y"))) out.print("selected"); %>></OPTION>
                <OPTION value="D" <% if (msgFRate.getE01DLVF03().equals("D")) out.print("selected"); %>>Day(s)</OPTION>
                <OPTION value="M" <% if (msgFRate.getE01DLVF03().equals("M")) out.print("selected"); %>>Month(s)</OPTION>
				<OPTION value="Y" <% if (msgFRate.getE01DLVF03().equals("Y")) out.print("selected"); %>>Year(s)</OPTION>
              </SELECT>

            </TD>

          </tr>
    </table>
  <br>
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
