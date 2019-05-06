<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Auditoría</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgAudit" class= "datapro.eibs.beans.ECD0011DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body>
<h3 align="center">Audit Inquiry<BR>
Details<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="plastic_audit_inq.jsp, ECD0011"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0011" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">

  <table class="tableinfo">
    <tr > 
      <td nowrap></td>
    </tr>
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY><TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Bank :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDBNK" size="3" maxlength="2" readonly value="<%= msgAudit.getE01TDDBNK() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Branch :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDBRN" size="4" maxlength="3" readonly value="<%= msgAudit.getE01TDDBRN() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Currency :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDCCY" size="4" maxlength="3" readonly value="<%= msgAudit.getE01TDDCCY() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Customer ID :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01TDDTCED" size="18" maxlength="15" readonly value="<%= msgAudit.getE01TDDCED() %>"></DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Customer Number :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
			  <INPUT type="text" name="E01TDDDCUN" size="12" maxlength="9" readonly value="<%= msgAudit.getE01TDDCUN() %>">
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Customer Name :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              <INPUT type="text" name="E01TDDLNAM" size="50" maxlength="45" readonly value="<%= msgAudit.getE01TDDNAM() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Card Type :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDTPL" size="3" maxlength="2" readonly value="<%= msgAudit.getE01TDDTPL() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Card Type Description :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01TDDDTP" size="40" maxlength="35" readonly value="<%= msgAudit.getE01TDDDTP() %>"></DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Card Number :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
			  <INPUT type="text" name="E01TDDTDD" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDTDD() %>">
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Account Number :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              <INPUT type="text" name="E01TDDLACC" size="15" maxlength="13" readonly value="<%= msgAudit.getE01TDDACC() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Process Date :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDDAY" size="2" maxlength="3" readonly value="<%= msgAudit.getE01TDDDAY() %>">
                <INPUT type="text" name="E01TDDMON" size="2" maxlength="3" readonly value="<%= msgAudit.getE01TDDMON() %>">
                <INPUT type="text" name="E01TDDYEA" size="4" maxlength="5" readonly value="<%= msgAudit.getE01TDDYEA() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Time :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01TDDTIM" size="10" maxlength="8" readonly value="<%= Util.formatTime(msgAudit.getE01TDDTIM()) %>"></DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">User :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
			  <INPUT type="text" name="E01TDDUSR" size="12" maxlength="10" readonly value="<%= msgAudit.getE01TDDUSR() %>">
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">File Name :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              <INPUT type="text" name="E01TDDLARC" size="12" maxlength="10" readonly value="<%= msgAudit.getE01TDDARC() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Program :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDPGM" size="12" maxlength="10" readonly value="<%= msgAudit.getE01TDDPGM() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Operation Code :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01TDDOPE" size="4" maxlength="3" readonly value="<%= msgAudit.getE01TDDOPE() %>"></DIV>
            </TD>
          </TR>  
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Notes :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
			  <INPUT type="text" name="E01TDDDOBS" size="18" maxlength="15" readonly value="<%= msgAudit.getE01TDDOBS() %>">
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right"></DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
              </DIV>
            </TD>
          </TR>

			</TBODY>
			</TABLE>
      </td>
    </tr>
    
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap></td>
    </tr>
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 1 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL1" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL1() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 1 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL1() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  1 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO1() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 2 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL1" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL2() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 2 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL2() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  2 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO2() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 3 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL3" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL3() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 3 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL3" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL3() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  3 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO3" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO3() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 4 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL4" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL4() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 4 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL4" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL4() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  4 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO4" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO4() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 5 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL5" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL5() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 5 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL5" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL5() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  5 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO5" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO5() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 6 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL6" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL6() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 6 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL6" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL6() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  6 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO6" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO6() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 7 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL7" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL7() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 7 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL7" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL7() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  7 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO7" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO7() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 8 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL8" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL8() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 8 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL8" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL8() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  8 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO8" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO8() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 9 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL9" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFIL9() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 9 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL9" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVAL9() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"><DIV align="right">Last Value  9 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO9" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVMO9() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Field 10 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDFIL1" size="10" maxlength="8" readonly value="<%= msgAudit.getE01TDDFI10() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Value 10 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVAL1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVA10() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Last Value  10 : </DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDVMO1" size="25" maxlength="20" readonly value="<%= msgAudit.getE01TDDVM10() %>">
              </DIV>
            </TD>
          </TR>


			</TBODY>
			</TABLE>
      </td>
    </tr>
    
  </table>
  </form>
</body>
</html>
