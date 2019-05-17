<html>
<head>
<title>Escrow Inqquiry</title>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ded" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
<%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){%>
	builtNewMenu(ln_i_1_opt);
<%} else  {%>
	builtNewMenu(ln_i_2_opt);
<%}%>
</SCRIPT>

</head>
<BODY>

<SCRIPT> initMenu();  </SCRIPT>

<h3 align="center">Escrow Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_inq_ded.jsp,EDL0305"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
	<INPUT TYPE=HIDDEN NAME="CODE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
	
<%if ( ded.getNoResult() ) {%>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> There is no match for your search criteria 
          </b></font> </div>
      </TD></TR>
   		</TABLE>
<%} else {
	
  ded.initRow();               
  while (ded.getNextRow()) {
       EDL030504Message msgDed = (EDL030504Message) ded.getRecord();	
       if (msgDed.getE04DLICDE().equals("999")) {
	       		 
 %> 
		 <h4><b>Summary</b></h4>
		  <table class="tableinfo">
		    <tr > 
		      <td nowrap> 
		        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right">Escrow Contribution :</div>
		            </td>
		            <td nowrap > 
		              <input type="text" name="E04DLIDPM" size="15" maxlength="15" value="<%= msgDed.getE04DLIDPM().trim()%>" readonly>
		            </td>
		            <td nowrap > 
		              <div align="right">Tax Disbursement Prior Year :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04TAXPYR" size="15" maxlength="15" value="<%= msgDed.getE04TAXPYR().trim()%>" readonly>			            </td>
		          </tr>		        
		          <tr id="trclear"> 
		            <td nowrap > 
		              <div align="right">Beginning Year Balance :</div>
		            </td>
		            <td nowrap > 
		              <input type="text" name="E04DLIBEG" size="15" maxlength="15" value="<%= msgDed.getE04DLIBEG().trim()%>" readonly>
		            </td>
		            <td nowrap > 
		              <div align="right">Tax Disbursement YTD :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04TAXYTD" size="15" maxlength="15" value="<%= msgDed.getE04TAXYTD().trim()%>" readonly>			            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right">Escrow Current Balance :</div>
		            </td>
		            <td nowrap > 
			            <input type="text" name="E04DLIBAL" size="15" maxlength="15" value="<%= msgDed.getE04DLIBAL().trim()%>" readonly>		             
		            </td>
		            <td nowrap > 
		              <div align="right">Insurance Disbursement Prior Year :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04INSPYR" size="15" maxlength="15" value="<%= msgDed.getE04INSPYR().trim()%>" readonly>			            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap ><div align="right">Contribution YTD :</div>
		            </td>
		            <td nowrap > 
 			            <input type="text" name="E04DLIYTD" size="15" maxlength="15" value="<%= msgDed.getE04DLIYTD().trim()%>" readonly>		            
		            </td>
		            <td nowrap > 
		              <div align="right">Insurance Disbursement YTD :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04INSYTD" size="15" maxlength="15" value="<%= msgDed.getE04INSYTD().trim()%>" readonly>			            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right">
				<DIV align="right">Contribution LTD :</DIV></div>
		            </td>
		            <td nowrap > 
			            <input type="text" name="E04DLILTD" size="15" maxlength="15" value="<%= msgDed.getE04DLILTD().trim()%>" readonly>	              
		            </td>
		            <td nowrap > 
		            </td>
		            <td nowrap > 						
					</td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap > 
		              <div align="right">Next Escrow Contribution :</div>
		            </td>
		            <td nowrap > 
		              <input type="text" name="E04DLIPCL" size="15" maxlength="15" value="<%= msgDed.getE04DLIPCL().trim()%>" readonly>
		            </td>
		            <td nowrap > 
		              <div align="right">Effective Date :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLIDD1" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD1().trim()%>" readonly>			           
						<input type="text" name="E04DLIDD2" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD2().trim()%>" readonly>	
						<input type="text" name="E04DLIDD3" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD3().trim()%>" readonly>	
					</td>
		          </tr>
		          
		        </table>
		      </td>
		    </tr>
		  </table>
 <%		}  	
 	}			 
  ded.initRow();               
  while (ded.getNextRow()) {
       EDL030504Message msgDed = (EDL030504Message) ded.getRecord();	
       if (!msgDed.getE04DLICDE().equals("999")) {
 %> 
		 <h4><b>Escrow Detail for : <%= msgDed.getE04DSCDED()%></b></h4>
		  <table class="tableinfo">
		    <tr > 
		      <td nowrap> 
		        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right">Deduction Code :</div>
		            </td>
		            <td nowrap > 
		              <input type="text" name="E04DLICDE" size="15" maxlength="15" value="<%= msgDed.getE04DLICDE().trim()%>" readonly>
		            </td>
		            <td nowrap > 
		              <div align="right">Next Disb. Amount :</div>
		            </td>
		            <td nowrap > 
          				<input type="text" name="E04DLICPA" size="15" maxlength="15" value="<%= msgDed.getE04DLICPA().trim()%>" readonly>						
					</td>
		            <td nowrap > 
		              <div align="right">Policy Number :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLIREF" size="15" maxlength="15" value="<%= msgDed.getE04DLIREF().trim()%>" readonly>	
					</td>					
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap > 
		              <div align="right">Type :</div>
		            </td>
		            <td nowrap > 
		              <input type="text" name="E04DSCTYP" size="15" maxlength="15" value="<%= msgDed.getE04DSCTYP().trim()%>" readonly>
		            </td>
		            <td nowrap > 
		              <div align="right">Next Disb. Date :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLIDD1" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD1().trim()%>" readonly>	
						<input type="text" name="E04DLIDD2" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD2().trim()%>" readonly>	
						<input type="text" name="E04DLIDD3" size="3" maxlength="2" value="<%= msgDed.getE04DLIDD3().trim()%>" readonly>							
		            </td>
		            <td nowrap > 
		              <div align="right">Policy Expiration :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLIEX1" size="3" maxlength="2" value="<%= msgDed.getE04DLIEX1().trim()%>" readonly>	
						<input type="text" name="E04DLIEX2" size="3" maxlength="2" value="<%= msgDed.getE04DLIEX2().trim()%>" readonly>	
						<input type="text" name="E04DLIEX3" size="3" maxlength="2" value="<%= msgDed.getE04DLIEX3().trim()%>" readonly>	
					</td>							            
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right"></div>
		            </td>
		            <td nowrap > 
		              
		            </td>
		            <td nowrap > 
		              <div align="right">Last Disb. Amount :</div>
		            </td>
		            <td nowrap > 
		            	<input type="text" name="E04DLILPA" size="15" maxlength="15" value="<%= msgDed.getE04DLILPA().trim()%>" readonly>	
					</td>
		            <td nowrap > 
		              <div align="right">Policy Coverage :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLIPAM" size="15" maxlength="15" value="<%= msgDed.getE04DLIPAM().trim()%>" readonly>	
					</td>					
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap > 
		              <div align="right"></div>
		            </td>
		            <td nowrap > 
		              
		            </td>
		            <td nowrap > 
		              <div align="right">Last Disb. Date :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLILP1" size="3" maxlength="2" value="<%= msgDed.getE04DLILP1().trim()%>" readonly>	
						<input type="text" name="E04DLILP2" size="3" maxlength="2" value="<%= msgDed.getE04DLILP2().trim()%>" readonly>	
						<input type="text" name="E04DLILP3" size="3" maxlength="2" value="<%= msgDed.getE04DLILP3().trim()%>" readonly>	
					</td>
		            <td nowrap > 
		              <div align="right">Company Name :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DSCCIA" size="15" maxlength="15" value="<%= msgDed.getE04DSCCIA().trim()%>" readonly>	
					</td>					
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap > 
		              <div align="right"></div>
		            </td>
		            <td nowrap > 
		              
		            </td>
		            <td nowrap > 
		              <div align="right">Total Disb. LTD :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLITPD" size="15" maxlength="15" value="<%= msgDed.getE04DLITPD().trim()%>" readonly>		
					</td>
		            <td nowrap > 
		              <div align="right">Insurance Agent :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DSCAGN" size="15" maxlength="15" value="<%= msgDed.getE04DSCAGN().trim()%>" readonly>	
					</td>					
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap > 
		              <div align="right"></div>
		            </td>
		            <td nowrap > 
		              
		            </td>
		            <td nowrap > 
		              <div align="right">Total Disb. YTD :</div>
		            </td>
		            <td nowrap > 
						<input type="text" name="E04DLITPY" size="15" maxlength="15" value="<%= msgDed.getE04DLITPY().trim()%>" readonly>		
					</td>
		            <td nowrap > 		             
		            </td>
		            <td nowrap > 
					</td>					
		          </tr>
		          
		        </table>
		      </td>
		    </tr>
		  </table>
<%
	    }
	}
%> 
  <BR>
<%}%> 
</form>
</body>
</html>
