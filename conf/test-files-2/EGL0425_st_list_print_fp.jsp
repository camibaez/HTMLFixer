<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %><HTML>
<HEAD>
<TITLE>General Ledger Inquiry</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stGLBal" class="datapro.eibs.beans.EGL042502Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<BODY>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%> 

<FORM >

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

  <h3 align="center">General Ledger Transactions by Bank</h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td  width="31%" height="15" nowrap>
              <div align="right"><b>General Ledger Account :</b></div>
            </td>
            <td colspan="3" height="15" nowrap><%= userPO.getBank().trim()%> <%= userPO.getCurrency().trim()%> 
              <%= userPO.getAccNum().trim()%> <%= stGLBal.getE02GLMDSC().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%" height="15" nowrap> 
              <div align="right"><b>Account Type :</b></div>
            </td>
            <td colspan="3" height="15"> 
              <div align="left">(<%= stGLBal.getE02GLMATY().trim()%>) <%= stGLBal.getE02DSCATY().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="31%"> 
              <div align="right"><b>Account Class :</b></div>
            </td>
            <td  width="19%" nowrap> 
              <div align="left">(<%= stGLBal.getE02GLMCLS().trim()%>) <%= stGLBal.getE02DSCCLS().trim()%></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b>Reconcilable Account :</b></div>
            </td>
            <td  width="22%"> 
              <div align="left"><% if (stGLBal.getE02GLMRCL().equals("Y")) out.print("Yes"); else out.print("No"); %></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%" nowrap> 
              <div align="right"><b>Monthly Average :</b><b></b></div>
            </td>
            <td  width="19%"> 
              <div align="right"><%= Util.fcolorCCY(stGLBal.getE02GLBAVG())%></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b>Cost Center Required :</b></div>
            </td>
            <td  width="22%"> 
              <div align="left"><% if (stGLBal.getE02GLMCCN().equals("Y")) out.print("Yes"); else out.print("No"); %></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%"> 
              <div align="right"><b>Current Balance :</b></div>
            </td>
            <td  width="19%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stGLBal.getE02GLBBAL())%></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b> Initial Balance :</b><b></b></div>
            </td>
            <td  width="22%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(userPO.getHeader5())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <BR>
  <table class="tableinfo">
    <tr id="trdark"> 
      <th align=CENTER >Branch/Batch</th>
      <th align=CENTER >Process</th>
      <th align=CENTER > Reference</th>
      <th align=CENTER >Description</th>
      <th align=CENTER >Debit</th>
      <th align=CENTER >Credit</th>
      <th align=CENTER >Balance</th>
      <!-- <TH ALIGN=CENTER>Value Date</TH> --> </tr>
	  <%
      glList.initRow();
      while (glList.getNextRow()) {
         if (glList.getFlag().equals("")) {
       		out.println(glList.getRecord());
         }
      }
      %> 
  </table>
  <BR>
  <table class="tableinfo">
    <tr id="trclear"> 
      <td width="33%" nowrap> 
        <div align="left"><b>Total Debits : </b> (<%= userPO.getHeader22().trim()%>) 
          : <%= userPO.getHeader19().trim()%></div>
        </td>
      <td width="33%" nowrap><b>Total Credits :</b> (<%= userPO.getHeader23().trim()%>) 
        : <%= userPO.getHeader20().trim()%></td>
      <td width="34%"><b>Final Balance :</b> <%= Util.fcolorCCY(userPO.getHeader21().trim())%></td>
    </tr>
  </table>
  
</FORM>
</BODY>
</HTML>
