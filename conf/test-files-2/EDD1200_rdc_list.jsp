<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Return Deposit Checks
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<!-- <jsp:useBean id= "msgChk" class= "datapro.eibs.beans.EDD120001Message"  scope="session" /> -->
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">
<!--
//-->
  function goAction(op) {

    document.forms[0].opt.value = op;
    if (op == 1) {
          document.forms[0].submit();
	 }
	 else {
      	 var formLength= document.forms[0].elements.length;
           var ok = false;
		   var en = "";
           for(n=0;n<formLength;n++)
           {
            	var elementName= document.forms[0].elements[n].name;
            	if(elementName == "ROW") 
            	{
					if (document.forms[0].elements[n].checked == true) {
               			ok = true;
						en = 'NUM_' + document.forms[0].elements[n].value;
              			break;
					}
            	}
            }
      	 if ( ok ) {
			document.forms[0].submit();
           }
           else {
      			alert("A valid check must be selected before this operation");	   
           }
	 }
	 
  }

//-->

</script>
</head>

<body onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/e/nueva_over.gif','<%=request.getContextPath()%>/images/e/modificar_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/delete_over.gif')">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%> 
<h3 align="center">Return Deposit Checks<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rdc_list.jsp , EDD1200"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( appList.getNoResult() ) {
 %>
<% 
      	String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
              if ( !pagename.equals("") ) {
%>
       	<SCRIPT Language="Javascript">
	   		CenterWindow('<%= pagename %>',620,500,2);
       	</SCRIPT>
<% 
              }
	}
%> 

   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        <div align="center"> 
   	      <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap  > 
                      <div align="right"><b>Reference Number :</b></div>
                    </td>
                    <td nowrap > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01WTRARF" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap  > 
                      <div align="right"></div>
                    </td>
                    <td nowrap > 
                      
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap > 
                      <div align="right"><b>Bank/Branch :</b></div>
                    </td>
                    <td nowrap > 
                      <div align="left"> 
                        <input type="text" name="E01OFFBNK" size="2" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
                        <input type="text" name="E01OFFBRN" size="5" maxlength="3" value="<%= userPO.getBranch().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap > 
                      <div align="right"><b>Concept : </b></div>
                    </td>
                    <td nowrap > 
                      <div align="left"><b> 
                        <input type="text" name="E01OFFOPE" size="2" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
                        <input type="text" name="E01OFFCON" size="26" maxlength="25" value="<%= userPO.getHeader2().trim()%>" readonly>
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>      

          <p>&nbsp;</p>
          <p><font size="2"><b>This reference number has no Checks, please 
            select one of the following options :</b></font></p>
            <table  class="tbenter" width=100% align=center>
            <tr > 
              <td class=TDBKG width="50%" > 
                <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="25%" > 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>
         <p>&nbsp; </p>
        </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> <% 
      	String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
              if ( !pagename.equals("") ) {
%>
       	<SCRIPT Language="Javascript">
	   		CenterWindow('<%= pagename %>',620,500,2);
       	</SCRIPT>
<% 
              }
	}
%>
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0"> 
    	      <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap > 
                      <div align="right"><b>Reference Number :</b></div>
                    </td>
                    <td nowrap  > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01WTRARF" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap  > 
                      <div align="right"></div>
                    </td>
                    <td nowrap > 
                      
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap > 
                      <div align="right"><b>Bank/Branch :</b></div>
                    </td>
                    <td nowrap> 
                      <div align="left"> 
                        <input type="text" name="E01OFFBNK" size="2" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
                        <input type="text" name="E01OFFBRN" size="5" maxlength="3" value="<%= userPO.getBranch().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap > 
                      <div align="right"><b>Concept : </b></div>
                    </td>
                    <td nowrap > 
                      <div align="left"><b> 
                        <input type="text" name="E01OFFOPE" size="2" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
                        <input type="text" name="E01OFFCON" size="26" maxlength="25" value="<%= userPO.getHeader2().trim()%>" readonly>
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table> 
  <p>&nbsp;</p>
  
            <table  class="tbenter" width=100% align=center>
            <tr > 
              <td class=TDBKG width="25%" > 
                <div align="center" ><a href="javascript:goAction(1)"><b>New</b></a></div>
              </td>
              <td class=TDBKG width="25%" > 
                <div align="center" ><a href="javascript:goAction(2)"><b>Maintenance</b></a></div>
              </td>
               <td class=TDBKG width="25%" > 
                <div align="center" ><a href="javascript:goAction(3)"><b>Delete</b></a></div>
              </td>
              <td class=TDBKG width="25%" > 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
              </td>
            </tr>
          </table>

  <center>
    <table  id="mainTable" class="tableinfo" >
      <tr > 
        <td NOWRAP valign="top"> 
          <table id="headTable">
            <tr id="trdark"> 
              <TH align=CENTER nowrap>&nbsp;</TH>
              <TH align=CENTER nowrap> 
               Seq.
              </TH>
              <TH align=CENTER nowrap> 
               Account
              </TH>
              <TH align=CENTER nowrap> 
               Customer
              </TH>
              <TH align=CENTER nowrap> 
               Amount
              </TH>
              <TH align=CENTER nowrap> 
                T/C
              </TH>
              <TH align=CENTER nowrap> 
                Check
              </TH>              
            </tr>
          </table>
          <div id="dataDiv1" class="scbarcolor" > 
			   <table id="dataTable">
			    <%
		               int row;
				  			try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
		               appList.initRow();
		                int k=1;
		               while (appList.getNextRow()) {
		               		datapro.eibs.beans.EDD120001Message msgCh = (datapro.eibs.beans.EDD120001Message)appList.getRecord();
			     %> 
			    <TR> 
			      <TD ALIGN=CENTER NOWRAP> 
			        <INPUT TYPE="radio" NAME="ROW" VALUE="<%= appList.getCurrentRow() %>" <% if (appList.getCurrentRow() == row) out.print("checked"); %> >
					<INPUT TYPE="hidden" NAME="NUM_<%= appList.getCurrentRow() %>" VALUE="<%= msgCh.getE01ACMACC() %>">
			      </TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgCh.getE01WTRSEQ()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgCh.getE01ACMACC()) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgCh.getE01CUSNA1()) %></TD>
				  <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgCh.getE01AMOUNT()) %></TD>
			      <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgCh.getE01TRNCDE()) %></TD>
			      <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgCh.getE01NUMCHK()) %></TD>
			    </TR>
			    <%
			                k++;
			                }
			      
			    %> 
			  </table>            
          </div>
        </td>
       </tr>   
    </table>
  </center>
      
<SCRIPT language="JavaScript">
  function resizeDoc() {
  	   document.forms[0].totalRow.value="<%= k %>";
       divResize();
       adjustEquTables(headTable, dataTable, dataDiv1,1,false);
  }
  showChecked("ROW");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>
  <%
  }
%> 
</FORM>

</BODY>
</HTML>
