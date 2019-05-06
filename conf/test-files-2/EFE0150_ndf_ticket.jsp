<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>NDF</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Refresh" CONTENT="10;url='<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0333M?SCREEN=1'">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="fra" class="datapro.eibs.beans.EFE0150DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.js"> </SCRIPT>


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
<h3 align="center"> NDF - Settlement
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ndf_ticket.jsp,EFE0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0333" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="80">
  <table class="tableinfo" width="315">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="hidden" name="D01FRACP1"  value="<%= fra.getD01FEMCP1()%>" readonly>
                <%= fra.getD01FEMCP1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="hidden" name="D01WFRCP2"  value="<%= fra.getD01FEMCP2()%>" readonly>
                <%= fra.getD01FEMCP2()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="hidden" name="D01WFRCP3"  value="<%= fra.getD01FEMCP3()%>" readonly>
              <%= fra.getD01FEMCP3()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"><b>Account Number :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <input type="hidden" name="E01WFRACC"  value="<%= fra.getE01FEMACC()%>" readonly>
              <%= fra.getE01FEMACC()%></td>
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
            <td nowrap width="21%" ><%= fra.getE01FEMREF()%></td>
            <td nowrap width="23%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Date :<%= Util.formatDate(fra.getE01FEMDD1(),fra.getE01FEMDD2(),fra.getE01FEMDD3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="21%" > <%= fra.getE01FEMBRK()%> - <%= fra.getD01FEBNM1()%> 
            </td>
            <td nowrap width="23%" > 
              <div align="right">Action Taken :</div>
            </td>
            <td nowrap width="23%" > <% if(fra.getE01FEMSBT().equals("PU")) out.print("Purchase");
						else out.print("Sale");%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Primary Currency :</div>
            </td>
            <td nowrap width="21%" > <%= fra.getE01FEMCCY().trim()%> </td>
            <td nowrap width="23%" > 
              <div align="right">Counter Currency :</div>
            </td>
            <td nowrap width="23%"><%= fra.getE01FEMDCY().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Primary Original Amount :</div>
            </td>
            <td nowrap width="21%" ><%= Util.fcolorCCY(fra.getE01FEMSOA())%></td>
            <td nowrap align="right" width="23%">Counter Original Amount :</td>
            <td nowrap width="23%"><%= Util.fcolorCCY(fra.getE01FEMDOA())%></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="33%" >
              <div align="right">Primary Balance Amount :</div>
            </td>
            <td nowrap width="21%" ><%= Util.fcolorCCY(fra.getE01FEMSAM())%></td>
            <td nowrap align="right" width="23%">Counter Balance Amount :</td>
            <td nowrap width="23%"><%= Util.fcolorCCY(fra.getE01FEMDAM())%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">O/Right Rate :</div>
            </td>
            <td nowrap width="21%" ><%= fra.getE01FEMEXR().trim()%> </td>
            <td nowrap align="right" width="23%"> 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="23%"> <%= Util.formatDate(fra.getE01FEMVD1(),fra.getE01FEMVD2(),fra.getE01FEMVD3())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= fra.getE01FEMDID()%> - <%= fra.getD01USRDSC().trim()%> 
              <input type="hidden" name="E01FEMCCY"  value="<%= fra.getE01FEMCCY()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Contract Rate Information</h4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
        <tr>	
            <td nowrap > 
              <div align="right">Contract Rate : </div>
            </td>
            <td nowrap colspan="2"><%= fra.getE01FEMEXR().trim()%> </td>
            <td nowrap > 
              <div align="right">Settlement Rate : </div>
            </td>
            <td nowrap colspan="2">                  
            
                    <%= fra.getE01FEMNRT() %>                    
                          
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
            <td nowrap colspan="4" > <%= fra.getE01FEMCLS()%> - <%= fra.getD01FEGDSC()%></td>
            <td nowrap > 
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><% if(fra.getE01FEMRVF().equals("3")) out.print("Accrual Basic");
				 else if(fra.getE01FEMRVF().equals("1")) out.print("Use Daily Spot Rate");
				 else if(fra.getE01FEMRVF().equals("2")) out.print("Forward Rate");
				 else out.print("No Revaluation");%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap colspan="2" > <% if(fra.getE01FEMNTF().equals("P")) out.print("Print Notification");
				 else if(fra.getE01FEMNTF().equals("S")) out.print("Send Notification Via Swift");
				 else if(fra.getE01FEMNTF().equals("H")) out.print("Send Notification Via Chip");
				 else if(fra.getE01FEMNTF().equals("T")) out.print("Send Notification Via Telex");
				 else if(fra.getE01FEMNTF().equals("F")) out.print("Send Notification Via Fax");
				 else out.print("No Notification");%> </td>
            <td nowrap colspan="2" > 
              <div align="right"></div>
            </td>
            <td nowrap > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><% if(fra.getE01FEMBPV().equals("F")) out.print("Payment Via Fed");
				 else if(fra.getE01FEMBPV().equals("1")) out.print("Payment Via Swift MT-103");
				 else if(fra.getE01FEMBPV().equals("2")) out.print("Payment Via Swift MT - 200");
				 else if(fra.getE01FEMBPV().equals("3")) out.print("Payment Via Swift MT- 202");
				 else if(fra.getE01FEMBPV().equals("T")) out.print("Payment Via Telex");
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
              <div align="center"> <%= fra.getE01FEMOBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMOBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMOCY()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMOGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMOAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMOCC()%> </div>
            </td>
            <td nowrap ><%= fra.getD01NACDSC()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Vostro Account :</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCBK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCBR()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCCU()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCGL()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCAC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= fra.getE01FEMCCC()%> </div>
            </td>
            <td nowrap ><%= fra.getD01VACDSC()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <br>
</form>
</body>
</html>
