<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment Orders Swift MT 100 Message</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="swiftMT200" class="datapro.eibs.beans.EDL013001Message"  scope="session" />

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

<h3 align="center">Payment Orders - Swift Format M-200<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_swift_m200.jsp, EDD0672"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= swiftMT200.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD"  value="<%= swiftMT200.getE01DEAACD().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Swift Identification :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01POSSID" size="12" maxlength="12" value="<%= swiftMT200.getE01POSSID().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Priority :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="radio" name="E01POSPR1" value="0" 
              <%if(swiftMT200.getE01POSPR1().equals("1")) out.print("checked");%> checked>
                01 
                <input type="radio" name="E01POSPR1" value="5" 
              <%if(cdTransac.getE01POSPR1().equals("2")) out.print("checked");%>>
                02 </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>SWIFT MT 200</h4>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
        <table id="TableTab" cellspacing=0 cellpadding=0 width="95%">
          <tr> 
            <td nowrap valign="top" align="right"> 
              <table id="TableTabL" cellspacing=0 cellpadding=0 border="0" width="168">
                <tr> 
                  <td nowrap id="Tab0" class="tabhighlightl" onClick="showTab(0,'E01POSRC1')"> 
                    <div nowrap >Receiver Swift Address</div>
                  <td> 
                </tr>
                <tr> 
                  <td nowrap id="Tab1" class="tabnormalv" onClick="showTab(1,'E01POSSC1')"> 
                    <div nowrap >Sender's Correspondant Bank</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab2" class="tabnormalv" onClick="showTab(2,'E01POSOBO')"> 
                    <div >Intermediary Bank </div>
                  
                  <td> 
                </tr>
              </table>
            </td>
            <td id="colTab" align="center" class="tabdataleft"> 
              <div id="DataTab"> 
                <div id="dataTab0"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap > 
                        <div align="right">Receiver Swift Address :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSRC1" size="35" maxlength="35" value="<%= swiftMT200.getE01POSRC1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap > 
                        <div align="right">Receiver :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSRC2" size="35" maxlength="35" value="<%= swiftMT200.getE01POSRC2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap > 
                        <div align="right">City and Country :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSRC3" size="35" maxlength="35" value="<%= swiftMT200.getE01POSRC3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap > 
                        <div align="right"></div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSRC4" size="35" maxlength="35" value="<%= swiftMT200.getE01POSRC4().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap > 
                        <div align="right"></div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSRC5" size="35" maxlength="35" value="<%= swiftMT200.getE01POSRC5().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Sender's Correspondant Bank 53. :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" width="54%" > 
                        <input type="text" name="E01POSSC1" size="35" maxlength="35" value="<%= swiftMT200.getE01POSSC1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">A :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" width="54%" > 
                        <input type="text" name="E01POSSC2" size="35" maxlength="35" value="<%= swiftMT200.getE01POSSC2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">D :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" width="54%" > 
                        <input type="text" name="E01POSSC3" size="35" maxlength="35" value="<%= swiftMT200.getE01POSSC3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" >&nbsp;</td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" width="54%" > 
                        <input type="text" name="E01POSSC4" size="35" maxlength="35" value="<%= swiftMT200.getE01POSSC4().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Intermediary Bank 56 A :</div>
                      </td>
                      <td nowrap width="5%" > 
                        <input type="text" name="E01POSOBO" size="2" maxlength="1" value="<%= swiftMT100.getE01POSOBO().trim()%>" >
                      </td>
                      <td nowrap colspan="3" width="51%" > 
                        <input type="text" name="E01POSIN1" size="35" maxlength="35" value="<%= swiftMT200.getE01POSIN1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">D :</div>
                      </td>
                      <td nowrap width="5%" >&nbsp; </td>
                      <td nowrap colspan="3" width="51%" > 
                        <input type="text" name="E01POSIN2" size="35" maxlength="35" value="<%= swiftMT200.getE01POSIN2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right"></div>
                      </td>
                      <td nowrap width="5%" >&nbsp; </td>
                      <td nowrap colspan="3" width="51%" > 
                        <input type="text" name="E01POSIN3" size="35" maxlength="35" value="<%= swiftMT200.getE01POSIN3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" >&nbsp;</td>
                      <td nowrap width="5%" >&nbsp;</td>
                      <td nowrap colspan="3" width="51%" > 
                        <input type="text" name="E01POSIN4" size="35" maxlength="35" value="<%= swiftMT200.getE01POSIN4().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab3" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right"> Account with Bank M 57 :</div>
                      </td>
                      <td nowrap width="2%" > 
                        <input type="text" name="E01POSSCO" size="2" maxlength="1" value="<%= swiftMT100.getE01POSSCO().trim()%>" >
                      </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBB1" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBB1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right">A :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBB2" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBB2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right">B :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBB3" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBB3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" >
                        <div align="right">D :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBB4" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBB4().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab4" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right">Bank to Bank Information 72 :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBK1" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBK1().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right"></div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBK2" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBK2().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" > 
                        <div align="right"></div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBK3" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBK3().trim()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="45%" >&nbsp;</td>
                      <td nowrap width="2%" >&nbsp;</td>
                      <td nowrap colspan="3" > 
                        <input type="text" name="E01POSBK4" size="35" maxlength="35" value="<%= swiftMT200.getE01POSBK4().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </td>
            <td nowrap valign=top> 
              <table id="TableTabR" cellspacing=0 cellpadding=0 border="0" width="168">
                <tr > 
                  <td nowrap id="Tab3" class="tabnormalv" onClick="showTab(3,'E01POSSCO')"> 
                    <div nowrap align="right" >Account with Bank</div>
                  
                  <td> 
                </tr>
                <tr > 
                  <td nowrap id="Tab4" class="tabnormalv" onClick="showTab(4,'E01POSBK1')"> 
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
  <h4>Stand Alone Orders</h4>
      <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Last Payment Date :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01PODLDT" size="3" maxlength="2" value="<%= swiftMT200.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT2" size="3" maxlength="2" value="<%= swiftMT200.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT3" size="3" maxlength="2" value="<%= swiftMT200.getE01PODLDT().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Number :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSLPN" size="5" maxlength="4" value="<%= swiftMT200.getE01POSLPN().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Amount :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSLPA" size="14" maxlength="13" value="<%= swiftMT200.getE01POSLPA().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Reference :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01LSTREF" size="8" maxlength="7" value="<%= swiftMT200.getE01LSTREF().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right"></div>
              </td>
              <td nowrap colspan="3" width="60%" >&nbsp; </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Amount :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSAM1" size="14" maxlength="13" value="<%= swiftMT200.getE01POSAM1().trim()%>" >
                <input type="text" name="E01POSAM2" size="3" maxlength="2" value="<%= swiftMT200.getE01POSAM2().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Debit Account :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSDBR" size="4" maxlength="3" value="<%= swiftMT200.getE01POSDBR().trim()%>" >
                <input type="text" name="E01POSDCY" size="4" maxlength="3" value="<%= swiftMT200.getE01POSDCY().trim()%>" >
                <input type="text" name="E01POSDGL" size="14" maxlength="12" value="<%= swiftMT200.getE01POSDGL().trim()%>" >
                <input type="text" name="E01POSDAC" size="10" maxlength="9" value="<%= swiftMT200.getE01POSDAC().trim()%>" >
                <input type="text" name="E01POSDSB" size="6" maxlength="5" value="<%= swiftMT200.getE01POSDSB().trim()%>" >
                <input type="text" name="E01POSDCS" size="7" maxlength="6" value="<%= swiftMT200.getE01POSDCS().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Credit Account :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSCBR" size="4" maxlength="3" value="<%= swiftMT200.getE01POSCBR().trim()%>" >
                <input type="text" name="E01POSCCY" size="4" maxlength="3" value="<%= swiftMT200.getE01POSCCY().trim()%>" >
                <input type="text" name="E01POSCGL" size="14" maxlength="12" value="<%= swiftMT200.getE01POSCGL().trim()%>" >
                <input type="text" name="E01POSCAC" size="10" maxlength="9" value="<%= swiftMT200.getE01POSCAC().trim()%>" >
                <input type="text" name="E01POSCSB" size="6" maxlength="5" value="<%= swiftMT200.getE01POSCSB().trim()%>" >
                <input type="text" name="E01POSCCS" size="7" maxlength="6" value="<%= swiftMT200.getE01POSCCS().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Payment Frequency :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <select name="E01POSFRQ">
                  <option value=" " <% if (!(swiftMT200.E01POSFRQ().equals("D") ||swiftMT200.getE01DLCTP1().equals("M")||swiftMT200.getE01DLCTP1().equals("W")||swiftMT200.getE01DLCTP1().equals("V"))) out.print("selected"); %>></option>
                  <option value="D" <% if(swiftMT200.getE01POSFRQ().equals("D")) out.print("selected");%>>Daily</option>
                  <option value="W" <% if(swiftMT200.getE01POSFRQ().equals("W")) out.print("selected");%>>Weakly</option>
                  <option value="M" <% if(swiftMT200.getE01POSFRQ().equals("M")) out.print("selected");%>>Monthly</option>
				  <option value="V" <% if(swiftMT200.getE01POSFRQ().equals("V")) out.print("selected");%>>Variable</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right"> Payment Day :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSPMD" size="3" maxlength="2" value="<%= swiftMT200.getE01POSPMD().trim()%>" >
                <a href="javascript:GetCode('E01POSPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a> 
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right"> or Number or Days :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSDYS" size="4" maxlength="3" value="<%= swiftMT200.getE01POSDYS().trim()%>" >
                ( For Variable Payment Frequency Only) </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Number of Payments :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="text" name="E01POSNPM" size="6" maxlength="4" value="<%= swiftMT200.getE01POSNPM().trim()%>" >
                (9999 = Indefinite) </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Payment Type :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="radio" name="E01POSPMT" value="F" 
              <%if(swiftMT200.getE01POSPMT().equals("F")) out.print("checked");%> checked>
                Fixed 
                <input type="radio" name="E01POSPMT" value="V" 
              <%if(swiftMT200.getE01POSPMT().equals("V")) out.print("checked");%>>
                Variable </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" > 
                <div align="right">Overdraft Authorization :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="radio" name="E01POSODA" value="Y" 
              <%if(swiftMT200.getE01POSODA().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POSODA" value="N" 
              <%if(cdTransac.getE01POSODA().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="40%" > 
                <div align="right">Suspend Payment :</div>
              </td>
              <td nowrap colspan="3" width="60%" > 
                <input type="radio" name="E01POSSPM" value="Y" 
              <%if(swiftMT200.getE01POSSPM().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POSSPM" value="N" 
              <%if(cdTransac.getE01POSSPM().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="40%" height="35" > 
                <div align="right">Reflect on Statement :</div>
              </td>
              <td nowrap colspan="3" height="35" width="60%" > 
                <input type="text" name="E01POSDAS" size="6" maxlength="4" value="<%= swiftMT200.getE01POSDAS().trim()%>" >
                ( Days) </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

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
  </div>
  </form>
</body>
</html>
