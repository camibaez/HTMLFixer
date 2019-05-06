<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">

function closeEnter(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 document.forms[0].TABLEN.focus();
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>  


<META name="GENERATOR" content="IBM WebSphere Studio">
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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0310" >
	
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
 	
  <INPUT TYPE=HIDDEN NAME="REPTYP" VALUE="3">
  
<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Payment Type :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <select name="PAYTYPE">
                
                <option value="I">Interest</option>
                <option value="C">Capital</option>
                <option value="D">Dividends</option>
               
          </select>
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=submit name="Submit" value="Send"> 
   </TD>
   
   </tr>
 </TABLE>
</div>




  


  
  <h3 align="center">Private Banking Reports</h3>
  <table class="tbenter" height="55%" width="0%" border="0">
    <tr> 
      <td nowrap align="center"> 
        <table class="tableinfo" align="center" width="100%" >
          <tr> 
            <td> 
              <table width="100%">
                <tr id="trdark"> 
                  <td width="20%" nowrap >&nbsp;</td>
                  <td width="70%" nowrap ><b>Reports by :</b></td>
                </tr>
                <tr id="trclear"> 
                  <td width="20%" nowrap > 
                    <div align="right"></div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
						<a href="javascript:invReports('R04DATAPRO','f:\\iis\\dummy\\eibsreports\\reports\\','ibs_inv_instruments.rpt')">Investment Instruments</a>
					</div>
                  </td>
                </tr>
                <tr id="trdark"> 
                  <td width="20%" nowrap >&nbsp;</td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
					<a href="javascript:invReports('R04DATAPRO','f:\\iis\\dummy\\eibsreports\\reports\\','ibs_out_by_custodian.rpt')">
					Outstanding Position By Custodians
					</a></div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="20%" nowrap >&nbsp;</td>
                  <td width="70%" nowrap > 
                    <div align="left">
					 <a href="javascript:invReports('R04DATAPRO','f:\\iis\\dummy\\eibsreports\\reports\\','ibs_out_by_customer.rpt')"> 
					 Outstanding Position by Customers
                    </a>
					</div>
                  </td>
                </tr>
                <tr id="trdark"> 
                  <td width="20%" nowrap >&nbsp;</td>
                  <td width="70%" nowrap >
					<a href="javascript:invReports('R04DATAPRO','f:\\iis\\dummy\\eibsreports\\reports\\','ibsstmt_en.rpt')">
					Account Statement(English)
                    </a>
					</td>
                </tr>
                <tr id="trclear"> 
                  <td width="20%" nowrap >&nbsp;</td>
                  <td width="70%" nowrap >
                   <a href="javascript:invReports('R04DATAPRO','f:\\iis\\dummy\\eibsreports\\reports\\','ibsstmt_es.rpt')">
					Account Statement(Spanish)
                    </a>
				</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>

        
      </td>
    </tr>
  </table>

      
</form>
</body>
</html>
