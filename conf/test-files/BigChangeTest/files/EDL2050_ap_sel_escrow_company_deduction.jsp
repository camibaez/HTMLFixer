<html>
<head>
<title>Escrow</title>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL205001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Escrow Payment Inquiry</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL2050" >
  <input type=HIDDEN name="SCREEN" value="10">
  <input type=HIDDEN name="totalRow" value="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01WKEARF" VALUE="<%= userPO.getHeader22()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
		  <table  cellspacing="0" cellpadding="2" width="100%"  class="tbhead">
			  <tr id="trdark"> 
			    <td nowrap width="30%" > 
			      <div align="right">Company :</div>
			    </td>
			    <td nowrap width="70%" > 
			      <input type="text" name="E01DLICIA" size="5"  value="<%= userPO.getHeader5()%>" readonly>
			      <input type="text" name="E01DSCCIA" size="40"  value="<%= userPO.getHeader6()%>" readonly>
			    </td>
			  </tr>
			   <tr id="trdark"> 
			    <td nowrap width="30%" > 
			      <div align="right">Deduction :</div>
			    </td>
			    <td nowrap width="70%" > 
			      <input type="text" name="E01DLICDE" size="4" value="<%= userPO.getHeader7()%>" readonly>
			      <input type="text" name="E01DSCCDE" size="40"  value="<%= userPO.getHeader8()%>" readonly>
			    </td>
			  </tr>	  
		   </table>
      </td>
    </tr>
  </table>

  <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
  
	if ( EDL205001Help.getNoResult() ) {
 %>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><b>There is no match for your search criteria </b></p>
          </div>

	  </TD>
	</TR>
    </TABLE>
  <%  
		}
	else {
%>  
  <br>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Account</TH>
      <TH ALIGN=CENTER  nowrap >Customer</TH>
      <TH ALIGN=CENTER  nowrap >Escrow<br>Balance</TH>      
      <TH ALIGN=CENTER  nowrap >Expected<br>Payment Amount</TH>
      <TH ALIGN=CENTER  nowrap >Payment<br>Amount</TH>
    </TR>
       <%
       	  int i = 0;
          EDL205001Help.initRow();               
          while (EDL205001Help.getNextRow()) {
               EDL205001Message msgList = (EDL205001Message) EDL205001Help.getRecord();			 
                    
       %>             
         <TR>
          <td NOWRAP align=left>
          	<%=Util.formatCell(msgList.getE01DEAACC())%>
		  </td>		  
		  <td NOWRAP align=left>
			<%=Util.formatCell(msgList.getE01CUSNA1())%>
		  </td>	
		  <td NOWRAP align=right>
			<%=Util.formatCell(msgList.getE01DLIBAL())%>
		  </td>		  
		  <td NOWRAP align=right>
			<%=Util.formatCell(msgList.getE01DLICPA())%>
		  </td>		  
		  <td NOWRAP align=right>
		  	<%=Util.formatCell(msgList.getE01PYMAMT())%>
		  </td>	
		</TR>
        <% 
        	i++;
        } 
        %> 
         <TR>
          <td NOWRAP align=left>
 		  </td>		  
		  <td NOWRAP align=left>
		  </td>	
		  <td NOWRAP align=right>
		  </td>		  
		  <td NOWRAP align=center>
		  </td>		  
		  <td NOWRAP align=right>
		  </td>	
		</TR>                
         <TR>
          <td NOWRAP align=left>
 		  </td>		  
		  <td NOWRAP align=left><b>Totals :</b>
		  </td>	
		  <td NOWRAP align=right>
		  	<input type="hidden" name="TOTDLIBAL" value="<%= userPO.getHeader9() %>">
			<b><%=Util.formatCell(userPO.getHeader9())%></b>
		  </td>		  
		  <td NOWRAP align=center>
		  </td>		  
		  <td NOWRAP align=right>
		  	<input type="hidden" name="TOTPYMAMT" value="<%= userPO.getHeader10() %>">
			<b><%=Util.formatCell(userPO.getHeader10())%></b>
		  </td>	
		</TR>        
  </TABLE>
  <SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
  </SCRIPT>
  
  <h4>Payment Information</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
        	<td nowrap > 
          		<div align="right">Value Date : </div>
        	</td>
	         <td > 
              <input type="text" name="E01PYMVD1" size="2" maxlength="2" value="<%= userPO.getHeader11().trim()%>" readonly>
              <input type="text" name="E01PYMVD2" size="2" maxlength="2" value="<%= userPO.getHeader12().trim()%>" readonly>
              <input type="text" name="E01PYMVD3" size="2" maxlength="2" value="<%= userPO.getHeader13().trim()%>" readonly>
            </td> 
          </tr>     
          <tr id="trclear"> 
            <td nowrap > 
            	<div align="right">Description : </div>
            </td>
	         <td > 
				<input type="text" name="E01PYMDSC" size="35" maxlength="30" value="<%= userPO.getHeader21().trim()%>" readonly>
            </td> 
          </tr>
         </table>
      </td>
    </tr>
  </table>  
     <h4>Payment Via</h4>
  <TABLE class="tableinfo" >
  <TR><TD>
  
   <table id="headTable1">
    <tr id="trdark"> 
      <td nowrap align="center" >Concept</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Branch</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >Reference</td>
    </tr>
    </table> 
      
    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
	    <tr id="trclear"> 
	      <td nowrap width="32%" > 
	        <div align="center"> 
	          <input type="text" name="E01PYMOPE" value="<%= userPO.getHeader14().trim()%>" size="2" maxlength="2" readonly>
	          <input type="hidden" name="E01PYMGLN" value="<%= userPO.getHeader19().trim()%>">
	          <input type="text" name="E01PYMCON" size="25" maxlength="25" readonly value="<%= userPO.getHeader15().trim()%>" readonly>
	        </div>
	      </td>
	      <td nowrap width="14%" > 
	        <div align="center"> 
	          <input type="text" name="E01PYMBNK" size="2" maxlength="2" value="<%= userPO.getHeader16().trim()%>" readonly>
	        </div>
	      </td>
	      <td nowrap width="17%" > 
	        <div align="center"> 
	          <input type="text" name="E01PYMBRN" size="3" maxlength="3" value="<%= userPO.getHeader17().trim()%>" readonly>
	        </div>
	      </td>
	      <td nowrap width="22%" > 
	        <div align="center"> 
	          <input type="text" name="E01PYMCCY" size="3" maxlength="3" value="<%= userPO.getHeader18().trim()%>" readonly>
	        </div>
	      </td>
	      <td nowrap width="15%" > 
	        <div align="center"> 
	          <input type="text" name="E01PYMACC" size="12" maxlength="12"  value="<%= userPO.getHeader20().trim()%>" readonly>
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
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,false);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>
  
   <%}%>
  
  
</form>

</body>
</html>