<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
 
<html>
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="EDEN000Record" class="datapro.eibs.beans.EDEN000DSMessage"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>


<H3 align="center">Control List- Inquiry Detail<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="denial_detail.jsp, EDEN000"></H3>
<hr size="4">
<form method="post">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Code (UID) :</td>
            <td nowrap width="35%" align="left">
				<%= EDEN000Record.getE01DCOUN().trim()%> 
			</td>
            <td nowrap width="15%" align="right">Type :</td>
			<td nowrap width="35%" align="left">
				<%if (EDEN000Record.getE01DLGT().equals("N")) out.print("Natural"); 
                    else if (EDEN000Record.getE01DLGT().equals("J")) out.print("Juridico");
                    else if (EDEN000Record.getE01DLGT().equals("A")) out.print("Agrupación");
                    else out.print("Desconocido"); 
                %>
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="15%" align="right">Complete  Name:</td>
            <td nowrap width="35%" align="left"> 
				<%= EDEN000Record.getE01DNAME().trim()%> 
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>


<div id="NATURAL" style="position:relative; display:none;">
  <h4>Basic Information</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Name :</td>
            <td nowrap width="35%" align="left"> 
               	<%= EDEN000Record.getE01DNOM().trim()%>
            </td>
            <td nowrap width="15%" align="right">Gender :</td>
            <td nowrap width="35%" align="left">
                <%if (EDEN000Record.getE01DGEN().equals("F")) out.print("Femenino"); 
                    else if (EDEN000Record.getE01DGEN().equals("M")) out.print("Masculino");
                    else out.print("Desconocido"); 
                %>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Last Name:</td>
            <td nowrap width="35%" align="left">
                <%= EDEN000Record.getE01DAPE().trim()%>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICO" style="position:relative; display:none;">
  <h4>Basic Information</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Name  :</td>
            <td nowrap width="35%" align="left"> 
               	<%= EDEN000Record.getE01DNAME().trim()%>
            </td>
            <td nowrap width="15%" align="right">Association   Type:</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DTSOC().trim()%> - <%= EDEN000Record.getD01ASSNME().trim()%>
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>
</div>

  <h4>Aditional Information</h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right">Identification Number. :</td>
            	<td nowrap width="35%"> 
              		<%= EDEN000Record.getE01DIDN().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Identification Type:</td>
            	<td nowrap width="35%"> 
              		<%= EDEN000Record.getE01DTID().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right">Country :</td>
            	<td nowrap width="35%" align="left">
                	<%= EDEN000Record.getE01DACCD().trim()%> - <%= EDEN000Record.getD01CTRNME().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Department / State :</td>
            	<td nowrap width="35%" align="left">
            		<%= EDEN000Record.getE01DASTA().trim()%> - <%= EDEN000Record.getD01STANME().trim()%>
            	</td>
         	</tr>
        	<tr id="trdark"> 
              	<td nowrap width="15%" align="right">Address 1 :</td>
              	<td nowrap width="35%" align="left"> 
              		<%= EDEN000Record.getE01DADD1().trim()%>
              	</td>
              	<td nowrap width="15%" align="right">Address 2 :</td>
              	<td nowrap width="35%" align="left">
					<%= EDEN000Record.getE01DADD2().trim()%>  
              	</td>
            </tr>
        	<tr id="trclear"> 
              	<td nowrap width="15%" align="right">Address 3 :</td>
              	<td nowrap width="35%" align="left"> 
              		<%= EDEN000Record.getE01DADD3().trim()%>  
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>
        	<tr id="trdark"> 
              	<td nowrap width="15%" align="right">Date  of Birth/ Date of Incorporation:</td>
              	<td nowrap width="35%" align="left"> 
						<%= datapro.eibs.master.Util.formatDate(EDEN000Record.getE01DDTEM1(),EDEN000Record.getE01DDTED1(),EDEN000Record.getE01DDTEY1())%>
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>

        </table>
        </td>
    </tr>
  </table>

  <h4>Causals</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Source :</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DCSRC().trim()%> - <%= EDEN000Record.getD01SRCNME().trim()%>
            </td>
            <td nowrap width="15%" align="right">Negation   Code:</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DCTYP().trim()%> - <%= EDEN000Record.getD01TYPNME().trim()%>
            </td>
          </tr>
        <tr id="trdark"> 
           	<td nowrap width="15%" align="right">Fact :</td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM1().trim()%>   
           	</td>
           	<td nowrap width="15%" align="right">Fact   Date:</td>
           	<td nowrap width="35%" align="left">
					<%= datapro.eibs.master.Util.formatDate(EDEN000Record.getE01DDTEM2(),EDEN000Record.getE01DDTED2(),EDEN000Record.getE01DDTEY2())%>
            </td>
        </tr>
        <tr id="trclear"> 
           	<td nowrap width="15%" align="right">Date of inclusion:</td>
           	<td nowrap width="35%" align="left"> 
					<%= datapro.eibs.master.Util.formatDate(EDEN000Record.getE01DDTEM3(),EDEN000Record.getE01DDTED3(),EDEN000Record.getE01DDTEY3())%>
           	</td>
           	<td nowrap width="15%" align="right">Volume/Page :</td>	 
           	<td nowrap width="35%" align="left">
				<%= EDEN000Record.getE01DVOLN().trim()%> / <%= EDEN000Record.getE01DPAGE().trim()%>
           	</td>
    	</tr>
        <tr id="trdark"> 
           	<td nowrap width="15%" align="right">Comments :</td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM2().trim()%>   
           	</td>
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
            </td>
        </tr>
        <tr id="trclear"> 
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM3().trim()%>   
           	</td>
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
            </td>
        </tr>
          
       </table>
      </td>
    </tr>
  </table>
 <br> 
    
    <table width="100%">		
  	<tr>
  		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Close" onClick="self.close();">
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT Language="Javascript">

<% 	if (EDEN000Record.getE01DLGT().trim().equals("N")) { %>
		JURIDICO.style.display='none' ;
		NATURAL.style.display='block' ;
<%	} else { %>
		NATURAL.style.display='none' ;
		JURIDICO.style.display='block' ;
<%	} %>
</SCRIPT>
</html>
