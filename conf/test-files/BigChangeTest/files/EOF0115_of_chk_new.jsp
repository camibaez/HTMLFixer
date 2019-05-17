<HTML>
<HEAD>
<TITLE>
Official Checks
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<%@ page import = "datapro.eibs.master.*" %>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0115Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">

function closeEnter(){
   	  enterCHK.filters[0].apply();
      enterCHK.style.visibility="hidden";
      enterCHK.filters[0].Play();
}


function cancelBub(){
  event.cancelBubble = true;
}

function ShowEnterCHK(x,y) {
	 var y= 200 - document.body.scrollTop;
     var x= 200 - document.body.scrollLeft;	
     eval('enterCHK.style.pixelTop=' + y);
     eval('enterCHK.style.pixelLeft=' + x);
	 enterCHK.filters[0].apply();
     enterCHK.style.visibility="visible";
     enterCHK.filters[0].Play();
	 document.forms[0].chknum.focus();
}

function enter(type , ccy) {
   document.forms[0].E01OFMBNK.value = '01';
   document.forms[0].E01OFMFTY.value = type;
   document.forms[0].E01OFMCCY.value = ccy;
   //cancelBub();
   <% 
    boolean autoNum = false;  			
    autoNum = JSEIBSProp.getAutoNumOCK();		
	if (!autoNum) { %>
	  ShowEnterCHK();
   <% } else { %>
      document.forms[0].E01OFMCKN.value = "";
	  document.forms[0].submit();
   <% } %>
   
}

function goNewOCK(){
  	//closeEnter();
  	var ok = false;
  	if (document.forms[0].chknum.value.length > 0) {
  	    chk = parseInt(document.forms[0].chknum.value);
  	    if (chk > 0) ok = true;  		
  	} 
    if (ok){
  	  document.forms[0].E01OFMCKN.value = document.forms[0].chknum.value;
	  document.forms[0].submit();
  	} else {
  	   alert("Enter a valid Check number");
  	   document.forms[0].chknum.focus();
  	}
}

</script>

</HEAD>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center">Official Checks Issuance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="of_chk_new, EOF0115"> 
  </h3>
  <hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="E01OFMBNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OFMFTY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OFMCCY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OFMCKN" VALUE="">
  <%
	if ( ewd0115Help.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
        <div align="center"> <b> There is no match for your search 
          criteria </b> </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
	<script language="javascript">
	  document.onclick= closeEnter;
	</script>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div id="enterCHK" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
	 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
		  <TD ALIGN=right nowrap>
	          Enter Check Number : 
	          <input type="text" maxlength=9 size=11 name="chknum" onKeyPress="enterInteger()" value="">
	      </TD>
	      <TD ALIGN=left nowrap>
		     <img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/apply_on.gif" onclick="javascript:goNewOCK()"> 
		  </TD>
	   </TR>
	 </TABLE>
 </div>
  <table class="tableinfo" style="width:87%" align=center>
    <tr id=trdark> 
      <th colspan="4" height="24">
        <div align="left">Formats :</div>
      </th>
    </tr>
    <tr id=trdark> 
      <th width="8%" height="24">Bank</th>
      <th width="8%" height="24">Currency</th>
      <th width="6%" height="24">Format </th>
      <th width="78%" height="24">Description</th>
    </tr>
    <%
                ewd0115Help.initRow();
                while (ewd0115Help.getNextRow()) {
                    if (ewd0115Help.getFlag().equals("")) {
                    		out.println(ewd0115Help.getRecord());
                    }
                }
    %> 
  </table>

  <%
  }
%> 
  <div align="center"> </div>
</FORM>

</BODY>
</HTML>
