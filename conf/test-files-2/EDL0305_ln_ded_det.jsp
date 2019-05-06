<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>Deduction Detail</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="lnDedDet" class= "datapro.eibs.beans.EDL030503Message"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>
<BODY>
<form>
  <h3 align="center">Deduction Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_ded_det.jsp,EDL0305" width="32" height="32"> 
  </h3>
  <hr size="4">

<h4></h4>
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
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
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
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Company Code :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03DLICDE().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Type :</div>
            </td>
            <td nowrap  colspan="2" > 
              <div align="left">
              	<%if (lnDedDet.getE03DLITYP().trim().equals("I")) {
              		out.println("Insurance");	
              	} else if (lnDedDet.getE03DLITYP().trim().equals("T")) {
              		out.println("Taxes");	
              	} else {
              		out.println("Other");	
              	}
              	%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Company Name :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03DEDNME().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Referece :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03DLIREF().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Insurance Agent :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03DLITBL().trim()%></div> 
            <td nowrap width="16%" > 
              <div align="right">Agent Name :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNNME().trim()%></div>
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"> Agent Address :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNAD1().trim()%></div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Phone 1 :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNPH1().trim()%></div>
            </td>
          </tr>   
               
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNAD2().trim()%></div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Phone 2 :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNPH2().trim()%></div>
            </td>
          </tr>        
          
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNAD3().trim()%></div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right">Fax :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNFA1().trim()%></div>
            </td>

          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">City :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNCTY().trim()%></div> 
            <td nowrap width="16%" > 
              <div align="right">Estate :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNSTE().trim()%></div>
            </td>
          </tr>        

          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Country :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNCTR().trim()%></div> 
            <td nowrap width="16%" > 
              <div align="right">Zip Code :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= lnDedDet.getE03AGNZIP().trim()%></div>
            </td>
          </tr>        

          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"> e-mail :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03AGNIA1().trim()%></div> 
            </td>  
           <td nowrap width="16%" > 
              <div align="right"></div>
           </td>
            <td nowrap colspan="2" > 
              <div align="left"></div>
            </td>
           </tr>        
        </table>
      </td>
    </tr>
  </table>


   <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Description :</div>
            </td>
            <td nowrap width="23%"  > 
              <div align="left"><%= lnDedDet.getE03DLIRMK().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Credit to Account :</div>
            </td>
            <td nowrap width="10%"colspan="2" > 
              <div align="left"><%= lnDedDet.getE03DLIBNK().trim()%>-<%= lnDedDet.getE03DLIBRN().trim()%>-<%= lnDedDet.getE03DLICCY().trim()%>-<%= lnDedDet.getE03DLIGLN().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Total Coverage :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIPAM().trim())%></div>
            </td>
            <td nowrap width="16%"  > 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.formatDate(lnDedDet.getE03DLIEX1().trim(),lnDedDet.getE03DLIEX2().trim(),lnDedDet.getE03DLIEX3().trim())%></div>
            </td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Total Policy/Taxes : </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLICPA().trim())%></div> 
           <td nowrap width="16%" > 
              <div align="right">Last Payment Date :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.formatDate(lnDedDet.getE03DLILP1().trim(),lnDedDet.getE03DLILP2().trim(),lnDedDet.getE03DLILP3().trim())%></div>
            </td>
           </tr>        
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Monthly Contribution : </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIDPM().trim())%></div> 
           <td nowrap width="16%" > 
              <div align="right">Next Payment Date :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.formatDate(lnDedDet.getE03DLINX1().trim(),lnDedDet.getE03DLINX2().trim(),lnDedDet.getE03DLINX3().trim())%></div>
            </td>
           </tr>        
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Escrow Beginning Balance : </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIBEG().trim())%></div> 
           <td nowrap width="16%" > 
              <div align="right">Escrow Balance :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIBAL().trim())%></div>
            </td>
           </tr>        
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Customer Contributions :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIYTD().trim())%></div> 
           <td nowrap width="16%" > 
              <div align="right">Customer Contribution LTD :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLILTD().trim())%></div>
            </td>
           </tr>        
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Amount Disbursed :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIPCY().trim())%></div> 
           <td nowrap width="16%" > 
              <div align="right">Amount Disbursed LTD :</div>
            <td nowrap colspan="2" > 
              <div align="left"><%= Util.fcolorCCY(lnDedDet.getE03DLIPCL().trim())%></div>
            </td>
           </tr>        
           <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Remarks :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03REMK01().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >
              <div align="left"></div>
            </td>
          </tr>         
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03REMK02().trim()%></div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right"></div>
            </td>  
            <td nowrap colspan="2" > 
              <div align="left"></div>
            </td>
           </tr>        
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03REMK03().trim()%></div> 
           <td nowrap width="16%" > 
              <div align="right"></div>
            <td nowrap colspan="2" > 
              <div align="left"></div>
            </td>
           </tr>        
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"><%= lnDedDet.getE03REMK04().trim()%></div> 
           <td nowrap width="16%" > 
              <div align="right"></div>
            <td nowrap colspan="2" > 
              <div align="left"></div>
            </td>
           </tr>            
        </table>
      </td>
    </tr>
  </table>

 
  
   <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Close" onClick="top.close()">
  </div>

</FORM>

</BODY>
</HTML>
