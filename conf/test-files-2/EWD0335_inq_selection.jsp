<html>
<head>
<title>Customer Deals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

</head>
<body nowrap>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   
%> 


<h3 align="center"> Customer Deals Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inq_selection.jsp , EWD0335" border="0"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0335" >

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="CUSTOMER" size="9" maxlength="9" readonly value="<%= userPO.getCusNum()%>">
              </div>
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="27%">
              <div align="right"><b>Deal Status :</b></div>
            </td>
            <td nowrap width="15%"> 
              <input type=HIDDEN name="DEALSTS" value="A">
              <input type="radio" name="CDEALSTS" value="O"
			  onClick="document.forms[0].DEALSTS.value='O'">
              Outstanding </td>
            <td nowrap width="10%"> 
              <div align="left">
                <input type="radio" name="CDEALSTS" value="C"
				onClick="document.forms[0].DEALSTS.value='C'">
                Closed</div>
            </td>
            <td nowrap width="47%"> 
              <input type="radio" name="CDEALSTS" checked
			  onClick="document.forms[0].DEALSTS.value=''" value="A">
              All</td>
          </tr>
          <tr id="trclear   "> 
            <td nowrap width="27%"> 
              <div align="right"><b>Date Type :</b></div>
            </td>
            <td nowrap width="15%"> 
              <input type="radio" name="CDATET" value="P" checked
			  onClick="document.forms[0].DATET.value='P'">
              Process Date</td>
            <td nowrap width="10%">
              <input type="radio" name="CDATET" value="V"
			  onClick="document.forms[0].DATET.value='V'">
              Value Date</td>
            <td nowrap width="47%">
              <input type=HIDDEN name="DATET" value="P">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right"> <b>Select Dates from :</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="DATEF1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="DATEF2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="DATEF3" size="2" maxlength="2" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Up to :</b></div>
            </td>
            <td nowrap width="47%"> 
              <div align="left"> 
                <input type="text" name="DATET1" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="DATET2" size="2" maxlength="2" onkeypress="enterInteger()">
                <input type="text" name="DATET3" size="2" maxlength="2" onkeypress="enterInteger()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right"><b>Select Reference from :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="REFERENCE1" size="15" maxlength="13" onkeypress="enterInteger()">
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Up to :</b></div>
            </td>
            <td nowrap width="47%" > 
              <div align="left"> 
                <input type="text" name="REFERENCE2" size="15" maxlength="13" onkeypress="enterInteger()">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
     <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>

  </form>
</body>
</html>
