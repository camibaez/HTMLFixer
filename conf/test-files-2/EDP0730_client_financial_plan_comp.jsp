<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Financial Information
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="mL0730" class="datapro.eibs.beans.EDP073001Message" scope="session" />
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "grpList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</HEAD>

<BODY>

<h3 align="center">.<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="client_financial_plan_comp.jsp,EDP0730"></h3>
<hr size="4">
<P align="center"><INPUT type="text" name="TITULO" size="45" readonly
	value="<%=userPO.getHeader20()%>"></P>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500"> 

<input type=HIDDEN name="E01IFMCFO" value="<%=userPO.getHeader3()%>">
<input type=HIDDEN name="E01IFMFEY" value="<%=userPO.getHeader6()%>">
<input type=HIDDEN name="E01IFMFEM" value="<%=userPO.getHeader7()%>">

<table class="tableinfo">    
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Customer :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01IFMCUN" size="12" readonly value="<%=userPO.getHeader1()%>">
      </td>
      <td align="right"  >
         <b>Name :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getHeader2()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Industry :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01IFMCIN" size="15" readonly value="<%=userPO.getHeader4()%>">
      </td>
      <td align="right"  >
         <b>Business :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01IFMLNE" size="15" readonly value="<%=userPO.getHeader5()%>">
      </td> 
      <td align="right"  >
<%--
         <b>Formato :</b>
--%>
      </td>
      <td nowrap > 
<%--
         <input type="text" name="E01IFMCFO" size="2" readonly value="<%=userPO.getHeader3()%>">-
         <input type="text" name="E01IFMFEY" size="4" readonly value="<%=userPO.getHeader6()%>">/
         <input type="text" name="E01IFMFEM" size="2" readonly value="<%=userPO.getHeader7()%>">
--%>
      </td>        
    </tr>  
  </table> 
 </td>        
 </tr>  
</table>

  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  
<%
   optList.initRow();
   int k=0;
       
   while (optList.getNextRow()) {
      if (optList.getFlag().equals("")) {
%>                            
	  <H4><%=optList.getRecord(0)%></H4>
      <TABLE  class="tableinfo">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="2%">&nbsp;
            </th>
             <th align=CENTER nowrap width="30%"> 
            	<div align="center">Description
            	</div>
            </th>
             <th align=CENTER nowrap width="15%"> 
            	<div align="center">Period<BR>
		<INPUT type="text" name="E01IFMFY1" size="4" readonly
					value="<%=mL0730.getE01IFMFY1().trim()%>">/
            	<INPUT type="text" name="E01IFMFM1" size="2" readonly value="<%=mL0730.getE01IFMFM1().trim()%>">
            	<INPUT type="text" name="E01DPBCR1" size="1" readonly value="<%=mL0730.getE01DPBCR1().trim()%>"></div>
            </th>
             <th align=CENTER nowrap width="15%"> 
            	<div align="center">Period<BR>
		<INPUT type="text" name="E01IFMFY2" size="4" readonly
					value="<%=mL0730.getE01IFMFY2().trim()%>">/
            	<INPUT type="text" name="E01IFMFM2" size="2" readonly value="<%=mL0730.getE01IFMFM2().trim()%>">
            	<INPUT type="text" name="E01DPBCR2" size="1" readonly value="<%=mL0730.getE01DPBCR2().trim()%>"></div>
            	</th>
             <th align=CENTER nowrap width="15%"> 
            	<div align="center">Period<BR>
            	<INPUT type="text" name="E01IFMFEY" size="4" readonly
					value="<%=mL0730.getE01IFMFEY().trim()%>">/
            	<INPUT type="text" name="E01IFMFEM" size="2" readonly value="<%=mL0730.getE01IFMFEM().trim()%>">
            	<INPUT type="text" name="E01DPBCR3" size="1" readonly value="<%=mL0730.getE01DPBCR3().trim()%>"></div>
            </th>
           </tr>


      <% 
        grpList.initRow();
        int j = 0;
        int chgGrp =0;
       %> 
      	   <% 
      	       accList.initRow();
               while (accList.getNextRow()) {
//                    if (accList.getFlag().equals(grpList.getFlag()+""+j)) {
           %>
               <TR id=trclear>       			
                <TD ALIGN=Left width="2%"><B> </B>
                </TD>
				<% if (accList.getRecord(7).equals("Titulo")) { %>
      			<TH ALIGN=LEFT width="30%"  NOWRAP><%= accList.getRecord(1) %> </TH>
      			<% } else { %>
      			<TD ALIGN=LEFT width="30%"  NOWRAP><%= accList.getRecord(1) %> </TD>      
      			<% } %>
				<% if (!accList.getRecord(7).equals("Titulo")) { %>
      			<TD ALIGN=RIGHT width="15%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(8)) %></TD>
      			<TD ALIGN=RIGHT width="15%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(9)) %></TD>
      			<TD ALIGN=RIGHT width="15%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(2)) %></TD>
      			<% } %>
     		  </TR>
           <% 	
//          			}
        		} 
        	%>
           
       <% 
        %>
      </TABLE> 
<%
       k++;
      }        
   }                 
%>


</FORM>

</BODY>
</HTML>
