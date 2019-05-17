<html>
<head>
<title>Instruments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="invOnline" class="datapro.eibs.beans.EIE020001Message"  scope="session" />
<jsp:useBean id= "EIE0200Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].SCREEN.value = op;
	
	document.forms[0].submit();
  
}


function getParams(clientId , projAmount , delAmount , comAmount , paidAmount , rcd ) {

    document.forms[0].CLIENTID.value = clientId;
    document.forms[0].PROJAMOUNT.value = projAmount;
    document.forms[0].DELAMOUNT.value = delAmount;
    document.forms[0].COMAMOUNT.value = comAmount;
    document.forms[0].PAIDAMOUNT.value = paidAmount;
    document.forms[0].RCD.value = rcd;


}



</SCRIPT>  

</head>

<BODY>
<h3 align="center">Coupons Payment Confirmation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="list_coupon_by_client.jsp, EIE0200"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0200" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CLIENTID">
  <input type=HIDDEN name="PROJAMOUNT">
  <input type=HIDDEN name="DELAMOUNT">
  <input type=HIDDEN name="COMAMOUNT">
  <input type=HIDDEN name="PAIDAMOUNT">
  <input type=HIDDEN name="RCD">
  <input type=HIDDEN name="ACTION">
  <%
	if ( EIE0200Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>There is no match for your search criteria</b></p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td> 
              <div align="left">Instrument: </div>
               <input type="HIDDEN" name="CODE" value='<%= userPO.getHeader1()%>'>
            </td>
            <td > 
              <div align="left"> <%= userPO.getHeader1().trim()%> - <%= userPO.getHeader2().trim()%> </div>
            </td>
            <td> 
              <div align="left">Currency: </div>
            </td>
            <td > 
              <div align="left"> <%= userPO.getHeader3().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td>
              <div align="left">Custodian: </div>
               <input type="HIDDEN" name="CUSTODIANCOD" value='<%= userPO.getHeader11()%>'>
            </td>
            <td> 
              <div align="left"> <%= userPO.getHeader4().trim()%></div>
            </td>
            <td> 
              <div align="left">Coupon Type: </div>
               <input type="HIDDEN" name="PAYTYPE" value='<%= userPO.getHeader12()%>'>
            </td>
            <td> 
              <div align="left"><b> <%= userPO.getHeader5()%> </b> </div>
            </td>
          </tr >
          <tr id="trdark"> 
            <td> 
              <div align="left">Payment Date: </div>
               <input type="HIDDEN" name="PDATE1" value='<%= userPO.getHeader7()%>'>
               <input type="HIDDEN" name="PDATE2" value='<%= userPO.getHeader8()%>'>
               <input type="HIDDEN" name="PDATE3" value='<%= userPO.getHeader6()%>'>
               <input type="HIDDEN" name="SUMREGISTROSTOTAL" value='<%= userPO.getHeader13()%>'>

            </td>
            <td> 
              <div align="left"><b> <%= userPO.getHeader7()%>/<%= userPO.getHeader8()%>/<%= userPO.getHeader6()%> </b> </div>
            </td>
            <td> 
              <div align="left"></div>
            </td>
            <td> 
            </td>
          </tr >
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="left">Custodian   Date :</div>
            </td> 
            <td nowrap colspan="3" >     
              <input type="text" name="E01CUSVLM" size="3" maxlength="2" value="<%= userPO.getHeader14() %>">
              <input type="text" name="E01CUSVLD" size="3" maxlength="2" value="<%= userPO.getHeader15() %>">
              <input type="text" name="E01CUSVLY" size="3" maxlength="2" value="<%= userPO.getHeader16() %>">
              <a href="javascript:DatePicker(document.forms[0].E01CUSVLM,document.forms[0].E01CUSVLD,document.forms[0].E01CUSVLY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
           <td >
          </tr >
          
          <tr id="trclear"> 
           <td nowrap width="18%" >  
              <div align="left">Client   Date :</div>
           </td>  
           <td nowrap >             
              <input type="text" name="E01CLIVLM" size="3" maxlength="2" value="<%= userPO.getHeader17() %>">
              <input type="text" name="E01CLIVLD" size="3" maxlength="2" value="<%= userPO.getHeader18() %>">
              <input type="text" name="E01CLIVLY" size="3" maxlength="2" value="<%= userPO.getHeader19()%>">
              <a href="javascript:DatePicker(document.forms[0].E01CLIVLM,document.forms[0].E01CLIVLD,document.forms[0].E01CLIVLY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
           </td > 
           <td>
           		<div align="left">Exchange rate :</div>
           </td>
           <td>
           	    <INPUT name="FXCCY"	value="<%= userPO.getHeader21()%>">
           </td>
          </tr >
          
          
           <tr id="trdark" > 
            <td> 
              <div align="left">Total Projected Amount: </div>
            </td>
            <td> 
              <div align="left"><%= userPO.getHeader9()%><input type="HIDDEN" name="EXPECTEDAMOUNT" value='<%= userPO.getHeader9()%>'></div>
            </td>
            <td> 
              <div align="left">Nominal/Qty :</div>
            </td>
            <td> 
            <%= userPO.getHeader20()%></td>
          </tr>
           <tr id="trclear"> 
            <td> 
              <div align="left">Total Actual Amount: </div>
            </td>
            <td> 
              <div align="left"><input name="ACTUALAMOUNT2" value='<%= userPO.getHeader10()%>' /> <input type='button' value = 'Prorate' onclick="javascript:goAction(3)"/></div>
	      </td>
	      <td> 
              <div align="left"></div>
            </td>
            <td> 
			</td>
          </tr>                    
        </table>
      </td>
    </tr>
  </table> 
    
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(4)"><b>Details</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Submit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >&nbsp;</th>
            
            <th align=CENTER nowrap > 
              <div align="center">Client Id</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Nominal<BR>Qty</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Projected<BR>Amount</div>
            </th>
            <th align=CENTER nowrap > 
              <div align="center">Actual<BR>Amount</div>
            </th>
            <th align=CENTER nowrap >Commis<BR>Amount</th>

            <th align=CENTER nowrap > 
              <div align="center"> Withhold<BR>Amount</div>
            </th>
            
            <th align=CENTER nowrap > 
               <div align="CENTER">Europ.<br>Sav.Tax</div>
            </th>            
                        
            <% if (!userPO.getHeader12().equals("C")){ %>
                <th align=CENTER nowrap >Custody<BR>Fee</th>
            <%}%>
            <th align=CENTER nowrap >Net<BR> Amount </th>
            
            <th align=CENTER nowrap > 
               <div align="CENTER">Err</div>
            </th>
            
          </tr>
        </table>
          <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EIE0200Help.initRow();
				int k=1;
                while (EIE0200Help.getNextRow()) {
                 
                  out.println(EIE0200Help.getRecord());
                  k++;   
                }
              %>
     
    </table>
   </div>
</Table>

  <SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
     adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EIE0200Help.getShowPrev() ) {
      			int pos = EIE0200Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0315I?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EIE0200Help.getShowNext() ) {
      			int pos = EIE0200Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0315I?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>


  </form>

</body>
</html>
