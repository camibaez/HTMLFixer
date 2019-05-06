<html>
<head>
<title>Line Of Credit Tariff Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="lctProdInq" class="datapro.eibs.beans.ESD0714DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("LN") ) {
%>
	
	var myhtml = 
		 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=1>Balances </A> <BR>"+	
		 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=2>Basic Information </A> <BR>"+			 
		 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=3>Special Codes</A><BR>" +
   	   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=4>Account Holders</A><BR> "  +
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=5>Special Instructions</A><BR>" + 
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=6>Interest Analysis</A><BR>" + 
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" + 
         "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=200&E01DEAACC=<%= userPO.getIdentifier() %>>Statement</A><BR> " +		 
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=8>Payment Schedule</A><BR>" +    
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=9>Calculator</A><BR>" + 
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=10>Products</A><BR>" + 	   
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0000?SCREEN=1>Guarantess</A><BR>" + 	 
	     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=11>Deductions</A><BR>" + 	                	     
         "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";	
      builtNewMenu(myhtml);
      initMenu();
<%   
}
%>

<%
}
%>
</SCRIPT>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Letter of Credit Tariff Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_inq_ln.jsp, ESD0711"></h3>
<hr size="4">

<form>
  
  
  <h4>Product Classification</h4>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Bank Code / Product: </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly  name="E01SELBNK" size="3" maxlength="2" value="<%= lctProdInq.getE01SELBNK().trim()%>">
              <input type="text" readonly  name="E01SELTYP" size="3" maxlength="2" value="<%= lctProdInq.getE01SELTYP().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Structure Number :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly  name="E01SELTLN" size="6" maxlength="4" value="<%= lctProdInq.getE01SELTLN().trim()%>">
              <input type="text" readonly  name="E101RLCDSC" size="65" maxlength="63" value="<%= lctProdInq.getE01RLCDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Charges</h4>

  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"><b>Concept</b></div>
            </td>
            <td width="7%"> 
              <div align="center"><b><b>Amount</b></b></div>
            </td>
            <td width="8%"> 
              <div align="center"><b><b>Rate</b></b></div>
            </td>
            <td width="7%"> 
              <div align="center"><b><b>Average</b></b></div>
            </td>
            <td width="11%"> 
              <div align="center"><b><b>Minimum</b></b></div>
            </td>
            <td width="10%"> 
              <div align="center"><b><b>Maximum</b></b></div>
            </td>
            <td width="9%"> 
              <div align="center"><b><b>I.V.A.</b></b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Issuance 1 :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCIBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIBP" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCIBP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCIMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCIMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(0)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Issuance 2 :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIR2" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCIR2().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIP2" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCIP2().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIM2" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCIM2().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIX2" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCIX2().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Advising :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCADF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCADF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA2" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(1)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Confirmation 1 :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCCBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCBP" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCCBP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA3" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(2)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Confirmation 2 :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCR2" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCCR2().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCP2" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCCP2().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCCM2" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCM2().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> </div>
            </td>
            <td width="9%"> 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Extension of Validity :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCEBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCEBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCEBP" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCEBP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCEMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCEMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCEMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCEMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA4" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(3)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Amendment :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCAMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCAMF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA5" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(4)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"> Advising Amendment :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCAAF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCAAF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA6" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(5)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Discrepancies :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCDIF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCDIF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA7" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(6)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Sight Payment :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCSBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCSBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCSPM" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCSPM().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA8" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(7)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Acceptances :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCACB" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCACB().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCABP" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCABP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCACM" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCACM().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCAMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCAMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA9" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(8)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Deferred Payment :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCDPB" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCDPB().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCDBP" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCDBP().trim()%>">
              </div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCDPM" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCDPM().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCDMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCDMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA10" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(9)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Negotiation :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCNBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCNBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCNMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCNMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCNMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCNMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA11" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(10)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Assignment of Proceeds :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCAPB" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCAPB().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCAPM" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCAPM().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA12" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(11)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Transfers :</div>
            </td>
            <td width="7%">&nbsp;</td>
            <td width="8%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCTBR" size="4" maxlength="3" value="<%= lctProdInq.getE01RLCTBR().trim()%>">
              </div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCTMF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCTMF().trim()%>">
              </div>
            </td>
            <td width="10%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCTMX" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCTMX().trim()%>">
              </div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA13" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(12)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Postage :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCPST" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCPST().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA14" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(13)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Message, Courier :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCCOU" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCOU().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA15" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(14)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Cancellation :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCCAN" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCAN().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA16" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(15)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Nominal Fee :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCNOF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCNOF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA17" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(16)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Wire Transfer :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCWTF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCWTF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA18" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(17)%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Telex-Long Message :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCCTF" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCTF().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA19" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(18)%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Telex-Short Message :</div>
            </td>
            <td width="7%"> 
              <input type="text" readonly name="E01RLCCTM" size="10" maxlength="9" value="<%= lctProdInq.getE01RLCCTM().trim()%>">
            </td>
            <td width="8%"> 
              <div align="center"></div>
            </td>
            <td width="7%"> 
              <div align="center"></div>
            </td>
            <td width="11%"> 
              <div align="center"></div>
            </td>
            <td width="10%"> 
              <div align="center"></div>
            </td>
            <td width="9%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCIVA20" maxlength="1" size="2" value="<%= lctProdInq.getE01RLCIVA().charAt(19)%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>General Ledger</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right"><b>Concept</b></div>
            </td>
            <td width="18%"> 
              <div align="center"><b><b>General Ledger</b></b></div>
            </td>
            <td width="34%"> 
              <div align="center"><b><b>Description</b></b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Issuance 1 :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGIS" value="<%= lctProdInq.getE01RLCGIS().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGIS" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGIS().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Advising :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGAD" value="<%= lctProdInq.getE01RLCGAD().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAD" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGAD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Confirmation 1 :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGCD" value="<%= lctProdInq.getE01RLCGCO().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCO" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGCO().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Extension of Validity :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGEV" value="<%= lctProdInq.getE01RLCGEV().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGEV" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGEV().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Amendment :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGAM" value="<%= lctProdInq.getE01RLCGAM().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAM" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGAM().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Advising Amendment :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGAA" value="<%= lctProdInq.getE01RLCGAA().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAA" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGAA().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Discrepancies :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGDI" value="<%= lctProdInq.getE01RLCGDI().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGDI" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGDI().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Sight Payment :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGPM" value="<%= lctProdInq.getE01RLCGPM().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGPM" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGPM().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Acceptances :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGAC" value="<%= lctProdInq.getE01RLCGAC().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAC" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGAC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Deferred Payment :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGDP" value="<%= lctProdInq.getE01RLCGDP().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGDP" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGDP().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Negotiation :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGNE" value="<%= lctProdInq.getE01RLCGNE().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGNE" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGNE().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Assignment of Proceeds :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGAS" value="<%= lctProdInq.getE01RLCGAS().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGAS" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGAS().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Transfers :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGTR" value="<%= lctProdInq.getE01RLCGTR().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTR" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGTR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Postage :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGPO" value="<%= lctProdInq.getE01RLCGPO().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGPO" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGPO().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Message, Courier :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGCR" value="<%= lctProdInq.getE01RLCGCR().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCR" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGCR().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Cancellation :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGCA" value="<%= lctProdInq.getE01RLCGCA().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGCA" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGCA().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Nominal Fee :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGNF" value="<%= lctProdInq.getE01RLCGNF().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGNF" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGNF().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Wire Transfer :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGWT" value="<%= lctProdInq.getE01RLCGWT().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGWT" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGWT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="48%"> 
              <div align="right">Telex-Long Message :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGTF" value="<%= lctProdInq.getE01RLCGTF().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTF" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGTF().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="48%"> 
              <div align="right">Telex-Short Message :</div>
            </td>
            <td width="18%"> 
              <div align="center"> 
                <input type="text" readonly name="E01RLCGTM" value="<%= lctProdInq.getE01RLCGTM().trim()%>" size="18" maxlength="16">
              </div>
            </td>
            <td width="34%"> 
              <div align="center"> 
                <input type="text" readonly name="E01DSCGTM" size="37" maxlength="35" value="<%= lctProdInq.getE01DSCGTM().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> <input id="EIBSBTN" type=button name="Submit" value="Close" onclick="top.close()"> 
  </p>
 
</form>
</body>
</html>
