<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>New Check</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgChk" class= "datapro.eibs.beans.EDD120001Message"  scope="session" />

</head>
<body>
<h3 align="center">New Check<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rdc_new.jsp,EDD1200">
</h3>
<hr size="4">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01OFFCCY" VALUE="<%= userPO.getHeader3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFGLN" VALUE="<%= userPO.getHeader4().trim()%>">

  <%
      //  int row;
	//	  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
	//	  appList.setCurrentRow(row);
  %>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap  >
              <div align="right"><b>Reference Number : </b></div>
            </td>
            <td nowrap  >
              <div align="left">
                <input type="text" name="E01WTRARF" size="9" maxlength="9" readonly value="<%= userPO.getIdentifier().trim()%>">
			  </div>
            </td>
            <td nowrap  >
              <div align="right"><b>Bank/Branch : </b></div>
            </td>
            <td nowrap  >
              <div align="left">
                <input type="text" name="E01OFFBNK" size="2" maxlength="2" readonly value="<%= userPO.getBank().trim()%>">
                <input type="text" name="E01OFFBRN" size="5" maxlength="3" readonly value="<%= userPO.getBranch().trim()%>">
              </div>
            </td>
           </tr>
           <tr id="trdark">
            <td nowrap  >
              <div align="right"><b>Concept : </b></div>
            </td>
            <td nowrap  >
              <div align="left">
                <input type="text" name="E01OFFOPE" size="2" maxlength="2" readonly value="<%= userPO.getHeader1().trim()%>">
                <input type="text" name="E01OFFCON" size="26" maxlength="25" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
			<td nowrap  >
				<div align="right"><b>Sequence : </b></div>
            </td>
            <td nowrap  >
            	<input type="text" name="E01WTRSEQ" size="2" maxlength="2" readonly value="0">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Account :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01ACMACC" size="12" maxlength="9" value="<%= msgChk.getE01ACMACC().trim()%>" onKeypress="enterInteger()">
				<a href="javascript:GetAccount('E01ACMACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="25%">
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="27%">
            	<input type="text" name="E01AMOUNT" size="17" maxlength="16" value="<%= msgChk.getE01AMOUNT().trim()%>" onKeypress="enterDecimal()">
            	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Transaction Code :</div>
            </td>
            <td nowrap width="23%">
				<input type="text" name="E01TRNCDE" size="3" maxlength="2" value="<%= msgChk.getE01TRNCDE().trim()%>" >
				<a href="javascript:GetCodeCNOFC('E01TRNCDE','TT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
            </td>
            <td nowrap width="25%">
              <div align="right">Check Number :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01NUMCHK" size="11" maxlength="10" value="<%= msgChk.getE01NUMCHK().trim()%>" onKeypress="enterInteger()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0" >
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
