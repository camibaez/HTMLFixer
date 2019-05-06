
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Hold & Uncollected
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "holduncoll" class= "datapro.eibs.beans.JBListRec"  scope="session" />

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
						en = 'SEQ_' + document.forms[0].elements[n].value;
              			break;
					}
            	}
            }
      	 if ( ok ) {
                if (op == 4) {
					for(n=0;n<formLength;n++) {
      					var l = document.forms[0].elements[n].name;
						if (l == en) {
							window.location.href="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&INTERFACE=B&OPE_CODE=HU&SEQ=" + document.forms[0].elements[n].value;
							break;
						}
					}
				}
				else {	
					document.forms[0].submit();
				}
           }
           else {
      			alert("A valid account must be selected before this operation");	   
           }
	 }
	 
  }

//-->
</script>
</head>

<body onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/e/nueva_over.gif','<%=request.getContextPath()%>/images/e/modificar_over.gif','<%=request.getContextPath()%>/images/e/exit_over.gif')">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%> 
<h3 align="center">Hold & Uncollected<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="hold_uncollected.jsp , EDD0300"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0300" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( holduncoll.getNoResult() ) {
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

   		<TABLE class="tbenter" width=100% cellpadding="3" height=80%>
   		<TR>
      <TD> 
        <div align="center"> 
          <table class="tableinfo">
            <tr bordercolor="#FFFFFF"> 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Customer :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01STPCUN2" size="9" maxlength="9" value="<%= userPO.getHeader1().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Name :</b> </div>
                    </td>
                    <td nowrap colspan="3" > 
                      <div align="left"> 
                        <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader5().trim()%>">
                        </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Account :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01STPACC2" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Currency : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01STPCCY2" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Product : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader6().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p><b>This account has neither hold nor uncollected issued, please 
            select one of the following options :</b></p>
          <table class="tbenter" width="100%">
            <div align="center"></div>
            <tr> 
              <td align=CENTER> <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image11" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a></td>
              <td align=CENTER>&nbsp;</td>
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
                <input type="text" readonly name="E01STPCUN" size="9" maxlength="9" value="<%= userPO.getHeader1().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Name :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader5().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Account :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01STPACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Currency : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01STPCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Product : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader6().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%">
    <div align="center"></div>
    <tr> 
      <td align=CENTER> <a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/new_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/new.gif" ></a></td>
      <td align=CENTER> <a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/maintenance_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/maintenance.gif" ></a></td>
      <td align=CENTER> <a href="javascript:goAction(5)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<%=request.getContextPath()%>/images/e/print_over.gif',1)"><img name="Image4" border="0" src="<%=request.getContextPath()%>/images/e/print.gif" ></a></td>
      <td align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a></td>
    </tr>
  </table>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="3%" >&nbsp;</TH>
      <TH ALIGN=CENTER>Type</TH>
      <TH ALIGN=CENTER>Process<br>Date</TH>
      <TH ALIGN=CENTER>Maturity<br>Date</TH>
      <TH ALIGN=CENTER>Days</TH>
      <TH ALIGN=CENTER>Amount</TH>
      <TH ALIGN=CENTER>Reason</TH>
      <TH ALIGN=CENTER>Reference</TH>
    </TR>
    <%
               int row;
		  			try{row = Integer.parseInt(request.getParameter("SEL"));}catch(Exception e){row = 0;}
               holduncoll.initRow();
               while (holduncoll.getNextRow()) {
     %> 
    <TR> 
      <TD ALIGN=CENTER width="3%"> 
        <INPUT TYPE="radio" NAME="ROW" VALUE="<%= holduncoll.getCurrentRow() %>" <% if (holduncoll.getCurrentRow() == row) out.print("checked"); %>>
		<INPUT TYPE="hidden" NAME="SEQ_<%= holduncoll.getCurrentRow() %>" VALUE="<%= holduncoll.getRecord(0) %>">
      </TD>
      <TD ALIGN=CENTER>
	  	<% if (holduncoll.getRecord(1).equals("H")) {%>
			Hold
		<% } else { %>
			Uncollected
		<% } %> 
	  </TD>
      <TD ALIGN=CENTER><%= Util.formatDate(holduncoll.getRecord(2),holduncoll.getRecord(3),holduncoll.getRecord(4)) %></TD>
      <TD ALIGN=CENTER><%= Util.formatDate(holduncoll.getRecord(5),holduncoll.getRecord(6),holduncoll.getRecord(7)) %></TD>
      <TD ALIGN=CENTER><%= Util.formatCell(holduncoll.getRecord(8)) %></TD>
      <TD ALIGN=CENTER><%= Util.fcolorCCY(holduncoll.getRecord(9)) %></TD>
      <TD ALIGN=CENTER><%= Util.formatCell(holduncoll.getRecord(10)) %></TD>
      <TD ALIGN=CENTER><%= Util.formatCell(holduncoll.getRecord(11)) %></TD>
    </TR>
    <%
                }
    %> 
  </TABLE>

  <h4></h4>
	
  <%
  }
%> 
</FORM>

</BODY>
</HTML>
