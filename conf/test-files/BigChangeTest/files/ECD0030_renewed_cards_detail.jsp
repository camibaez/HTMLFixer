<html> 
<head>
<title>Renewed Cards Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD003001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<BODY>
<h3 align="center">Renewed Cards Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="renewed_cards_detail.jsp, ECD0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cards.JSECD0030" >
  <input type=HIDDEN name="SCREEN" value="1">
  <h4>Renewal Card Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Customer Number : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDDCUN" size="15" maxlength="9" readonly value="<%= msgCD.getE01TDDCUN() %>">
			  </div>
            </td>
            <TD nowrap width="16%"> 
              <DIV align="right">Customer Name :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01TDDNAM" size="55" maxlength="45" readonly value="<%= msgCD.getE01TDDNAM() %>">
              </DIV>
            </TD>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Card Number : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDDNUM" size="25" maxlength="20" readonly value="<%= msgCD.getE01TDDNUM() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Main Account :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDDCRA" size="15" maxlength="9" readonly value="<%= msgCD.getE01TDDCRA() %>">
              </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Card Status :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01TDDSTS" size="3" maxlength="2" readonly value="<%= msgCD.getE01TDDSTS() %>">
                <input type="text" name="E01TDDDSC" size="21" maxlength="20" readonly value="<%= msgCD.getE01TDDDSC() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Expiration Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01TDDEXM" size="3" maxlength="2" readonly value="<%= msgCD.getE01TDDEXM() %>">
                <input type="text" name="E01TDDEXY" size="3" maxlength="2" readonly value="<%= msgCD.getE01TDDEXY() %>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Lot Number : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDDLOT" size="13" maxlength="12" readonly value="<%= msgCD.getE01TDDLOT() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Plastic Type :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDDTPL" size="3" maxlength="2" readonly value="<%= msgCD.getE01TDDTPL() %>">
              </div>
            </td>
          </tr>  
        </table>
      </td>
    </tr>
  </table>
  <h4>Current Card Information</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Current Card Status :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01CCRSTS" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCRSTS() %>">
                <input type="text" name="E01CCRDSC" size="21" maxlength="20" readonly value="<%= msgCD.getE01CCRDSC() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Current Card Expiration Date :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CCREXM" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCREXM() %>">
                <input type="text" name="E01CCREXY" size="3" maxlength="2" readonly value="<%= msgCD.getE01CCREXY() %>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Return">
  </div>
  
</form>

</body>
</html>
