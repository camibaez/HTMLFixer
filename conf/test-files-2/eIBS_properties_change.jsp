<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>eIBS Property Update</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.JSEIBSProp" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body>

<h3 align="center">eIBS Property File Update<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="eIBS_properties_change, JSEIBSPropMutator" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/eibsMutator" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <h4>Basic Information</h4>
    
  <table  class="tableinfo">
    <tr > 
        <td nowrap >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Release :</div>
            </td>
            <td nowrap width="68%" > 
              <select name="eIBS.release">
                <option value="43" <% if (JSEIBSProp.getRelease().equals("43")) out.print("selected"); %>>43</option>
                <option value="47" <% if (JSEIBSProp.getRelease().equals("47")) out.print("selected"); %>>47</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Host IP :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.HostIP" value="<%= JSEIBSProp.getHostIP() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">Initial Socket :</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.IniSocket" value="<%= JSEIBSProp.getIniSocket() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Log Option :</div>
            </td>
            <td nowrap width="68%"> 
              <select name="eIBS.Log">
                <option value="0" <% if (JSEIBSProp.getLog() == 0) out.print("selected"); %>>NONE</option>
                <option value="1" <% if (JSEIBSProp.getLog() == 1) out.print("selected"); %>>LOG</option>
                <option value="2" <% if (JSEIBSProp.getLog() == 2) out.print("selected"); %>>SYSTEM</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">Web Application Path</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.WebAppPath" value="<%= JSEIBSProp.getWebAppPath() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Root Path</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.rootPath" value="<%= JSEIBSProp.getRootPath() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">Background Page</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.bgPage" value="<%= JSEIBSProp.getBgPage() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Busy Page</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.busyPage" value="<%= JSEIBSProp.getBusyPage() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">Development Page</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.devPage" value="<%= JSEIBSProp.getDevPage() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Socket Not Open Page</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.sckNotOpenPage" value="<%= JSEIBSProp.getSckNotOpenPage() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right">Socket Not Responding Page</div>
            </td>
            <td nowrap width="68%"> 
              <input type="text" name="eIBS.sckNotRespondPage" value="<%= JSEIBSProp.getSckNotRespPage() %>">
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
<p align="center"> 
    <input type=image class="imgfilter" name="Submit" src="<%=request.getContextPath()%>/images/e/bt_submit.gif"
     onMouseDown="this.className='imgfilterpress'" onMouseUp="this.className='imgfilter'">
  </p>
</form>
</body>
</html>

