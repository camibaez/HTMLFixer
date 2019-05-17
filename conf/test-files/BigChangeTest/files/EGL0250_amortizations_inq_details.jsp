<html>
<head>
<title>Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="msgAmort" class="datapro.eibs.beans.EGL025001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Amortization/Accrual Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="amortization_inq_details.jsp, EGL0250"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0250" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  
  <table class="tableinfo" align="center">
     <tr class="trdark"> 
      <td width="50%"> 
        <div align="right">Bank Code : </div>
      </td>
      <td width="50%"> 
        <div align="left">
          <input readonly type="text" name="E01AMOBNK" size="3" maxlength="2" value="<%= msgAmort.getE01AMOBNK()%>">
         </div>
      </td>
    </tr>
     <tr class="trclear"> 
      <td width="50%"> 
        <div align="right">Branch Number : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOBRN" onKeypress="enterInteger()" size="5" maxlength="4" value="<%= msgAmort.getE01AMOBRN()%>">
        </div>
      </td>
    </tr>
    <tr class="trdark"> 
      <td width="50%"> 
        <div align="right">Currency Code : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOCCY" size="4" maxlength="3" value="<%= msgAmort.getE01AMOCCY()%>">
        </div>
      </td>
    </tr>
    <tr class="trclear"> 
      <td width="50%"> 
        <div align="right">General Ledger : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOGLN" size="4" maxlength="3" value="<%= msgAmort.getE01AMOCCY()%>">
        </div>
      </td>
    </tr>
    <tr class="trdark"> 
      <td width="50%"> 
        <div align="right">Reference Number : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOACC" size="4" maxlength="3" value="<%= msgAmort.getE01AMOACC()%>">
        </div>
      </td>
    </tr>
    <tr class="trclear"> 
      <td width="50%"> 
        <div align="right">Batch Date : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOBD1" size="3" maxlength="2" value="<%= msgAmort.getE01AMOBD1()%>">
          <input readonly type="text" name="E01AMOBD2" size="3" maxlength="2" value="<%= msgAmort.getE01AMOBD2()%>">
          <input readonly type="text" name="E01AMOBD3" size="5" maxlength="4" value="<%= msgAmort.getE01AMOBD3()%>">
        </div>
      </td>
    </tr>
    <tr class="trdark"> 
      <td width="50%"> 
        <div align="right">Description : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMONAR" size="4" maxlength="3" value="<%= msgAmort.getE01AMONAR()%>">
        </div>
      </td>
    </tr>
    <tr class="trclear"> 
      <td width="50%"> 
        <div align="right">Amount : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input readonly type="text" name="E01AMOOAM" size="4" maxlength="3" value="<%= msgAmort.getE01AMOOAM()%>">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
  </form>
</body>
</html>
