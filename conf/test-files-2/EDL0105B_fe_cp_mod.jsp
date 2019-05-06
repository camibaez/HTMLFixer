<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="deal" class="datapro.eibs.beans.EDL010502Message"  scope="session" />
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

	builtNewMenu( cp_m_opt ) ;
	initMenu() ;

</SCRIPT>

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
<h3 align="center">Commercial Papers - Back Office<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_cp_mod.jsp,EDL0105B"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0105B" >
<input type="hidden" name="SCREEN"  value="4" >
<%!
	double difer(String oam, String net)
	{
		oam = oam.replaceAll(",", "");
		net = net.replaceAll(",", "");
    	double premium = Double.parseDouble(net) - Double.parseDouble(oam);
    	return premium;
    }
%>
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
                <input type="hidden" name="E02CUSNA1"  value="<%= deal.getE02CUSNA1()%>" >
                <%= deal.getE02CUSNA1()%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information 
    
   
  </h4>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Date :</div>
            </td>
            <td nowrap ><%= Util.formatDate(deal.getE02DEAOD1(),deal.getE02DEAOD2(),deal.getE02DEAOD3())%></td>
            <td nowrap >
              <div align="right">Time :</div>
            </td>
            <td nowrap >
            	<% if (deal.getE02DEAREF().length() > 6) out.print(deal.getE02DEAREF().substring(deal.getE02DEAREF().length() - 6)); %>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Broker :</div>
            </td>
            <td nowrap width="23%" > <%= deal.getE02DLSBRK()%> - <%= deal.getE02DLSBDS()%> 
            </td>
            <td nowrap width="18%" > 
              <div align="right"> Action Taken :</div>
            </td>
            <td nowrap width="20%" ><% if(deal.getE02DLSSBT().equals("PU")) out.print("New Purchase");
					   else if(deal.getE02DLSSBT().equals("PA")) out.print("Additional Purchase");
					    else if(deal.getE02DLSSBT().equals("SL")) out.print("Sale outright");
					     else if(deal.getE02DLSSBT().equals("S1")) out.print("Re-Sale");
					      else if(deal.getE02DLSSBT().equals("PR")) out.print("Re-Purchase");
					       else if(deal.getE02DLSSBT().equals("RL")) out.print("Release");
					        else if(deal.getE02DLSSBT().equals("SS")) out.print("Short Sale");
					         else out.print("");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap width="23%" ><%= deal.getE02DEAREF().trim()%> </td>
            <td nowrap width="18%" >
              <div align="right">Line of Credit :</div>
            </td>
            <td nowrap width="20%" >
			  <%= deal.getE02DEACMC().trim()%>
			  &nbsp;/&nbsp;
              <%= deal.getE02DEACMN().trim()%>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="23%" ><%= deal.getE02DEACCY().trim()%>  </td>
            <td nowrap align="right" width="18%">Face Value :</td>
            <td nowrap width="20%"><%= Util.fcolorCCY(deal.getE02DEAOAM())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Price : </div>
            </td>
            <td nowrap width="23%" > <%= Util.fcolorCCY(deal.getE02BIDPRC())%>
            </td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap width="20%"><%= deal.getE02DEAINT().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Coupon Rate :</div>
            </td>
            <td nowrap width="23%" ><%= Util.fcolorCCY(deal.getE02DEARTE())%></td>
            <td nowrap align="right" width="18%"> 
              <div align="right">Premium/Discount :</div>
            </td>
            <td nowrap width="20%"><%= Util.fcolorCCY(Double.toString(difer(deal.getE02DEAOAM() , deal.getE02NETPRC())))%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Last Coupon Date :</div>
            </td>
            <td nowrap width="23%" ><%= Util.formatDate(deal.getE02DEALI1(),deal.getE02DEALI2(),deal.getE02DEALI3())%>  </td>
            <td nowrap align="right" width="18%">Net Proceeds :</td>
            <td nowrap width="20%"><%= Util.fcolorCCY(deal.getE02NETPRC())%> </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap width="23%" ><%= Util.formatDate(deal.getE02DEAOD1(),deal.getE02DEAOD2(),deal.getE02DEAOD3())%> 
            </td>
            <td nowrap align="right" width="18%">Settlement Date :</td>
            <td nowrap width="20%"> <%= Util.formatDate(deal.getE02DEAST1(),deal.getE02DEAST2(),deal.getE02DEAST3())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Notes :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE02DLSOT1().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE02DLSOT2().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Dealer :</div>
            </td>
            <td nowrap colspan="3" ><%= deal.getE02DLSUSR().trim()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Additional Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Product :</div>
            </td>
            <td nowrap width="23%"> 
              <%= deal.getE02DEAPRO().trim()%>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Redemption Date :</div>
            </td>
            <td nowrap width="27%"> 
              <%= Util.formatDate(deal.getE02DEAMD1(),deal.getE02DEAMD2(),deal.getE02DEAMD3())%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Terms :</div>
            </td>
            <td nowrap width="23%" height="37"> 
             <%= deal.getE02DEATRM().trim()%>
             &nbsp;
                 <% if(deal.getE02DEATRC().equals("D")) out.print("Day(s)");
                 else if(deal.getE02DEATRC().equals("M")) out.print("Month(s)");
                else if(deal.getE02DEATRC().equals("Y")) out.print("Year(s)");%>
            </td>
            <td nowrap width="25%" height="37"> 
              <div align="right">Yield :</div>
            </td>
            <td nowrap width="27%" height="37">
				<%= deal.getE02DEAMXR().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" height="37"> 
              <div align="right">Accrual Type Basis :</div>
            </td>
            <td nowrap width="23%" height="37"> 
             <%= deal.getE02DEAICT().trim()%>&nbsp;
             <%= deal.getE02DEABAS().trim()%>
            </td>
            <td nowrap width="25%" height="37"> 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap width="27%" height="37">
               <% if(deal.getE02DEAPVI().equals("F")) out.print("Fed");
                  else if(deal.getE02DEAPVI().equals("1")) out.print("Swift MT-103");
                  else if(deal.getE02DEAPVI().equals("2")) out.print("Swift MT-200");
				  else if(deal.getE02DEAPVI().equals("3")) out.print("Swift MT-202");
				  else if(deal.getE02DEAPVI().equals("G")) out.print("General Ledger");
				  else if(deal.getE02DEAPVI().equals("R")) out.print("Retail Account");			  
                  else if(deal.getE02DEAPVI().equals("C")) out.print("Official Check");
                  else if(deal.getE02DEAPVI().equals("A")) out.print("ACH");%>

            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Coupon Payment Period :</div>
            </td>
            <td nowrap width="23%" > 
             <%= deal.getE02DEAROY().trim()%> 
             <SELECT name="E02DEAODA" disabled>
				<OPTION value=""
					<%if (deal.getE02DEAODA().equals("")) { out.print("selected"); }%>></OPTION>
				<OPTION value="P"
					<%if (deal.getE02DEAODA().equals("P")) { out.print("selected"); }%>>Monthly Period (Do Not Include Last Day)</OPTION>
				<OPTION value="I"
					<%if (deal.getE02DEAODA().equals("I")) { out.print("selected"); }%>>Monthly Period (Include Last Day)</OPTION>
				<OPTION value="Y"
					<%if (deal.getE02DEAODA().equals("Y")) { out.print("selected"); }%>>Yearly</OPTION>
				<OPTION value="M"
					<%if (deal.getE02DEAODA().equals("M")) { out.print("selected"); }%>>Day of the Month</OPTION>
				<OPTION value="D"
					<%if (deal.getE02DEAODA().equals("D")) { out.print("selected"); }%>>Days (31 End of Month)</OPTION>
				<OPTION value="Q"
					<%if (deal.getE02DEAODA().equals("Q")) { out.print("selected"); }%>>Quarterly</OPTION>
			</SELECT> 
            </td>            <td nowrap width="25%" >
              <div align="right">Confirmation Type :</div>
            </td>
            <td nowrap width="27%" >
                
                <% if (deal.getE02DEAF03().equals("P")) out.print("Print"); 
                 else if (deal.getE02DEAF03().equals("S")) out.print("Swift"); 
				else if (deal.getE02DEAF03().equals("N")) out.print("None"); %>

             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Investment Type :</div>
            </td>
            <td nowrap width="23%" > 
              <%= deal.getE02DEAUC6().trim()%>
            </td>
            <td nowrap width="25%" >
              <div align="right">Revaluation Type :</div>
            </td>
            <td nowrap width="27%" >
				<% if (deal.getE02DEARRT().equals("1")) out.print("Reval Gain & Losses Daily"); 
                else if (deal.getE02DEARRT().equals("2")) out.print("Reval Only Losses Daily"); 
                else if (deal.getE02DEARRT().equals("3")) out.print("Reval Gain & Losses Monthly"); 
                else if (deal.getE02DEARRT().equals("4")) out.print("Reval Only Losses Monthly");
                else if (deal.getE02DEARRT().equals("N")) out.print("No Revaluation"); %>

             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Safekeeper Number :</div>
            </td>
            <td nowrap width="23%" > 
				<%= deal.getE02SFENUM().trim()%>         
			</td>
            <td nowrap width="25%" >
              <div align="right">Cusip/Isin Code Number :</div>
            </td>
            <td nowrap width="27%" >
             <%= deal.getE02DEACUI().trim()%>
            </td>
          </tr>     
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Documents Location :</div>
            </td>
            <td nowrap width="25%"> 
            	<%= deal.getE02DEALOC().trim()%>
            </td>
            <TD nowrap width="25%">
              <DIV align="right">Country of Risk :</DIV>
            </TD><TD nowrap width="27%">
              <%= deal.getE02DEAGRC().trim()%>
             </TD>
            
          </tr>  
           <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Country of Residence :</div>
            </td>
            <td nowrap width="23%" > 
              <%= deal.getE02DEAGCD().trim()%>
              
            </td>
            <TD nowrap width="25%"> 
              <DIV align="right">Coupon Rate :</DIV>
            </TD><TD nowrap width="27%"> 
              <%= deal.getE02RATE().trim()%>
            </TD>
            
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Floating Rate Type :</div>
            </td>
            <td nowrap width="23%" > 
              <%= deal.getE02DEAFTB().trim()%>&nbsp;
                 <% if (deal.getE02DEAFTY().equals("FP")) out.print("Primary"); 
                else if (deal.getE02DEAFTY().equals("FS")) out.print("Secondary"); %>

            </td>
            <TD nowrap width="25%"> 
              <DIV align="right">Cost Center :</DIV>
            </TD><TD nowrap width="27%"> 
              <%= deal.getE02DEACCN().trim()%>
            </TD>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Rate Revision Date/Period :</div>
            </td>
            <td nowrap width="23%" > 
              <%= Util.formatDate(deal.getE02DEARD1(),deal.getE02DEARD2(),deal.getE02DEARD3())%>
               / 
              <%= deal.getE02DEARRP().trim()%>
            </td>
            <TD nowrap width="25%"> 
              <DIV align="right">Foreign Exchange Rate :</DIV>
            </TD><TD nowrap width="27%"> 
              <%= deal.getE02DEAEXR().trim()%>
            </TD>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Rollover Code :</div>
            </td>
            <td nowrap width="23%" > 
              <%= deal.getE02DEAF02().trim()%>
             </td>
            <td nowrap width="25%"> 
              <div align="right">Negotiated By :</div>
            </td>
            <td nowrap width="25%"><%= deal.getE02DL1OFI().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">First Cpn Pmt Date :</div>
            </td>
            <td nowrap width="23%" > 
            	<%= Util.formatDate(deal.getE02DEABA1(),deal.getE02DEABA2(),deal.getE02DEABA3())%> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">:</div>
            </td>
            <td nowrap width="25%">
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>  

<% if (!deal.getE02DLSSBT().equals("PR")) { %>   
            
     <h4>Offset Accounts</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <%= deal.getField("E02OFFOP"+name).getString().trim()%>
          <%= deal.getField("E02OFFCO"+name).getString().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getField("E02OFFBK"+name).getString().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getField("E02OFFBR"+name).getString().trim()%>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <%= deal.getField("E02OFFCY"+name).getString().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getField("E02OFFAC"+name).getString().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
             <%= deal.getField("E02OFFAM"+name).getString().trim()%>
        </div>
      </td>
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
    <table id="footTable" > 				
    <tr id="trdark"> 
            <td nowrap align="right"><b>Deal Currency Equivalent :</b> </td>
      <td nowrap align="center"><b><i><strong> 
          <%= deal.getE02OFFEQV().trim()%>
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>    

    <h4>Repayment</h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable1">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
      <td nowrap align="center" >Amount</td>
    </tr>
    </table> 
      
    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
     <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <%= deal.getE02REPOPE().trim()%>
          <%= deal.getE02REPCON().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getE02REPBNK().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getE02REPBRN().trim()%>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <%= deal.getE02REPCCY().trim()%>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <%= deal.getE02REPACC().trim()%>
        </div>
      </td>
    </tr>
     </table>
        </div>
  </TD>  
</TR>	
</TABLE>    

<% } %>

   <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,true);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>


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
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT1())%></div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT2())%></div>
            </td>
            <td nowrap > 
              <div align="right"><b><%= Util.fcolorCCY(deal.getE02DLSAMT3())%></b></div>
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
