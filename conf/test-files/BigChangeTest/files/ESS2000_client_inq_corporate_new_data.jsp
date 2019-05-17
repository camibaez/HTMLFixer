<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate User</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="cusdata" class="datapro.eibs.beans.ESS200001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.js"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.js"> </SCRIPT>
 
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
 
 
<h3 align="center">Internet Banking Corporate User<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_inq_corporate_new_data, ESS2000" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2000" onsubmit="return FieldNotBlank(this)">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="101">
  <INPUT TYPE=HIDDEN NAME="E01EUSCTY" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01EUSCFM" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01EUSTPT" VALUE="N">
  <INPUT TYPE=HIDDEN NAME="E01EUSMAX" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01EUSAMX" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01EUSTTL" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01EUSTAL" VALUE="0">
  <h4>General Information</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Entity ID :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" ID="MANDATORY" name="E01EUSUSR" size="12" maxlength="10" READONLY value="<%= cusdata.getE01EUSUSR().trim()%>">
                                    </div></td>
          </tr>
          <tr id="tedark"> 
            <td nowrap width="40%" ><div align="right">Administrator User ID :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" <% if(userPO.getPurpose().equals("MAINT")){ %> READONLY <% } %> ID="MANDATORY" name="E01EUSENT" size="12" maxlength="10" value="<%= cusdata.getE01EUSENT().trim()%>">
                                    </div></td>
          </tr>

          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Administrator User Status :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT disabled NAME="E01EUSSTS">
             <OPTION VALUE="1" <%if (cusdata.getE01EUSSTS().equals("1")) {out.print("selected"); }%>>ACTIVE</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSSTS().equals("2")) {out.print("selected"); }%>>INACTIVE</OPTION>
             <OPTION VALUE="3" <%if (cusdata.getE01EUSSTS().equals("3")) {out.print("selected"); }%>>SUSPENDED</OPTION>
             <OPTION VALUE="4" <%if (cusdata.getE01EUSSTS().equals("4")) {out.print("selected"); }%>>PENDING ACTIVATION</OPTION>
             <OPTION VALUE="5" <%if (cusdata.getE01EUSSTS().equals("5")) {out.print("selected"); }%>>AGREEMENT</OPTION>
             
             
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Customer Number :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E01EUSCUN" size="10" maxlength="9" value="<%= cusdata.getE01EUSCUN().trim()%>">
                                    </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Primary Account Number :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E01EUSACC" size="10" maxlength="9" value="<%= cusdata.getE01EUSACC().trim()%>" onkeypress="enterInteger()">
                                    </div></td> 
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Maximum Acumulated Type :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT disabled  NAME="E01EUSMXT">
             <OPTION VALUE="1" <%if (cusdata.getE01EUSMXT().equals("1")) {out.print("selected"); }%>>DAILY MAXIMUM AMOUNT PERMITTED</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSMXT().equals("2")) {out.print("selected"); }%>>WEEKLY MAXMIMUN AMOUNT PERMITTED</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Internal Transfers Permitted :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT disabled NAME="E01EUSTRA">
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSTRA().equals("Y")) {out.print("selected"); }%>>YES</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSTRA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Maximum Withdrawal :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" name="E01EUSMAX" size="15" maxlength="13" value="<%= cusdata.getE01EUSMAX().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Maximum Acumulated Withdrawal :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" name="E01EUSAMX" size="15" maxlength="13" value="<%= cusdata.getE01EUSAMX().trim()%>"></div></td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Person Responsible :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSCON" size="35" maxlength="30" value="<%= cusdata.getE01EUSCON().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">E-Mail Address :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" ID="MANDATORY" name="E01EUSIAD" size="45" maxlength="45" value="<%= cusdata.getE01EUSIAD().trim()%>">
                                    </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Confirmation Type :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT disabled NAME="E01EUSCFM">
             <OPTION VALUE="1" <%if (cusdata.getE01EUSCFM().equals("1")) {out.print("selected"); }%>>NO CONFIRMATION REQUIRED</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSCFM().equals("2")) {out.print("selected"); }%>>CALL-BACK REQUIRED</OPTION>
             <OPTION VALUE="3" <%if (cusdata.getE01EUSCFM().equals("3")) {out.print("selected"); }%>>INTERNET ADVICE TO CUSTOMER</OPTION>
             <OPTION VALUE="4" <%if (cusdata.getE01EUSCFM().equals("4")) {out.print("selected"); }%>>E-MAIL ADVICE TO CUSTOMER</OPTION>
             </SELECT></div></td>
          </tr>          
        </table>
        </td>
      </tr>
    </table>
    
 
</form>
</body>
</html>
