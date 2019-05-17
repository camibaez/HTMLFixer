<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Upload Form</title>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "dir" class= "com.datapro.generic.beanutil.BeanList"  scope="session" />

<style>
  .select-editable { position:relative; background-color:white; width:400px; height:22px;}
  .select-editable select { position:absolute; top:0px; left:0px; font-size:12px; border:none; width:400px; margin:0; }
  .select-editable input { position:absolute; top:2px; left:2px; width:370px; padding:1px; font-size:12px; border:none; height: 16px;}
  .select-editable select:focus, .select-editable input:focus { outline:none; }
</style>

<SCRIPT Language="javascript">
function OpenFile(url){
	if(url !== ''){
		CenterWindow('<%= datapro.eibs.master.JSEIBSProp.getFORMPDFURL() %>' + url,480,320,2);
	}
}

</SCRIPT>
</head>

<body>
 
<h3 align="center">Upload Form
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="upload_confirm, EForms" ></h3>
<hr size="4">

<table width="100%" bordercolor="#000000" class="tableinfo">
	<tr height="60px"> 
    	<td colspan="2"> 
        	<table width="100%">
          		<tr>
	        		<td align="center">
	        		The form template has been uploaded successfully.
	        		</td>
          		</tr>
        	</table>
      	</td>
	</tr>
</table>

<H4>Verificación de Plantillas</H4>
<table  class="tableinfo">
	<tr>
		<td align="left" colspan="2">
	    	Here you can check the list of templates on the server:
		</td>
	</tr>
	<tr height="22px">
		<td align="right" width="20%">
	    	Templates :
		</td>
        <td nowrap> 
			<span class="select-editable">
			<select id="FILES" name="FILES"  onchange="document.getElementById('FILE').value=this.value">
				<option value="" selected >&nbsp;</option>
<%
				dir.initRow();
				while (dir.getNextRow()) {
					String path = dir.getRecord().toString();
%> 				<option value="<%= path %>"><%= path %></option>
<% 		}	%>
			</select>
			<input type="text" id="FILE" name="FILE" value=""/>
			</span>
			<span>
    		<input id="EIBSBTN" type="button" id="Open" name="Open" value="Download..." style="font-weight: normal;"
				onClick="OpenFile(document.getElementById('FILES').options[document.getElementById('FILES').selectedIndex].value)">
			</span>
		</td>
	</tr>
</table>

</body>
</html>
