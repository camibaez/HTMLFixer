
<%@ page import = "datapro.eibs.master.Util" %><HTML>
<HEAD>
<TITLE>
Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="lcBalances" class="datapro.eibs.beans.ESD081702Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<BODY>
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

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

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
   		out.print("<center><h4>There is no results for your search</h4></center>");
	}
	else {
%>
  <h3 align="center">Account Statement  </h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="30%" height="15" nowrap> 
              <div align="right"><b>Name and Address :</b></div>
            </td>
            <td  width="32%" height="15"> 
              <div align="left"></div>
              <%= lcBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td  width="13%" height="15" nowrap> 
              <div align="right"><%= userPO.getIdentifier().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%"> 
              <div align="right"></div>
            </td>
            <td  width="28%" height="15"> 
              <div align="left"><%= lcBalances.getE02CUMMA2().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Original </b> <%= lcBalances.getE02CIFCCY().trim()%> 
                <b>Amount :</b></div>
            </td>
            <td  width="13%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN1().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="30%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUMMA3().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN2().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="28%"> 
              <div align="left"><%= lcBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Negotiated Amount :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN3().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="30%"> 
              <div align="right"><b>Issue Date :</b></div>
            </td>
            <td  width="32%" nowrap><%= Util.formatDate(lcBalances.getE02DATEA1(),lcBalances.getE02DATEA2(),lcBalances.getE02DATEA3())%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.formatDate(lcBalances.getE02DATEB1(),lcBalances.getE02DATEB2(),lcBalances.getE02DATEB3())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%"> 
              <div align="right"><b>Fax :</b></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><b>e - Mail :</b></div>
            </td>
            <td  width="15%" nowrap height="20"> 
              <div align="right"><a href="mailto:<%= lcBalances.getE02CUSIAD().trim()%>" target="body"><%= lcBalances.getE02CUSIAD().trim()%></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <TABLE  class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  >Process Date </TH>
      <TH ALIGN=CENTER  > Value Date </TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Description</TH>
      <TH ALIGN=CENTER  >Debits</TH>
      <TH ALIGN=CENTER  >Credits</TH>
      <TH ALIGN=CENTER  >Batch</TH>
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
  <table class="tableinfo">
    <tr> 
      <td width="20%"> 
        <div align="center"><b>Totals</b></div>
      </td>
      <td width="45%"><b>Debits </b> : <%= userPO.getHeader19().trim()%></td>
      <td width="35%"><b>Credits </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
  <%
  }
%> 

</FORM>

</BODY>
</HTML>
