<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Certificates Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdCancel" class="datapro.eibs.beans.EDL013012Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

  

</SCRIPT>

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

<h3 align="center"> Future Deals Cancellation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_cancel_deals.jsp,EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type=HIDDEN name="E12DEAACD"  value="<%= cdCancel.getE12DEAACD()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Portfolio/Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly    name="E12DEACUN" size="9" maxlength="9" value="<%= cdCancel.getE12DEACUN()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly    name="E12CUSNA1" size="45" maxlength="45" value="<%= cdCancel.getE12CUSNA1()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Reference :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly    name="E12DEAACC" size="12" maxlength="9" value="<%= cdCancel.getE12DEAACC()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product :</b></div>
            </td>
            <td nowrap> 
              <div align="left"><b> 
                <input type="text" readonly    name="E12DEAPRO" size="4" maxlength="4" value="<%= cdCancel.getE12DEAPRO()%>" >
                </b><b> </b> </div>
            </td>
            <td nowrap>
              <div align="right"><b>Currency :</b></div>
            </td>
            <td nowrap><b>
              <input type="text" readonly    name="E12DEACCY" size="3" maxlength="3" value="<%= cdCancel.getE12DEACCY()%>" >
              </b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Last Calculation Date :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12DEALC1" size="2" maxlength="2" value="<%= cdCancel.getE12DEALC1()%>" >
              <input type="text" readonly    name="E12DEALC2" size="2" maxlength="2" value="<%= cdCancel.getE12DEALC2()%>" >
              <input type="text" readonly    name="E12DEALC3" size="2" maxlength="2" value="<%= cdCancel.getE12DEALC3()%>" >
            </td>
            <td nowrap > 
              <div align="right">Principal Balance :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12DEAMEP" size="15" maxlength="15" value="<%= cdCancel.getE12DEAMEP()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Accrual Basis :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12INTDYS" size="3" maxlength="3" value="<%= cdCancel.getE12INTDYS()%>" >
            </td>
            <td nowrap > 
              <div align="right">Accrual Interests :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12DEAMEI" size="15" maxlength="15" value="<%= cdCancel.getE12DEAMEI()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Related Account :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12DEAREA" size="12" maxlength="12" value="<%= cdCancel.getE12DEAREA()%>" >
            </td>
            <td nowrap >
              <div align="right">General Ledger : </div>
              </td>
            <td nowrap >
              <input type="text" readonly    name="E12DEABNK" size="3" maxlength="2" value="<%= cdCancel.getE12DEABNK()%>" >
              <input type="text" readonly    name="E12DEABRN" size="4" maxlength="3" value="<%= cdCancel.getE12DEABRN()%>" >
              <b>
              <input type="text" readonly    name="E12DEACCY2" size="3" maxlength="3" value="<%= cdCancel.getE12DEACCY()%>" >
              </b> 
              <input type="text" readonly    name="E12DEAGLN" size="16" maxlength="16" value="<%= cdCancel.getE12DEAGLN()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Current Rate :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly    name="E12DEARTE2" size="10" maxlength="9" value="<%= cdCancel.getE12DEARTE()%>" >
              </div>
            </td>
            <td nowrap > 
              <div align="right">Foreign Exchange Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly    name="E12DEAEXR" size="10" maxlength="9" value="<%= cdCancel.getE12DEAEXR()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Narrative :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text"     name="E12DEANR1" size="35" maxlength="35" value="<%= cdCancel.getE12DEANR1()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >&nbsp;</td>
            <td nowrap colspan="3" > 
              <input type="text"     name="E12DEANR2" size="35" maxlength="35" value="<%= cdCancel.getE12DEANR2()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> 
    <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
    <br>
  </h4>
  <div align="center"> 
	   
    <input id="EIBSBTN" type=submit name="Submit" value="Cancel Deal">
  </div>
  </form>
</body>
</html>
