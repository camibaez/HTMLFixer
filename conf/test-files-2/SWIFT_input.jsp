<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Financial Transaction</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="prMant" class="datapro.eibs.beans.EPR000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<SCRIPT Language="Javascript">

  function showTab(index,name){

  for(var i=0;i<5;i++){
   document.all["Tab"+i].className="tabnormalv";
   document.all["dataTab"+i].style.display="none";
   }
  if(index < 3) {
    document.all["Tab"+index].className="tabhighlightl";
	colTab.className="tabdataleft";
  }else {
	document.all["Tab"+index].className="tabhighlightr";
	colTab.className="tabdataright";
  }
  document.all["dataTab"+index].style.display="";
  document.all[name].focus();
  }

</SCRIPT>

<SCRIPT Language="Javascript">

  function showType(value){

  if (value=="LP"){
	document.forms[0].action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950";
    document.forms[0].SCREEN.value="600";
	OtherOpt.style.display="none";
	IAOpt.style.display="none";
	MPOpt.style.display="none";
    LoanOpt.style.display="";
	document.forms[0].E01DEAACC.focus();
   }else if (value=="IA"){
	document.forms[0].action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130";
    document.forms[0].SCREEN.value="1000";
	OtherOpt.style.display="none";
    LoanOpt.style.display="none";
	MPOpt.style.display="none";
    IAOpt.style.display="";
	document.forms[0].E03DEAACC.focus();
   }else if (value=="MP"){
	document.forms[0].action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035";
    document.forms[0].SCREEN.value="200";
	OtherOpt.style.display="none";
    LoanOpt.style.display="none";
    IAOpt.style.display="none";
	MPOpt.style.display="";
	document.forms[0].E01BTHNUM.focus();
   }else {
	document.forms[0].action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000";
    <%
     if (userPO.getPurpose().equals("NEW")) {
    %>
  		document.forms[0].SCREEN.value="2";
	<% } else{ %>
		document.forms[0].SCREEN.value="4";
    <% } %>
	LoanOpt.style.display="none";
	IAOpt.style.display="none";
	MPOpt.style.display="none";
    OtherOpt.style.display="";
	document.forms[0].E01PRITTP.value=value;}
  }

</SCRIPT>

<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E01DEAACC.value.length < 1 && LoanOpt.style.display==""){
alert("A valid number must be entered");
document.forms[0].E01DEAACC.value='';
document.forms[0].E01DEAACC.focus();
}
else if(document.forms[0].E03DEAACC.value.length < 1 && IAOpt.style.display==""){
alert("A valid number must be entered");
document.forms[0].E01DEAACC.value='';
document.forms[0].E01DEAACC.focus();
}
else {
  document.forms[0].submit();
}
}
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

<h3 align="center">Payment Instructions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000">
  <div id="OtherOpt">
    <table class="tableinfo">
      <tr>
        <td nowrap height="28" >
          <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
            <tr>
              <td nowrap width="10%" align="right"> Customer: </td>
              <td nowrap width="12%" align="left"> 123456</td>
              <td nowrap width="6%" align="right">ID: </td>
              <td nowrap width="14%" align="left"> DA123456 </td>
              <td nowrap width="8%" align="right"> Name: </td>
              <td nowrap width="50%"align="left"> Datapro, Inc</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Basic Information</h4>
    <table class="tableinfo" width="639">
      <tr>
        <td nowrap height="28" >
          <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
            <tr>
              <td nowrap width="10%" align="right">Show By Currency : </td>
              <td nowrap width="12%" align="left">
                <select name="select9">
                  <option>USD - United States Dolar</option>
                  <option>EUR - Euro</option>
                  <option>LIR- Italian Lira </option>
                </select>
              </td>
              <td nowrap width="6%" align="right">Add Currency : </td>
              <td nowrap width="14%" align="left">
                <input type="text" name="E11PRIDTO63" size="9" maxlength="9" value="<%= prMant.getE11PRIDTO().trim()%>">
                <a href="javascript:GetCustomerDescId('E01CUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table class="tableinfo" width="639">
      <tr >
      <td >
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark">
              <td colspan="5" align="center">
                <table id="TableTab" cellspacing=0 cellpadding=0 border="0" width="100%">
                  <tr id=trdark>
                    <td nowrap valign="top" align="right">
                      <table id="TableTabL" cellspacing=0 cellpadding=0 border="0">
                        <tr>
                          <td nowrap id="Tab0" class="tabhighlightl" onClick="showTab(0,'E11PRIDTO')">
                            <div nowrap >Paying Correspondant</div>
                          <td>
                        </tr>
                        <tr>
                          <td nowrap id="Tab1" class="tabnormalv" onClick="showTab(1,'E11PRIDTP')">
                            <div nowrap >Receiving Correspondant</div>
                          <td>
                        </tr>
                        <tr >
                          <td nowrap id="Tab2" class="tabnormalv" onClick="showTab(2,'E11PRIBCU')">
                            <div >Paying Intermediary</div>
                          <td>
                        </tr>
                      </table>
                    </td>
                    <td id="colTab" align="center" class="tabdataleft">
                      <div id="DataTab">
                        <div id="dataTab0">
                          <table border="0">
                            <tr>
                              <td >Customer Number :
                                <input type="text" name="E11PRIDTO6" size="9" maxlength="9" value="<%= prMant.getE11PRIDTO().trim()%>">
                                <a href="javascript:GetCustomerDescId('E01CUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
                              </td>
                              <td width="53%">
                                <input type="text" name="E11PRIDTO" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td rowspan="3" >&nbsp;</td>
                              <td width="53%">
                                <input type="text" name="E21PRIDTO" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <input type="text" name="E31PRIDTO" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <input type="text" name="E41PRIDTO" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab1" style="display: none">
                          <table border="0">
                            <tr>
                              <td >Customer Number :
                                <input type="text" name="E11PRIDTO62" size="9" maxlength="9" value="<%= prMant.getE11PRIDTO().trim()%>">
                                <a href="javascript:GetCustomerDescId('E01CUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
                              </td>
                              <td width="53%">
                                <input type="text" name="E11PRIDTO2" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td rowspan="3" >&nbsp;</td>
                              <td width="53%">
                                <input type="text" name="E21PRIDTO2" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <input type="text" name="E31PRIDTO2" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <input type="text" name="E41PRIDTO2" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab2" style="display: none">
                          <table width="94%" border="0">
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO3" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E21PRIDTO3" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E31PRIDTO3" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E41PRIDTO3" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab3" style="display: none">
                          <table width="94%" border="0">
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO4" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E21PRIDTO4" size="36" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E31PRIDTO4" size="36" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E41PRIDTO4" size="36" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab4" style="display: none">
                          <table width="94%" border="0">
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO5" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO52" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO53" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="53%">
                                <div align="center">
                                  <input type="text" name="E11PRIDTO54" size="36" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </div>
                    </td>
                    <td nowrap valign=top>
                      <table id="TableTabR" cellspacing=0 cellpadding=0 border="0">
                        <tr >
                          <td nowrap id="Tab3" class="tabnormalv" onClick="showTab(3,'E11PRIBKB')">
                            <div nowrap >Receiving Intermediary</div>
                          <td>
                        </tr>
                        <tr >
                          <td nowrap id="Tab4" class="tabnormalv" onClick="showTab(4,'E11PRIINB')">
                            <div nowrap >Account With</div>
                          <td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
      </TD>
 </tr>
</table>
    <p>&nbsp;</p>
    <p align="center"><img class="imgfilter" name="Submit" src="<%=request.getContextPath()%>/images/e/bt_submit.gif"
						onMouseDown="this.className='imgfilterpress'" onMouseUp="this.className='imgfilter'" onClick="CheckACC()">
    </p>
  </div>

</form>


</body>
</html>
