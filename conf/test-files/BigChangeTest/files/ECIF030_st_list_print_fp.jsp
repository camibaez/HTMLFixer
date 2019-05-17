<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id= "error" class="datapro.eibs.beans.ELEERRMessage"   scope="session" />
<jsp:useBean id= "cifList" class="datapro.eibs.beans.JBList"   scope="session" />
<jsp:useBean id= "stBalances" class="datapro.eibs.beans.ECIF03002Message"   scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos"   scope="session" />

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

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>


<BODY>
<FORM  >

  <h3 align="center">Account Statement</h3>
  <hr size="4">
 <BR>
  <table class="tableinfo">
    <tr > 
      <td width="50%" height="100%">
        <table cellspacing=0 cellpadding=2 width="100%" border="0" height="100%">
          <tr id="trdark"> 
            <td width="16%" nowrap > 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap> <%= userPO.getIdentifier().trim()%></td>
		  </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap >
              <div align="right"><b></b> </div>
            </td>
            <td  nowrap>
				<%= Util.concatBR(new String[] {stBalances.getE02LGNA01(),stBalances.getE02LGNA02(),stBalances.getE02LGNA03(),stBalances.getE02LGNA04(),stBalances.getE02LGNA05(),stBalances.getE02LGNA06(),stBalances.getE02LGNA07(),stBalances.getE02LGNA08(),stBalances.getE02LGNA09()})%> 
				<br><%= Util.concatBR(new String[] {stBalances.getE02CUMMA2(),stBalances.getE02CUMMA3(),stBalances.getE02CUMMA4(),stBalances.getE02CUMMA5()})%>
            </td>
		  </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap >
              <div align="right"><b>Product : </b> </div>
            </td>
            <td  nowrap><%= stBalances.getE02ACMPRO().trim()%> </td>
		  </tr>
		 <tr id="trdark"> 
            <td  width="16%" nowrap >
              <div align="right"><b>Purpose of Account : </b> </div>
            </td>
            <td  nowrap><%= stBalances.getE02LGNA10().trim()%> </td>
		  </tr>
		</table>
	  </td> 
      <td width="50%" height="100%">
        <table cellspacing=0 cellpadding=2 width="100%" height="100%" border="0">
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Gross</b> <%= stBalances.getE02ACMCCY().trim()%> 
                <b>Balance :</b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(stBalances.getE02ACMMGB().trim())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Uncollected Balance :</b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(stBalances.getE02UNCBAL().trim())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Hold Amount : </b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(stBalances.getE02ACMHAM().trim())%> 
            </td>
          </tr>
          <tr id="trdark">
            <td  width="16%" nowrap >
              <div align="right"><b>Credit Limit :</b></div>
            </td>
            <td  nowrap>
              <div align="left"><%= Util.fcolorCCY(stBalances.getE02ACMCLI().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Available Balance :</b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(stBalances.getE02AVALBL().trim())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Gross Average : </b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(stBalances.getE02ACMGAV().trim())%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="16%" nowrap > 
              <div align="right"><b>Balance as of </b> <%= Util.formatDate(stBalances.getE02LSSTM1(),stBalances.getE02LSSTM2(),stBalances.getE02LSSTM3())%> 
                <b>: </b> </div>
            </td>
            <td  nowrap><%= Util.fcolorCCY(userPO.getHeader5().trim())%> </td>
          </tr>
        </table>
	  </td> 
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Process<br>Date</TH>
      <TH ALIGN=CENTER>Value<br>Date</TH>
      <TH ALIGN=CENTER> Reference</TH>
      <TH ALIGN=CENTER>Description</TH>
      <TH ALIGN=CENTER>Debit</TH>
      <TH ALIGN=CENTER>Credit</TH>
      <TH ALIGN=CENTER>Balance</TH>
      <!-- <TH ALIGN=CENTER>Value Date</TH> -->
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

  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr> 
      <td colspan="2"> 
        <div align="center"><b>Total </b><b>Debits : </b> (<%= userPO.getHeader22().trim()%>) 
          : <%= userPO.getHeader19().trim()%></div>
        </td>
      <td width="5%">&nbsp;</td>
      <td width="26%"><b>Total Credits :</b> (<%= userPO.getHeader23().trim()%>) 
        : <%= userPO.getHeader20().trim()%></td>
      <td width="5%">&nbsp;</td>
      <td width="29%"><b>Ending Balance :</b> <%= Util.fcolorCCY(userPO.getHeader21().trim())%></td>
    </tr>
  </table>
  
  <div align="center"> 
  </div>
</FORM>

</BODY>
</HTML>
