<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Assign Accounts to Cards
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
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
      			alert("A valid account must be selected before this operation");	   
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
<h3 align="center">Assign Accounts to Cards<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_accounts_list.jsp , ECC0080"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0080" >
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
                    <td nowrap width="16%" > 
                      <div align="right"><b>Customer :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01CARCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Name :</b> </div>
                    </td>
                    <td nowrap > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E01CARNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b></b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right">Card Number :</div>
                    </td>
                    <td nowrap > 
                      <div align="left">
                      	<input type="text" readonly name="E01CCANUM" size="30" maxlength="30" value="<%= userPO.getHeader1().trim()%>" >
                      </div>
                    </td>
                  </tr>                                 
                </table>
              </td>
            </tr>
          </table>      

          <p>&nbsp;</p>
          <p><font size="3"><b>This Card has no accounts, please 
            select one of the following options :</b></font></p>
          <table class="tbenter" width="100%">
            <tr> 
              <td align=CENTER> <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image11" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a></td>
              <td align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image51" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a></td>
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
                    <td nowrap width="16%" > 
                      <div align="right"><b>Customer :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01CARCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Name :</b> </div>
                    </td>
                    <td nowrap > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E01CARNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b></b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right">Card Number :</div>
                    </td>
                    <td nowrap > 
                      <div align="left">
                      	<input type="text" readonly name="E01CCANUM" size="30" maxlength="30" value="<%= userPO.getHeader1().trim()%>" >
                      </div>
                    </td>
                  </tr>          
                </table>
              </td>
            </tr>
          </table>      

  <p>&nbsp;</p>
  <table class="tbenter" width="100%">
    <tr> 
      <td align=CENTER> <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a></td>
      <td align=CENTER> <a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/maintenance_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/maintenance.gif" ></a></td>
      <td align=CENTER> <a href="javascript:goAction('3')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/delete_over.gif',1)"><img name="Image3" alt="Borrar" border="0" src="<%=request.getContextPath()%>/images/e/delete.gif" ></a></td>
      <td align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a></td>
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
                Account
              </TH>
              <TH align=CENTER nowrap> 
                Type
              </TH>
              <TH align=CENTER nowrap> 
               Customer Number
              </TH>
              <TH align=CENTER nowrap> 
                Customer Name
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
			     %> 
			    <TR> 
			      <TD ALIGN=CENTER NOWRAP> 
			        <INPUT TYPE="radio" NAME="ROW" VALUE="<%= appList.getCurrentRow() %>" <% if (appList.getCurrentRow() == row) out.print("checked"); %> >
					<INPUT TYPE="hidden" NAME="NUM_<%= appList.getCurrentRow() %>" VALUE="<%= appList.getRecord(4) %>">
			      </TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(appList.getRecord(4)) %></TD>
			      <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(appList.getRecord(3)) %></TD>
				  <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(appList.getRecord(15)) %></TD>
			      <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(appList.getRecord(16)) %></TD>
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
