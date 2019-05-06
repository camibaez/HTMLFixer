<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT> 
 <script src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"></script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="JavaScript">
	builtHPopUp();

function enter(){
	 document.forms[0].submit();
}

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
  }
</script>


<TITLE></TITLE>
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
<h3 align="center">Return Deposit Checks New<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rdc_enter_new.jsp,EDD1200"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

   <table class="tbenter" height="75%" width="100%" border="0">
    <TR>
    <TD>
    <table class="tbenter" width="100%" border="0">

        <tr>
          <td NOWRAP width="50%">
      		<div align="right"> Reference Number : </div>
          </td>
          <td NOWRAP width="50%">
            <div align="left">
              <input type="text" name="E01WTRARF"  size="12" maxlength="9" onkeypress="enterInteger()">

            </div>
          </td>
        </tr>
        <tr>
          <td NOWRAP width="50%">
            <div align="right">Bank/Branch : </div>
          </td>
          <td NOWRAP width="50%">
            <div align="left">
              <input type="text" name="E01OFFBNK" size="2" maxlength="2" value="<%=currUser.getE01UBK().trim()%>" readonly>
              <input type="text" name="E01OFFBRN"  size="5" maxlength="3" value="" >
              <a href="javascript:GetBranch('E01OFFBRN','<%=currUser.getE01UBK().trim()%>')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a></div>

          </td>
        </tr>
        <tr>
          <td NOWRAP width="50%">
            <div align="right">Concept :</div>
          </td>
          <td NOWRAP width="50%">
            <div align="left">
	    		<input type="text" name="E01OFFOPE" value="" size="2" maxlength="2">
	    		<input type="hidden" name="E01OFFGLN" value="">
	    		<input type="text" name="E01OFFCON" size="25" maxlength="25" readonly value=""
	     		 oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01OFFBNK.value,'','E01OFFGLN','E01OFFOPE','RD')">
			</div>
		  </td>
        </tr>

    </table>


<br>
 <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:enter();">
  </div>		</TD>
    </TR>
  </table>

</form>
</body>
</html>
