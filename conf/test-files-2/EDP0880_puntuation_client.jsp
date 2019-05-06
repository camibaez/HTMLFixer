<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Información Financiera</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="mL0730" class="datapro.eibs.beans.EDP073001Message" scope="session" />
<jsp:useBean id="grpList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<script language="javascript">


function showOption(obj){
 var i= obj[obj.selectedIndex].value; 
   document.all["dataGrpTable"+ document.forms[0].ActOpt.value].style.display="none"
   document.all["dataGrpTable"+ i].style.display=""
   document.forms[0].ActOpt.value = i;
   adjustEquTables(headTable1, document.all["dataGrpTable"+ i], dataDiv1,1,false);
   showChecked("GRPNUM"+i);
}

function showGrpAcc(flg,idxRow){
  var i= document.forms[0].ActAccTb.value;
  var j= document.forms[0].ActOpt.value;
  var k= document.all["dataGrpTable"+j].rows.length;
  for(var l=0;l<k;l++) {
    document.all["dataGrpTable"+j].rows[l].className="trnormal";
    }
  document.all["dataGrpTable"+j].rows[idxRow].className="trhighlight";
  document.all["dataAccTable"+i].style.display="none";
  document.forms[0].ActAccTb.value=flg;
//  document.forms[0].E01CNORCD.value=trim(dataTable.rows[idxRow].cells[5].innerText);
  try {
  	document.all["dataAccTable"+flg].style.display="";
  	if (document.all["dataAccTable"+flg].rows.length > 0) {
  	ACCINFO.style.display="";
  	adjustEquTables(headTable2, document.all["dataAccTable"+flg], dataDiv2,1,false);
  	showChecked("ACCNUM"+flg);
  	} else ACCINFO.style.display="none";
  } catch(e){}
  finally {}  
  
}    

function setAccInfo(valNA1,idxRow,idxAbsRow,MEMO){

// alert(document.forms[0].E01DPXLID.text);

  var dataTable=document.all["dataAccTable"+document.forms[0].ActAccTb.value];
  for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].E01IFMNA1.value=valNA1;
   document.forms[0].E01IFMGLN.value=trim(dataTable.rows[idxRow].cells[1].innerText);
   document.forms[0].E01IFMDSC.value=trim(dataTable.rows[idxRow].cells[2].innerText);
   document.forms[0].E01IFMAMT.value=trim(replaceAll(dataTable.rows[idxRow].cells[3].innerText,","));
   document.forms[0].E01CNORCD.value=trim(dataTable.rows[idxRow].cells[5].innerText);
   document.forms[0].E01DPMS01.value="<%=mL0730.getE01DPMS01().trim()%>";
   document.forms[0].E01DPXLID.value=trim(dataTable.rows[idxRow].cells[7].innerText);
   document.forms[0].MEMO.value=MEMO;
   document.forms[0].ROW.value=idxAbsRow;

//alert(document.forms[0].MEMO.value);

}

 function goUpdVal(){
document.forms[0].SCREEN.value=8;
document.forms[0].submit();	 

}

 function updval(valNA1,idxRow,idxAbsRow){


  var dataTable=document.all["dataAccTable"+document.forms[0].ActAccTb.value];
  for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";

   document.forms[0].E01IFMAMT.value=valNA1;
   document.forms[0].E01IFMNA1.value=valNA1;
   document.forms[0].E01IFMGLN.value=trim(dataTable.rows[idxRow].cells[1].innerText);
   document.forms[0].E01IFMDSC.value=trim(dataTable.rows[idxRow].cells[2].innerText);
   document.forms[0].E01CNORCD.value=trim(dataTable.rows[idxRow].cells[5].innerText);
   document.forms[0].E01DPMS01.value="<%=mL0730.getE01DPMS01().trim()%>";
   document.forms[0].E01DPXLID.value=trim(dataTable.rows[idxRow].cells[7].innerText);
   document.forms[0].ROW.value=idxAbsRow;
	document.forms[0].submit();	 

 }

</script>

</HEAD>
<%--
<body onload=javascript:init()>
--%>
<body >

<h3 align="center">Puntuación Credit Scoring<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="client_financial.jsp,EDP0730"></h3>
<hr size="2">
<P align="center">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2"> 
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActRowD" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActAccTb" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActGrpTb" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActOpt" VALUE="0"> 

<INPUT type=HIDDEN NAME="ROW" value=""> 

<INPUT type=HIDDEN NAME="MEMO" value=""> 
<INPUT type=HIDDEN NAME="TITULO" value=""> 
<INPUT type=HIDDEN NAME="opt" value=""> 
<INPUT type=HIDDEN NAME="RETORNO" value="<%=userPO.getHeader11()%>" >
<input type=HIDDEN name="AUD" value="<%= mL0730.getE01IFMCFA().trim()%>">

<table class="tableinfo">
	<TR>
		<TD NOWRAP>
		<TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
			<tr id="trdark">
				<td align="right"><b>Cliente :</b></td>
				<td nowrap>
				<input type="text" name="E01IFMCUN" size="12" value="<%=userPO.getCusNum()%>" > 
				<% if(userPO.getOption().equals("1")) { %> 
	            <a href="javascript:GetCustomerDescId('E01IFMCUN','NAMECUM','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absmiddle" border="0" >
				<% };%>
	            </a> 
				</td>
				<td align="right"><b>Nombre :</b></td>
				<td nowrap colspan=3>
				<input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getCusName()%>">
			</tr>
		</table>
		</td>
	</tr>
</table>
<%if (accList.getNoResult()) {%>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<% if(!userPO.getOption().equals("1")) { %> 
		
		<div align="center"><font size="3">
		<b> No hay datos que correspondan con su criterio de busqueda </b>
		</font></div>
		<%}%>
		</TD>
	</TR>
</TABLE>
<%} else { %>

<% if(!mL0730.getH01FLGWK3().equals("5")) { %> 

<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER width="100%">
	<TR>
		<TD NOWRAP valign="top" width="100%">
		<TABLE id="headTable1">
			<TR id="trdark">
				<TH ALIGN=CENTER NOWRAP></TH>
				<TH ALIGN=CENTER NOWRAP>Modulo</TH>
				<TH ALIGN=CENTER NOWRAP>100%</TH>
				<TH ALIGN=CENTER NOWRAP>Puntos</TH>
			</TR>
		</TABLE>

		<div id="dataDiv1" class="scbarcolor"><%boolean firstTime = true;
String grpChk = "";
String flg = "";
int accRow = 0;
int grpRow = 0;
int selOpt = 0;
int actAccTb = 0;
int actGrpTb = 0;

try {
	accRow = Integer.parseInt(request.getParameter("ROW"));
} catch (Exception e) {
};
accList.setCurrentRow(accRow);
flg = accList.getFlag();
actAccTb = Integer.parseInt(flg); //
try {
	grpRow = Integer.parseInt(flg.substring(1, flg.length()));
	selOpt = Integer.parseInt(flg.substring(0, 1));
} catch (Exception e) {
};

for (int i = 0; i < k; i++) {%>
		<table id="dataGrpTable<%=i%>" style="display: none">
			<%int j = 0;
firstTime = true;
grpList.initRow();
while (grpList.getNextRow()) {
	if (grpList.getFlag().equals("" + i)) {
		if (i == selOpt) {
			grpChk = (grpRow == j) ? "checked" : "";
		} else {
			grpChk = (firstTime) ? "checked" : "";
		}
		firstTime = false;%>
			<TR>
				<TD ALIGN=Center NOWRAP>
					<input type="radio" name="GRPNUM<%=i%>"	value="<%=grpList.getFlag() + "" + j%>" onClick="showGrpAcc(this.value,<%=j%>)" <%=grpChk%>>
				</TD>
				<TD ALIGN=LEFT NOWRAP>
					<a href="javascript:radioClick('GRPNUM<%=i%>',<%=j%>)">
					<DIV NOWRAP><%=grpList.getRecord(0)%>
					</DIV>
					</a>
				</TD>
				<TD ALIGN=RIGHT NOWRAP>
					<DIV NOWRAP>
					<a href="javascript:radioClick('GRPNUM<%=i%>',<%=j%>)"><%=datapro.eibs.master.Util.fcolorCCY(grpList.getRecord(1))%></a>
					</DIV>
				</TD>
				<TD ALIGN=RIGHT NOWRAP>
					<DIV NOWRAP>
					<a href="javascript:radioClick('GRPNUM<%=i%>',<%=j%>)"><%=datapro.eibs.master.Util.fcolorCCY(grpList.getRecord(2))%></a>
					</DIV>
				</TD>
			</TR>
			<%j++;
}
}%>
		</table>
		<%}%></div>
		</TD>
	</TR>
</TABLE>
<DIV id="ACCINFO">
<A NAME="accounts"> </A>

<TABLE id="mainTable2" class="tableinfo" ALIGN=CENTER width="100%">
	<TR>
		<TD NOWRAP valign="top" width="100%">
		<TABLE id="headTable2">
			<TR id="trdark">
				<TH ALIGN=CENTER NOWRAP></TH>
				<TH ALIGN=CENTER NOWRAP>Factor</TH>
				<TH ALIGN=CENTER NOWRAP>Descripción</TH>
				<TH ALIGN=CENTER NOWRAP>Selección</TH>
			</TR>
		</TABLE>

		<div id="dataDiv2" class="scbarcolor"><%grpList.initRow();
int g = 0;
int h = 0;
int chgGrp = 0;
int accRowD = 0;
while (grpList.getNextRow()) {
	if (Integer.parseInt(grpList.getFlag()) != chgGrp) {
		chgGrp = Integer.parseInt(grpList.getFlag());
		g = 0;
	}%>
		<table id="dataAccTable<%=grpList.getFlag() + "" + g%>"
			style="display: none">
			<%String accChk = "";
accList.initRow();
int j = 0;
firstTime = true;
while (accList.getNextRow()) {
	if (accList.getFlag().equals(grpList.getFlag() + "" + g)) {
		if (accList.getFlag().equals(flg)) {
			accChk = (accRowD == accList.getCurrentRow()) ? "checked" : "";
		} else {
			accChk = (firstTime) ? "checked" : "";
		}
		firstTime = false;%>
			<TR>
            <input type="HIDDEN" name="DPLGLN<%=h%>" value="<%=accList.getRecord(0)%>">
            <input type="HIDDEN" name="CNORCD<%=h%>" value="<%=accList.getRecord(5)%>">

				<TD ALIGN=Center NOWRAP>
				<input type="radio" name="ACCNUM<%=accList.getFlag()%>"
					value="<%=accList.getRecord(3)%>" <%=accChk%>
					onClick="setAccInfo(this.value,'<%=j%>','<%=accList.getCurrentRow()%>',<%=accList.getRecord(10)%>)">
				<TD ALIGN=LEFT NOWRAP>
				<div nowrap><a
					href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(0)%></a></DIV>
				</TD>
				<TD ALIGN=LEFT NOWRAP>
				<div nowrap><a
					href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(1)%></a></DIV>
				</TD>
			</TR>

			<%j++;h++;} %>
<%}%>

		</table>
		<%g++;
}%>
    <input type="HIDDEN" name="RECNUM" value="<%=h%>">
</div>
	</TR>

</TABLE>
<div align="center"> 
		<INPUT id="EIBSBTN" type="submit" name="Submit0" value="Enviar" onclick="goUpdVal()"
	<% if(userPO.getOption().equals("4")){out.print("disabled");}%> 
	>
</div>


</DIV>
<SCRIPT language="JavaScript">
   document.forms[0].ActRow.value=<%=accRow%>;
   document.forms[0].ActRowD.value=<%=accRowD%>;
   document.forms[0].ActAccTb.value="<%=flg%>";
   document.forms[0].ActGrpTb.value="<%=selOpt%>";
   document.forms[0].ActOpt.value=<%=selOpt%>;

   document.forms[0].OPTION.value=<%=selOpt%>;
   
   showOption(document.forms[0].OPTION);  
   function resizeDoc() {
      var actvTbGrp = document.forms[0].ActGrpTb.value;
      var actvTbAcc = document.forms[0].ActAccTb.value;
      var dataTGrp = document.all["dataGrpTable"+actvTbGrp];
      var dataTAcc = document.all["dataAccTable"+actvTbAcc];
       adjustEquTables(headTable1, dataTGrp, dataDiv1,1,false);
       adjustEquTables(headTable2, dataTAcc, dataDiv2,1,false);
   }
    
   resizeDoc();
   window.onresize=resizeDoc;
</SCRIPT>
<% } %> 
<% } %>
<INPUT type="text" maxlength="1" size="1" name="curpos" value="" readonly>

</FORM>

</BODY>
</HTML>
