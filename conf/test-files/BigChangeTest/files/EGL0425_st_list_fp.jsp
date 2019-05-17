<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>General Ledger Inquiry</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stGLBal" class="datapro.eibs.beans.EGL042502Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<BODY>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function PrintPreview() {

  <% 
  int iniPos = glList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0425?SCREEN=3&Pos=' + pos,600,500,4);

}

</SCRIPT>

<%if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}%> 
<h3 align="center">General Ledger Transactions Inquiry by Bank<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="st_list_fp.jsp,EGL0425" width="35" height="35"></h3>
  <hr size="4">
<FORM>
<%if ( glList.getNoResult() ) {%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
        <div align="center"> <b> There is no match for your search criteria</b></div>
      </TD></TR>
   		</TABLE>
<%}	else {%>

  <p>&nbsp;</p>
<table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="30%" > 
              <div align="right"><b>General Ledger :</b></div>
            </td>
            <td nowrap width="70%" > 
              <input type="text" name="E02GLMBNK" size="2" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
              <input type="text" name="E02GLMCCY" size="3" readonly maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
              <input type="text" name="E02GLMGLN" size="16" readonly maxlength="16" value="<%= userPO.getAccNum().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right"><b>Description</b> :</div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E02GLMDSC" size="35" readonly maxlength="35" value="<%= stGLBal.getE02GLMDSC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Account Information</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="31%"  nowrap> 
              <div align="right"><b>Account Type :</b></div>
            </td>
            <td colspan="3" > 
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
              <div align="right"><b>Reconcilable Account : </b></div>
            </td>
            <td  width="22%"> 
              <div align="left"><% if (stGLBal.getE02GLMRCL().equals("Y")) out.print("Yes"); else out.print("No"); %></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%" nowrap> 
              <div align="right"><b>Monthly Average :</b></div>
            </td>
            <td  width="19%"> 
              <div align="right" nowrap><%= Util.fcolorCCY(stGLBal.getE02GLBAVG())%></div>
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
  <h4 align="left">Transactions</h4>
  <TABLE class="tableinfo">
    <TR id="trclear"> 
      <TH ALIGN=CENTER width="53" nowrap>Process <br>
        Date</TH>
      <TH ALIGN=CENTER width="57" nowrap>Branch</TH>
      <TH ALIGN=CENTER width="57" nowrap>Reference</TH>
      <TH ALIGN=CENTER width="25" nowrap>TC</TH>
      <TH ALIGN=CENTER width="230" nowrap>Description</TH>
      <TH ALIGN=CENTER width="36" nowrap> 
        <div align="right">Debit</div>
      </TH>
      <TH ALIGN=CENTER width="46" nowrap> 
        <div align="center">Credit</div>
      </TH>
      <TH ALIGN=CENTER width="57" nowrap> 
        <div align="center">Balance</div>
      </TH>
      <TH ALIGN=CENTER width="49" nowrap>Batch</TH>
      <!--<TH ALIGN=CENTER width="43" nowrap>Value Date</TH>-->
      <TH ALIGN=CENTER width="39" nowrap>Time</TH>
      <TH ALIGN=CENTER width="50" nowrap>User</TH>
      <TH ALIGN=CENTER width="47" nowrap> 
        <p>Originating Bank</p>
      </TH>
      <TH ALIGN=CENTER width="43" nowrap>Originating Branch</TH>
    </TR>
    <%
    glList.initRow();
    while (glList.getNextRow()) {
        if (glList.getFlag().equals("")) {
        		out.println(glList.getRecord());
        }
    }
    %> 
  </TABLE>
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
	<%
    if ( glList.getShowPrev() ) {
  			int pos = glList.getFirstRec() - 51;
  			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0425?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
    }
 	%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
	<%
    if ( glList.getShowNext() ) {
  			int pos = glList.getLastRec();
  			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0425?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
    }
	%>
</TD>
</TR>
</TABLE>
  <p align="center">
    <input id="EIBSBTN" type=button name="Submit" value="Print" OnClick="PrintPreview();">
 </p>
<%}%> 
</FORM>
</BODY>
</HTML>
