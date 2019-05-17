<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Overdraft Collaterals Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="coll" class="datapro.eibs.beans.ERA018001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

 function DeleteAcc(){
   document.forms[0].SCREEN.value = "400";
   document.forms[0].submit();
}
 function SubmitAcc(){
   document.forms[0].SCREEN.value = "600";
   document.forms[0].submit();
}


</SCRIPT>




</head>

<body>



<h3 align="center">Overdraft / Collaterals Maintenance </h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERA0180" >
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Costumer : </b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> <%= coll.getE01DEACUN()%> - <%= coll.getE01CUSNA1()%> 
              </div>
            </td>
          </tr>
        
        </table>
      </td>
    </tr>
  </table>
  <h4>Overdraft Information<b>
    <input type="hidden" name="SCREEN" >
    </b></h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Account Number :</div>
            </td>
            <td nowrap width="25%" ><%= coll.getE01DEAACC()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Overdraft Amount :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(coll.getE01ACMOVD())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Last Overdraft Date :</div>
            </td>
            <td nowrap width="25%" ><%= Util.formatDate(coll.getE01ACMOV1(),coll.getE01ACMOV2(),coll.getE01ACMOV3())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Times Overdraft :</div>
            </td>
            <td nowrap width="25%" ><%= coll.getE01ACMTON()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Credit Limit :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(coll.getE01CREDLM())%> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Certificate of Deposit </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Contract Number :</div>
            </td>
            <td nowrap width="25%" ><%= coll.getE01DEAACC()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(coll.getE01DEAPRI())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Hold Amount :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(coll.getE01DEAHAM())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="25%" ><%= Util.formatDate(coll.getE01DEAMD1(),coll.getE01DEAMD2(),coll.getE01DEAMD3())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Interest Outstanding :</div>
            </td>
            <td nowrap width="25%" ><%= Util.fcolorCCY(coll.getE01DEAINT())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Rate :</div>
            </td>
            <td nowrap width="25%" ><%= coll.getE01DEARTE()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap colspan="2" > 
              <div align="right"></div>
              <%= coll.getE01DESCRI()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="SubmitAcc();">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit2" value="Delete" onClick="DeleteAcc();">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
