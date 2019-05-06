<html>
<head>
<title>Front Office Input</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">
function analice(){
 if(!document.forms[0].E01FESREF.value == ""){
    document.forms[0].submit();
}
}
</script>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "trOption" class= "datapro.eibs.beans.TrOption"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<body bgcolor="#FFFFFF">
<H3 align="center"> Treasury - Dealer Slip<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fe_enter_opt,EFE0000"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000">
<input type=HIDDEN name="SCREEN" value="200">
<input type=HIDDEN name="E01FESTYP">
  <input type=HIDDEN name="INPTOPT" value="<%= datapro.eibs.master.Util.addLeftChar('0', 2, trOption.getHeader1()) %>">
  <center>
    <table class="tableinfo" width="73%">
      <tr id="trintrot"> 
        <td colspan="7"><%= currUser.getH01USR()%></td>
        <td width="20%"> 
          <div align="right"><%= datapro.eibs.master.Util.formatDate(currUser.getE01RDM(),currUser.getE01RDD(),currUser.getE01RDY())%></div>
        </td>
      </tr>
      <tr id="trintro"> 
        <td width="4%" height="10"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="01"
		  onClick="document.forms[0].INPTOPT.value='01'"
		  <%if(trOption.getHeader1().equals("1"))out.print("checked");%>>
          </div>
        </td>
        <td width="23%" height="10">FX Fast Spot</td>

        <td width="4%"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="03"
		  onClick="document.forms[0].INPTOPT.value='03'"
			<%if(trOption.getHeader1().equals("3")) out.print("checked");%>>
          </div>
        </td>
        <td width="23%">FX Short FWD/Outrt</td>

        <td width="4%" height="10"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="09"
			onClick="document.forms[0].INPTOPT.value='09'"
			<%if(trOption.getHeader1().equals("9")) out.print("checked");%>>
          </div>
        </td>
        <td width="24%" height="10">CDs</td>
        <td width="3%" height="10"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="06"
            onClick="document.forms[0].INPTOPT.value='06'"
			<%if(trOption.getHeader1().equals("6")) out.print("checked");%>>
          </div>
        </td>
        <td width="20%" height="10"><%=currUser.getH01WK3().equals("4") ?"Interbank":"Time Deposits"%></td>
      </tr>
      <tr id="trintro"> 
        <td width="4%" height="24"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="02"
		  onClick="document.forms[0].INPTOPT.value='02'"
		  <%if(trOption.getHeader1().equals("2") ||trOption.getHeader1().trim().equals("")) out.print("checked");%> >
          </div>
        </td>
        <td width="23%" height="24">FX Spot</td>

        <td width="4%"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="04"
		  onClick="document.forms[0].INPTOPT.value='04'"
		  <%if(trOption.getHeader1().equals("4")) out.print("checked");%>>
          </div>
        </td>
        <td width="23%">FX Swap</td>

        <td width="4%"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="08"
			onClick="document.forms[0].INPTOPT.value='08'"
			<%if(trOption.getHeader1().equals("8")) out.print("checked");%>>
          </div>
        </td>
        <td>Commercial Paper </td>

        <td width="3%" height="24"> 
          <div align="center"> 
            <input type="radio" name="CINPTOPT" value="70"
			onClick="document.forms[0].INPTOPT.value='70'"
			<%if(trOption.getHeader1().equals("70")) out.print("checked");%>>
          </div>
        </td>
        <% if (currUser.getH01WK3().equals("1")) { %>
        <td width="20%" height="24">Federal Funds</td>
        <% } else { %>
        <td width="20%" height="24">Overnight Funds</td>
        <% } %>
      </tr>



      <tr id="trdark"> 
        <td colspan="8">&nbsp;</td>
      </tr>
      <tr id="trintro"> 
        <td colspan="5"> 
          <div align="left">Counterparty : 
            <input type="text" name="CUNCOD" size="9" maxlength="9">
            <input type="text" name="CUNDSC" size="25" maxlength="25">
            <a href="javascript:GetCustomerDescId('CUNCOD','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a></div>
        </td>
        <td colspan="3">Reference Number : 
          <input type="hidden" name="E01FESDID">
          <input type="hidden" name="E01FESTYPO">
          <input type="text" name="E01FESREF" size="11" maxlength="11" onFocus="javascript:analice()" readonly>
          <a href="javascript:GetFeRef('E01FESDID','E01FESTYPO','E01FESREF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td width="33%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
    </table>

  </center>
  <center>
    <table  id="mainTable" class="tableinfo" height="30" width="0">
    
        <TR>
            <TD nowrap valign="top" width="100%" height="60">
            
          <TABLE id="headTable">
            <TBODY> 
            <TR id="trintrot"> 
              <TH align="CENTER" nowrap></TH>
              <TH align="CENTER" nowrap>Number</TH>
              <TH align="CENTER" nowrap>Name</TH>
              <TH align="CENTER" nowrap>Id</TH>
            </TR>
            </TBODY> 
          </TABLE>
            <DIV id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:100">
            <TABLE id="dataTable"  style="font-size:7pt">
               <%
                custList.initRow();
                int k=1;
                while (custList.getNextRow()) {
                    if (custList.getFlag().equals("")) {
                    		out.println(custList.getRecord());
                    k++;
                    }        
                }
            %>
            </TABLE>
            </DIV>
            </TD>
        </TR>
        
    
</table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </center>
      
  
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
  <%
 }
%> <b>
  <input type=HIDDEN name="totalRow" value="1">
  </b>
<SCRIPT language="JavaScript">
     document.forms[0].totalRow.value="11";
     function resizeDoc() {
       //divResize2(true);
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
     }
     showChecked("ACCNUM");
     resizeDoc();
     window.onresize = resizeDoc;
function divResize2() {
  var minValue= mainTable.offsetTop + dataDiv1.offsetTop + 30;
  var h = 400 - minValue ;
  var totalrow= parseInt(document.forms[0].totalRow.value);
  var maxHeight= totalrow * 20; 
  
  if (totalrow > 6) {
     dataDiv1.style.height= maxHeight + ""; 
     dataDiv1.style.overflowY="scroll";
  } else {
	dataDiv1.style.height= maxHeight + ""; 
   	dataDiv1.style.overflowY="";
  } 
}
     
</SCRIPT>
</form>
</body>
</html>
