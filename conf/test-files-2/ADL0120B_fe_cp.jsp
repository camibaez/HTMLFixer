<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL0120DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
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
<h3 align="center">Commercial Papers - Dealer Slip<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp.jsp,EDL0120B"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120B" >
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="hidden" name="D01DLSCP1"  value="<%= deal.getD01DLSCP1()%>" >
                <%= deal.getD01DLSCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01DLSCP2"  value="<%= deal.getD01DLSCP2()%>" >
              <%= deal.getD01DLSCP2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>" >
              <%= deal.getD01DLSCP3()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><b>Contract Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" name="D01FEBNM12" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Trade Information</h4>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSBRK" size="4" maxlength="3" value="<%= deal.getE01DLSBRK()%>">
              <input type="text" name="D01FEBNM1" size="15" maxlength="15" value="<%= deal.getD01FEBNM1()%>">
            </td>
            <td nowrap width="18%" > 
              <div align="right">Action Taken:</div>
            </td>
            <td nowrap width="20%" >
              <select name="select">
                <option>Sale outright (No safekeeping)</option>
                <option>Re-Sale (Keep safekeeping)</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Face Amount :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSRA42" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              <b> </b> <b> </b> </td>
            <td nowrap width="18%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSLI12" size="3" maxlength="2" value="<%= deal.getE01DLSLI1().trim()%>" 
			  >
              <input type="text" name="E01DLSLI22" size="3" maxlength="2" value="<%= deal.getE01DLSLI2().trim()%>" 
			  >
              <input type="text" name="E01DLSLI32" size="3" maxlength="2" value="<%= deal.getE01DLSLI3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSLI1,document.forms[0].E01DLSLI2,document.forms[0].E01DLSLI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Sale / Purchase Price :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSRA422" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
            </td>
            <td nowrap width="18%" > 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01DLSLI1" size="3" maxlength="2" value="<%= deal.getE01DLSLI1().trim()%>" 
			  >
              <input type="text" name="E01DLSLI2" size="3" maxlength="2" value="<%= deal.getE01DLSLI2().trim()%>" 
			  >
              <input type="text" name="E01DLSLI3" size="3" maxlength="2" value="<%= deal.getE01DLSLI3().trim()%>" 
			  >
              <a href="javascript:DatePicker(document.forms[0].E01DLSLI1,document.forms[0].E01DLSLI2,document.forms[0].E01DLSLI3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Interest Accrued :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSRA423" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
            </td>
            <td nowrap width="18%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Total Proceed :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLSRA424" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
            </td>
            <td nowrap width="18%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap width="23%" ><%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
            <td nowrap width="18%" >&nbsp;</td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Fee Entries</h4>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="center"><b>Bank</b></div>
            </td>
            <td nowrap width="23%" > 
              <div align="center"><b>Branch</b></div>
            </td>
            <td nowrap width="18%" > 
              <div align="center"><b>Currency</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><b>G/L Number </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><b>Account</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><b>Debit</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><b>Credit</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO2" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="23%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO12" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="18%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO22" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4222" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4223" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4224" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4225" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO3" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="23%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO13" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="18%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO23" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4226" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4227" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4228" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">
                <input type="text" name="E01DLSRA4229" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="31" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO4" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="23%" height="31" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO14" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="18%" height="31" > 
              <div align="center"> 
                <input type="text" name="E01DLSPRO24" size="3" maxlength="1" value="<%= deal.getE01DLSPRO()%>" 
			  >
              </div>
            </td>
            <td nowrap width="20%" height="31" > 
              <div align="center">
                <input type="text" name="E01DLSRA42210" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" height="31" > 
              <div align="center">
                <input type="text" name="E01DLSRA42211" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" height="31" > 
              <div align="center">
                <input type="text" name="E01DLSRA42212" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
            <td nowrap width="20%" height="31" > 
              <div align="center">
                <input type="text" name="E01DLSRA42213" size="17" maxlength="11" value="<%= deal.getE01DLSRA4().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Limits</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2"> 
              <div align="center"><b>Limit Amount </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Available Limit</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Ending Limit Amount </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap>Credit Lines</td>
            <td nowrap  colspan="2"> 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAMT())%>:</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAVL())%></div>
            </td>
            <td nowrap > 
              <div align="right"><b><%= Util.fcolorCCY(deal.getD01LIMEND())%></b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
<div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  <BR>
  </form>
</body>
</html>
