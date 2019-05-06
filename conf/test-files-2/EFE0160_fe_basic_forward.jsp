<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Foreign Exchange Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fex" class="datapro.eibs.beans.EFE0160DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(fwi_bo_opt);

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
out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
<div align="center">
  <h3>Foreign Exchange Forward - Inquiry</h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140" >
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="hidden" name="D01FEMCP1"  value="<%= fex.getD01FEMCP1()%>" >
                <%= fex.getD01FEMCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <input type="hidden" name="D01FEMCP2"  value="<%= fex.getD01FEMCP2()%>" readonly>
              <%= fex.getD01FEMCP2()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > <font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="D01FEMCP3"  value="<%= fex.getD01FEMCP3()%>" readonly>
              </font></font></font></font></font><%= fex.getD01FEMCP3()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" ><font face="Arial"><font face="Arial"><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="hidden" name="E01FEMACC"  value="<%= fex.getD01FEMCP3()%>" readonly>
              </font></font></font></font></font><%= fex.getE01FEMACC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information
    <input type="hidden" name="SCREEN"  value="14" >
  </h4>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="21%" ><%= fex.getE01FEMREF()%></td>
            <td nowrap width="23%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Date :<%= Util.formatDate(fex.getE01FEMDD1(),fex.getE01FEMDD2(),fex.getE01FEMDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="21%" > <%= fex.getE01FEMBRK()%> - <%= fex.getD01FEBNM1()%> 
            </td>
            <td nowrap width="23%" > 
              <div align="right">Action Taken :</div>
            </td>
            <td nowrap width="23%" > <% if(fex.getE01FEMSBT().equals("PU")) out.print("Purchase");
						else out.print("Sale");%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="21%" > <%= fex.getE01FEMCCY().trim()%> </td>
            <td nowrap width="23%" > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap width="23%"><%= fex.getE01FEMDCY().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Primary Original Amount :</div>
            </td>
            <td nowrap width="21%" ><%= Util.fcolorCCY(fex.getE01FEMSOA())%></td>
            <td nowrap align="right" width="23%">Counter Original Amount :</td>
            <td nowrap width="23%"><%= Util.fcolorCCY(fex.getE01FEMDOA())%></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Primary Balance Amount :</div>
            </td>
            <td nowrap width="21%" ><%= Util.fcolorCCY(fex.getE01FEMSAM())%></td>
            <td nowrap align="right" width="23%">Counter Balance Amount :</td>
            <td nowrap width="23%"><%= Util.fcolorCCY(fex.getE01FEMDAM())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">O/Right Rate :</div>
            </td>
            <td nowrap width="21%" ><%= fex.getE01FEMEXR().trim()%> </td>
            <td nowrap align="right" width="23%"> 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="23%"> <%= Util.formatDate(fex.getE01FEMVD1(),fex.getE01FEMVD2(),fex.getE01FEMVD3())%> 
            </td>
          </tr>
          <tr id="trdark">
          	<td nowrap width="33%">
          		<div align="right">Hedge Deal :</div>
          	</td>
            <% if (fex.getE01FEMHEF().equals("Y")) { %>
            <td nowrap>            
            Yes
            </td>
            <td nowrap align="right" width="23%">
            	<div align="right">Deal Number :</div>
            </td>
            <td nowrap width="23%" >
            <%= fex.getE01FEMHEM().trim()%> 
            </td>
            <% } else { %>
            <td nowrap colspan="3" >
            No
            </td>
            <% } %>
          </tr>          
          
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fex.getE01FEMDID()%> - <%= fex.getD01USRDSC().trim()%> 
              <input type="hidden" name="E01FEMCCY"  value="<%= fex.getE01FEMCCY()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table  class="tableinfo" width="474" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Classification :</div>
            </td>
            <td nowrap colspan="4" > <%= fex.getE01FEMCLS()%> - <%= fex.getD01FEGDSC()%></td>
            <td nowrap > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><% if(fex.getE01FEMRVF().equals("3")) out.print("Accrual Basic");
				 else if(fex.getE01FEMRVF().equals("1")) out.print("Use Daily Spot Rate");
				 else if(fex.getE01FEMRVF().equals("2")) out.print("Forward Rate");
				 else out.print("No Revaluation");%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap colspan="2" > <% if(fex.getE01FEMNTF().equals("P")) out.print("Print Notification");
				 else if(fex.getE01FEMNTF().equals("S")) out.print("Send Notification Via Swift");
				 else if(fex.getE01FEMNTF().equals("H")) out.print("Send Notification Via Chip");
				 else if(fex.getE01FEMNTF().equals("T")) out.print("Send Notification Via Telex");
				 else if(fex.getE01FEMNTF().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%> </td>
            <td nowrap colspan="2" > 
              <div align="right"></div>
            </td>
            <td nowrap > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><% if(fex.getE01FEMBPV().equals("F")) out.print("Payment Via Fed");
				 else if(fex.getE01FEMBPV().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fex.getE01FEMBPV().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fex.getE01FEMBPV().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fex.getE01FEMBPV().equals("T")) out.print("Payment Via Telex");
				 else out.print("None");%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Bank</b></h4>
            </td>
            <td nowrap> 
              <h4 align="center"><b>Branch</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>CCY</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>G/L</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Reference</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Cost Center</b></h4>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Nostro Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOCY()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMOCC()%> </div>
            </td>
            <td nowrap ><%= fex.getD01NACDSC()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCCU()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fex.getE01FEMCCC()%> </div>
            </td>
            <td nowrap ><%= fex.getD01VACDSC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p><b>Limits</b></p>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Line of Credit</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Daily Settlement</b></div>
            </td>
            <td nowrap > 
              <div align="right">Yesterday Position :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01YTDBAL())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right">Limit Amount :</div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fex.getD01LIMAMT())%></div>
            </td>
            <td nowrap > 
              <div align="center"><%= Util.fcolorCCY(fex.getD01FEOLIM())%></div>
            </td>
            <td nowrap > 
              <div align="right">(+) Purchases :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01TOTPUR())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">Available Limit :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01LIMAVL())%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01FEOAVL())%> </div>
            </td>
            <td nowrap > 
              <div align="right">(-) Sales :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01TOTSAL())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="right">Ending Limit Amount :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01LIMEND())%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= Util.fcolorCCY(fex.getD01FEOEND())%> </div>
            </td>
            <td nowrap > 
              <div align="right">Available Position :</div>
            </td>
            <td nowrap ><%= Util.fcolorCCY(fex.getD01POSBAL())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
