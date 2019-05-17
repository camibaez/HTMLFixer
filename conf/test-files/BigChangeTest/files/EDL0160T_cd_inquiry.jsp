<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Deals Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdInquiry" class="datapro.eibs.beans.EDL016001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cdt_i_opt);

</SCRIPT>


</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
 
%> 
<div align="center"></div>
<h3 align="center"> Deals Balances<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_inquiry, EDL0160 "></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <p>
    <input type=HIDDEN name="SCREEN" value="14">
  </p>
  <p><b><font color=red><%= cdInquiry.getE01COLATR()%> </font></b></p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Contract :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Officer :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Summary</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01DEAOAM" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAOAM().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01DEAOD1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAOD1().trim()%>" readonly>
                <input type="text" name="E01DEAOD2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAOD2().trim()%>" readonly>
                <input type="text" name="E01DEAOD3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAOD3().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Principal Balance:</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01DEAMEP" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAMEP().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01DEAMD1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAMD1().trim()%>" readonly>
                <input type="text" name="E01DEAMD2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAMD2().trim()%>" readonly>
                <input type="text" name="E01DEAMD3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAMD3().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Adjustment Principal :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01DEAREA" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAREA().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Term :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01DEATRM" size="4" maxlength="4" value="<%= cdInquiry.getE01DEATRM().trim()%>" readonly>
                <input type="text" name="E01DEATRC" size="10" 
				  value="<% if (cdInquiry.getE01DEATRC().equals("D")) out.print("Day(s)");
							else if (cdInquiry.getE01DEATRC().equals("M")) out.print("Month(s)");
							else if (cdInquiry.getE01DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Interest Balance :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01DEAMEI" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAMEI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01NOWRTE2" size="9" maxlength="9" value="<%= cdInquiry.getE01NOWRTE().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Withholding Amount :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01TOTRET" size="15" maxlength="15" value="<%= cdInquiry.getE01TOTRET().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Accrual Basis :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= cdInquiry.getE01DEABAS().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Current Balance :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01MEMBAL" size="15" maxlength="15" value="<%= cdInquiry.getE01MEMBAL().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Interest at Maturity :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left"> 
                <input type="text" name="E01MATINT" size="15" maxlength="15" value="<%= cdInquiry.getE01MATINT().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"> Collateral Amount :</div>
            </td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01DEAHAM" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAHAM().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Collateral Date :</div>
            </td>
            <td nowrap width="26%"> 
              <div align="left">
                <input type="text" name="E01DEAHE1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAHE1().trim()%>" readonly>
                <input type="text" name="E01DEAHE2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAHE2().trim()%>" readonly>
                <input type="text" name="E01DEAHE3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEAHE3().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Redemption Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table width="100%">
          <tr id="trdark"> 
            <td> <%
 if (cdInquiry.getE01DEAROC().equals("A")) out.print("Principal plus Interests will be roll over by the same period of time.  ");
 else if (cdInquiry.getE01DEAROC().equals("B")) {
 					out.print("Interest will be paid to " + cdInquiry.getE01TEXTO2().trim() + " will have as a number " 
 				  + cdInquiry.getE01DEARAC().trim() + ". Principal will be roll over by the same period of time. ");
 				}
 else if (cdInquiry.getE01DEAROC().equals("C")) {
 					out.print("Interest will be paid to the General Ledger Number  " + cdInquiry.getE01DEARAC().trim() + ", generating a " 
 				  + cdInquiry.getE01TEXTO2().trim() + " will have as a number");
 				}
else if (cdInquiry.getE01DEAROC().equals("D")) {
 					out.print("When Certificate matures cancel the Deposit plus Interest payable to the General Ledger number  " + cdInquiry.getE01DEARAC().trim()
 					+ ", generating a " +  cdInquiry.getE01TEXTO2().trim()) ;
 				}
else if (cdInquiry.getE01DEAROC().equals("E")) {
 					out.print("When Certificate matures cancel the Deposit plus Interest payable to the Account (Retail, Savings, etc.) number  " +  cdInquiry.getE01DEARAC().trim() ) ;  
 				}
else if (cdInquiry.getE01DEAROC().equals("F")) {
 					out.print("When Certificate matures roll over  the Deposit plus Interest,   " + cdInquiry.getE01TEXTO2().trim() + "  en  "   +  cdInquiry.getE01DEAROA().trim()  	+  " against  the Account (Retail, Savings, etc.) number "  +  cdInquiry.getE01DEARAC().trim()) ;
 				} 
else if (cdInquiry.getE01DEAROC().equals("G")) {
 					out.print("When Certificate matures roll over  the Deposit plus Interest, by the same period of time, increasing the Interests in " +  cdInquiry.getE01DEAROA().trim()  +  "   and crediting them to the Account (Retail, Savings, etc.) number  "  
 				  + cdInquiry.getE01DEARAC().trim()  ); 
 				}	
else if (cdInquiry.getE01DEAROC().equals("H")) {
 					out.print("Interest will be paid in  " + cdInquiry.getE01DEAROY().trim() + "  " + cdInquiry.getE01TEXTO1().trim() + "  a " + cdInquiry.getE01TEXTO2().trim()
					+ " will have as a number " + cdInquiry.getE01DEARAC().trim() + ".  Principal will be roll over by the same period of time.  ");
 				}		
 else if (cdInquiry.getE01DEAROC().equals("I")) {
 					out.print("Interest will be paid in " +  cdInquiry.getE01DEAROY().trim() +  "  " + cdInquiry.getE01TEXTO1().trim() + " to the General Ledger number "  +
 				    cdInquiry.getE01DEARAC().trim() + ", generating a  " +  cdInquiry.getE01TEXTO2().trim() + ". Principal will be roll over by the same period of time ");
 				}	
 else if (cdInquiry.getE01DEAROC().equals("J")) {
 					out.print("Interest plus Principal will be paid to the Certificate of Deposit number  " +  cdInquiry.getE01DEARAC().trim()
 					+ "  .There is no renovation in this option.");  
 				}
 else if (cdInquiry.getE01DEAROC().equals("K")) {
 					out.print("Interest will be paid in " +  cdInquiry.getE01DEAROY().trim() + "  " +  cdInquiry.getE01TEXTO1().trim()  +  "  a "  +
 				    cdInquiry.getE01TEXTO2().trim() + ",  will have as a number " +  cdInquiry.getE01DEARAC().trim());  
 				}	
else if (cdInquiry.getE01DEAROC().equals("P")) out.print("Deposit has no Roll Over instructions, it will be automatically roll over after the waiting period. "); 		
else if (cdInquiry.getE01DEAROC().equals("S")) out.print("Principal and Interest will be paid based on payment schedule,crediting  to a General Ledger Number  " + cdInquiry.getE01DEARAC().trim() + ", or to an Account number " 
 				  + cdInquiry.getE01TEXTO1().trim() + " generating a " + cdInquiry.getE01TEXTO2().trim() );	
					
%> </td>
          </tr>
        </table>
<%
if ( !pmnt.getNoResult() ) {
%>
        
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="trdark"> 
                  <td nowrap> 
                    <div align="center">Payment Number </div>
                  </td>
                  <td nowrap> 
                    <div align="center">Date</div>
                  </td>
                  <td nowrap> 
                    <div align="center">Principal</div>
                  </td>
                  <td nowrap> 
                    <div align="center">Interest</div>
                  </td>
                </tr>
                <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %> 
                <tr id="trclear"> 
                  <td nowrap> 
                    <div align="center"><%= pmnt.getRecord(0) %></div>
                  </td>
                  <td nowrap> 
                    <div align="center"><%= pmnt.getRecord(1) %></div>
                  </td>
                  <td nowrap> 
                    <div align="center"><%= pmnt.getRecord(2) %></div>
                  </td>
                  <td nowrap> 
                    <div align="center"><%= pmnt.getRecord(3) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>
<%
}
%>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="31%"> 
              <div align="right">Redemption Type :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01DEAROC" size="2" maxlength="1" value="<%= cdInquiry.getE01DEAROC().trim()%>" readonly>
            </td>
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="22%">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Interest / Rates</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="26%"> 
              <div align="right">Interest Accrual LTD :</div>
            </td>
            <td nowrap width="14%"> 
              <input type="text" name="E01DEAIAL" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAIAL().trim()%>" readonly>
            </td>
            <td nowrap width="35%"> 
              <div align="right">Base Rate / Spread Current :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01NOWRTE" size="9" maxlength="9" value="<%= cdInquiry.getE01NOWRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Interest Paid LTD :</div>
            </td>
            <td nowrap width="14%"> 
              <input type="text" name="E01DEAIPL" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAIPL().trim()%>" readonly>
            </td>
            <td nowrap width="35%"> 
              <div align="right">Base Rate / Spread Previous :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAPBR" size="9" maxlength="9" value="<%= cdInquiry.getE01DEAPBR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%"> 
              <div align="right">Interest Adjustment LTD :</div>
            </td>
            <td nowrap width="14%"> 
              <input type="text" name="E01DEAIJL" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAIJL().trim()%>" readonly>
            </td>
            <td nowrap width="35%"> 
              <div align="right">Current Floating Rate :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAFRT" size="9" maxlength="9" value="<%= cdInquiry.getE01DEAFRT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" >
              <div align="right">Interest Paid YTD :</div>
            </td>
            <td nowrap width="14%"  >
              <input type="text" name="E01DEAIPY" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAIPY().trim()%>" readonly>
            </td>
            <td nowrap width="35%"> 
              <div align="right">Previous Floating Rate :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEAPFR" size="9" maxlength="9" value="<%= cdInquiry.getE01DEAPFR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="26%">
              <div align="right">Daily Interest :</div>
            </td>
            <td nowrap width="14%" >
              <input type="text" name="E01DLYINT" size="15" maxlength="15" value="<%= cdInquiry.getE01DLYINT().trim()%>" readonly>
            </td>
            <td nowrap width="35%" >
              <div align="right">Next Floating Rate :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" name="E01DEANER" size="9" maxlength="9" value="<%= cdInquiry.getE01DEANER().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Yesterday Interest :</div>
            </td>
            <td nowrap width="14%" >
              <input type="text" name="E01YESINT" size="15" maxlength="15" value="<%= cdInquiry.getE01YESINT().trim()%>" readonly>
            </td>
            <td nowrap width="35%" > 
              <div align="right">Effective Rate :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEASPR" size="9" maxlength="9" value="<%= cdInquiry.getE01DEASPR().trim()%>" readonly>
            </td>
          </tr>
	   <tr id="trdark">
            <td nowrap width="26%">
              <div align="right">Penalty YTD :</div>
            </td>
            <td nowrap width="14%" >
              <input type="text" name="E01DEAXRL" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAXRL().trim()%>" readonly>
            </td>
            <td nowrap width="35%" >
              <div align="right"></div>
            </td>
            <td nowrap width="25%" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Penalty LTD :</div>
            </td>
            <td nowrap width="14%" >
              <input type="text" name="E01DEAXRP" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAXRP().trim()%>" readonly>
            </td>
            <td nowrap width="35%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="25%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Withholding</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="33"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%"> 
              <div align="right">Quaterly :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" name="E01DEAWQT" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAWQT().trim()%>" readonly>
            </td>
            <td nowrap width="18%"> 
              <div align="right">Annual :</div>
            </td>
            <td nowrap width="32%"> 
              <input type="text" name="E01DEAWYT" size="15" maxlength="15" value="<%= cdInquiry.getE01DEAWYT().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Dates</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="31%"> 
              <div align="right">Value Date :</div>
            </td>
            <td nowrap width="13%"> 
              <input type="text" name="E01DEASD1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEASD1().trim()%>" readonly>
              <input type="text" name="E01DEASD2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEASD2().trim()%>" readonly>
              <input type="text" name="E01DEASD3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEASD3().trim()%>" readonly>
            </td>
            <td nowrap width="31%"> 
              <div align="right">Last Calculation Date :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEALC1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALC1().trim()%>" readonly>
              <input type="text" name="E01DEALC2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALC2().trim()%>" readonly>
              <input type="text" name="E01DEALC3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%"> 
              <div align="right">Last Change of Rate Date :</div>
            </td>
            <td nowrap width="13%">
              <input type="text" name="E01DEARC1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEARC1().trim()%>" readonly>
              <input type="text" name="E01DEARC2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEARC2().trim()%>" readonly>
              <input type="text" name="E01DEARC3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEARC3().trim()%>" readonly>
            </td>
            <td nowrap width="31%">
              <div align="right"> Last Principal Payment Date :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01DEALP1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALP1().trim()%>" readonly>
              <input type="text" name="E01DEALP2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALP2().trim()%>" readonly>
              <input type="text" name="E01DEALP3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALP3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="31%"> 
              <div align="right">Next Change of Rate Date :</div>
            </td>
            <td nowrap width="13%">
              <input type="text" name="E01DEANR1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEANR1().trim()%>" readonly>
              <input type="text" name="E01DEANR2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEANR2().trim()%>" readonly>
              <input type="text" name="E01DEANR3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEANR3().trim()%>" readonly>
            </td>
            <td nowrap width="31%">
              <div align="right">Last Interests Payment Date :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01DEALI1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALI1().trim()%>" readonly>
              <input type="text" name="E01DEALI2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALI2().trim()%>" readonly>
              <input type="text" name="E01DEALI3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALI3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="31%"> 
              <div align="right">Last Modification Date :</div>
            </td>
            <td nowrap width="13%">
              <input type="text" name="E01DEALM1" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALM1().trim()%>" readonly>
              <input type="text" name="E01DEALM2" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALM2().trim()%>" readonly>
              <input type="text" name="E01DEALM3" size="2" maxlength="2" value="<%= cdInquiry.getE01DEALM3().trim()%>" readonly>
            </td>
            <td nowrap width="31%"> 
              <div align="right">Last Modification User :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01DEAUSR" size="15" maxlength="10" value="<%= cdInquiry.getE01DEAUSR().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
