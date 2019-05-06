<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="swift" class="datapro.eibs.beans.ESWF10002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>



<SCRIPT Language="Javascript">
<%
if ( userPO.getHeader16().equals("N") ) {
%>
	builtNewMenu(cp_bo_act_opt);
<%   
} 
else {
%>  
   builtNewMenu(cp_bo_opt);
<%}%>
 </SCRIPT>



</head>
<body nowrap>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">MT 320 Confirmation Message<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="ln_basic.jsp,EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120B" >
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> <%= swift.getE02SWFNA1()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > <%= swift.getE02SWFNA2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > <%= swift.getE02SWFNA3()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Basic Information </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Transaction Reference Number :</div>
            </td>
            <td nowrap ><%= swift.getE02SWFREF()%></td>
            <td nowrap > 
              <div align="right">Related Reference :</div>
            </td>
            <td nowrap ><%= swift.getE02SWFRLR()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Amount :</div>
            </td>
            <td nowrap width="23%" ><%= Util.fcolorCCY(swift.getE02SWFPRI())%> 
            </td>
            <td nowrap width="18%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="20%" ><%= swift.getE02SWFCCY().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Sender Swift ID :</div>
            </td>
            <td nowrap width="23%" ><%= swift.getE02SWFSID()%> </td>
            <td nowrap width="18%" > 
              <div align="right">Receiver Swift ID :</div>
            </td>
            <td nowrap width="20%"><%= swift.getE02SWFRID()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4> 
    <h4> 
      <h4> 
        <h4> 
          <h4>Sequence A : General Information</h4>
          <table  class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellpadding=2 cellspacing=0 width="100%" border="0">
                  <tr id="trdark"> 
                    <td nowrap width="17%" > 
                      <div align="right">New Sequence :</div>
                    </td>
                    <td nowrap colspan="2" > 
                      <div align="center"></div>
                      <%= swift.getE02SWFSQA()%></td>
                    <td nowrap width="23%" > 
                      <div align="right">Sender's Reference :</div>
                    </td>
                    <td nowrap width="24%" > 
                      <div align="center"><%= swift.getE02SWFREF()%></div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="17%" > 
                      <div align="right">Type of Operation :</div>
                    </td>
                    <td nowrap colspan="2" > 
                      <div align="center"></div>
                      <div align="left"> <%= swift.getE02SWFTOP()%> </div>
                    </td>
                    <td nowrap width="23%" > 
                      <div align="right">Related Reference :</div>
                    </td>
                    <td nowrap width="24%"> 
                      <div align="center"><%= swift.getE02SWFRLR()%></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="17%" > 
                      <div align="right">Type of Event :</div>
                    </td>
                    <td nowrap colspan="2" > 
                      <div align="left"></div>
                      <div align="left"> <%= swift.getE02SWFTEV()%> </div>
                    </td>
                    <td nowrap width="23%" > 
                      <div align="right">Common Reference :</div>
                    </td>
                    <td nowrap width="24%"> 
                      <div align="center"><%= swift.getE02SWFCRF()%></div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="17%" > 
                      <div align="right">Party A :</div>
                    </td>
                    <td nowrap colspan="4" > 
                      <div align="left"> 
                        <input type="text" readonly  name="E01SWFIN13" size="4" maxlength="2" value="<%= swift.getE02SWFPAO()%>" 
			  >
                        <input type="text" readonly  name="E01SWFIN1" size="40" maxlength="35" value="<%= swift.getE02SWFPTA()%>" 
			  >
                      </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="17%" > 
                      <div align="right">Party B :</div>
                    </td>
                    <td nowrap colspan="4" > 
                      <div align="left"> 
                        <input type="text" readonly  name="E01SWFIN132" size="4" maxlength="2" value="<%= swift.getE02SWFPBO()%>" 
			  >
                        <input type="text" readonly  name="E01SWFIN12" size="40" maxlength="35" value="<%= swift.getE02SWFPTB()%>" 
			  >
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <h4>Sequence B : Transaction Detail</h4>
          <table  class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellpadding=2 cellspacing=0 width="100%" border="0">
                  <tr id="trdark"> 
                    <td nowrap width="22%" > 
                      <div align="right">New Sequence :</div>
                    </td>
                    <td nowrap width="32%" ><%= swift.getE02SWFSQB()%></td>
                    <td nowrap width="18%" >&nbsp;</td>
                    <td nowrap width="28%" >&nbsp;</td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="22%" > 
                      <div align="right">Party's A Role :</div>
                    </td>
                    <td nowrap width="32%" > <%= swift.getE02SWFPRL()%> </td>
                    <td nowrap width="18%" > 
                      <div align="right">Trade Date :</div>
                    </td>
                    <td nowrap width="28%" > <%= Util.formatDate(swift.getE02SWFTD1(),swift.getE02SWFTD2(),swift.getE02SWFTD3())%> 
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="22%" > 
                      <div align="right">Principal Amount :</div>
                    </td>
                    <td nowrap width="32%" > 
                      <div align="left"> <%= Util.fcolorCCY(swift.getE02SWFPRI())%> 
                      </div>
                    </td>
                    <td nowrap width="18%" > 
                      <div align="right">Value Date :</div>
                    </td>
                    <td nowrap width="28%"> 
                      <div align="left"> <%= Util.formatDate(swift.getE02SWFVD1(),swift.getE02SWFVD2(),swift.getE02SWFVD3())%> 
                      </div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="22%" > 
                      <div align="right">Interest Amount :</div>
                    </td>
                    <td nowrap width="32%" > 
                      <div align="left"> <%= Util.fcolorCCY(swift.getE02SWFINT())%> 
                      </div>
                    </td>
                    <td nowrap width="18%" > 
                      <div align="right">Maturity Date :</div>
                    </td>
                    <td nowrap width="28%"> 
                      <div align="left"> <%= Util.formatDate(swift.getE02SWFMD1(),swift.getE02SWFMD2(),swift.getE02SWFMD3())%> 
                      </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="22%" > 
                      <div align="right">Interest Rate :</div>
                    </td>
                    <td nowrap width="32%" > 
                      <div align="left"> <%= swift.getE02SWFRTE()%> </div>
                    </td>
                    <td nowrap align="right" width="18%"> 
                      <div align="right">Next Interest Due Date :</div>
                    </td>
                    <td nowrap width="28%"> 
                      <div align="left"> <%= Util.formatDate(swift.getE02SWFID1(),swift.getE02SWFID2(),swift.getE02SWFID3())%> 
                      </div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="22%" > 
                      <div align="right">Days Count :</div>
                    </td>
                    <td nowrap width="32%" ><%= swift.getE02SWFDYS()%></td>
                    <td nowrap align="right" width="18%">&nbsp;</td>
                    <td nowrap width="28%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <h4>Sequence C : Settlement Instructions for Amounts Payable by Party 
            A </h4>
        </h4>
      </h4>
    </h4>
  </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="left">New Sequence : <%= swift.getE02SWFSQC()%></div>
            </td>
            <td nowrap width="46%" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="left">Delivery Agent 53</div>
            </td>
            <td nowrap width="46%" > 
              <div align="left">Receiving Agent 57</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1322" size="4" maxlength="2" value="<%= swift.getE02SWFADO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122" size="40" maxlength="35" value="<%= swift.getE02SWFAD1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN13222" size="4" maxlength="2" value="<%= swift.getE02SWFARO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN1225" size="40" maxlength="35" value="<%= swift.getE02SWFAR1()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1222" size="40" maxlength="35" value="<%= swift.getE02SWFAD2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12252" size="40" maxlength="35" value="<%= swift.getE02SWFAR2()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1223" size="40" maxlength="35" value="<%= swift.getE02SWFAD3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12253" size="40" maxlength="35" value="<%= swift.getE02SWFAR3()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224" size="40" maxlength="35" value="<%= swift.getE02SWFAD4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12254" size="40" maxlength="35" value="<%= swift.getE02SWFAR4()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" >Intermediary 56</td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN132222" size="4" maxlength="2" value="<%= swift.getE02SWFAIO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN12242" size="40" maxlength="35" value="<%= swift.getE02SWFAI1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN122422" size="40" maxlength="35" value="<%= swift.getE02SWFAI2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN122423" size="40" maxlength="35" value="<%= swift.getE02SWFAI3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN122424" size="40" maxlength="35" value="<%= swift.getE02SWFAI4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Sequence D : Settlement Instructions for Amounts Payable by Party B </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="left">New Sequence :<%= swift.getE02SWFSQD()%></div>
            </td>
            <td nowrap width="46%" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="left">Delivery Agent 53</div>
            </td>
            <td nowrap width="46%" > 
              <div align="left">Receiving Agent 57</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1322222" size="4" maxlength="2" value="<%= swift.getE02SWFBDO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122425" size="40" maxlength="35" value="<%= swift.getE02SWFBD1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN132222222" size="4" maxlength="2" value="<%= swift.getE02SWFBRO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122425542" size="40" maxlength="35" value="<%= swift.getE02SWFBR1()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224252" size="40" maxlength="35" value="<%= swift.getE02SWFBD2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255422" size="40" maxlength="35" value="<%= swift.getE02SWFBR2()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224253" size="40" maxlength="35" value="<%= swift.getE02SWFBD3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255423" size="40" maxlength="35" value="<%= swift.getE02SWFBR3()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224254" size="40" maxlength="35" value="<%= swift.getE02SWFBD4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255424" size="40" maxlength="35" value="<%= swift.getE02SWFBR4()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2" >Intermediary 56</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN13222222" size="4" maxlength="2" value="<%= swift.getE02SWFBIO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN1224255" size="40" maxlength="35" value="<%= swift.getE02SWFBI1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242552" size="40" maxlength="35" value="<%= swift.getE02SWFBI2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242553" size="40" maxlength="35" value="<%= swift.getE02SWFBI3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242554" size="40" maxlength="35" value="<%= swift.getE02SWFBI4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
