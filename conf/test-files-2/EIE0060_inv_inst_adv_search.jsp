<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script language="JavaScript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0308Q" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <center>
    <table class="tbenter" height="55%" width="100%" border="0">
      <tr> 
        <td nowrap align="center"> 
          <table class="tableinfo">
            <tr> 
              <td> 
                <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
                  <tr id="trdark"> 
                    <td valign="middle" align="center" colspan="3" height=33> 
                      <b>Instruments Management - Advance Search</b></td>
                  </tr>
                  <tr id="trclear"> 
                    <td>&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Description :</div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type="text" name="DESCRIPTION"  size=45 maxlength="35" >
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Instrument Type : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <select name="TYPE">
                        <option value=" ">All </option>
                        <option value="BND">Bonds</option>
                        <option value="EQT">Equity</option>
                        <option value="MUT">Mutual Funds</option>
                        <option value="PFS">Preferred Stocks</option>
                        <option value="ACD">Commodities</option>
                      </select>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right"> Issuer : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type="text" name="ISSUER"  size=19 maxlength="19" >
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap > 
                      <div align="right">Internal Instrument Code : </div>
                    </td>
                    <td width="70%" nowrap > 
                      <input type="text" name="INSTCODE"  size=19 maxlength="19" >
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap > 
                      <div align="right">Status : </div>
                    </td>
                    <td width="70%" nowrap > 
                      <div align="left"> 
                        <input type=HIDDEN name="STATUS" value="A">
                        <input type="radio" name="CSTATUS" value="A" onClick="document.forms[0].STATUS.value='A'" checked>
                        Active 
                        <input type="radio" name="CSTATUS" value="R" onClick="document.forms[0].STATUS.value='R'">
                        Redeem 
                        <input type="radio" name="CSTATUS" value="C" onClick="document.forms[0].STATUS.value='C'">
                        Cancelled 
                        <input type="radio" name="CSTATUS" value="P" onClick="document.forms[0].STATUS.value='P'">
                        Pending </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Issued Date : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <div align="left"> 
                        <input type="text" size="2" maxlength="2" name="DATEF1" onKeyPress="enterInteger()">
                        <input type="text" size="2" maxlength="2" name="DATEF2" onKeyPress="enterInteger()">
                        <input type="text" size="2" maxlength="2" name="DATEF3" onKeyPress="enterInteger()">
                        To 
                        <input type="text" size="2" maxlength="2" name="DATET1" onKeyPress="enterInteger()">
                        <input type="text" size="2" maxlength="2" name="DATET2" onKeyPress="enterInteger()">
                        <input type="text" size="2" maxlength="2" name="DATET3" onKeyPress="enterInteger()">
                      </div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">List Only Preferential Instruments ? 
                        : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type=HIDDEN name="PREFINST" value="A">
                      <input type="radio" name="CPREFINST" value="Y" onClick="document.forms[0].PREFINST.value='Y'">
                      Yes 
                      <input type="radio" name="CPREFINST" value="N" onClick="document.forms[0].PREFINST.value='N'" checked>
                      No </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <br>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
            <tr bgcolor="#FFFFFF"> 
              <td width="33%"> 
                <div align="center"> 
                  <input id="EIBSBTN" type=submit name="Submit" value="Submit">
                </div>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="center"> </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </center>

          
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
