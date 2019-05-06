<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="swift" class="datapro.eibs.beans.ESWF10003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(fra_inq_opt);
   
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
<h3 align="center">MT 340 Confirmation Message<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="fe_fra_format_inq.jsp, ESWF340"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340" >
  <input type=HIDDEN name="SCREEN" value="4">
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Counterparty :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> <%= swift.getE03SWFNA1()%> </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%" >
              <div align="right"><b>Location :</b></div>
            </td>
            <td nowrap colspan="3" width="85%" > <%= swift.getE03SWFNA2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" width="85%" > <%= swift.getE03SWFNA3()%> </td>
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
            <td nowrap ><%= swift.getE03SWFREF()%></td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Notional Amount :</div>
            </td>
            <td nowrap width="23%" ><%= Util.fcolorCCY(swift.getE03SWFPRI())%> 
            </td>
            <td nowrap width="18%" > 
              <div align="right">Currency :</div>
            </td>
            <td nowrap width="20%" ><%= swift.getE03SWFCCY().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Sender Swift ID :</div>
            </td>
            <td nowrap width="23%" ><%= swift.getE03SWFSID()%> </td>
            <td nowrap width="18%" > 
              <div align="right">Receiver Swift ID :</div>
            </td>
            <td nowrap width="20%"><%= swift.getE03SWFRID()%> </td>
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
                      <div align="right">Type of Operation 22 A :</div>
                    </td>
                    <td nowrap > 
                      <div align="left"> 
                        <select name="E03SWFTOP" disabled>
                          <option value=" " <% if (!(swift.getE03SWFTOP().equals("AMND") ||swift.getE03SWFTOP().equals("CANC")||swift.getE03SWFTOP().equals("DUPL")
					||swift.getE03SWFTOP().equals("EXOP") ||swift.getE03SWFTOP().equals("NEWT"))) out.print("selected"); %>></option>
                          <option value="AMND" <% if(swift.getE03SWFTOP().equals("AMND")) out.print("selected");%>>AMND</option>
                          <option value="CANC" <% if(swift.getE03SWFTOP().equals("CANC")) out.print("selected");%>>CANC</option>
                          <option value="DUPL" <% if(swift.getE03SWFTOP().equals("DUPL")) out.print("selected");%>>DUPL</option>
                          <option value="EXOP" <% if(swift.getE03SWFTOP().equals("EXOP")) out.print("selected");%>>EXOP</option>
                          <option value="NEWT" <% if(swift.getE03SWFTOP().equals("NEWT")) out.print("selected");%>>NEWT</option>
                        </select>
                      </div>
                    </td>
                    <td nowrap width="23%" > 
                      <div align="right">Period :</div>
                    </td>
                    <td nowrap width="24%" > <%= swift.getE03SWFSQB()%></td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="17%" > 
                      <div align="right">Common Reference 22 C :</div>
                    </td>
                    <td nowrap > 
                      <div align="center"></div>
                      <div align="left"><%= swift.getE03SWFCRF()%> </div>
                    </td>
                    <td nowrap width="23%" > 
                      <div align="right">Related Reference 21 :</div>
                    </td>
                    <td nowrap width="24%"> <%= swift.getE03SWFRLR()%></td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="17%" > 
                      <div align="right">23D Type :</div>
                    </td>
                    <td nowrap colspan="3" > 
                      <div align="left"></div>
                      <div align="left"><%= swift.getE03SWFSQA()%> </div>
                      </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="17%" > 
                      <div align="right">Party A 82 :</div>
                    </td>
                    <td nowrap colspan="3" > 
                      <div align="left"> 
                        <input type="text" readonly  name="E01SWFIN13" size="4" maxlength="2" value="<%= swift.getE03SWFPAO()%>" 
			  >
                        <input type="text" readonly  name="E01SWFIN1" size="40" maxlength="35" value="<%= swift.getE03SWFPTA()%>" 
			  >
                      </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="17%" > 
                      <div align="right">Party B 87 :</div>
                    </td>
                    <td nowrap colspan="3" > 
                      <div align="left"> 
                        <input type="text" readonly  name="E01SWFIN132" size="4" maxlength="2" value="<%= swift.getE03SWFPBO()%>" 
			  >
                        <input type="text" readonly  name="E01SWFIN12" size="40" maxlength="35" value="<%= swift.getE03SWFPTB()%>" 
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
                      <div align="right">Principal Amount 32 B :</div>
                    </td>
                    <td nowrap width="32%" ><%= Util.fcolorCCY(swift.getE03SWFPRI())%></td>
                    <td nowrap width="18%" > 
                      <div align="right">Effective Date 30 F :</div>
                    </td>
                    <td nowrap width="28%" > 
                      <div align="left"><%= Util.formatDate(swift.getE03SWFTD1(),swift.getE03SWFTD2(),swift.getE03SWFTD3())%></div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td nowrap width="22%" > 
                      <div align="right">Fixed Rate 37 M :</div>
                    </td>
                    <td nowrap width="32%" ><%= swift.getE03SWFRTE()%></td>
                    <td nowrap width="18%" > 
                      <div align="right">Termination Date 30 P :</div>
                    </td>
                    <td nowrap width="28%" > 
                      <div align="left"><%= Util.formatDate(swift.getE03SWFVD1(),swift.getE03SWFVD2(),swift.getE03SWFVD3())%></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="22%" > 
                      <div align="right">Days Count 14 D :</div>
                    </td>
                    <td nowrap width="32%" > 
                      <div align="left"><%= swift.getE03SWFSQC()%></div>
                    </td>
                    <td nowrap width="18%" > 
                      <div align="right"></div>
                    </td>
                    <td nowrap width="28%"> 
                      <div align="left"></div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <h4>Sequence C</h4>
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
              <div align="left">Delivery Agent 53</div>
            </td>
            <td nowrap width="46%" >Receiving Agent 57 </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1322" size="4" maxlength="2" value="<%= swift.getE03SWFADO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122" size="40" maxlength="35" value="<%= swift.getE03SWFAD1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN13222" size="4" maxlength="2" value="<%= swift.getE03SWFARO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN1225" size="40" maxlength="35" value="<%= swift.getE03SWFAR1()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1222" size="40" maxlength="35" value="<%= swift.getE03SWFAD2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12252" size="40" maxlength="35" value="<%= swift.getE03SWFAR2()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1223" size="40" maxlength="35" value="<%= swift.getE03SWFAD3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12253" size="40" maxlength="35" value="<%= swift.getE03SWFAR3()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224" size="40" maxlength="35" value="<%= swift.getE03SWFAD4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12254" size="40" maxlength="35" value="<%= swift.getE03SWFAR4()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="left">Intermediary 56 </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN132222" size="4" maxlength="2" value="<%= swift.getE03SWFAIO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN12242" size="40" maxlength="35" value="<%= swift.getE03SWFAI1()%>" 
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
                <input type="text" readonly  name="E01SWFIN122422" size="40" maxlength="35" value="<%= swift.getE03SWFAI2()%>" 
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
                <input type="text" readonly  name="E01SWFIN122423" size="40" maxlength="35" value="<%= swift.getE03SWFAI3()%>" 
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
                <input type="text" readonly  name="E01SWFIN122424" size="40" maxlength="35" value="<%= swift.getE03SWFAI4()%>" 
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
  
          
  <h4>Sequence D</h4>
          <table  class="tableinfo">
            <tr > 
              <td nowrap> 
                
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="left">Delivery Agent 53</div>
            </td>
            <td nowrap width="46%" >Receiving Agent 57 </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1322222" size="4" maxlength="2" value="<%= swift.getE03SWFBDO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122425" size="40" maxlength="35" value="<%= swift.getE03SWFBD1()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN132222222" size="4" maxlength="2" value="<%= swift.getE03SWFBRO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN122425542" size="40" maxlength="35" value="<%= swift.getE03SWFBR1()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224252" size="40" maxlength="35" value="<%= swift.getE03SWFBD2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255422" size="40" maxlength="35" value="<%= swift.getE03SWFBR2()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224253" size="40" maxlength="35" value="<%= swift.getE03SWFBD3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255423" size="40" maxlength="35" value="<%= swift.getE03SWFBR3()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224254" size="40" maxlength="35" value="<%= swift.getE03SWFBD4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="46%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN1224255424" size="40" maxlength="35" value="<%= swift.getE03SWFBR4()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="left">Intermediary 56</div>
            </td>
            <td nowrap width="46%" > 
              <div align="left">Beneficiary 58 </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN13222222" size="4" maxlength="2" value="<%= swift.getE03SWFBIO()%>" 
			  >
                <input type="text" readonly  name="E01SWFIN1224255" size="40" maxlength="35" value="<%= swift.getE03SWFBI1()%>" 
			  >
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
                <input type="text" readonly  name="E03SWFBBO" size="4" maxlength="2" value="<%= swift.getE03SWFBBO()%>" 
			  >
                <input type="text" readonly  name="E01SWFBB1" size="40" maxlength="35" value="<%= swift.getE03SWFBB1()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242552" size="40" maxlength="35" value="<%= swift.getE03SWFBI2()%>" 
			  >
              </div>
            </td>
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFBB2" size="40" maxlength="35" value="<%= swift.getE03SWFBB2()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242553" size="40" maxlength="35" value="<%= swift.getE03SWFBI3()%>" 
			  >
              </div>
            </td>
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFBB3" size="40" maxlength="35" value="<%= swift.getE03SWFBB3()%>" 
			  >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFIN12242554" size="40" maxlength="35" value="<%= swift.getE03SWFBI4()%>" 
			  >
              </div>
            </td>
            <td nowrap width="54%" > 
              <div align="right"> 
                <input type="text" readonly  name="E01SWFBB4" size="40" maxlength="35" value="<%= swift.getE03SWFBB4()%>" 
			  >
              </div>
            </td>
          </tr>
        </table>
              </td>
            </tr>
          </table>
     
  </form>
</body>
</html>
