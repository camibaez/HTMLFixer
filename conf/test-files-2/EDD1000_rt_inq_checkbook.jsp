<html>
<head>
<title>Retail Account Approval </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBasic" class ="datapro.eibs.beans.EDD000001Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

   builtNewMenu(rt_i_opt);


</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  

   out.println("<SCRIPT> initMenu();  </SCRIPT>");

%> 
<H3 align="center">Retail Accounts<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="rt_ap_basic EDD1000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
  <INPUT TYPE=HIDDEN NAME="E01ACMBNK" VALUE="<%= rtBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= rtBasic.getE01ACMATY().trim()%>">
  
 
  
 
  <H4>Checkbook Information</H4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
 
 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Checkbook Type :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" readonly   name="E01ACMTCB" size="2" maxlength="1" value="<%= rtBasic.getE01ACMTCB().trim()%>">
                     
            </td>            
            <td nowrap width="26%"> 
              <div align="right">Checkbook Code :</div>
            </td>
            <td nowrap width="23%">
                <input type="text" readonly   name="E01ACMP11" size="3" maxlength="2" value="<%= rtBasic.getE01ACMP11().trim()%>">            
            </td>
          </tr>           
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Minimum  Stock :</div>
            </td>
            <td nowrap width="21%"> 
                    <input type="text" readonly  name="E01ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMMSK().trim()%>">                           
            </td>
            <td nowrap width="26%"> 
              <div align="right">Current Stock :</div>
            </td>
            <td nowrap width="23%">  
               <input type="text" readonly   name="E01ACMASK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMASK().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%">                
              <div align="right">Checkbook Service Charges :</div>
            </td>
            <td nowrap width="21%">  
               <input type="text" readonly   name="E01ACMCBC" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMCBC().equals("Y")) out.print("Yes");
							else if (rtBasic.getE01ACMCBC().equals("N")) out.print("No");
							else out.print("");%>" 
				>                                  
            </td>
            <td nowrap width="26%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="23%">&nbsp;
            </td>
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
       </form>
</body>
</html>
