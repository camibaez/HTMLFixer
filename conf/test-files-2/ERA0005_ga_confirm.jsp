<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page  import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Placement of Collaterals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Refresh" CONTENT="10;url='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005?SCREEN=100'">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="gaBasic" class="datapro.eibs.beans.ERA000501Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<SCRIPT LANGUAGE="javascript">
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
 function CheckSubmit()
{
  document.forms[0].submit();
}

 function getAmount(num)
  {
   if (num == 1) {
    if (trim(document.forms[0].E01OFFAM1.value)=="0.00" || trim(document.forms[0].E01OFFAM1.value)=="") {
     document.forms[0].E01OFFAM1.value = document.forms[0].E01DEAOAM.value;}
  }
}

function showCollaterals(){
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005?SCREEN=3&NUMACC=<%= userPO.getHeader20()%>',600,500,4);
}

function showAssets(){
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005?SCREEN=5&NUMACC=<%= userPO.getHeader20()%>',600,500,4);
}

</SCRIPT>
</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 
<h3 align="center"> Collaterals Placement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="cd_opening.jsp,EDL0130"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01RCLTIPO" VALUE="<%= gaBasic.getE01RCLTIPO()%>">
  </p>
  <h4>Operation to be Collaterized </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Customer<b> :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> <%= gaBasic.getE01RCLACUN()%> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Name :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= gaBasic.getE01CUSNA1A()%> </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="17"> 
              <div align="right">Account : </div>
            </td>
            <td nowrap width="20%" height="17"> <%= gaBasic.getE01RCLAACC()%> 
            </td>
            <td nowrap width="16%" height="17"> 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="16%" height="17"> <%= gaBasic.getE01RCLACCY()%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Product Type :</div>
            </td>
            <td nowrap width="20%"> <%= gaBasic.getE01RCLATYP()%> </td>
            <td nowrap width="16%"> 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAORA())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> <%= Util.formatDate(gaBasic.getE01RCLAOD1(),gaBasic.getE01RCLAOD2(),gaBasic.getE01RCLAOD3())%> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Current Amount :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> <%= Util.fcolorCCY(gaBasic.getE01RCLABAL())%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="20%"> <%= Util.formatDate(gaBasic.getE01RCLAMD1(),gaBasic.getE01RCLAMD2(),gaBasic.getE01RCLAMD3())%> </td>
            <td nowrap width="16%"> 
              <div align="right">Collaterized Amount :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAGAN())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%">&nbsp; </td>
            <td nowrap width="16%"> 
              <div align="right">Pending Amount :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAAVL())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Collateral Assignment </h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Collateral Number :</div>
            </td>
            <td nowrap width="30%"> <%= gaBasic.getE01RCLBACC()%> </td>
            <td nowrap width="22%"> 
              <div align="right">Account Type :</div>
            </td>
            <td nowrap width="7%"> <%= gaBasic.getE01RCLBTYP()%> </td>
            <td nowrap width="9%"> 
              <div align="right">Status :</div>
            </td>
            <td nowrap width="12%"> <%= gaBasic.getE01RCLBSTA()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="37"> 
              <div align="right">Customer :</div>
            </td>
            <td nowrap width="30%" height="37"> <%= gaBasic.getE01RCLBCUN()%> 
            </td>
            <td nowrap width="22%" height="37"> 
              <div align="right">Name :</div>
            </td>
            <td nowrap height="37" colspan="3"> 
              <div align="left"> <%= gaBasic.getE01CUSNA1B()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="30%" > <%= Util.fcolorCCY(gaBasic.getE01RCLBOPE())%> 
              <INPUT TYPE=HIDDEN NAME="E01RCLINDE" VALUE="<%= gaBasic.getE01RCLINDE()%>">
              <input type="radio" name="CE01RCLINDE" value="5" 
			  onClick="document.forms[0].E01RCLINDE.value='5'"
			  <%if(gaBasic.getE01RCLINDE().equals("5")) out.print("checked");%> disabled>
              Increase 
              <input type="radio" name="CE01RCLEINDE" value="0" 
			  onClick="document.forms[0].E01RCLINDE.value='0'"
			  <%if(gaBasic.getE01RCLINDE().equals("0")) out.print("checked");%> disabled>
              Decrease </td>
            <td nowrap width="22%" > 
              <div align="right">Balance :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBALT())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Collaterized Through :</div>
            </td>
            <td nowrap width="30%" > <%= Util.formatDate(gaBasic.getE01RCLEXP1(),gaBasic.getE01RCLEXP2(),gaBasic.getE01RCLEXP3())%> </td>
            <td nowrap width="22%" > 
              <div align="right">Ineligible Amount :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBEAM())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Currency Code :</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLBCCY()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Collaterized Amount :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBAUS())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Exchange Rate :</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLEXR ()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Available Amount :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBAVL())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLSP1()%> </td>
            <td nowrap width="22%" > 
              <div align="right">This operation Amount :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBOPE())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLSP2()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Collateral Balance :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBFIN())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="center">This operation has been sucesfully processed. 
                This screen is not valid as official receipt. Please wait..</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> </h4>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp; </p>
  </form>
</body>
</html>
