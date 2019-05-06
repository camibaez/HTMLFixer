<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Retail Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="accAnalysis" class="datapro.eibs.beans.EDD000010Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(rt_a_opt);
   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }	

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  

   out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 
<H3 align="center">Account Analysis Maintenance - Approval<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_account_analysis, EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="102">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E10ACMCUN" size="9" maxlength="9" readonly value="<%= accAnalysis.getE10ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E10CUSNA1" size="45" maxlength="45" readonly value="<%= accAnalysis.getE10CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E10ACMACC" size="12" maxlength="12" value="<%= accAnalysis.getE10ACMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E10ACMCCY" size="3" maxlength="3" value="<%= userPO.getCurrency()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E10ACMPRO" size="4" maxlength="4" readonly value="<%= accAnalysis.getE10ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Basic Information</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Analysis Type :</div>
            </td>
            <td nowrap width="18%"> 
              <select disabled name="E10ACMAAN">
                <option value="" <%if (accAnalysis.getE10ACMAAN().equals("")) out.print("selected"); %>></option>
                <option value="R" <%if (accAnalysis.getE10ACMAAN().equals("R")) out.print("selected"); %>>Regular</option>
                <option value="G" <%if (accAnalysis.getE10ACMAAN().equals("G")) out.print("selected"); %>>Group</option>
                <option value="M" <%if (accAnalysis.getE10ACMAAN().equals("M")) out.print("selected"); %>>Master</option>            
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Related Master Account :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly name="E10ACMANR" size="17" maxlength="16" value="<%= accAnalysis.getE10ACMANR().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Charges to be Applied</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Analysis Service Charge :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMASC" value="Y" <% if (accAnalysis.getE10ACMASC().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMASC" value="N" <% if (accAnalysis.getE10ACMASC().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
            <td nowrap > 
              <div align="right">Bill Payers :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMP05" value="Y" <% if (accAnalysis.getE10ACMP05().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP05" value="N" <% if (accAnalysis.getE10ACMP05().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Return Items :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMP01" value="Y" <% if (accAnalysis.getE10ACMP01().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP01" value="N" <% if (accAnalysis.getE10ACMP01().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
            <td nowrap > 
              <div align="right">Stop Payments :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="radio" disabled  name="E10ACMP06" value="Y" <% if (accAnalysis.getE10ACMP06().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP06" value="N" <% if (accAnalysis.getE10ACMP06().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Payable Through :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMP02" value="Y" <% if (accAnalysis.getE10ACMP02().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP02" value="N" <% if (accAnalysis.getE10ACMP02().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
            <td nowrap > 
              <div align="right">Account Management :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="radio" disabled  name="E10ACMP07" value="Y" <% if (accAnalysis.getE10ACMP07().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP07" value="N" <% if (accAnalysis.getE10ACMP07().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Wire Transfer :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMP03" value="Y" <% if (accAnalysis.getE10ACMP03().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP03" value="N" <% if (accAnalysis.getE10ACMP03().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
            <td nowrap > 
              <div align="right">Retail Services :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="radio" disabled  name="E10ACMP08" value="Y" <% if (accAnalysis.getE10ACMP08().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP08" value="N" <% if (accAnalysis.getE10ACMP08().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">O/D Interest :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="radio" disabled  name="E10ACMP04" value="Y" <% if (accAnalysis.getE10ACMP04().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP04" value="N" <% if (accAnalysis.getE10ACMP04().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
            <td nowrap > 
              <div align="right">O/D Authorization :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="radio" disabled  name="E10ACMP09" value="Y" <% if (accAnalysis.getE10ACMP09().equals("Y")) out.print("checked"); %>>
                Yes 
                <input type="radio" disabled  name="E10ACMP09" value="N" <% if (accAnalysis.getE10ACMP09().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Analysis O/D Frequency :</div>
            </td>
            <td nowrap width="18%"> 
              <select disabled name="E10ACMAAF">
                <option value="" <%if (accAnalysis.getE10ACMAAF().equals("")) out.print("selected"); %>></option>
                <option value="M" <%if (accAnalysis.getE10ACMAAF().equals("M")) out.print("selected"); %>>Monthly</option>
                <option value="Q" <%if (accAnalysis.getE10ACMAAF().equals("Q")) out.print("selected"); %>>Quaterly</option>
                <option value="S" <%if (accAnalysis.getE10ACMAAF().equals("S")) out.print("selected"); %>>Semester</option>
				<option value="A" <%if (accAnalysis.getE10ACMAAF().equals("A")) out.print("selected"); %>>Yearly</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Discount Percentage:</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly name="E10ACMADS" size="5" maxlength="4" value="<%=accAnalysis.getE10ACMADS().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
