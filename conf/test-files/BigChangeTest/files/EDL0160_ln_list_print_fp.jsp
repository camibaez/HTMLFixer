<%@ page import = "datapro.eibs.master.Util" %><HTML>
<HEAD>
<TITLE>
Print Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session"/>
<jsp:useBean id="stBalances" class= "datapro.eibs.beans.EDL030002Message"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<style>
BODY {
	background-color: #FFFFFF;
}
	
TABLE {
	font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	background-color: #F0F0F0;
	border-color: #0b23b5;
	color: #0B23B5;
	
}
	
TH {font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	color: #0B23B5;
	text-transform : uppercase;
        
}

#TRDARK{
	background-color: #D1D1D1;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
}

#TRCLEAR{
	background-color: #F0F0F0;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
	}
	
P {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
} 

HR{
	color: #D1D1D1;
	height : 4pt;
}

H3 {font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size:10pt;
	text-align: center;
	color: #0B23B5;
	}
 
 H4{font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size: 8pt;
	text-align:left;
	color: #0B23B5;
}

.TABLEINFO{
	border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	width:100%;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');  
}
</style>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h4>There are no results for your search criteria</h4></center>");
	}
	else {
%>
  <h3 align="center">Account Statement </h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="25%"  nowrap> 
              <div align="right"><b>Name and Address :</b></div>
            </td>
            <td  width="34%" > 
              <div align="left"><%= stBalances.getE02CUMMA1().trim()%></div>
            </td>
            <td  width="25%" > 
              <div align="right"><b>Account :</b></div>
            </td>
            <td  width="16%"  nowrap> 
              <div align="right"><%= stBalances.getE02DEAACC().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="25%"> 
              <div align="right"></div>
            </td>
            <td  width="34%" nowrap> 
              <div align="left"><%= stBalances.getE02CUMMA2().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Gross</b> <%= stBalances.getE02DEACCY().trim()%> 
                <b>Principal Amount :</b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="25%" nowrap>&nbsp;</td>
            <td  width="34%"><%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Balance : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="25%" nowrap>&nbsp;</td>
            <td  width="34%">&nbsp;</td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Penalty :</b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEM().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="34%"> 
              <div align="left"><%= stBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Other Charges:</b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAOTH().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="25%" nowrap> 
              <div align="right"><b>Opening Date :</b></div>
            </td>
            <td  width="34%" nowrap> 
              <div align="left"><%= Util.formatDate(stBalances.getE02OPEND1(),stBalances.getE02OPEND2(),stBalances.getE02OPEND3())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b> Total Balance :</b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="25%"> 
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td  width="34%" nowrap> 
              <div align="left"><%= Util.formatDate(stBalances.getE02MATUR1(),stBalances.getE02MATUR2(),stBalances.getE02MATUR3())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Rate:</b></div>
            </td>
            <td  width="16%" nowrap> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <TABLE class="tableinfo">
    <TR id=trclear> 
      <TH ALIGN=CENTER  >Value Date</TH>
      <TH ALIGN=CENTER  > Process Date</TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Description</TH>
      <TH ALIGN=CENTER  >Principal</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Interest</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Penalty</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >BATCH</TH>
    </TR>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </TABLE>

  
<BR>
	
	
  <%
  }
%>
  <div align="center"> 
  </div>
</FORM>

</BODY>
</HTML>
