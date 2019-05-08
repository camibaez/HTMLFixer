<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EDD067001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

</SCRIPT>

<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01POSFRQ.value=="W" && document.forms[0].E01POSPMD.value =="") {
 alert("A valid payment weekday(Mon - Fr) must be entered for this option");
  document.forms[0].E01POSPMD.value='';
  document.forms[0].E01POSPMD.focus();
}
else if ( document.forms[0].E01POSFRQ.value=="M" && document.forms[0].E01POSPMD.value =="") {
 alert("A valid payment day must be entered for this option");
  document.forms[0].E01POSPMD.value='';
  document.forms[0].E01POSPMD.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>

<SCRIPT Language="Javascript">

  function Checking(){
  if(document.forms[0].E01PODTYP.value == 3){
   alert("This option is not valid for  Swift MT - 200");
   document.forms[0].E11POSORC.blur();
   return;
  }
  }
 function Checking1(){
  if(document.forms[0].E01PODTYP.value == 3){
   alert("This option is not valid for  Swift MT - 200");
   document.forms[0].E01POSOBO.blur();
   return;
  }
  }
 function Checking2(){
  if(document.forms[0].E01PODTYP.value == 3){
   alert("This option is not valid for  Swift MT - 200");
   document.forms[0].E11POSOBK.blur();
   return;
  }
  }
  function showTab(index,name){

  if((document.forms[0].E01PODTYP.value == 2)&& index == 7 ){
  alert("This option is not valid for  Swift MT - 100");
  return;
  }
  if((document.forms[0].E01PODTYP.value == 3)&& ((index == 4 )||(index== 5)||(index== 7))){
  alert("This option is not valid for  Swift MT - 200");
  return;
  }
  if((document.forms[0].E01PODTYP.value == 4)&& ((index == 5)||(index== 7))){
  alert("This option is not valid for  Swift MT - 202");
  return;
  }
  if((document.forms[0].E01PODTYP.value == 5)&& ((index == 0 )||(index== 1)||(index== 2)||(index== 3)||(index== 6))){
  alert("This option is not valid for  Telex");
  return;
  }
  if((document.forms[0].E01REFNUM.value == '0' || document.forms[0].E01REFNUM.value == '') && index == 8){
  alert("This is not an Stand Alone Order");
  return;
  }

  for(var i=0;i<9;i++){
   document.all["Tab"+i].className="tabnormalv";
   document.all["dataTab"+i].style.display="none";
   }
  if(index < 4) {
    document.all["Tab"+index].className="tabhighlightl";
	colTab.className="tabdataleft";
  }else {
	document.all["Tab"+index].className="tabhighlightr";
	colTab.className="tabdataright";
  }
  document.all["dataTab"+index].style.display="";
  document.all[name].focus();
  }

 </script>

</head>

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Payment Orders Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pr_maint.jsp,EDD0670" ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0670">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
	<INPUT TYPE=HIDDEN NAME="E01POSPR1" VALUE="<%= prBasic.getE01POSPR1()%>">
    <INPUT TYPE=HIDDEN NAME="E01POSPR2" VALUE="<%= prBasic.getE01POSPR2()%>">
	<INPUT TYPE=HIDDEN NAME="E01POSCHB" VALUE="<%= prBasic.getE01POSCHB()%>">
    <INPUT TYPE=HIDDEN NAME="E01POSCHO" VALUE="<%= prBasic.getE01POSCHO()%>">
	<INPUT TYPE=HIDDEN NAME="E01PODTYP" VALUE="<%= prBasic.getE01PODTYP()%>">
    <INPUT TYPE=HIDDEN NAME="E01REFNUM" VALUE="<%= prBasic.getE01REFNUM()%>">
  <h4>Basic Information</h4>


  <table class="tableinfo" >
    <tr id="trdark">
      <td nowrap width="30%" >
        <div align="right">Swift Identification :</div>
      </td>
      <td nowrap width="10%" >
        <div align="left">
          <input type="text" name="E01POSSID" size="12" maxlength="12" value="<%= prBasic.getE01POSSID()%>">
          <a href="javascript:GetSwiftId('E01POSSID')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a></div>
      </td>
      <td nowrap width="20%" >
        <div align="right">Priority : </div>
      </td>
      <td nowrap colspan="3" width="40%" >
        <div align="left">
          <input type="radio" name="CE01POSPR1"
              <%if(prBasic.getE01POSPR1().equals("X")) out.print("checked");%>
		onClick="document.forms[0].E01POSPR1.value = 'X';document.forms[0].E01POSPR2.value = ' '">
          01
          <input type="radio" name="CE01POSPR1" value="X"
              <%if(prBasic.getE01POSPR2().equals("X")) out.print("checked");%>
		 onClick="document.forms[0].E01POSPR1.value = ' ';document.forms[0].E01POSPR2.value = 'X'">
          02 </div>
      </td>
    </tr>
    <tr id="trclear">
      <td nowrap width="30%" >
        <div align="right"></div>
      </td>
      <td nowrap width="10%" >&nbsp; </td>
      <td nowrap width="20%" >
        <div align="right">Charges :</div>
      </td>
      <td nowrap colspan="3" width="40%" >
        <input type="radio" name="CE01POSCHB" value="X"
			  onClick="document.forms[0].E01POSCHB.value='X';document.forms[0].E01POSCHO.value=' '"
              <%if(prBasic.getE01POSCHB().equals("X")) out.print("checked");%>>
        Beneficiary
        <input type="radio" name="CE01POSCHB" value="X"
			  onClick="document.forms[0].E01POSCHB.value=' ';document.forms[0].E01POSCHO.value='X'"
              <%if(prBasic.getE01POSCHO().equals("X")) out.print("checked");%>>
        Our</td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr>
      <td align="center">
        <table id="TableTab" cellspacing=0 cellpadding=0 width="99%">
          <tr>
            <td  valign="top" align="right" width="5%">
              <table id="TableTabL" cellspacing=0 cellpadding=0 border="0">
                <tr>
                  <td  id="Tab0" class="tabhighlightl" onClick="showTab(0,'E11POSORC')">
                    <div  >Ordering </div>
                  <td>
                </tr>
                <tr>
                  <td  id="Tab1" class="tabnormalv" onClick="showTab(1,'E01POSSCO')">
                    <div  >Correspondant</div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab2" class="tabnormalv" onClick="showTab(2,'E11POSINB')">
                    <div >Intermediary Bank </div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab3" class="tabnormalv" onClick="showTab(3,'E01POSBBO')">
                    <div  >Account with Bank </div>
                  <td>
                </tr>
              </table>
            </td>
            <td id="colTab" align="center" class="tabdataleft">
              <div id="DataTab">
                <div id="dataTab0">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="14%" >
                        <div align="right"> Customer :</div>
                      </td>
                      <td nowrap width="21%">
                        <input type="text" name="E11POSORC" size="36" maxlength="35" value="<%= prBasic.getE11POSORC()%>" onClick="javascript:Checking()"><BR>
                        <input type="text" name="E21POSORC" size="36" maxlength="35" value="<%= prBasic.getE21POSORC()%>" onClick="javascript:Checking()"><BR>
                        <input type="text" name="E31POSORC" size="36" maxlength="35" value="<%= prBasic.getE31POSORC()%>" onClick="javascript:Checking()"><BR>
                        <input type="text" name="E41POSORC" size="36" maxlength="35" value="<%= prBasic.getE41POSORC()%>" onClick="javascript:Checking()">
                      </td>
                      <td nowrap width="23%">
                        <div align="right">Bank : </div>
                      </td>
                      <td nowrap width="4%" valign="top">
                        <input type="text" name="E01POSOBO" size="2" maxlength="1" value="<%= prBasic.getE01POSOBO()%>" onClick="javascript:Checking1()">
                      </td>
                      <td nowrap width="4%">&nbsp;</td>
                      <td nowrap width="34%">
                        <input type="text" name="E11POSOBK" size="36" maxlength="35" value="<%= prBasic.getE11POSOBK()%>" onClick="javascript:Checking2()"><BR>
                        <input type="text" name="E21POSOBK" size="36" maxlength="35" value="<%= prBasic.getE21POSOBK()%>" onClick="javascript:Checking2()"><BR>
                        <input type="text" name="E31POSOBK" size="36" maxlength="35" value="<%= prBasic.getE31POSOBK()%>" onClick="javascript:Checking2()"><BR>
                        <input type="text" name="E41POSOBK" size="36" maxlength="35" value="<%= prBasic.getE41POSOBK()%>" onClick="javascript:Checking2()">
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab1" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="16%" >
                        <div align="right">Sender Bank :</div>
                      </td>
                      <td nowrap width="2%" valign="top" >
                        <input type="text" name="E01POSSCO" size="2" maxlength="1" value="<%= prBasic.getE01POSSCO()%>" >
                      </td>
                      <td nowrap width="3%" valign="middle" >&nbsp;</td>
                      <td nowrap width="38%" valign="middle" >
                        <input type="text" name="E11POSSCB" size="36" maxlength="35" value="<%= prBasic.getE11POSSCB()%>"><BR>
                        <input type="text" name="E21POSSCB" size="36" maxlength="35" value="<%= prBasic.getE21POSSCB()%>"><BR>
                        <input type="text" name="E31POSSCB" size="36" maxlength="35" value="<%= prBasic.getE31POSSCB()%>"><BR>
                        <input type="text" name="E41POSSCB" size="36" maxlength="35" value="<%= prBasic.getE41POSSCB()%>">
                      </td>
                      <td nowrap width="7%" >
                        <div align="right">Receiver :</div>
                      </td>
                      <td nowrap width="34%" >
                        <input type="text" name="E11POSRCB" size="36" maxlength="35" value="<%= prBasic.getE11POSRCB()%>"><BR>
                        <input type="text" name="E21POSRCB" size="36" maxlength="35" value="<%= prBasic.getE21POSRCB()%>"><BR>
                        <input type="text" name="E31POSRCB" size="36" maxlength="35" value="<%= prBasic.getE31POSRCB()%>"><BR>
                        <input type="text" name="E41POSRCB" size="36" maxlength="35" value="<%= prBasic.getE41POSRCB()%>">
                      </td>
                    </tr>
                    <tr >
                      <td nowrap width="16%" >
                        <div align="right"></div>
                      </td>
                      <td nowrap colspan="3" >&nbsp; </td>
                      <td nowrap colspan="2" >&nbsp; </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab2" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="28%" >
                        <div align="right"> Intermediary Bank :</div>
                      </td>
                      <td nowrap width="21%" >
                        <input type="text" name="E11POSINB" size="36" maxlength="35" value="<%= prBasic.getE11POSINB()%>"><BR>
                        <input type="text" name="E21POSINB" size="36" maxlength="35" value="<%= prBasic.getE21POSINB()%>"><BR>
                        <input type="text" name="E31POSINB" size="36" maxlength="35" value="<%= prBasic.getE31POSINB()%>"><BR>
                        <input type="text" name="E41POSINB" size="36" maxlength="35" value="<%= prBasic.getE41POSINB()%>">
                      </td>
                      <td nowrap width="51%" >&nbsp; </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab3" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="28%" >
                        <div align="right">Account With Bank : </div>
                      </td>
                      <td nowrap width="2%" valign="top" >
                        <input type="text" name="E01POSBBO" size="2" maxlength="1" value="<%= prBasic.getE01POSBBO()%>" >
                      </td>
                      <td nowrap width="4%" >&nbsp;</td>
                      <td nowrap width="66%" >
                        <input type="text" name="E11POSBBK" size="36" maxlength="35" value="<%= prBasic.getE11POSBBK()%>"><BR>
                        <input type="text" name="E21POSBBK" size="36" maxlength="35" value="<%= prBasic.getE21POSBBK()%>"><BR>
                        <input type="text" name="E31POSBBK" size="36" maxlength="35" value="<%= prBasic.getE31POSBBK()%>"><BR>
                        <input type="text" name="E41POSBBK" size="36" maxlength="35" value="<%= prBasic.getE41POSBBK()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab4" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="28%" >
                        <div align="right"> Customer :</div>
                      </td>
                      <td nowrap width="30%" >
                        <input type="text" name="E11POSBCU" size="36" maxlength="35" value="<%= prBasic.getE11POSBCU()%>"><BR>
                        <input type="text" name="E21POSBCU" size="36" maxlength="35" value="<%= prBasic.getE21POSBCU()%>"><BR>
                        <input type="text" name="E31POSBCU" size="36" maxlength="35" value="<%= prBasic.getE31POSBCU()%>"><BR>
                        <input type="text" name="E41POSBCU" size="36" maxlength="35" value="<%= prBasic.getE41POSBCU()%>">
                      </td>
                      <td nowrap width="8%">
                        <div align="right">Bank : </div>
                      </td>
                      <td nowrap width="34%">
                        <input type="text" name="E11POSBCN" size="36" maxlength="35" value="<%= prBasic.getE11POSBCN()%>"><BR>
                        <input type="text" name="E21POSBCN" size="36" maxlength="35" value="<%= prBasic.getE21POSBCN()%>"><BR>
                        <input type="text" name="E31POSBCN" size="36" maxlength="35" value="<%= prBasic.getE31POSBCN()%>"><BR>
                        <input type="text" name="E41POSBCN" size="36" maxlength="35" value="<%= prBasic.getE41POSBCN()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab5" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="44%" >
                        <div align="right">Detail of Payments :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap width="54%">
                        <input type="text" name="E11POSDTP" size="36" maxlength="35" value="<%= prBasic.getE11POSDTP()%>"><BR>
                        <input type="text" name="E21POSDTP" size="36" maxlength="35" value="<%= prBasic.getE21POSDTP()%>"><BR>
                        <input type="text" name="E31POSDTP" size="36" maxlength="35" value="<%= prBasic.getE31POSDTP()%>"><BR>
                        <input type="text" name="E41POSDTP" size="36" maxlength="35" value="<%= prBasic.getE41POSDTP()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab6" style="display: none">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                      <td nowrap width="44%" >
                        <div align="right">Bank to Bank Information :</div>
                      </td>
                      <td nowrap width="2%">&nbsp; </td>
                      <td nowrap width="54%">
                        <input type="text" name="E11POSBKB" size="36" maxlength="35" value="<%= prBasic.getE11POSBKB()%>"><BR>
                        <input type="text" name="E21POSBKB" size="36" maxlength="35" value="<%= prBasic.getE21POSBKB()%>"><BR>
                        <input type="text" name="E31POSBKB" size="36" maxlength="35" value="<%= prBasic.getE31POSBKB()%>"><BR>
                        <input type="text" name="E41POSBKB" size="36" maxlength="35" value="<%= prBasic.getE41POSBKB()%>">
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab7" style="display: none">
                  <table width="100%">
                    <tr id="trclear" >
                      <td nowrap width="31%" >
                        <div align="right">Orig Department :</div>
                      </td>
                      <td nowrap width="25%">
                        <input type="text" name="E01POTORD" size="12" maxlength="12" value="<%= prBasic.getE01POTORD().trim()%>">
                      </td>
                      <td nowrap width="22%">
                        <div align="right">Telex Log Ref:</div>
                      </td>
                      <td nowrap width="22%">
                        <input type="text" name="E01POTLOG" size="12" maxlength="12" value="<%= prBasic.getE01POTLOG().trim()%>">
                      </td>
                    </tr>
                    <tr   >
                      <td nowrap width="31%" height="23" >
                        <div align="right">Receiver Bank :</div>
                      </td>
                      <td nowrap height="23" width="25%">
                        <input type="text" name="E01POTCNU" size="10" maxlength="9" value="<%= prBasic.getE01POSSID().trim()%>">
                      </td>
                      <td nowrap height="23" width="22%">
                        <div align="right">Short Name :</div>
                      </td>
                      <td nowrap height="23" width="22%">
                        <input type="text" name="E01POTCSN" size="20" maxlength="15" value="<%= prBasic.getE01POTCSN().trim()%>">
                      </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="31%" height="23" >
                        <div align="right">Name :</div>
                      </td>
                      <td nowrap height="23" width="25%">
                        <input type="text" name="E01POTTO1" size="30" maxlength="25" value="<%= prBasic.getE01POTTO1().trim()%>">
                      </td>
                      <td nowrap height="23" width="22%">
                        <div align="right">Advice Via :</div>
                      </td>
                      <td nowrap height="23" width="22%">
                        <input type="text" name="E01POTVIA" size="2" maxlength="1" value="<%= prBasic.getE01POTVIA().trim()%>">
                        ( /L/I/F) </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="31%" height="23" >&nbsp;</td>
                      <td nowrap height="23" width="25%">
                        <input type="text" name="E01POTTO2" size="30" maxlength="25" value="<%= prBasic.getE01POTTO2().trim()%>">
                      </td>
                      <td nowrap height="23" width="22%">
                        <div align="right">Telex Number :</div>
                      </td>
                      <td nowrap height="23" width="22%">
                        <input type="text" name="E01POTNRO" size="20" maxlength="15" value="<%= prBasic.getE01POTNRO().trim()%>">
                      </td>
                    </tr>
                    <tr >
                      <td nowrap width="31%" >
                        <div align="right">By Order of :</div>
                      </td>
                      <td nowrap colspan="3">
                        <input type="text" name="E01POTBYO" size="30" maxlength="30" value="<%= prBasic.getE01POTBYO().trim()%>" >
                      </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="31%" >
                        <div align="right"> Originator's Bank :</div>
                      </td>
                      <td nowrap colspan="3">
                        <input type="text" name="E01POTORB" size="30" maxlength="30" value="<%= prBasic.getE01POTORB().trim()%>" >
                      </td>
                    </tr>
                    <tr   >
                      <td nowrap width="31%" >&nbsp;</td>
                      <td nowrap colspan="3">&nbsp;</td>
                    </tr>
                    <tr   >
                      <td nowrap width="31%" >
                        <div align="right"> We Charge your Account With Us :</div>
                      </td>
                      <td nowrap width="25%">
                        <input type="text" name="E01POTOU1" size="15" maxlength="13" value="<%= prBasic.getE01POTOU1().trim()%>" >
                      </td>
                      <td nowrap width="22%">
                        <div align="right">Charge Our Account With You :</div>
                      </td>
                      <td nowrap width="22%">
                        <input type="text" name="E01POTOUA" size="15" maxlength="12" value="<%= prBasic.getE01POTOUA().trim()%>" >
                      </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="31%" >
                        <div align="right">Cover Provided With :</div>
                      </td>
                      <td nowrap>
                        <input type="text" name="E01POTCVP" size="25" maxlength="20" value="<%= prBasic.getE01POTCVP().trim()%>" >
                      </td>
                      <td nowrap colspan="2">
                        <input type="text" name="E01POTOTC" size="35" maxlength="30" value="<%= prBasic.getE01POTOTC().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab8" style="display: none">
                  <table width="100%">
                    <tr id="trclear" >
                      <td nowrap width="35%" >
                        <div align="right">Amount :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="text" name="E01POSAM1" size="14" maxlength="13" value="<%= prBasic.getE01POSAM1()%>" >
                      </td>
                    </tr>
                    <tr   >
                      <td nowrap width="35%" >
                        <div align="right"></div>
                      </td>
                      <td nowrap width="4%"> <font size="1">Branch</font><br>
                      </td>
                      <td nowrap width="5%">
                        <div align="center"><font size="1">Currency</font></div>
                      </td>
                      <td nowrap width="9%">
                        <div align="center"><font size="1">G/L</font></div>
                      </td>
                      <td nowrap width="7%">
                        <div align="center"><font size="1">Account</font></div>
                      </td>
                      <td nowrap width="9%"><font size="1">Sub Account</font></td>
                      <td nowrap width="31%"><font size="1">Cost Center</font></td>
                    </tr>
                    <tr   >
                      <td nowrap width="35%" >
                        <div align="right">Debit Account :</div>
                      </td>
                      <td nowrap width="4%">
                        <input type="text" name="E01POSDBR" size="4" maxlength="3" value="<%= prBasic.getE01POSDBR()%>"
						  oncontextmenu="showPopUp(branchHelp,this.name,'01','','','','')" >
                      </td>
                      <td nowrap width="5%">
                        <input type="text" name="E01POSDCY" size="4" maxlength="3" value="<%= prBasic.getE01POSDCY()%>"
						  oncontextmenu="showPopUp(currencyHelp,'E01POSDCY','01','','','','')"	>
                      </td>
                      <td nowrap width="9%">
                        <input type="text" name="E01POSDGL" size="14" maxlength="12" value="<%= prBasic.getE01POSDGL()%>"
						oncontextmenu="showPopUp(ledgerHelp,'E01POSDGL','01',document.forms[0].E01POSDCY.value,'')">
                      </td>
                      <td nowrap width="7%">
                        <input type="text" name="E01POSDAC" size="10" maxlength="9" value="<%= prBasic.getE01POSDAC()%>"
						  oncontextmenu="showPopUp(accountHelp,'E01POSDAC','01','','','','')">
                      </td>
                      <td nowrap width="9%">
                        <div align="center">
                          <input type="text" name="E01POSDSB" size="6" maxlength="5" value="<%= prBasic.getE01POSDSB()%>"
						  oncontextmenu="showPopUp(subaccHelp ,this.name,'','',document.forms[0].E01POSDAC.value,'','')"
						  >
                        </div>
                      </td>
                      <td nowrap width="31%">
                        <input type="text" name="E01POSDCS" size="7" maxlength="6" value="<%= prBasic.getE01POSDCS()%>"
						oncontextmenu="showPopUp(costcenterHelp,this.name,'01','','','','')" >
                      </td>
                    </tr>
                    <tr   >
                      <td nowrap width="35%" >
                        <div align="right"></div>
                      </td>
                      <td nowrap width="4%"> <font size="1">Branch</font><br>
                      </td>
                      <td nowrap width="5%">
                        <div align="center"><font size="1">Currency</font></div>
                      </td>
                      <td nowrap width="9%">
                        <div align="center"><font size="1">G/L</font></div>
                      </td>
                      <td nowrap width="7%">
                        <div align="center"><font size="1">Account</font></div>
                      </td>
                      <td nowrap width="9%"><font size="1">Sub Account</font></td>
                      <td nowrap width="31%"><font size="1">Cost Center</font></td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="35%" height="17" >
                        <div align="right">Credit Account :</div>
                      </td>
                      <td nowrap width="4%" height="17">
                        <input type="text" name="E01POSCBR" size="4" maxlength="3" value="<%= prBasic.getE01POSCBR()%>"
						oncontextmenu="showPopUp(branchHelp,'E01POSCBR','01','','','','')">
                      </td>
                      <td nowrap width="5%" height="17">
                        <input type="text" name="E01POSCCY" size="4" maxlength="3" value="<%= prBasic.getE01POSCCY()%>"
						oncontextmenu="showPopUp(currencyHelp,'E01POSCCY','01','','','','')"	>
                      </td>
                      <td nowrap width="9%" height="17">
                        <input type="text" name="E01POSCGL" size="14" maxlength="12" value="<%= prBasic.getE01POSCGL()%>"
						oncontextmenu="showPopUp(ledgerHelp,'E01POSCGL','01',document.forms[0].E01POSCCY.value,'')">
                      </td>
                      <td nowrap width="7%" height="17">
                        <input type="text" name="E01POSCAC" size="10" maxlength="9" value="<%= prBasic.getE01POSCAC()%>"
						oncontextmenu="showPopUp(accountHelp,'E01POSCAC','01','','','','')">
                      </td>
                      <td nowrap width="9%" height="17">
                        <div align="center">
                          <input type="text" name="E01POSCSB" size="6" maxlength="5" value="<%= prBasic.getE01POSCSB()%>"
						  oncontextmenu="showPopUp(subaccHelp ,this.name,'','',document.forms[0].E01POSCAC.value,'','')" >
                        </div>
                      </td>
                      <td nowrap width="31%" height="17">
                        <input type="text" name="E01POSCCS" size="7" maxlength="6" value="<%= prBasic.getE01POSCCS()%>"
						oncontextmenu="showPopUp(costcenterHelp,this.name,'01','','','','')" >
                      </td>
                    </tr>
                    <tr >
                      <td nowrap width="35%" >
                        <div align="right">Payment Frequency :</div>
                      </td>
                      <td nowrap colspan="6">
                        <select name="E01POSFRQ">
                          <option value="D" <% if(prBasic.getE01POSFRQ().equals("D")) out.print("selected");%>>Daily</option>
                          <option value="W" <% if(prBasic.getE01POSFRQ().equals("W")) out.print("selected");%>>Weekly</option>
                          <option value="M" <% if(prBasic.getE01POSFRQ().equals("M")) out.print("selected");%>>Monthly</option>
                          <option value="V" <% if(prBasic.getE01POSFRQ().equals("V")) out.print("selected");%>>Variable</option>
                        </select>
                      </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="35%" >
                        <div align="right"> Payment Day :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="text" name="E01POSPMD" size="3" maxlength="2" value="<%= prBasic.getE01POSPMD()%>" >
                        <a href="javascript:GetCode('E01POSPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help" ></a>
                      </td>
                    </tr>
                    <tr   >
                      <td nowrap width="35%" >
                        <div align="right"> or Number or Days :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="text" name="E01POSDYS" size="4" maxlength="3" value="<%= prBasic.getE01POSDYS()%>" >
                        ( For Variable Payment Frequency Only) </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="35%" >
                        <div align="right">Number of Payments :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="text" name="E01POSNPM" size="6" maxlength="4" value="<%= prBasic.getE01POSNPM()%>" >
                        (9999 = Indefinite) </td>
                    </tr>
                    <tr >
                      <td nowrap width="35%" >
                        <div align="right">Payment Type :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="radio" name="E01FLD001" value="F"
              <%if(prBasic.getE01FLD001().equals("F")) out.print("checked");%> checked>
                        Fixed
                        <input type="radio" name="E01FLD001" value="V"
              <%if(prBasic.getE01FLD001().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="35%" >
                        <div align="right">Overdraft Authorization :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="radio" name="E01POSODA" value="Y"
              <%if(prBasic.getE01POSODA().equals("Y")) out.print("checked");%>>
                        Yes
                        <input type="radio" name="E01POSODA" value="N"
              <%if(prBasic.getE01POSODA().equals("N")) out.print("checked");%> checked>
                        No </td>
                    </tr>
                    <tr >
                      <td nowrap width="35%" >
                        <div align="right">Suspend Payment :</div>
                      </td>
                      <td nowrap colspan="6">
                        <input type="radio" name="E01POSSPM" value="Y"
              <%if(prBasic.getE01POSSPM().equals("Y")) out.print("checked");%>>
                        Yes
                        <input type="radio" name="E01POSSPM" value="N"
              <%if(prBasic.getE01POSSPM().equals("N")) out.print("checked");%> checked>
                        No </td>
                    </tr>
                    <tr id="trclear" >
                      <td nowrap width="35%">
                        <div align="right">Reflect on Statement :</div>
                      </td>
                      <td nowrap colspan="6" >
                        <input type="text" name="E01FLD002" size="6" maxlength="4" value="<%= prBasic.getE01FLD002()%>" >
                        (Days) </td>
                    </tr>
                  </table>
                </div>
              </div>
            </td>
            <td  valign=top width="5%">
              <table id="TableTabR" cellspacing=0 cellpadding=0 border="0">
                <tr >
                  <td  id="Tab4" class="tabnormalv" onClick="showTab(4,'E11POSBCU')">
                    <div  align="right" >Beneficiary</div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab5" class="tabnormalv" onClick="showTab(5,'E11POSDTP')">
                    <div  align="right" >Detail of Payments </div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab6" class="tabnormalv" onClick="showTab(6,'E11POSBKB')">
                    <div  align="right" >Bank to Bank Information</div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab7" class="tabnormalv" onClick="showTab(7,'E01POTORD')">
                    <div align="right">Telex</div>
                  <td>
                </tr>
                <tr >
                  <td  id="Tab8" class="tabnormalv" onClick="showTab(8,'E01POSAM1')">
                    <div  align="right" >Stand Alone Orders</div>
                  <td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
 <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
</form>
</body>
</html>
