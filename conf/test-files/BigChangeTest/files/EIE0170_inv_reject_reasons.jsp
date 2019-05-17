<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Reject Reasons</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="InReje" class="datapro.eibs.beans.EIE017001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>  
 
</head>
<body>
<%  
 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 
<h3 align="center">Reject Reasons <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_reject_reasons.jsp,EIE0170"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0170" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT type="hidden" name="E01USFLVL" value="<%= userPO.getHeader1()%>">         
   
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="center"><b>Order Number :</b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"></div> 
                <input type="text" name="E01USFNUM" size="12" maxlength="9" value="<%= userPO.getIdentifier()%>" READONLY>
                
             
          </tr>
           
        </table>
      </td>
    </tr>
  </table>
  <h4> Reject Reasons</h4> 
  <table class="tableinfo">
     
     <tr id="trdark">            
       <td nowrap width="5%" >
          <div align="center"><b>Reason  :</b></div>
       </td>
       <td nowrap width="60%" >
       	  <div align="left"></div> 
          <input type="text" name="E01USFDS1" size="60" maxlength="65" value="<%= InReje.getE01USFDS1() %>">
           
       </td>
     </tr> 
       
     <tr id="trdark">            
       <td nowrap width="5%" >
          <div align="left"><b>       </b></div>
       </td>
       <td nowrap width="60%" >
       	  <div align="left"></div> 
          <input type="text" name="E01USFDS2" size="60" maxlength="65" value="<%= InReje.getE01USFDS2() %>">
           
       </td>
     </tr> 
       
     <tr id="trdark">            
       <td nowrap width="5%" >
          <div align="left"><b>      </b></div>
       </td>
       <td nowrap width="60%" >
       	  <div align="left"></div> 
          <input type="text" name="E01USFDS3" size="60" maxlength="65" value="<%= InReje.getE01USFDS3() %>">
           
       </td>
     </tr> 
       
     <tr id="trdark">            
       <td nowrap width="5%" >
          <div align="left"><b>       </b></div>
       </td>
       <td nowrap width="60%" >
       	  <div align="left"></div> 
          <input type="text" name="E01USFDS4" size="60" maxlength="65" value="<%= InReje.getE01USFDS4() %>">
           
       </td>
     </tr>                  
       
     <tr id="trdark">            
       <td nowrap width="5%" >
          <div align="left"><b>       </b></div>
       </td>
       <td nowrap width="60%" >
       	  <div align="left"></div> 
          <input type="text" name="E01USFDS5" size="60" maxlength="65" value="<%= InReje.getE01USFDS5() %>">
           
       </td>
     </tr>               
 
 <%  
 
 if (userPO.getHeader1().equals("3")  ) {%>
 
       
   <tr id="trclear"> 
      <td nowrap width="17%" > 
         <div align="center"><b>Send To :</b></div>
      </td>
      <td nowrap width="36%" > 
   
   	 
 		 <select name="E01USFSND">
 	 	    <option value=" " <%if (InReje.getE01USFSND().equals(" ")) {  out.print("selected"); }%>>               </option> 
    	    <option value="1" <%if (InReje.getE01USFSND().equals("1")) {  out.print("selected"); }%>>Private Banking</option>
     	    <option value="2" <%if (InReje.getE01USFSND().equals("2")) {  out.print("selected"); }%>>Treasury</option>
     	     
    	 </select>
    	 <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom" border="0"  > 
      </td>
       
    </tr>
    	 
 <%}%>  	 
 	 
   
  </table>
      
    <br>
   
  <tr> 
     <td nowrap colspan="2" valign="middle" height="100"> 
       <div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Submit">
		</div>
     </td>
  </tr>
  

  </form>
</body>
</html>
