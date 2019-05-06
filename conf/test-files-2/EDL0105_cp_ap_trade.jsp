 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdTrade" class="datapro.eibs.beans.EDL010509Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   	builtNewMenu(cp_a_opt);
	builtHPopUp();
    
  	function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   		init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
   	}

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
 	
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Securities &amp; Investments Sales/Purchase Approval <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cp_ap_trade.jsp,EDL0105"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105A" onsubmit="javascript:this.disabled = true;">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="SCRDEABNK"  value="<%= cdTrade.getE09DEABNK().trim()%>">
  <input type=HIDDEN name="E09DEAACC"  value="<%= cdTrade.getE09DEAACC().trim()%>">
  <input type=HIDDEN name="E09DEAGLN"  value="<%= cdTrade.getE09DEAGLN().trim()%>">
  
  
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        
          <tr id="trdark"> 
            <td nowrap >              
              <div align="right"><b>Account Number:</b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E09DEABNK" size="2" maxlength="2" value="<%= cdTrade.getE09DEABNK().trim()%>" readonly>
                <input type="text" name="E09DEABRN" size="3" maxlength="3" value="<%= cdTrade.getE09DEABRN().trim()%>" readonly>
                <input type="text" name="E09DEACCY" size="3" maxlength="3" value="<%= cdTrade.getE09DEACCY().trim()%>" readonly>
                <input type="text" name="E09DEAGLN" size="12" maxlength="12" value="<%= cdTrade.getE09DEAGLN().trim()%>" readonly>                                
                <input type="text" name="E09DEAACC" size="12" maxlength="9" value="<%= cdTrade.getE09DEAACC().trim()%>" readonly>
              </div>
            </td>  
            
          </tr>
          
        
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
				<input type="text" name="E09DLICUS" size="9" maxlength="9" value="<%= cdTrade.getE09DLICUS().trim()%>" readonly> 
				<input type="text" name="E09DLINAM" size="45" maxlength="45" value="<%= cdTrade.getE09DLINAM().trim()%>" readonly>              
               </div>
            </td>             
          </tr>
           
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>Issuer/Customer :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E09DEACUN" size="9" maxlength="9" value="<%= cdTrade.getE09DEACUN().trim()%>" readonly>
                <input type="text" name="E09CUSNA1" size="45" maxlength="45" value="<%= cdTrade.getE09CUSNA1().trim()%>" readonly>                
               </div>
            </td> 
          </tr>
         
        </table>
      </td>
    </tr>
  </table>
  
  
  <h4> Trade Information</h4> 
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
 
        <table cellpadding=2 cellspacing=0 width="100%" border="0"> 
          
          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Trade Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLITD1" size="2" maxlength="2" value="<%= cdTrade.getE09DLITD1().trim()%>" readonly>
              <input type="text" name="E09DLITD2" size="2" maxlength="2" value="<%= cdTrade.getE09DLITD2().trim()%>" readonly>
              <input type="text" name="E09DLITD3" size="2" maxlength="2" value="<%= cdTrade.getE09DLITD3().trim()%>" readonly>
            </td>           
            
            <td nowrap  > 
              <div align="right">Settlement Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLISD1" size="2" maxlength="2" value="<%= cdTrade.getE09DLISD1().trim()%>" readonly>
              <input type="text" name="E09DLISD2" size="2" maxlength="2" value="<%= cdTrade.getE09DLISD2().trim()%>" readonly>
              <input type="text" name="E09DLISD3" size="2" maxlength="2" value="<%= cdTrade.getE09DLISD3().trim()%>" readonly>
            </td>
          </tr>
          
          <tr id="trclear">            
          <td nowrap > 
              <div align="right">Operation Type :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLIRMK" size="20" maxlength="20" value="<%= cdTrade.getE09DLIRMK().trim()%>" readonly>               
            </td>
          </tr> 
                    
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Offset Account :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLIOBN" size="2" maxlength="2" value="<%= cdTrade.getE09DLIOBN().trim()%>" readonly>
              <input type="text" name="E09DLIOBR" size="3" maxlength="3" value="<%= cdTrade.getE09DLIOBR().trim()%>" readonly>
              <input type="text" name="E09DLIOCC" size="3" maxlength="3" value="<%= cdTrade.getE09DLIOCC().trim()%>" readonly>
              <input type="text" name="E09DLIOAC" size="12" maxlength="9" value="<%= cdTrade.getE09DLIOAC().trim()%>" readonly>
            </td>             
          </tr>
            
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Face Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLIFCV" size="15" maxlength="13" value="<%= cdTrade.getE09DLIFCV().trim()%>" readonly>              
            </td>
          </tr>
            
         <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Sale/Purchase Price :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLIPRC" size="15" maxlength="13" value="<%= cdTrade.getE09DLIPRC().trim()%>" readonly>              
            </td>
          </tr>
           
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Accrued Interest :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E09DLIINT" size="15" maxlength="13" value="<%= cdTrade.getE09DLIINT().trim()%>" readonly>
            </td>             
          </tr>
          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Total Proceeds :</div>
            </td>
            <td nowrap  > 
              <input type="text" name="E09PROCED" size="15" maxlength="13" value="<%= cdTrade.getE09PROCED().trim()%>" readonly>
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>  

               
   

  <h4>Fee Entries</h4>
  <TABLE class="tableinfo" align="center">
  	<TR>
  		<TD>
  
   		 <table id="headTable">
    		<tr id="trdark">     
      			<td nowrap align="center" >Bank 		</td>
      			<td nowrap align="center" >Branch		</td>
      			<td nowrap align="center" >Currency		</td>
      			<td nowrap align="center" >G/L Number   </td>
      			<td nowrap align="center" >Account    	</td>
      			<td nowrap align="center" >Debit        </td>
      			<td nowrap align="center" >Credit       </td>  
      
    		</tr>
    	  </table> 
      
    	  <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     		<table id="dataTable" >
     		
     		 
     		  <tr id="trclear">      			
      			<td nowrap > 
        		  <div align="center"> 
        		  	<input type="text" name="E09DLIFB1" size="2" maxlength="2" value="<%= cdTrade.getE09DLIFB1().trim()%>" readonly>        		      
 
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">       
        			<input type="text" name="E09DLIBR1" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIBR1().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        		  	<input type="text" name="E09DLIFC1" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIFC1().trim()%>" readonly>
 
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLIFG1" size="12" maxlength="12" value="<%=  cdTrade.getE09DLIFG1().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFA1" size="12" maxlength="9" value="<%=  cdTrade.getE09DLIFA1().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIDR1" size="15" maxlength="13" value="<%=  cdTrade.getE09DLIDR1().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLICR1" size="15" maxlength="13" value="<%=  cdTrade.getE09DLICR1().trim()%>" readonly>
      			  </div>
      			</td>    		
    		</tr> 
    		  
    		<tr id="trclear"> 
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFB2" size="2" maxlength="2" value="<%=  cdTrade.getE09DLIFB2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">       
        			<input type="text" name="E09DLIBR2" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIBR2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        		  	<input type="text" name="E09DLIFC2" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIFC2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLIFG2" size="12" maxlength="12" value="<%=  cdTrade.getE09DLIFG2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFA2" size="12" maxlength="9" value="<%=  cdTrade.getE09DLIFA2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIDR2" size="15" maxlength="13" value="<%=  cdTrade.getE09DLIDR2().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLICR2" size="15" maxlength="13" value="<%=  cdTrade.getE09DLICR2().trim()%>" readonly>
      			  </div>
      			</td>    		
    		</tr>
    		   
    		<tr id="trclear"> 
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFB3" size="2" maxlength="2" value="<%=  cdTrade.getE09DLIFB3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">       
        			<input type="text" name="E09DLIBR3" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIBR3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        		  	<input type="text" name="E09DLIFC3" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIFC3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLIFG3" size="12" maxlength="12" value="<%=  cdTrade.getE09DLIFG3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFA3" size="12" maxlength="9" value="<%=  cdTrade.getE09DLIFA3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIDR3" size="15" maxlength="13" value="<%=  cdTrade.getE09DLIDR3().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLICR3" size="15" maxlength="13" value="<%=  cdTrade.getE09DLICR3().trim()%>" readonly>
      			  </div>
      			</td>    		
    		</tr>
    		
    		<tr id="trclear"> 
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFB4" size="2" maxlength="2" value="<%=  cdTrade.getE09DLIFB4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">       
        			<input type="text" name="E09DLIBR4" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIBR4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        		  	<input type="text" name="E09DLIFC4" size="3" maxlength="3" value="<%=  cdTrade.getE09DLIFC4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLIFG4" size="12" maxlength="12" value="<%=  cdTrade.getE09DLIFG4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIFA4" size="12" maxlength="9" value="<%=  cdTrade.getE09DLIFA4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center"> 
        			<input type="text" name="E09DLIDR4" size="15" maxlength="13" value="<%=  cdTrade.getE09DLIDR4().trim()%>" readonly>
      			  </div>
      			</td>
      
      			<td nowrap > 
        		  <div align="center">
        			<input type="text" name="E09DLICR4" size="15" maxlength="13" value="<%=  cdTrade.getE09DLICR4().trim()%>" readonly>
      			  </div>
      			</td>    		
    		</tr>   
    		 
    		  
    		    
     	 </table>
       </div>
        
  	</TD>  
  </TR>	
</TABLE> 
   
<SCRIPT language="javascript">
	function tableresize() {
    	adjustEquTables(headTable, dataTable, dataDiv, 0, false);
   	}
  	tableresize();
  	window.onresize = tableresize;  
</SCRIPT>
</form>
</body>
</html>
 