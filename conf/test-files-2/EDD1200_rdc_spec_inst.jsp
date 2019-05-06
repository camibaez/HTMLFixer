<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>New Check</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "msgChk" class= "datapro.eibs.beans.EDD120001Message"  scope="session" />

<SCRIPT Language="javascript">

function enter(){
  document.forms[0].SCREEN.value='6';
  document.forms[0].submit();
}

function ignore(){
  close();
}

</SCRIPT>

</head>
<body>
<h3 align="center">Return Deposit Checks<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="rdc_spec_inst.jsp,EDD1200"> 
</h3>
<hr size="4">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1201" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01WTRARF" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFBNK" VALUE="<%= userPO.getBank().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFBRN" VALUE="<%= userPO.getBranch().trim()%>">  
  <INPUT TYPE=HIDDEN NAME="E01OFFOPE" VALUE="<%= userPO.getHeader1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFCON" VALUE="<%= userPO.getHeader2().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFCCY" VALUE="<%= userPO.getHeader3().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OFFGLN" VALUE="<%= userPO.getHeader4().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01WTRSEQ" VALUE="<%= msgChk.getE01WTRSEQ().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OVDFLG" VALUE="<%= msgChk.getE01OVDFLG().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01INSFLG" VALUE="<%= msgChk.getE01INSFLG().trim()%>">
      
  <%
      //  int row;
	//	  try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
	//	  appList.setCurrentRow(row);
  %>   
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">        
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>Account : </b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01ACMACC" size="10" maxlength="9" readonly value="<%= msgChk.getE01ACMACC().trim()%>">
			  </div>
            </td>
            <td nowrap  > 
              <div align="right"><b>Amount : </b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01AMOUNT" size="17" maxlength="16" readonly value="<%= msgChk.getE01AMOUNT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right"><b>Transaction Code : </b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01TRNCDE" size="3" maxlength="2" readonly value="<%= msgChk.getE01TRNCDE().trim()%>">
			  </div>
            </td>
            <td nowrap  > 
              <div align="right"><b>Check Number : </b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01NUMCHK" size="11" maxlength="10" readonly value="<%= msgChk.getE01NUMCHK().trim()%>">
              </div>
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <% if (msgChk.getE01OVDFLG().equals("Y")) {%>
  <br>
  <table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" >
            <tr valign="top"> 
              <td valign="middle">
                <div align="left">
       				<font color="red"><B> Overdraft Account </B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>  
   <% }
    if (msgChk.getE01INSFLG().equals("Y")) {%>
  	  <br>
	  <div id="dataDiv" align="center" style="width:90%; padding-left:50; padding-right:10" class="scbarcolor">
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages One</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI010" value="<%= msgChk.getE01SPI010().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI011" value="<%= msgChk.getE01SPI011().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI012" value="<%= msgChk.getE01SPI012().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI013" value="<%= msgChk.getE01SPI013().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Two</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI020" value="<%= msgChk.getE01SPI020().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI021" value="<%= msgChk.getE01SPI021().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI022" value="<%= msgChk.getE01SPI022().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI023" value="<%= msgChk.getE01SPI023().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Three</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI030" value="<%= msgChk.getE01SPI030().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI031" value="<%= msgChk.getE01SPI031().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI032" value="<%= msgChk.getE01SPI032().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI033" value="<%= msgChk.getE01SPI033().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Four</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI040" value="<%= msgChk.getE01SPI040().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI041" value="<%= msgChk.getE01SPI041().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI042" value="<%= msgChk.getE01SPI042().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI043" value="<%= msgChk.getE01SPI043().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Five</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI050" value="<%= msgChk.getE01SPI050().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI051" value="<%= msgChk.getE01SPI051().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI052" value="<%= msgChk.getE01SPI052().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI053" value="<%= msgChk.getE01SPI053().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Six</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI060" value="<%= msgChk.getE01SPI060().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI061" value="<%= msgChk.getE01SPI061().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI062" value="<%= msgChk.getE01SPI062().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI063" value="<%= msgChk.getE01SPI063().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Seven</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI070" value="<%= msgChk.getE01SPI070().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI071" value="<%= msgChk.getE01SPI071().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI072" value="<%= msgChk.getE01SPI072().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI073" value="<%= msgChk.getE01SPI073().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Eight</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI080" value="<%= msgChk.getE01SPI080().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI081" value="<%= msgChk.getE01SPI081().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI082" value="<%= msgChk.getE01SPI082().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI083" value="<%= msgChk.getE01SPI083().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Nine</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI090" value="<%= msgChk.getE01SPI090().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI091" value="<%= msgChk.getE01SPI091().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI092" value="<%= msgChk.getE01SPI092().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI093" value="<%= msgChk.getE01SPI093().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		  
		  <table class="tableinfo">
		    <tr> 
		      <td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"><b>Messages Ten</b></div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI100" value="<%= msgChk.getE01SPI100().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI101" value="<%= msgChk.getE01SPI101().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trclear"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI102" value="<%= msgChk.getE01SPI102().trim()%>" >
		              </div>
		            </td>
		          </tr>
		          <tr id="trdark"> 
		            <td nowrap width="70%" height="23"> 
		              <div align="center"> 
		                <input type="text" maxlength="70" size="71" readonly name="E01SPI103" value="<%= msgChk.getE01SPI103().trim()%>" >
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
	  </div> 
  <% } %>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" align="center"> 
       		<input id="EIBSBTN" type=button name="Ignore" value="Ignore" onClick="ignore();">
	  </td>
      <td width="50%" align="center"> 
       		<input id="EIBSBTN" type=button name="Process" value="Process" onClick="enter();">
  	  </td>     
    </tr>    
  </table>   
  </form>
</body>
</html>
