<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="stBalances" class="datapro.eibs.beans.EDL030002Message"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<style>
<!--
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
-->
</style>

</HEAD>

<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<h3 align="center">Account Statement </h3>
  <hr size="4">
  <BR>

<FORM>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="30%"  nowrap> 
              <div align="right"><b>Name and Address:</b></div>
            </td>
            <td  width="32%" > 
              <div align="left"></div>
              <%= stBalances.getE02CUSNA1().trim()%></td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td  width="13%"  nowrap> 
              <div align="right"><%= stBalances.getE02DEAACC().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%"> 
              <div align="right"></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Gross</b> <%= stBalances.getE02DEACCY().trim()%> 
                <b>Balance :</b></div>
            </td>
            <td  width="13%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="30%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="32%"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Balance :</b></div>
            </td>
            <td  width="13%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"><%= stBalances.getE02CUMMA3().trim()%></div>
              <div align="left"><%= stBalances.getE02CUMMA4().trim()%></div>
              </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Total Balance :</b></div>
            </td>
            <td  width="13%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="30%">&nbsp;</td>
            <td  width="32%" nowrap>&nbsp;</td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Rate :</b></div>
            </td>
            <td  width="13%" nowrap> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="30%"> 
              <div align="right"><b>Opening Date :</b></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"></div>
              <%= Util.formatDate(stBalances.getE02OPEND1(),stBalances.getE02OPEND2(),stBalances.getE02OPEND3())%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td  width="13%" nowrap> 
              <div align="right"> <%= Util.formatDate(stBalances.getE02MATUR1(),stBalances.getE02MATUR2(),stBalances.getE02MATUR3())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="30%"> 
              <div align="right"><b>Renewal Times:</b></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"><%= stBalances.getE02DEARON().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Last Renewal Date :</b></div>
            </td>
            <td  width="13%" nowrap> 
              <div align="left"><%= Util.formatDate(stBalances.getE02LSTRD1(),stBalances.getE02LSTRD2(),stBalances.getE02LSTRD3())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <TABLE class="tableinfo">
    <TR id="trclear"> 
      <TH ALIGN=CENTER  >Process Date</TH>
      <TH ALIGN=CENTER  > Value Date</TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Description</TH>
      <TH ALIGN=CENTER  >Principal</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Interest</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Batch</TH>
      <TH ALIGN=CENTER  >Trans.ID</TH>
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
        <div align="center"><b>Total</b></div>
      </td>
      <td width="45%"><b>Principal</b> : <%= userPO.getHeader19().trim()%></td>
      <td width="35%"><b>Interest </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
  
  <div align="center"> 
  </div>
</FORM>

</BODY>
</HTML>
