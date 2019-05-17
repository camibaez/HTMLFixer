
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Change of Variable Rate to Fixed Rate
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "hdr" class= "datapro.eibs.beans.EDL115702Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

 
<!--
//-->
  function goAction(op) {

    document.forms[0].opt.value = op;
    if (op == 'N') {
          document.forms[0].submit();
	} else {
      	var formLength= document.forms[0].elements.length;
        var rowSelected = false;
		for(n=0;n<formLength;n++){
        	var elementName= document.forms[0].elements[n].name;
        	if(elementName == "ROW") {
        		rowSelected = true;
			}
		}
		if (rowSelected) {
	    	if (op == 'D') {
				if(confirm("Are you sure you want to delete this item?")){
					document.forms[0].SCREEN.value = 4;
					document.forms[0].submit();
				}
			} else {
				document.forms[0].SCREEN.value = 3;
				document.forms[0].submit();
			}
		} else {
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


	datapro.eibs.beans.EDL115701Message header = new datapro.eibs.beans.EDL115701Message();
	int i = list.getLastRec() ;
	
	if( i != 0 ){
		list.setCurrentRow( i ) ;
		header = (datapro.eibs.beans.EDL115701Message)list.getRecord() ;
	}
	

%> 
<h3 align="center">Change of Variable Rate to Fixed Rate<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="change_rate_list.jsp , EDL1157"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1157" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="E01CDVACC" value="<%= hdr.getE02DEAACC().trim()%>">


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
                        <input type="text" name="E02DEACUN" size="9" maxlength="9" value="<%=hdr.getE02DEACUN()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Name :</b> </div>
                    </td>
                    <td nowrap colspan="3" > 
                      <div align="left"> 
                        <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= hdr.getE02CUSNA1().trim()%>" readonly>
                        </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Account :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E02CDVACC" size="12" maxlength="12" value="<%= hdr.getE02DEAACC()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Currency : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= hdr.getE02DEACCY().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Product : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEAPRO" size="4" maxlength="4" value="<%= hdr.getE02DEAPRO().trim()%>" readonly>
                        </b> </div>
                    </td>
                  </tr>
                </table>
	    	  </td>
    	  </tr>
    </table>

  <table class=tbenter>
   <tr > 
      <td nowrap> <h4><b>Basic Information</b></h4> </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Note Date :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DEAOD1" size="2" maxlength="2" value="<%= hdr.getE02DEAOD1().trim()%>" readonly>
              <input type="text" name="E02DEAOD2" size="2" maxlength="2" value="<%= hdr.getE02DEAOD2().trim()%>" readonly>
              <input type="text" name="E02DEAOD3" size="2" maxlength="2" value="<%= hdr.getE02DEAOD3().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Maturity Date :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMA1" size="2" maxlength="2" value="<%= hdr.getE02DEAMA1().trim()%>" readonly>
              <input type="text" name="E02DEAMA2" size="2" maxlength="2" value="<%= hdr.getE02DEAMA2().trim()%>" readonly>
              <input type="text" name="E02DEAMA3" size="2" maxlength="2" value="<%= hdr.getE02DEAMA3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Principal Amount :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAMEP" size="15" maxlength="15" value="<%= hdr.getE02DEAMEP().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interest Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02TOTRTE" size="10" maxlength="9" value="<%= hdr.getE02TOTRTE().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Floating Rate Table :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAFTB" size="2" maxlength="2" value="<%= hdr.getE02DEAFTB().trim()%>"readonly>
              <input type="text" name="E02DEAFTY" size="14" 
				  value="<% if (hdr.getE02DEAFTY().equals("FP")) out.print("Primary");
							else if (hdr.getE02DEAFTY().equals("FS")) out.print("Secondary");
							else if (hdr.getE02DEAFTY().equals("DS")) out.print("Time Deposits");
							else out.print("");%>" 
				readonly>
            </td>
            <td nowrap > 
              <div align="right">Actual Floating Rate :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEAFRT" size="10" maxlength="9" value="<%= hdr.getE02DEAFRT().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Accrual Base :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEABAS" size="3" maxlength="3" value="<%= hdr.getE02DEABAS().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Terms :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E02DEATRM" size="4" maxlength="4" value="<%= hdr.getE02DEATRM().trim()%>"readonly>
              <input type="text" name="E02DEATRC" size="10" 
				  value="<% if (hdr.getE02DEATRC().equals("D")) out.print("Day(s)");
							else if (hdr.getE02DEATRC().equals("M")) out.print("Month(s)");
							else if (hdr.getE02DEATRC().equals("Y")) out.print("Year(s)");
							else out.print("");%>" 
				readonly>
            </td>
	       </tr>
		 </table>
      </tr>
 </table>

<%
	if ( list.getNoResult() ) {
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
          <p>&nbsp;</p>
          <p><b>This account has neither change rates issued, please 
            select one of the following options :</b></p>
          <table class="tbenter" width="100%">
            <tr> 
		      <td class=TDBKG width="30%"> 
		        <div align="center"><a href="javascript:goAction('N')"><b>New</b></a></div>
		      </td>
		      <td class=TDBKG width="30%"> 
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

  <p>&nbsp;</p>
  <table class="tbenter" width="100%">
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('N')"><b>New</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('M')"><b>Maintenance</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Delete</b></a></div>
      </td>      
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="3%" >&nbsp;</TH>
      <TH ALIGN=CENTER>Process<br>Date</TH>
      <TH ALIGN=CENTER>Interes Rate</TH>
      <TH ALIGN=CENTER>Floating Table</TH>
      <TH ALIGN=CENTER>Floating Type</TH>
    </TR>
    <%
               int row;
		  			try{row = Integer.parseInt(request.getParameter("SEL"));}catch(Exception e){row = 0;}
               list.initRow();
               while (list.getNextRow()) {
               		datapro.eibs.beans.EDL115701Message msg = (datapro.eibs.beans.EDL115701Message)list.getRecord() ;
     %> 
    <TR> 
      <TD ALIGN=CENTER width="3%"> 
        <INPUT TYPE="radio" NAME="ROW" VALUE="<%= list.getCurrentRow() %>" <% if (list.getCurrentRow() == row) out.print("checked"); %>>
      </TD>
      <TD ALIGN=CENTER><%= Util.formatDate( msg.getE01CDVUD1(), msg.getE01CDVUD2(), msg.getE01CDVUD3()) %></TD>
      <TD ALIGN=CENTER><%= Util.fcolorCCY( msg.getE01CDVNRT() ) %></TD>
      <TD ALIGN=CENTER><%= Util.formatCell( msg.getE01CDVFTB() ) %></TD>
      <TD ALIGN=CENTER><%= Util.formatCell( msg.getE01CDVFTY() ) %></TD>
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
