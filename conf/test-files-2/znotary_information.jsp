<html>
<head>
<title>Notary</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "cdCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>


<body nowrap bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    

%> 
<h3 align="center">Credit Purpose List</h3> 
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
  </p>
  <table class="tbenter" align=center width="211">
    <tr> 
      <td class=TDBKG > 
        <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="javascript:goAction(3)"><b>Delete</b></a></div>
      </td>
      <td class=TDBKG > 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="3%"> 
              <div align="center"><b><b></b></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>Starting Date</b></div>
            </td>
            <td nowrap width="17%"> 
              <div align="center"><b>End Date </b></div>
            </td>
            <td nowrap width="13%"> 
              <div align="center"><b>Description</b></div>
            </td>
            <td nowrap width="17%"> 
              <div align="center"><b>Amount</b></div>
            </td>
            <td nowrap width="17%"> 
              <div align="center"><b>Currency</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton" checked>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">05/01/2004</div>
            </td>
            <td nowrap width="17%"> 
              <div align="center">05/04/2009</div>
            </td>
            <td nowrap width="13%"> 
              <div align="right">Home Improvement</div>
            </td>
            <td nowrap width="17%"> 
              <div align="right">$ 215,000.00</div>
            </td>
            <td nowrap width="17%"> 
              <div align="center">USD</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="center"> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">05/01/2004</div>
            </td>
            <td nowrap width="17%"> 
              <div align="center">06/03/2007</div>
            </td>
            <td nowrap width="13%"> 
              <div align="right">University Loan</div>
            </td>
            <td nowrap width="17%"> 
              <div align="right">$150,000.00</div>
            </td>
            <td nowrap width="17%"> 
              <div align="center">USD</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <br>
  <div align="center"> </div>
</form>
</body>
</html>

