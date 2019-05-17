<html>
<head>
<title>Detail Account Charge Table Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<jsp:useBean id="ddaServCharge" class="datapro.eibs.beans.ESD0712DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>
<SCRIPT Language="Javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>
 initMenu();
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("       top.close();");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Detail Account Charge Table Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rt_inq_serv_charges, EDD0000"></h3>
<hr size="4">
<form >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <h4>General Information</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="49%"> 
              <div align="right">Bank Code :</div>
            </td>
            <td width="51%"> 
              <input type="text" readonly  name="E01SELBNK" size="4" maxlength="2" value="<%= ddaServCharge.getE01SELBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="49%"> 
              <div align="right">Account Type :</div>
            </td>
            <td width="51%"> 
              <input type="text" readonly  name="E01SELTYP" size="6" maxlength="4" value="<%= ddaServCharge.getE01SELTYP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="49%"> 
              <div align="right">Structure Number :</div>
            </td>
            <td width="51%"> 
              <input type="text" readonly  name="E01SELTBL" size="4" maxlength="2" value="<%= ddaServCharge.getE01SELTBL().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <BR>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="20%" height="22"> 
              <div align="right">Structure Number :</div>
            </td>
            <td width="40%" height="22"> 
              <input type="text" readonly  name="E01RTEDSC" size="27" maxlength="25" value="<%= ddaServCharge.getE01RTEDSC().trim()%>">
            </td>
            <td width="21%" height="22"> 
              <div align="right">Commission Currency :</div>
            </td>
            <td width="19%" height="22"> 
              <input type="text" readonly  name="E01RTEFCY" size="5" maxlength="3" value="<%= ddaServCharge.getE01RTEFCY().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Charges/Commissions</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="18%" height="22">&nbsp;</td>
            <td width="16%" height="22">&nbsp;</td>
            <td width="16%" height="22">&nbsp;</td>
            <td width="16%" height="22">&nbsp;</td>
            <td width="16%" height="22">&nbsp;</td>
            <td width="18%" height="22">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td width="18%" height="22"> 
              <div align="right">Communication :</div>
            </td>
            <td width="16%" height="22"> 
              <input type="text" readonly  name="E01RTESTC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTESTC().trim()%>">
            </td>
            <td width="16%" height="22"> 
              <div align="right">Balance Limit :</div>
            </td>
            <td width="16%" height="22"> 
              <input type="text" readonly  name="E01RTEMBM" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMBM().trim()%>">
            </td>
            <td width="16%" height="22"> 
              <div align="right">Balance Type :</div>
            </td>
            <td width="18%" height="22"> 
              <input type="text" readonly  name="E01RTEBT1" size="5" maxlength="3" value="<%= ddaServCharge.getE01RTEBT1().trim()%>">
            </td>
          </tr>
        </table>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="34%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
            <td width="32%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right"> Below Minimum Balance :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTECH1" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTECH1().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Minimum Gross Balance :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEBL1" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEBL1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Below Minimum Balance :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTECH2" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTECH2().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Minimum Net Balance :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEBL2" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEBL2().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Below Minimum Average :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTECH3" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTECH3().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Minimum Gross Average :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEBL3" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEBL3().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Below Minimum Average :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTECH4" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTECH4().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Minimum Net Average :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEBL4" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEBL4().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Extra Checks :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEMKC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMKC().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Number of Free Checks :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEMKK" size="5" maxlength="3" value="<%= ddaServCharge.getE01RTEMKK().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Inactive Accounts Type One :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEICH" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEICH().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Number of Days Inactive for Type One :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEIDL" size="6" maxlength="4" value="<%= ddaServCharge.getE01RTEIDL().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Inactive Accounts Type Two :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEDCH" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEDCH().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Number of Days Inactive for Type Two :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEDDL" size="6" maxlength="4" value="<%= ddaServCharge.getE01RTEDDL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Overdraft Approval :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENSC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTENSC().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Uncollected Approval :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEUNC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEUNC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Stop Payment :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTESPC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTESPC().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Openinig Commission :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEOPC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOPC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Non-Local Checks Commission :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENCP" size="7" maxlength="5" value="<%= ddaServCharge.getE01RTENCP().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Annual Commission :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEYRC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEYRC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Minimum Non-Local Checks :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENCM" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTENCM().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Deposited Checks :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEPDC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEPDC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Maximum Non-Local Checks :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENCX" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTENCX().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Hold Mail Service :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEHCH" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEHCH().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Confirmation Hold Days :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENDH" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTENDH().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Confirmation Limit Balance :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEMAC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMAC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%" height="19"> 
              <div align="right">Check Minimum Amount :</div>
            </td>
            <td width="17%" height="19"> 
              <input type="text" readonly  name="E01RTEMAK" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMAK().trim()%>">
            </td>
            <td width="32%" height="19"> 
              <div align="right">Opening Minimum Balance :</div>
            </td>
            <td width="17%" height="19"> 
              <input type="text" readonly  name="E01RTEMOA" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMOA().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Overdraft Minimum Charge :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEOMC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOMC().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Uncollected Days Loc/Non-Local :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEWLC" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTEWLC().trim()%>">
              <input type="text" readonly  name="E01RTEWNL" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTEWNL().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Number of Credit Units :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTESCU" size="7" maxlength="5" value="<%= ddaServCharge.getE01RTESCU().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Cancellation Minimum Days :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTENDC" size="5" maxlength="3" value="<%= ddaServCharge.getE01RTENDC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="34%"> 
              <div align="right">Credit Units Amount :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTESCA" size="7" maxlength="5" value="<%= ddaServCharge.getE01RTESCA().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Bal/Type Used for Crd/Units :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEBUS" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEBUS().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="34%"> 
              <div align="right">Current Certified Check Days :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTECAB" size="5" maxlength="3" value="<%= ddaServCharge.getE01RTECAB().trim()%>">
            </td>
            <td width="32%"> 
              <div align="right">Months to Keep History :</div>
            </td>
            <td width="17%"> 
              <input type="text" readonly  name="E01RTEHIS" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEHIS().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <BR>
 <div id="ActiveRate">
  <h4>Active Rate</h4>

  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="31%"> 
              <div align="right">Overdraft :</div>
            </td>
            <td width="23%"> 
              <input type="text" readonly  name="E01RTEOR1" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOR1().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right">Limit Day 1:</div>
            </td>
            <td width="19%">
              <input type="text" readonly  name="E01RTEDO1" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEDO1().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%"> 
              <div align="right">Overdraft :</div>
            </td>
            <td width="23%">
              <input type="text" readonly  name="E01RTEOR2" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOR2().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right">Limit Day 2:</div>
            </td>
            <td width="19%">
              <input type="text" readonly  name="E01RTEDO2" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEDO2().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="31%"> 
              <div align="right">Overdraft :</div>
            </td>
            <td width="23%">
              <input type="text" readonly  name="E01RTEOR3" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOR3().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right">Limit Day 3:</div>
            </td>
            <td width="19%">
              <input type="text" readonly  name="E01RTEDO3" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEDO3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%"> 
              <div align="right">Overdraft :</div>
            </td>
            <td width="23%">
              <input type="text" readonly  name="E01RTEOR4" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEOR4().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right">Limit Day 4:</div>
            </td>
            <td width="19%">
              <input type="text" readonly  name="E01RTEDO4" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEDO4().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td width="31%"> 
              <div align="right">Interest Type Calculation :</div>
            </td>
            <td width="23%">
              <input type="text" readonly  name="E01RTECAM" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTECAM().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right">Commission Amount :</div>
            </td>
            <td width="19%"> 
              <input type="text" readonly  name="E01RTEODC" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEODC().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="31%"> 
              <div align="right"> Overdraft Commission :</div>
            </td>
            <td width="23%">
              <input type="text" readonly  name="E01RTEODF" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTEODF().trim()%>">
            </td>
            <td width="27%"> 
              <div align="right"></div>
            </td>
            <td width="19%">&nbsp; </td>
          </tr>
        </table>

        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="17%"> 
              <div align="right">Variable Rate :</div>
            </td>
            <td width="13%">
              <input type="text" readonly  name="E01RTEFTA" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEFTA().trim()%>">
              <input type="text" readonly  name="E01RTEFYA" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEFYA().trim()%>">
            </td>
            <td width="17%"> 
              <div align="right">Base Number :</div>
            </td>
            <td width="13%"> 
              <input type="text" readonly  name="E01RTEFCA" size="7" maxlength="5" value="<%= ddaServCharge.getE01RTEFCA().trim()%>">
            </td>
            <td width="15%"> 
              <div align="right">Operation :</div>
            </td>
            <td width="25%"> 
              <input type="text" readonly  name="E01RTEFFA" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTEFFA().trim()%>">
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
   <BR>
  </div>

<div id="LiabilityRate">
  <h4>Liability Rate</h4>

  <table class="tableinfo">
    <tr> 
      <td > 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td width="31%"> 
                <div align="right">Balance Limit (1) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEMKL" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMKL().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Rate Limit (1) :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEMKR" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMKR().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td width="31%"> 
                <div align="right">Balance Limit (2) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEMB1" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMB1().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Rate Limit (2) :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEMR1" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMR1().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td width="31%"> 
                <div align="right">Balance Limit (3) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEMB2" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMB2().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Rate Limit (3) :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEMR2" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMR2().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td width="31%"> 
                <div align="right">Balance Limit (4) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEMB3" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMB3().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Rate Limit (4) :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEMR3" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMR3().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td width="31%"> 
                <div align="right">Balance Limit (5) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEMB4" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMB4().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Rate Limit (5) :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEMR4" size="11" maxlength="9" value="<%= ddaServCharge.getE01RTEMR4().trim()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td width="31%"> 
                <div align="right"> Balance Type :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEBTY" size="3" maxlength="2" value="<%= ddaServCharge.getE01RTEBTY().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Interest Type Calculation :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTECAML" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTECAM().trim()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td width="31%"> 
                <div align="right">Base( 360/365/366) :</div>
              </td>
              <td width="23%"> 
                <input type="text" readonly  name="E01RTEABA" size="3" maxlength="3" value="<%= ddaServCharge.getE01RTEABA().trim()%>">
              </td>
              <td width="27%"> 
                <div align="right">Interest Reversal :</div>
              </td>
              <td width="19%"> 
                <input type="text" readonly  name="E01RTEOMP" size="3" maxlength="1" value="<%= ddaServCharge.getE01RTEOMP().trim()%>">
              </td>
            </tr>
            <tr id="trclear">
              <td width="31%">
                <div align="right">Variable Rate :</div>
              </td>
              <td width="23%">
                <input type="text" readonly  name="E01RTEFTA2" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEFTA().trim()%>">
                <input type="text" readonly  name="E01RTEFYA2" size="4" maxlength="2" value="<%= ddaServCharge.getE01RTEFYA().trim()%>">
              </td>
              <td width="27%">&nbsp;</td>
              <td width="19%">&nbsp;</td>
            </tr>
          </table>
        
      </td>
    </tr>
  </table>
   <BR>
  </div>

  <SCRIPT Language="Javascript">
    <% if(ddaServCharge.getE01ACMACD().equals("01")){ %>
		LiabilityRate.style.display="none";
    <% }else if(ddaServCharge.getE01ACMACD().equals("04")){ %>
		ActiveRate.style.display="none";
	<% } %>
  </SCRIPT>
 </form>
</body>
</html>
