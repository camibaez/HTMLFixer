<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Dividends Payment Schedule</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="invOnline" class="datapro.eibs.beans.EIE008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
 
 
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

<h3 align="center"> Dividends Payment Schedule<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="inv_payment_dividen.jsp,EIE0080"></h3>
<hr size="4">
 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0080">  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
 
  <table  class="tableinfo">
    <tr id="trdark"> 
      <td nowrap width="29%" > 
        <div align="right">Instrument : </div>
      </td> 
      <td nowrap width="71%" > 
        <input type="text" name="E01SCHIIC" size="9" maxlength="9" value="<%=userPO.getIdentifier()%>" readonly>
        <input type="text" name="D01ISIDSC" size="35" maxlength="30" value="<%= userPO.getHeader1()%>" readonly>
        </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="29%" > 
        <div align="right">Instrument Type : </div>
      </td>
      <td nowrap width="71%" >
        <input type="text" name="D01ISIPTY" size="5" maxlength="3" value="<%=userPO.getHeader2()%>" readonly>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap width="29%" > 
        <div align="right">Instrument Currency :</div>
      </td>
      <td nowrap width="71%" > 
        <div align="left"> 
          <input type="text" name="D01ISICCY" size="4" maxlength="3" value="<%= userPO.getHeader3()%>" readonly>
        </div>
      </td>
    </tr>
    
  </table>
  <h4>Coupon Information </h4>
  <table  class="tableinfo">    
 
                 
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Payment Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" >  
              <input type="text" name="E01SCHAM1" size="15" maxlength="15" value="<%= invOnline.getE01SCHAM1()%>" onKeyPress="enterDecimal()">              
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Tax Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHTAX" size="15" maxlength="15" value="<%= invOnline.getE01SCHTAX()%>" onKeyPress="enterDecimal()">              
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Fees/Commissions Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHCOM" size="15" maxlength="15" value="<%= invOnline.getE01SCHCOM()%>" onKeyPress="enterDecimal()">              
          </tr>
           
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Net Payment Amount :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHNET" size="15" maxlength="15" value="<%= invOnline.getE01SCHNET()%>" onKeyPress="enterDecimal()" disabled>              
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="18%" ></td>            
          </tr>
             
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Custodian   Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01CSTDT1" size="3" maxlength="2" value="<%= invOnline.getE01CSTDT1() %>">
              <input type="text" name="E01CSTDT2" size="3" maxlength="2" value="<%= invOnline.getE01CSTDT2() %>">
              <input type="text" name="E01CSTDT3" size="3" maxlength="2" value="<%= invOnline.getE01CSTDT3() %>">
              <a href="javascript:DatePicker(document.forms[0].E01CSTDT1,document.forms[0].E01CSTDT2,document.forms[0].E01CSTDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
                    
          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Client   Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01CLIDT1" size="3" maxlength="2" value="<%= invOnline.getE01CLIDT1() %>">
              <input type="text" name="E01CLIDT2" size="3" maxlength="2" value="<%= invOnline.getE01CLIDT2() %>">
              <input type="text" name="E01CLIDT3" size="3" maxlength="2" value="<%= invOnline.getE01CLIDT3() %>">
              <a href="javascript:DatePicker(document.forms[0].E01CLIDT1,document.forms[0].E01CLIDT2,document.forms[0].E01CLIDT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
          
           <tr id="trclear"> 
            <td nowrap width="18%" ></td>            
          </tr>             
     
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Payment   Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHPA1" size="3" maxlength="2" value="<%= invOnline.getE01SCHPA1() %>">
              <input type="text" name="E01SCHPA2" size="3" maxlength="2" value="<%= invOnline.getE01SCHPA2() %>">
              <input type="text" name="E01SCHPA3" size="3" maxlength="2" value="<%= invOnline.getE01SCHPA3() %>">
              <a href="javascript:DatePicker(document.forms[0].E01SCHPA1,document.forms[0].E01SCHPA2,document.forms[0].E01SCHPA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  ></td>
          </tr>
           

          <tr id="trclear"> 
            <td nowrap width="18%" > 
              <div align="right">Declared Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHDE1" size="3" maxlength="2" value="<%= invOnline.getE01SCHDE1() %>">
              <input type="text" name="E01SCHDE2" size="3" maxlength="2" value="<%= invOnline.getE01SCHDE2()  %>">
              <input type="text" name="E01SCHDE3" size="3" maxlength="2" value="<%= invOnline.getE01SCHDE3()  %>">
              <a href="javascript:DatePicker(document.forms[0].E01SCHDE1,document.forms[0].E01SCHDE2,document.forms[0].E01SCHDE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a></td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="18%" > 
              <div align="right">Record Date :</div>
            </td>
            <td nowrap colspan="3" width="82%" > 
              <input type="text" name="E01SCHRE1" size="3" maxlength="2" value="<%= invOnline.getE01SCHRE1() %>">
              <input type="text" name="E01SCHRE2" size="3" maxlength="2" value="<%= invOnline.getE01SCHRE2() %>">
              <input type="text" name="E01SCHRE3" size="3" maxlength="2" value="<%= invOnline.getE01SCHRE3() %>"> 
              <a href="javascript:DatePicker(document.forms[0].E01SCHRE1,document.forms[0].E01SCHRE2,document.forms[0].E01SCHRE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  >
            </td>
          </tr>
		     
           
  </table>
  <SCRIPT language="javascript">
    /*function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize; */
  </SCRIPT>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%"> 
        <div align="center">
          <input type="checkbox" name="H01FLGWK2" value="A" <% if(invOnline.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
          Accept with Warnings </div>
      </td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
</html>
