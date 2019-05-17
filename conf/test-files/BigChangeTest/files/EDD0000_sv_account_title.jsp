<html>
<head>
<title>Account Title</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "mailA" class= "datapro.eibs.beans.ESD000004Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

	builtNewMenu(sv_m_opt);

</SCRIPT>

<body >



 <%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  //if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu();</SCRIPT>");
 //}
%>

<h3 align="center">Account Title<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sv_account_title, EDD0000" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="58">

  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  <table id="mainTable9" class="tableinfo">
   <tr >
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Legal Name :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94MA1" maxlength="45" size="46" value="<%= mailA.getField("E94MA1").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Title/Address
                :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94MA2" maxlength="35" size="36" value="<%= mailA.getField("E94MA2").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94MA3" maxlength="35" size="36" value="<%= mailA.getField("E94MA3").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Address :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94MA4" maxlength="35" size="36" value="<%= mailA.getField("E94MA4").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">City :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94CTY" maxlength="30" size="31" value="<%= mailA.getField("E94CTY").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">State :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94STE" maxlength="4" size="5" value="<%= mailA.getField("E94STE").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E94STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Country :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94CTR" maxlength="20" size="21" value="<%= mailA.getField("E94CTR").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">P.O.Box :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94POB" maxlength="10" size="11" value="<%= mailA.getField("E94POB").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark">
            <td nowrap width="42%">
              <div align="right">Zip Code :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94ZPC" maxlength="15" size="16" value="<%= mailA.getField("E94ZPC").getString().trim()%>">
            </td>
          </tr>
         <tr>
            <td nowrap width="42%">
              <div align="right">Mailing Code :</div>
            </td>
            <td nowrap width="58%">
              <input type="text" name="E94MLC" maxlength="3" size="4" value="<%= mailA.getField("E94MLC").getString().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<p align="center">
 <input id="EIBSBTN" type=submit name="Submit" value="Submit">
</p>

 </form>
</body>
</html>
