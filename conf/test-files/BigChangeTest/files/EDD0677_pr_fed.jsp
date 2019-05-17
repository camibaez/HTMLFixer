<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment Orders Swift MT 100 Message</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fedBean" class="datapro.eibs.beans.EDL013001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(cd_m_opt);
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>
<SCRIPT Language="Javascript">
  
  function showTab(index,name){
  
  for(var i=0;i<8;i++){
   document.all["Tab"+i].className="tabnormalv";
   document.all["dataTab"+i].style.display="none";
   }
  if(index < 4) {
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

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Payment Orders - FRB Full Detail<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_fed.jsp, EDD0677"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= fedBean.getE01DEABNK().trim()%>">
    <input type=HIDDEN name="E01DEAACD"  value="<%= fedBean.getE01DEAACD().trim()%>">
  </p>
  <p> <%= fedBean.getE01CNTNME().trim()%> </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="5" > 
              <div align="center">Transfer Number : 
                <input type="text" name="E01WRTLST" size="10" maxlength="6" value="<%= fedBean.getE01WRTLST().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Sender :</div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" name="E01POFSAB" size="10" maxlength="9" value="<%= fedBean.getE01POFSAB().trim()%>" >
              <input type="text" name="E01POFSNM" size="20" maxlength="18" value="<%= fedBean.getE01POFSNM().trim()%>" >
            </td>
            <td nowrap width="17%" > 
              <div align="right">Receiver :</div>
            </td>
            <td nowrap colspan="2" width="29%" > 
              <input type="text" name="E01POFRAB" size="10" maxlength="9" value="<%= fedBean.getE01POFRAB().trim()%>" >
              <input type="text" name="E01POFRNM" size="20" maxlength="18" value="<%= fedBean.getE01POFRNM().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Reference :</div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" name="E01POFSRF" size="20" maxlength="16" value="<%= fedBean.getE01POFSRF().trim()%>" >
            </td>
            <td nowrap width="17%" > 
              <div align="right">Type :</div>
            </td>
            <td nowrap colspan="2" width="29%" > 
              <input type="text" name="E01POFTPE" size="3" maxlength="2" value="<%= fedBean.getE01POFTPE().trim()%>" >
              <a href="javascript:GetCode('E01POFTPE','STATIC_pr_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Product Code :</div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" name="E01POFPRC" size="4" maxlength="3" value="<%= fedBean.getE01POFPRC().trim()%>" >
              <a href="javascript:GetCode('E01POFPRC','STATIC_pr_business.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
            </td>
            <td nowrap width="17%" > 
              <div align="right">Subtype :</div>
            </td>
            <td nowrap colspan="2" width="29%" > 
              <input type="text" name="E01POFSBT" size="3" maxlength="2" value="<%= fedBean.getE01POFSBT().trim()%>" >
              <a href="javascript:GetCode('E01POFSBT','STATIC_pr_subtypes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
        <table id="TableTab" cellspacing=0 cellpadding=0 width="100%">
          <tr> 
            <td nowrap valign="top" align="right"> 
              <table id="TableTabL" cellspacing=0 cellpadding=0 border="0" width="168">
                <tr> 
                  <td nowrap id="Tab0" class="tabhighlightl" onClick="showTab(0,'E01POFOTY')"> 
                    <div nowrap >Originator</div>
                  
                  <td> 
                </tr>
                <tr> 
                  <td nowrap id="Tab1" class="tabnormalv" onClick="showTab(1,'E01POFOFT')"> 
                    <div nowrap >Originator Bank</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab2" class="tabnormalv" onClick="showTab(2,'E01POFBTC')"> 
                    <div >Beneficiary</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab3" class="tabnormalv" onClick="showTab(3,'E01POFBFC')"> 
                    <div nowrap >Beneficiary Bank</div>
                  
                  <td> 
                </tr>
              </table>
            </td>
            <td id="colTab" align="center" class="tabdataleft"> 
              <div id="DataTab"> 
                <div id="dataTab0"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="23%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFOTY" size="2" maxlength="1" value="<%= fedBean.getE01POFOTY().trim()%>" >
                        <a href="javascript:GetCode('E01POFOTY','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="23%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFOID" size="35" maxlength="34" value="<%= fedBean.getE01POFOID().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="23%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFONM" size="35" maxlength="35" value="<%= fedBean.getE01POFONM().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="23%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFOD1" size="35" maxlength="35" value="<%= fedBean.getE01POFOD1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="23%" >&nbsp;</td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFOD2" size="35" maxlength="35" value="<%= fedBean.getE01POFOD2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="23%" >&nbsp;</td>
                      <td nowrap width="27%" > 
                        <input type="text" name="E01POFOD3" size="35" maxlength="35" value="<%= fedBean.getE01POFOD3().trim()%>" >
                      </td>
                    </tr>
                  </table> 
                </div>
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOFT" size="2" maxlength="1" value="<%= fedBean.getE01POFOFT().trim()%>" >
                        <a href="javascript:GetCode('E01POFOFT','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOFI" size="35" maxlength="34" value="<%= fedBean.getE01POFOFI().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOFN" size="35" maxlength="35" value="<%= fedBean.getE01POFOFN().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOF1" size="35" maxlength="35" value="<%= fedBean.getE01POFOF1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOF2" size="35" maxlength="35" value="<%= fedBean.getE01POFOF2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFOF3" size="35" maxlength="35" value="<%= fedBean.getE01POFOF3().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBTC" size="2" maxlength="1" value="<%= fedBean.getE01POFBTC().trim()%>" >
                        <a href="javascript:GetCode('E01POFBTC','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
                      </td>
                    </tr>
                    <tr> 
                      <td nowrap width="47%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBID" size="35" maxlength="34" value="<%= fedBean.getE01POFBID().trim()%>" >
                      </td>
                    </tr>
                    <tr> 
                      <td nowrap width="47%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBNM" size="35" maxlength="35" value="<%= fedBean.getE01POFBNM().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBA1" size="35" maxlength="35" value="<%= fedBean.getE01POFBA1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBA2" size="35" maxlength="35" value="<%= fedBean.getE01POFBA2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBA3" size="35" maxlength="35" value="<%= fedBean.getE01POFBA3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Reference :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBRF" size="18" maxlength="16" value="<%= fedBean.getE01POFBRF().trim()%>" >
                      </td>
                    </tr>
                  </table>
       </div>
                <div id="dataTab3" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBFC" size="2" maxlength="1" value="<%= fedBean.getE01POFBFC().trim()%>" >
                        <a href="javascript:GetCode('E01POFBFC','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBFD" size="35" maxlength="34" value="<%= fedBean.getE01POFBFD().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBFA" size="35" maxlength="35" value="<%= fedBean.getE01POFBFA().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBF1" size="35" maxlength="35" value="<%= fedBean.getE01POFBF1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIA22" size="35" maxlength="35" value="<%= fedBean.getE01POFBF2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFBF3" size="35" maxlength="35" value="<%= fedBean.getE01POFBF3().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab4" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFITC" size="2" maxlength="1" value="<%= fedBean.getE01POFITC().trim()%>" >
                        <a href="javascript:GetCode('E01POFITC','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" width="18" height="22" ></a> 
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIID" size="35" maxlength="34" value="<%= fedBean.getE01POFIID().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFINM" size="35" maxlength="35" value="<%= fedBean.getE01POFINM().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIA1" size="35" maxlength="35" value="<%= fedBean.getE01POFIA1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIA2" size="35" maxlength="35" value="<%= fedBean.getE01POFIA2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIA3" size="35" maxlength="35" value="<%= fedBean.getE01POFIA3().trim()%>" >
                      </td>
                    </tr>
                  </table>

                </div>
                <div id="dataTab5" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identification Code :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFITP" size="2" maxlength="1" value="<%= fedBean.getE01POFITP().trim()%>" >
                        <a href="javascript:GetCode('E01POFITP','STATIC_pr_institution_code.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a> 
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Identifier :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFITD" size="35" maxlength="34" value="<%= fedBean.getE01POFITD().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFITN" size="35" maxlength="35" value="<%= fedBean.getE01POFITN().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" > 
                        <div align="right">Address :</div>
                      </td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIT1" size="35" maxlength="35" value="<%= fedBean.getE01POFIT1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIT2" size="35" maxlength="35" value="<%= fedBean.getE01POFIT2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="47%" >&nbsp;</td>
                      <td nowrap width="53%" > 
                        <input type="text" name="E01POFIT3" size="35" maxlength="35" value="<%= fedBean.getE01POFIT3().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab6" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFOB1" size="40" maxlength="35" value="<%= fedBean.getE01POFOB1().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFOB2" size="40" maxlength="35" value="<%= fedBean.getE01POFOB2().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFOB3" size="40" maxlength="35" value="<%= fedBean.getE01POFOB3().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFOB4" size="40" maxlength="35" value="<%= fedBean.getE01POFOB4().trim()%>" >
                        </div>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab7" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFBB1" size="40" maxlength="35" value="<%= fedBean.getE01POFBB1().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFBB2" size="40" maxlength="35" value="<%= fedBean.getE01POFBB2().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFBB3" size="40" maxlength="35" value="<%= fedBean.getE01POFBB3().trim()%>" >
                        </div>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap colspan="3" > 
                        <div align="center"> 
                          <input type="text" name="E01POFBB4" size="40" maxlength="35" value="<%= fedBean.getE01POFBB4().trim()%>" >
                        </div>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </td>
            <td nowrap valign=top> 
              <table id="TableTabR" cellspacing=0 cellpadding=0 border="0" width="204">
                <tr > 
                  <td nowrap id="Tab4" class="tabnormalv" onClick="showTab(4,'E01POFITC')"> 
                    <div nowrap align="right" >Intermediary Bank</div>
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab5" class="tabnormalv" onClick="showTab(5,'E01POFITP')"> 
                    <div nowrap align="right" >Instructing Bank</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab6" class="tabnormalv" onClick="showTab(6,'E01POFOB1')"> 
                    <div nowrap align="right" >Originator / Beneficiary Information</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab7" class="tabnormalv" onClick="showTab(7,'E01POFBB1')"> 
                    <div nowrap align="right" >Bank to Bank Information</div>
                  <td> 
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <h4>Stand Alone Orders</h4>
  <div id ="MT202"> 
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Last Payment Date :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01PODLDT" size="3" maxlength="2" value="<%= fedBean.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT2" size="3" maxlength="2" value="<%= fedBean.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT3" size="3" maxlength="2" value="<%= fedBean.getE01PODLDT().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap > 
                <div align="right">Number :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFLPN" size="5" maxlength="4" value="<%= fedBean.getE01POFLPN().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Amount :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFLPA" size="14" maxlength="13" value="<%= fedBean.getE01POFLPA().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap > 
                <div align="right">Reference :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01LSTREF" size="8" maxlength="7" value="<%= fedBean.getE01LSTREF().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right"></div>
              </td>
              <td nowrap colspan="3" >&nbsp; </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Amount :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFAMN" size="14" maxlength="13" value="<%= fedBean.getE01POFAMN().trim()%>" >
                <input type="text" name="E01POSAM2" size="3" maxlength="2" value="<%= fedBean.getE01POSAM2().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Debit Account :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFDBR" size="4" maxlength="3" value="<%= fedBean.getE01POFDBR().trim()%>" >
                <input type="text" name="E01POFDCY" size="4" maxlength="3" value="<%= fedBean.getE01POFDCY().trim()%>" >
                <input type="text" name="E01POFDGL" size="14" maxlength="12" value="<%= fedBean.getE01POFDGL().trim()%>" >
                <input type="text" name="E01POFDAC" size="10" maxlength="9" value="<%= fedBean.getE01POFDAC().trim()%>" >
                <input type="text" name="E01POFDSB" size="6" maxlength="5" value="<%= fedBean.getE01POFDSB().trim()%>" >
                <input type="text" name="E01POFDCS" size="7" maxlength="6" value="<%= fedBean.getE01POFDCS().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Credit Account :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFCBR" size="4" maxlength="3" value="<%= fedBean.getE01POFCBR().trim()%>" >
                <input type="text" name="E01POFCCY" size="4" maxlength="3" value="<%= fedBean.getE01POFCCY().trim()%>" >
                <input type="text" name="E01POFCGL" size="14" maxlength="12" value="<%= fedBean.getE01POFCGL().trim()%>" >
                <input type="text" name="E01POFCAC" size="10" maxlength="9" value="<%= fedBean.getE01POFCAC().trim()%>" >
                <input type="text" name="E01POFCSB" size="6" maxlength="5" value="<%= fedBean.getE01POSCSB().trim()%>" >
                <input type="text" name="E01POFCCS" size="7" maxlength="6" value="<%= fedBean.getE01POFCCS().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Payment Frequency :</div>
              </td>
              <td nowrap colspan="3" > 
                <select name="E01POFFRQ">
                  <option value=" " <% if (!(fedBean.E01POFFRQ().equals("D") ||fedBean.getE01POFFRQ().equals("M")||fedBean.getE01POFFRQ().equals("W")||fedBean.getE01POFFRQ().equals("V"))) out.print("selected"); %>></option>
                  <option value="D" <% if(fedBean.getE01POFFRQ().equals("D")) out.print("selected");%>>Daily</option>
                  <option value="W" <% if(fedBean.getE01POFFRQ().equals("W")) out.print("selected");%>>Weakly</option>
                  <option value="M" <% if(fedBean.getE01POFFRQ().equals("M")) out.print("selected");%>>Monthly</option>
				  <option value="V" <% if(fedBean.getE01POFFRQ().equals("V")) out.print("selected");%>>Variable</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right"> Payment Day :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFPMD" size="3" maxlength="2" value="<%= fedBean.getE01POFPMD().trim()%>" >
                <a href="javascript:GetCode('E01POFPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a> 
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right"> or Number or Days :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFDYS" size="4" maxlength="3" value="<%= fedBean.getE01POFDYS().trim()%>" >
                ( For Variable Payment Frequency Only) </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Number of Payments :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POFNPM" size="6" maxlength="4" value="<%= fedBean.getE01POFNPM().trim()%>" >
                (9999 = Indefinite) </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Payment Type :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POFPMT" value="F" 
              <%if(fedBean.getE01POFPMT().equals("F")) out.print("checked");%> checked>
                Fixed 
                <input type="radio" name="E01POFPMT" value="V" 
              <%if(fedBean.getE01POFPMT().equals("V")) out.print("checked");%>>
                Variable </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Overdraft Authorization :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POFODA" value="Y" 
              <%if(fedBean.getE01POFODA().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POFODA" value="N" 
              <%if(cdTransac.getE01POFODA().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Suspend Payment :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POFSPM" value="Y" 
              <%if(fedBean.getE01POFSPM().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POFSPM" value="N" 
              <%if(cdTransac.getE01POFSPM().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" height="35" > 
                <div align="right">Reflect on Statement :</div>
              </td>
              <td nowrap colspan="3" height="35" > 
                <input type="text" name="E01POFDAS" size="6" maxlength="4" value="<%= fedBean.getE01POFDAS().trim()%>" >
                (Days) </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
 
    <SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
<br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>  </form>
</body>
</html>
