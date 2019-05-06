<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment Orders Swift MT 100 Message</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="telexBean" class="datapro.eibs.beans.EDL013001Message"  scope="session" />

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

<h3 align="center">Payment Orders - Internal Transfers<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_transfer.jsp, EDD0675"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01POTCHB"  value="<%= telexBean.getE01POTCHB().trim()%>">
  <input type=HIDDEN name="E01POTCHO"  value="<%= telexBean.getE01POTCHO().trim()%>">
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
                <input type="text" name="E01PODLDT" size="3" maxlength="2" value="<%= telexBean.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT2" size="3" maxlength="2" value="<%= telexBean.getE01PODLDT().trim()%>" >
                <input type="text" name="E01PODLDT3" size="3" maxlength="2" value="<%= telexBean.getE01PODLDT().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap > 
                <div align="right">Number :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSLPN" size="5" maxlength="4" value="<%= telexBean.getE01POSLPN().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Amount :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSLPA" size="14" maxlength="13" value="<%= telexBean.getE01POSLPA().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap > 
                <div align="right">Reference :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01LSTREF" size="8" maxlength="7" value="<%= telexBean.getE01LSTREF().trim()%>" >
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
                <input type="text" name="E01POSAM1" size="14" maxlength="13" value="<%= telexBean.getE01POSAM1().trim()%>" >
                <input type="text" name="E01POSAM2" size="3" maxlength="2" value="<%= telexBean.getE01POSAM2().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Debit Account :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSDBR" size="4" maxlength="3" value="<%= telexBean.getE01POSDBR().trim()%>" >
                <input type="text" name="E01POSDCY" size="4" maxlength="3" value="<%= telexBean.getE01POSDCY().trim()%>" >
                <input type="text" name="E01POSDGL" size="14" maxlength="12" value="<%= telexBean.getE01POSDGL().trim()%>" >
                <input type="text" name="E01POSDAC" size="10" maxlength="9" value="<%= telexBean.getE01POSDAC().trim()%>" >
                <input type="text" name="E01POSDSB" size="6" maxlength="5" value="<%= telexBean.getE01POSDSB().trim()%>" >
                <input type="text" name="E01POSDCS" size="7" maxlength="6" value="<%= telexBean.getE01POSDCS().trim()%>" >
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Credit Account :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSCBR" size="4" maxlength="3" value="<%= telexBean.getE01POSCBR().trim()%>" >
                <input type="text" name="E01POSCCY" size="4" maxlength="3" value="<%= telexBean.getE01POSCCY().trim()%>" >
                <input type="text" name="E01POSCGL" size="14" maxlength="12" value="<%= telexBean.getE01POSCGL().trim()%>" >
                <input type="text" name="E01POSCAC" size="10" maxlength="9" value="<%= telexBean.getE01POSCAC().trim()%>" >
                <input type="text" name="E01POSCSB" size="6" maxlength="5" value="<%= telexBean.getE01POSCSB().trim()%>" >
                <input type="text" name="E01POSCCS" size="7" maxlength="6" value="<%= telexBean.getE01POSCCS().trim()%>" >
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Payment Frequency :</div>
              </td>
              <td nowrap colspan="3" > 
                <select name="E01POSFRQ">
                  <option value=" " <% if (!(telexBean.E01POSFRQ().equals("D") ||telexBean.getE01DLCTP1().equals("M")||telexBean.getE01DLCTP1().equals("W")||telexBean.getE01DLCTP1().equals("V"))) out.print("selected"); %>></option>
                  <option value="D" <% if(telexBean.getE01POSFRQ().equals("D")) out.print("selected");%>>Daily</option>
                  <option value="W" <% if(telexBean.getE01POSFRQ().equals("W")) out.print("selected");%>>Weakly</option>
                  <option value="M" <% if(telexBean.getE01POSFRQ().equals("M")) out.print("selected");%>>Monthly</option>
				  <option value="V" <% if(telexBean.getE01POSFRQ().equals("V")) out.print("selected");%>>Variable</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right"> Payment Day :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSPMD" size="3" maxlength="2" value="<%= telexBean.getE01POSPMD().trim()%>" >
                <a href="javascript:GetCode('E01POSPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a> 
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right"> or Number or Days :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSDYS" size="4" maxlength="3" value="<%= telexBean.getE01POSDYS().trim()%>" >
                ( For Variable Payment Frequency Only) </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Number of Payments :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E01POSNPM" size="6" maxlength="4" value="<%= telexBean.getE01POSNPM().trim()%>" >
                (9999 = Indefinite) </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Payment Type :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POSPMT" value="F" 
              <%if(telexBean.getE01POSPMT().equals("F")) out.print("checked");%> checked>
                Fixed 
                <input type="radio" name="E01POSPMT" value="V" 
              <%if(telexBean.getE01POSPMT().equals("V")) out.print("checked");%>>
                Variable </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" > 
                <div align="right">Overdraft Authorization :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POSODA" value="Y" 
              <%if(telexBean.getE01POSODA().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POSODA" value="N" 
              <%if(cdTransac.getE01POSODA().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="45%" > 
                <div align="right">Suspend Payment :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="radio" name="E01POSSPM" value="Y" 
              <%if(telexBean.getE01POSSPM().equals("Y")) out.print("checked");%> checked>
                Yes 
                <input type="radio" name="E01POSSPM" value="N" 
              <%if(cdTransac.getE01POSSPM().equals("N")) out.print("checked");%>>
                No </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="45%" height="35" > 
                <div align="right">Reflect on Statement :</div>
              </td>
              <td nowrap colspan="3" height="35" > 
                <input type="text" name="E01POSDAS" size="6" maxlength="4" value="<%= telexBean.getE01POSDAS().trim()%>" >
                Days </td>
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
  </div>
  </form>
</body>
</html>
