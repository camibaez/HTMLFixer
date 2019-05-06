<html>
<head>
<title>Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id ="cdMant" class="datapro.eibs.beans.EDL013001Message"  scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   <% 
    if (userPO.getOption().equals("CD_TREASURY") && userPO.getHeader16().equals("N")) {  
   %>
		builtNewMenu(cdt_a_act_opt);
  <%      
   }
    else if (userPO.getOption().equals("CD_TREASURY") && (!userPO.getHeader16().equals("N"))) {
   %>
		builtNewMenu(cdt_a_opt);
   <%
   }
    else if (!userPO.getOption().equals("CD_TREASURY")) {
   %>
		builtNewMenu(cd_a_opt);
   <%
   }
   %>



</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

<h3 align="center">Basic Information<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_ap_maint.jsp,EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
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
                <input type="text" readonly <% if (cdMant.getF01DEACUN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACUN" size="9" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E01DEAACC" size="12" maxlength="12" value="<%= cdMant.getE01DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E01DEACCY2" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E01DEAPRO" size="4" maxlength="4" value="<%= cdMant.getE01DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Information</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Opening Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAOD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD1().trim()%>" >
              <input type="text" readonly <% if (cdMant.getF01DEAOD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD2().trim()%>" >
              <input type="text" readonly <% if (cdMant.getF01DEAOD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAOD3().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right">Original Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAOAM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAOAM" size="15" maxlength="15" value="<%= cdMant.getE01DEAOAM().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAMD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD1" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD1().trim()%>" >
              <input type="text" readonly <% if (cdMant.getF01DEAMD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD2" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD2().trim()%>" >
              <input type="text" readonly <% if (cdMant.getF01DEAMD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMD3" size="2" maxlength="2" value="<%= cdMant.getE01DEAMD3().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right">Principal Balance :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAMEP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMEP" size="15" maxlength="15" value="<%= cdMant.getE01DEAMEP().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01RATE" size="10" maxlength="9" value="<%= cdMant.getE01RATE().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right">Interest Balance :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAMEI().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMEI" size="15" maxlength="15" value="<%= cdMant.getE01DEAMEI().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Accrual Basic :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEABAS().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEABAS" size="3" maxlength="3" value="<%= cdMant.getE01DEABAS().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right"> Currency :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEACCY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACCY" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> Basic Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">New Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01NEWMD1" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD1().trim()%>">
              <input type="text" readonly name="E01NEWMD2" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD2().trim()%>">
              <input type="text" readonly name="E01NEWMD3" size="2" maxlength="2" value="<%= cdMant.getE01NEWMD3().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Term :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEATRM().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEATRM" size="4" maxlength="4" value="<%= cdMant.getE01DEATRM().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEATRC().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEATRC" size="15" maxlength="15" 
				  value="<% if (cdMant.getE01DEATRC().equals("M")) out.print("Month(s)");
							else if (cdMant.getE01DEATRC().equals("D")) out.print("Day(s)");
							else if (cdMant.getE01DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Type of Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAFTB().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEAFTY().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAFTY" size="3" maxlength="3" 
				  value="<% if (cdMant.getE01DEAFTY().equals("FP")) out.print("FP");
							else if (cdMant.getE01DEAFTY().equals("FS")) out.print("FS");
							else out.print("");%>" 
				>
            </td>
            <td nowrap > 
              <div align="right">Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly name="E01FLTRTE" size="10" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Rate Revision Perios/ Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEARRP().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>">
              / 
              <input type="text" readonly <% if (cdMant.getF01DEARD1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARD1" size="2" maxlength="2" value="<%= cdMant.getE01DEARD1().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEARD2().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARD2" size="2" maxlength="2" value="<%= cdMant.getE01DEARD2().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEARD3().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARD3" size="2" maxlength="2" value="<%= cdMant.getE01DEARD3().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Interest Rate/ Spread :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEARTE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEARTE" size="10" maxlength="9" value="<%= cdMant.getE01DEARTE().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Withholding/Deductions :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAWHF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAWHF" size="2" maxlength="1" value="<%= cdMant.getE01DEAWHF().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Reference Number :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAREF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAREF" size="12" maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Status :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEADLC().equals("Y")) out.print("id=\"txtchanged\""); %>  name="E01DEADLC" size="15" maxlength="15" 
				  value="<% if (cdMant.getE01DEADLC().equals("1")) out.print("Current");
							else if (cdMant.getE01DEADLC().equals("2")) out.print("Matured");
							else if (cdMant.getE01DEADLC().equals("3")) out.print("Suspende");
							else out.print("");%>" 
				>
            </td>
            <td nowrap > 
              <div align="right">Foreign Exchange Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAEXR().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAEXR" size="11" maxlength="11" value="<%= cdMant.getE01DEAEXR().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interest Calculation Method :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAICT().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAICT" size="2" maxlength="1" value="<%= cdMant.getE01DEAICT().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Interest Accrual :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="F01DEAIFL" value="N" <% if (cdMant.getF01DEAIFL().equals("N")) out.print("checked"); %> checked>
              Yes 
              <input type="radio" name="F01DEAIFL" value="1" <% if (cdMant.getF01DEAIFL().equals("1")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Mailing Address :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEAMLA().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEAMLA" size="2" maxlength="1" value="<%= cdMant.getE01DEAMLA().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Certificate Class :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly <% if (cdMant.getF01DEACLF().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACLF" size="2" maxlength="1" value="<%= cdMant.getE01DEACLF().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Cost Center :</div>
            </td>
            <td nowrap >
              <input type="text" readonly <% if (cdMant.getF01DEACCN().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACCN" size="8" maxlength="8" value="<%= cdMant.getE01DEACCN().trim()%>">
            </td>
            <td nowrap >
              <div align="right">Collateral Percent :</div>
            </td>
            <td nowrap >
              <input type="text" readonly <% if (cdMant.getF01DEACPE().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01DEACPE" size="7" maxlength="7" value="<%= cdMant.getE01DEACPE().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Rates Tables: </div>
            </td>
            <td nowrap >
              <input type="text" readonly name="E01DEARTB" size="1" maxlength="1" value="<%= cdMant.getE01DEARTB().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Payment Via :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPVI" size="2" maxlength="1" readonly value="<%= cdMant.getE01DEAPVI().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Inquiry Level (0-9) : </div>
            </td>
            <td nowrap >
              <input type="text"  name="E01DEAOPT" size="2" maxlength="1" value="<%= cdMant.getE01DEAOPT().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Beneficiary Designation :</div>
            </td>
            <td nowrap >
              <input type="text" size="2" maxlength="1" readonly value="<%= cdMant.getE01DEAF05().trim()%>" name="E01DEAF05">
            </td>
          </tr>       
          <tr id="trdark"> 
            <td nowrap width="29%" height="19">
              <div align="right">Bank/Branch :</div>
            </td>
            <td nowrap >            
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="2" maxlength="3" value="<%= cdMant.getE01DEABRN().trim()%>" readonly>
            </td>
          
            <td nowrap > 
              <div align="right">Ownership of Account : </div>
            </td>
            <td nowrap >
              <input type="text" size="2" maxlength="1" readonly value="<%= cdMant.getE01DEAF04().trim()%>" name="E01DEAF04">
            </td>
          </tr>                    
        </table>
      </td>
    </tr>
  </table>
  
  <%if (!cdMant.getE01DEARCL().equals("")){%>  
  <h4>IRA Information</h4>
  <table class="tableinfo" width="582">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
             
            	<td nowrap width="16%"> 
              		<div align="right">TAX Year : </div>
            	</td>
	         <td width="18%"> 
              <select name="E01DEARRT">
                <option value="C" <%if (cdMant.getE01DEARRT().equals("C")) { out.print("selected"); }%>>Current Year</option>
                <option value="P" <%if (cdMant.getE01DEARRT().equals("P")) { out.print("selected"); }%>>Previous Year</option>
					<OPTION value="">Not Applicable</OPTION>
				</select> 
            </td> 
        	 
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Contribution Type : </div>
            </td>
             <td width="18%"> 
              <input type="text" name="E01DEASOU" size="3" maxlength="2" value="<%= cdMant.getE01DEASOU().trim() %>">
              <a href="javascript:GetCodeCNOFC('E01DEASOU','18')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
            </td>
             
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%}%>
  
  <h4>Offset Accounts</h4>
   <TABLE class="tableinfo" align="center" >
  <TR><TD>
  
   <table id="headTable" >
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
      <td nowrap  > 
        <div align="center"> 
          <input type="hidden" name="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>">
          <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBR<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" readonly>
        </div>
      </td>
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
    <table id="footTable"> 			
    <tr id="trdark"> 
      <td nowrap align="right"><b>Certificate Currency Equivalent :</b>
      </td>
      <td nowrap align="center"><b><i><strong> 
          <input type="text" name="E01OFFEQV" size="15" maxlength="13" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>    
 <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
  </form>
</body>
</html>
