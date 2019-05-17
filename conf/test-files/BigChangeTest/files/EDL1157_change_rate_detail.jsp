<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Change of Variable Rate to Fixed Rate</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msg" class= "datapro.eibs.beans.EDL115701Message"  scope="session" />
<jsp:useBean id= "hdr" class= "datapro.eibs.beans.EDL115702Message"  scope="session" />
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

<H3 align="center">Change of Variable Rate to Fixed Rate
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="change_rate_detail.jsp , EDL1157"> 
</H3><hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1157" >
<input type=HIDDEN name="SCREEN" value="5">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="2">
<INPUT TYPE=HIDDEN NAME="E01CDVACC" value="<%= hdr.getE02DEAACC().trim()%>">

 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Customer :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E02DEACUN" size="9" maxlength="9" value="<%= hdr.getE02DEACUN().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= hdr.getE02CUSNA1().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02DEAACC" size="12" maxlength="12" value="<%= hdr.getE02DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= hdr.getE02DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02DEAPRO" size="4" maxlength="4" readonly value="<%= hdr.getE02DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <table class=tbenter>
   <tr > 
      <td nowrap> <h4><b>Basic Information</b></h4> </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Note Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEAOD1" size="2" maxlength="2" value="<%= hdr.getE02DEAOD1().trim()%>" readonly>
              <input type="text" name="E02DEAOD2" size="2" maxlength="2" value="<%= hdr.getE02DEAOD2().trim()%>" readonly>
              <input type="text" name="E02DEAOD3" size="2" maxlength="2" value="<%= hdr.getE02DEAOD3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMA1" size="2" maxlength="2" value="<%= hdr.getE02DEAMA1().trim()%>" readonly>
              <input type="text" name="E02DEAMA2" size="2" maxlength="2" value="<%= hdr.getE02DEAMA2().trim()%>" readonly>
              <input type="text" name="E02DEAMA3" size="2" maxlength="2" value="<%= hdr.getE02DEAMA3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMEP" size="15" maxlength="15" value="<%= hdr.getE02DEAMEP().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02TOTRTE" size="10" maxlength="9" value="<%= hdr.getE02TOTRTE().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Floating Rate Table :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAFTB" size="2" maxlength="2" value="<%= hdr.getE02DEAFTB().trim()%>"readonly>
              <input type="text" name="E02DEAFTY" size="14" 
				  value="<% if (hdr.getE02DEAFTY().equals("FP")) out.print("Primary");
							else if (hdr.getE02DEAFTY().equals("FS")) out.print("Secondary");
							else if (hdr.getE02DEAFTY().equals("DS")) out.print("Time Deposits");
							else out.print("");%>" 
				readonly>
            </td>
            <td nowrap > 
              <div align="right">Actual Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAFRT" size="10" maxlength="9" value="<%= hdr.getE02DEAFRT().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEABAS" size="3" maxlength="3" value="<%= hdr.getE02DEABAS().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEATRM" size="4" maxlength="4" value="<%= hdr.getE02DEATRM().trim()%>"readonly>
              <input type="text" name="E02DEATRC" size="10" 
				  value="<% if (hdr.getE02DEATRC().equals("D")) out.print("Day(s)");
							else if (hdr.getE02DEATRC().equals("M")) out.print("Month(s)");
							else if (hdr.getE02DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
            </td>
	       </tr>
		 </table>
      </tr>
 </table>


  <table class=tbenter>
   <tr > 
      <td nowrap> <h4><b>Input Information</b></h4> </td>
    </tr>
  </table>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Process Date :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01CDVUD1" size="2" maxlength="2" value="<%=msg.getE01CDVUD1().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CDVUD2" size="2" maxlength="2" value="<%=msg.getE01CDVUD2().trim()%>" onkeypress="enterInteger()">
              <input type="text" name="E01CDVUD3" size="2" maxlength="2" value="<%=msg.getE01CDVUD3().trim()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01CDVUD1,document.forms[0].E01CDVUD2,document.forms[0].E01CDVUD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0"></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap width="56%"> 
              <div align="left"> 
                <input type="text" name="E01CDVNRT" size="11" maxlength="9" value="<%=msg.getE01CDVNRT().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="44%"> 
              <div align="right">Floating Table :</div>
            </td>
            <td nowrap width="56%"> 
              <input type="text" name="E01CDVFTB" size="3" maxlength="2" value="<%=msg.getE01CDVFTB().trim()%>">
              <a href="javascript:GetFloating('E01CDVFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Floating Rates Table" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="44%"> 
              <div align="right">Floating Type :</div>
            </td>
            <td nowrap width="56%"> 
              <div align="left"> 
             <select name="E01CDVFTY">
                <option value=" " <% if (!(msg.getE01CDVFTY().equals("FP") || msg.getE01CDVFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (msg.getE01CDVFTY().equals("FP")) out.print("selected"); %>>Primary</option>
                <option value="FS" <% if (msg.getE01CDVFTY().equals("FS")) out.print("selected"); %>>Secondary</option>
              </select>
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
