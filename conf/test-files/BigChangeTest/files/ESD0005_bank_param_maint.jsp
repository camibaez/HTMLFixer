<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Bank Control Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000501Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}

%>

<h3 align="center">Bank Control Parameters Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="bank_param_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">

<h4>Basic Information</h4>
<div align="left">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Bank Code :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTBNK" size="3" readonly maxlength="2" value="<%=bankOld.getE01CNTBNK().trim()%>">
	  	</td>
	    <td nowrap width="30%">
		   <div align="right">Bank Name :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E01CNTNME" size="36" maxlength="35" value="<%=bankOld.getE01CNTNME().trim()%>">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Phone Number :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CNTPHN" size="12" maxlength="11" value="<%=bankOld.getE01CNTPHN().trim()%>">
	   </td>
	    <td nowrap width="30%">
		   <div align="right">Bank Address :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E01CNTADR" size="36" maxlength="35" value="<%=bankOld.getE01CNTADR().trim()%>">
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Bank Identification :</div>
		</td>
		<td nowrap width="20%"><input type="text" name="E01CNTBID" size="16" maxlength="15" value="<%=bankOld.getE01CNTBID().trim()%>">
		</td>
	    <td nowrap width="30%">
		   <div align="right">Bank City :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E01CNTCIT" size="36" maxlength="35" value="<%=bankOld.getE01CNTCIT().trim()%>">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		    <div align="right">End of Fiscal Month/Year :</div>
		</td>
		<td nowrap width="20%">Month &nbsp;<input type="text" name="E01CNTFYM" size="3" maxlength="2" value="<%=bankOld.getE01CNTFYM().trim()%>"  onKeyPress="enterInteger()">
		   &nbsp;&nbsp; Year &nbsp;<input type="text" name="E01CNTFYY" size="3" maxlength="2" value="<%=bankOld.getE01CNTFYY().trim()%>"  onKeyPress="enterInteger()">
		</td>
		<td nowrap width="30%">
		<div align="right">Base Currency :</div>
		</td>
        <td nowrap width="25%">
            <input type="text" name="E01CNTBCU" size="4" maxlength="3" value="<%= bankOld.getE01CNTBCU().trim()%>">
            <a href="javascript:GetCurrency('E01CNTBCU','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
         </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		    <div align="right">P/L F/CCY Transfering :</div>
		</td>
		<td nowrap width="20%">
		  <select name="E01CNTPRF">
		    <option value=" "
	           <% if (!(bankOld.getE01CNTPRF().equals("B") || bankOld.getE01CNTPRF().equals("D")
                    	|| bankOld.getE01CNTPRF().equals("M") || bankOld.getE01CNTPRF().equals("N")))
                	    out.print("selected"); %>>
            </option>
            <option value="B" <%if (bankOld.getE01CNTPRF().equals("B"))  out.print("selected");%>>Same G/L in Base Currency</option>
		    <option value="D" <%if (bankOld.getE01CNTPRF().equals("D"))  out.print("selected");%>>Transfering Daily</option>
            <option value="M" <%if (bankOld.getE01CNTPRF().equals("M"))  out.print("selected");%>>Transfering Monthly</option>
		    <option value="N" <%if (bankOld.getE01CNTPRF().equals("N"))  out.print("selected");%>>None Transfering</option>
		  </select>
		</td>
		<td nowrap width="30%">
		<div align="right">Home Office Currency :</div>
		</td>
        <td nowrap width="25%">
            <input type="text" name="E01CNTHCU" size="4" maxlength="3" value="<%= bankOld.getE01CNTHCU().trim()%>">
            <a href="javascript:GetCurrency('E01CNTHCU','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
         </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
			<div align="right">Multicurrency :</div>
		</td>
		<td>
           <p>
           <input type="radio" name="E01CNTMCU" value="Y" <%if (bankOld.getE01CNTMCU().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTMCU" value="N" <%if (bankOld.getE01CNTMCU().equals("N")) 	out.print("checked");%>> No</p>
	  	</td>
		<td nowrap width="30%">
			<div align="right">IBF Facilities :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E01CNTIBF" value="Y"  <%if (bankOld.getE01CNTIBF().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTIBF" value="N"  <%if (bankOld.getE01CNTIBF().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Multibank Entity :</div>
		</td>
		<td>
           <p>
           <input type="radio" name="E01CNTMUL" value="Y" <%if (bankOld.getE01CNTMUL().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTMUL" value="N" <%if (bankOld.getE01CNTMUL().equals("N")) 	out.print("checked");%>> No</p>
	  	</td>
		<td nowrap width="30%">
			<div align="right">Multibranch Entity :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E01CNTMBR" value="Y" <%if (bankOld.getE01CNTMBR().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E01CNTMBR" value="N" <%if (bankOld.getE01CNTMBR().equals("N")) out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
			<div align="right">P/L Reevaluation Frequency :</div>
		</td>
		<td>
		  <select name="E01CNTRVF">
		    <option value=" " <% if (!(bankOld.getE01CNTRVF().equals("1") || bankOld.getE01CNTRVF().equals("2") || bankOld.getE01CNTRVF().equals("3") || bankOld.getE01CNTRVF().equals("N"))) out.print("selected"); %>> </option>
            <option value="1" <%if (bankOld.getE01CNTRVF().equals("1"))  out.print("selected");%>>Global Position Daily</option>
		    <option value="2" <%if (bankOld.getE01CNTRVF().equals("2"))  out.print("selected");%>>Global Position Monthly</option>
            <option value="3" <%if (bankOld.getE01CNTRVF().equals("3"))  out.print("selected");%>>Revaluation for Daily G/L</option>
		    <option value="N" <%if (bankOld.getE01CNTRVF().equals("N"))  out.print("selected");%>>No Revaluation</option>
		  </select>
	  	</td>
		<td nowrap width="30%">
			<div align="right">System Security Active :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E01CNTSEC" value="Y"   <%if (bankOld.getE01CNTSEC().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTSEC" value="N"   <%if (bankOld.getE01CNTSEC().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Customer Access :</div>
		</td>
		<td>
		  <select name="E01CNTCAT">
		    <option value=" " <%if (!(bankOld.getE01CNTCAT().equals("1") || bankOld.getE01CNTCAT().equals("2"))) out.print("selected"); %>> </option>
            <option value="1" <%if (bankOld.getE01CNTCAT().equals("1"))  out.print("selected");%>>Customer Number IBS</option>
		    <option value="2" <%if (bankOld.getE01CNTCAT().equals("2"))  out.print("selected");%>>Customer Number Identi.</option>
		  </select>
	  	</td>
		<td nowrap width="30%">
			<div align="right">Balance for O/D Calculation :</div>
		</td>
        <td nowrap width="25%">
			<select name="E01CNTOCT">
			  <option value=" " <%if (!(bankOld.getE01CNTOCT().equals("G") || bankOld.getE01CNTOCT().equals("N") || bankOld.getE01CNTOCT().equals("A"))) out.print("selected"); %>> </option>
			  <option value="G" <%if (bankOld.getE01CNTOCT().equals("G"))  out.print("selected");%>>Gross Balance</option>
			  <option value="N" <%if (bankOld.getE01CNTOCT().equals("N"))  out.print("selected");%>>Net Balance</option>
		      <option value="A" <%if (bankOld.getE01CNTOCT().equals("A"))  out.print("selected");%>>Balance Account Level</option>
			</select>
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
			<div align="right">Language Indicator :</div>
		</td>
		<td>
	        <select name="E02CNTLAN">
	            <option value=" " <% if (!(bankOld.getE01CNTLAN().equals("S") || bankOld.getE01CNTLAN().equals("E") || bankOld.getE01CNTLAN().equals("F"))) out.print("selected"); %>> </option>
	            <option value="E" <%if (bankOld.getE01CNTLAN().equals("E"))  out.print("selected");%>>English</option>
	            <option value="S" <%if (bankOld.getE01CNTLAN().equals("S"))  out.print("selected");%>>Spanish</option>
			    <option value="F" <%if (bankOld.getE01CNTLAN().equals("F"))  out.print("selected");%>>French</option>
	        </select>
	  	</td>
		<td nowrap width="30%">
			<div align="right">G/L Structure :</div>
		</td>
        <td nowrap width="25%">
			<input type="text" name="E01GLLVL1" size="2" maxlength="1" value="<%=bankOld.getE01GLLVL1().trim()%>"  onKeyPress="enterInteger()">
			<input type="text" name="E01GLLVL2" size="2" maxlength="1" value="<%=bankOld.getE01GLLVL2().trim()%>"  onKeyPress="enterInteger()">
			<input type="text" name="E01GLLVL3" size="2" maxlength="1" value="<%=bankOld.getE01GLLVL3().trim()%>"  onKeyPress="enterInteger()">
			<input type="text" name="E01GLLVL4" size="2" maxlength="1" value="<%=bankOld.getE01GLLVL4().trim()%>"  onKeyPress="enterInteger()">
			<input type="text" name="E01GLLVL5" size="2" maxlength="1" value="<%=bankOld.getE01GLLVL5().trim()%>"  onKeyPress="enterInteger()">
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Bck Value Batch (GL Rep) :</div>
		</td>
		<td>
		    <input type="text" name="E01CNTGRF" size="5" maxlength="4" value="<%=bankOld.getE01CNTGRF().trim()%>"  onKeyPress="enterInteger()">
		   &nbsp; A &nbsp;
		   <input type="text" name="E01CNTGRT" size="5" maxlength="4" value="<%=bankOld.getE01CNTGRT().trim()%>"  onKeyPress="enterInteger()">
	  	</td>
		<td nowrap width="30%">
			<div align="right">First Day Interest Accrual :</div>
		</td>
        <td nowrap width="25%">
	    	<select name="E01CNTFLA">
				 <option value="F" <%if (bankOld.getE01CNTFLA().equals("F")) out.print("selected");%>>First Day yes Last no</option>
	             <option value=" " <%if (bankOld.getE01CNTFLA().equals("") || bankOld.getE01CNTFLA().equals(" ") )  out.print("selected");%>>First Day no Last yes</option>
	        </select>
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
			<div align="right">Backup Media to be Used :</div>
		</td>
		<td>
			<input type="text" name="E01CNTBUM" size="11"  maxlength="10" value="<%=bankOld.getE01CNTBUM().trim()%>">
	  	</td>
		<td nowrap width="30%">
			<div align="right">Check Digit for New Account :</div>
		</td>
        <td nowrap width="25%">
			<select name="E01CNTMOD">
			  <option value=" " <% if (!(bankOld.getE01CNTMOD().equals("N") || bankOld.getE01CNTMOD().equals("0") || bankOld.getE01CNTMOD().equals("1"))) out.print("selected"); %>> </option>
			  <option value="N" <%if (bankOld.getE01CNTMOD().equals("N"))  out.print("selected");%>>No Check Digit</option>
			  <option value="0" <%if (bankOld.getE01CNTMOD().equals("0"))  out.print("selected");%>>IBM Module 10</option>
		      <option value="1" <%if (bankOld.getE01CNTMOD().equals("1"))  out.print("selected");%>>IBM Module 11</option>
			</select>
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
			<div align="right">Microfiche/Reports Options :</div>
		</td>
		<td>
			<select name="E01CNTMFP">
			  <option value=" " <% if (!(bankOld.getE01CNTMFP().equals("M") || bankOld.getE01CNTMFP().equals("R") || bankOld.getE01CNTMFP().equals("B") || bankOld.getE01CNTMFP().equals("N"))) out.print("selected"); %>> </option>
			  <option value="M" <%if (bankOld.getE01CNTMFP().equals("M"))  out.print("selected");%>>Save Microfiche</option>
			  <option value="R" <%if (bankOld.getE01CNTMFP().equals("R"))  out.print("selected");%>>Save End of Day Reports</option>
		      <option value="B" <%if (bankOld.getE01CNTMFP().equals("B"))  out.print("selected");%>>Microfiche and Reports</option>
		      <option value="P" <%if (bankOld.getE01CNTMFP().equals("P"))  out.print("selected");%>>PDF</option>
		      <option value="F" <%if (bankOld.getE01CNTMFP().equals("F"))  out.print("selected");%>>PDF and Reports</option>
	          <option value="N" <%if (bankOld.getE01CNTMFP().equals("N"))  out.print("selected");%>>None</option>
	        </select>
	  	</td>
		<td nowrap width="30%">
			<div align="right">Last Official Check Num. :</div>
		</td>
        <td nowrap width="25%">
			<input type="text" name="E01CNTLCN" size="10" maxlength="9" value="<%=bankOld.getE01CNTLCN().trim()%>"  onKeyPress="enterInteger()">
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
			<div align="right">Date Format  :</div>
		</td>
		<td>
	     	<select name="E01CNTDTF">
	     	  <option value=" "   <%if (!(bankOld.getE01CNTDTF().equals("MDY") || bankOld.getE01CNTDTF().equals("DMY") || bankOld.getE01CNTDTF().equals("YMD"))) out.print("selected"); %>></option>
	          <option value="MDY" <%if (bankOld.getE01CNTDTF().equals("MDY"))  out.print("selected");%>>MDY=Month/Day/Year</option>
			  <option value="DMY" <%if (bankOld.getE01CNTDTF().equals("DMY"))  out.print("selected");%>>DMY=Day/Month/Year</option>
		      <option value="YMD" <%if (bankOld.getE01CNTDTF().equals("YMD"))  out.print("selected");%>>YMD=Year/Month/Day</option>
	        </select>
	  	</td>
		<td nowrap width="30%" align="right">
		Loans Losses Mode :</td>
        <td nowrap width="25%"><SELECT name="E01CNTDEC">
			<OPTION value="1"
				<%if (bankOld.getE01CNTDEC().equals("1")|| bankOld.getE01CNTDEC().equals(" ") ) out.print("selected");%>>Principal
			Only</OPTION>
			<OPTION value="2"
				<%if (bankOld.getE01CNTDEC().equals("2") )  out.print("selected");%>>Principal
			and Interest by level</OPTION>
		</SELECT></td>
	</tr>

</table>
<h4>Aditional Information</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Statement Type :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTSTN" size="3" maxlength="2" value="<%=bankOld.getE01CNTSTN().trim()%>">
		</td>
		<td nowrap width="30%">
		<div align="right">Print "Hold" Statement :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E01CNTPHS" value="Y" <%if (bankOld.getE01CNTPHS().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E01CNTPHS" value="N" <%if (bankOld.getE01CNTPHS().equals("N")) out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Commitment Number Loans :</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E01CNTCLN" value="Y"
	                 <%if (bankOld.getE01CNTCLN().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTCLN" value="N"
                     <%if (bankOld.getE01CNTCLN().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="30%">
		<div align="right">Commitment Number L/C's :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E01CNTCLC" value="Y"
	                 <%if (bankOld.getE01CNTCLC().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTCLC" value="N"
                     <%if (bankOld.getE01CNTCLC().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Commitment Number O/D's :</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E01CNTCOD" value="Y"
	                 <%if (bankOld.getE01CNTCOD().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTCOD" value="N"
                     <%if (bankOld.getE01CNTCOD().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="30%">
		<div align="right">Automatic Open/Close Acc. :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E01CNTREA" size="2" maxlength="1" value="<%=bankOld.getE01CNTREA().trim()%>">
		  <A href="javascript:GetCode('E01CNTREA','STATIC_par_close_open_account.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		</td>
	</tr>	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Trade Accounting:</div>
		</td>
		<td nowrap width="20%">
           <p>
           <input type="radio" name="E01CNTDE1" value="Y"
	                 <%if (bankOld.getE01CNTDE1().equals("Y")) 	out.print("checked");%>> Yes
           <input type="radio" name="E01CNTDE1" value="N"
                     <%if (bankOld.getE01CNTDE1().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="30%">
		<div align="right"></div>
		</td>
		<td nowrap width="25%">

		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">TD's Minimun Rate :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTMNR" size="11" maxlength="10" value="<%=bankOld.getE01CNTMNR().trim()%>">
		</td>
		<td nowrap width="30%">
		<div align="right">TD's Maximum Rate :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTMXR" size="11" maxlength="10" value="<%=bankOld.getE01CNTMXR().trim()%>">
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Maximum Days Back Value :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTMDB" size="4" maxlength="3" value="<%=bankOld.getE01CNTMDB().trim()%>">
		</td>
		<td nowrap width="30%">
		<div align="right">Maximum Days Future Value :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTMDF" size="4" maxlength="3" value="<%=bankOld.getE01CNTMDF().trim()%>">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Institution Type :</div>
		</td>
		<td nowrap width="20%">
	     	<select name="E01CNTTYP">
	     	  <option value=" " <%if (!(bankOld.getE01CNTTYP().equals("B") || bankOld.getE01CNTTYP().equals("R"))) out.print("selected"); %>></option>
	          <option value="B" <%if (bankOld.getE01CNTTYP().equals("B"))  out.print("selected");%>>Base Institution</option>
			  <option value="R" <%if (bankOld.getE01CNTTYP().equals("R"))  out.print("selected");%>>Resulting Institution</option>
	        </select>
		</td>
		<td nowrap width="30%">
		<div align="right">Duplicate Books :</div>
		</td>
		<td nowrap width="25%">
		   <INPUT type="text" name="E01CNTTDB" size="2" maxlength="1" value="<%= bankOld.getE01CNTTDB().trim()%>">
		   <A href="javascript:GetCode('E01CNTTDB','STATIC_par_dupl_book.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		  <div align="right">Balance used for CCY/Ext :</div>
		</td>
		<td nowrap width="20%">
	     	<select name="E01CNTIEB">
	     	  <option value=" " <%if (!(bankOld.getE01CNTIEB().equals("H") || bankOld.getE01CNTIEB().equals("N"))) out.print("selected"); %>></option>
	          <option value="H" <%if (bankOld.getE01CNTIEB().equals("H"))  out.print("selected");%>>Balance History (Change Rates Daily)</option>
			  <option value="N" <%if (bankOld.getE01CNTIEB().equals("N"))  out.print("selected");%>>Balance Nominal (Change Rates Last Day)</option>
	        </select>
		</td>
		<td nowrap width="30%">
		  <div align="right">Financial Statement Level :</div>
		</td>
		<td nowrap width="25%">
		   <select name="E01CNTFSL">
	     	  <option value=" "   <%if (!(bankOld.getE01CNTFSL().equals("1") || bankOld.getE01CNTFSL().equals("2") || bankOld.getE01CNTFSL().equals("3") || bankOld.getE01CNTFSL().equals("4"))) out.print("selected"); %>></option>
	          <option value="1" <%if (bankOld.getE01CNTFSL().equals("1"))  out.print("selected");%>>Presentation for Branch</option>
			  <option value="2" <%if (bankOld.getE01CNTFSL().equals("2"))  out.print("selected");%>>Presentation for Bank</option>
		      <option value="3" <%if (bankOld.getE01CNTFSL().equals("3"))  out.print("selected");%>>For Base Institution</option>
		      <option value="4" <%if (bankOld.getE01CNTFSL().equals("4"))  out.print("selected");%>>For Resulting Institution</option>
	        </select>
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		  <div align="right">Account Generation Automatic :</div>
		</td>
		<td nowrap width="20%">
		   <select name="E01CNTANG">
	     	  <option value=" "   <%if (!(bankOld.getE01CNTANG().equals("1") || bankOld.getE01CNTANG().equals("2") || bankOld.getE01CNTANG().equals("3") || bankOld.getE01CNTANG().equals("4") || bankOld.getE01CNTANG().equals("5") || bankOld.getE01CNTANG().equals("N"))) out.print("selected"); %>></option>
	          <option value="1" <%if (bankOld.getE01CNTANG().equals("1"))  out.print("selected");%>>Sequential dor Data Base</option>
			  <option value="2" <%if (bankOld.getE01CNTANG().equals("2"))  out.print("selected");%>>Sequential for Bank</option>
		      <option value="3" <%if (bankOld.getE01CNTANG().equals("3"))  out.print("selected");%>>Sequential for Branch</option>
		      <option value="4" <%if (bankOld.getE01CNTANG().equals("4"))  out.print("selected");%>>Sequential Bank/Branch</option>
		      <option value="5" <%if (bankOld.getE01CNTANG().equals("5"))  out.print("selected");%>>Sequential by Product Type</option>
		      <option value="N" <%if (bankOld.getE01CNTANG().equals("N"))  out.print("selected");%>>No Automatic Generation</option>
	        </select>
		</td>
		<td nowrap width="30%">
		  <div align="right">Country Institution :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E01CNTINT" size="3" maxlength="1" 	value="<%= bankOld.getE01CNTINT().trim()%>">
          <A href="javascript:GetCode('E01CNTINT','STATIC_par_country.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		  <div align="right">Teller Module :</div>
		</td>
		<td nowrap width="20%">
		<select name="E01CNTTLM">
			<option value=" " <%if (!(bankOld.getE01CNTTLM().equals("1") || bankOld.getE01CNTTLM().equals("2") || bankOld.getE01CNTTLM().equals("3") || bankOld.getE01CNTTLM().equals("4"))) out.print("selected");%>> </option>
			<option value="1" <%if (bankOld.getE01CNTTLM().equals("1")) out.print("selected");%>>Regular IBS Module</option>
			<option value="2" <%if (bankOld.getE01CNTTLM().equals("2")) out.print("selected");%>>Interface With Comlasa</option>
			<option value="3" <%if (bankOld.getE01CNTTLM().equals("3")) out.print("selected");%>>Interface With Plaase</option>
			<option value="4" <%if (bankOld.getE01CNTTLM().equals("4")) out.print("selected");%>>No Accounting Entries</option>
			<option value="5" <%if (bankOld.getE01CNTTLM().equals("5")) out.print("selected");%>>Interface with De la Rue</option>
			<option value="6" <%if (bankOld.getE01CNTTLM().equals("6")) out.print("selected");%>>e-IBS Teller Web Based</option>
		</select>
		</td>
		<td nowrap width="30%">
		  <div align="right">Proccess Next Day Renewal :</div>
		</td>
		<td nowrap width="25%">
		 <p>
           <input type="radio" name="E01CNTGLR" value="Y" <%if (bankOld.getE01CNTGLR().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E01CNTGLR" value="N" <%if (bankOld.getE01CNTGLR().equals("N")) out.print("checked");%>> No</p>
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		  <div align="right">Update Profitability Table :</div>
		</td>
		<td nowrap width="20%">
			<select name="E01CNTCPF">
				<option value=" " <%if (!(bankOld.getE01CNTCPF().equals("M") || bankOld.getE01CNTCPF().equals("D") || bankOld.getE01CNTCPF().equals("N"))) out.print("selected");%>> </option>
				<option value="M" <%if (bankOld.getE01CNTCPF().equals("M")) out.print("selected");%>>Monthly</option>
				<option value="D" <%if (bankOld.getE01CNTCPF().equals("D")) out.print("selected");%>>Daily</option>
				<option value="N" <%if (bankOld.getE01CNTCPF().equals("N")) out.print("selected");%>>Not Active</option>
			</select>
		</td>
		<td nowrap width="30%">
		  <div align="right">Additional Approval :</div>
		</td>
		<td nowrap width="25%">
		 <p>
           <input type="radio" name="E01CNTAAP" value="Y" <%if (bankOld.getE01CNTAAP().equals("Y")) out.print("checked");%>> Yes
           <input type="radio" name="E01CNTAAP" value="N" <%if (bankOld.getE01CNTAAP().equals("N")) out.print("checked");%>> No</p>
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		  <div align="right">Accounting Method for Discount :</div>
		</td>
		<td nowrap width="20%">
		  <input type="text" name="E01CNTFL3" size="2" maxlength="1" 	value="<%= bankOld.getE01CNTFL3().trim()%>">
          <A href="javascript:GetCode('E01CNTFL3','STATIC_par_acc_method.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"  ></a>
		</td>
		<td nowrap width="30%">
		  <div align="right">Domestic Country Code :</div>
		</td>
		<td nowrap width="25%">
		 <p>
          <input type="text" name="E01CNTDCT" size="4" maxlength="3" value="<%= bankOld.getE01CNTDCT().trim()%>">
          <a href="javascript:GetCodeCNOFC('E01CNTDCT','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		  <div align="right">Lending Limit % (Loans) :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTLL1" size="4" maxlength="3" value="<%=bankOld.getE01CNTLL1().trim()%>" onKeyPress="enterInteger()">
		<td nowrap width="30%">
		  <div align="right">CDS Penalty Grace Period (Days) :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTPGP" size="3" maxlength="2" value="<%=bankOld.getE01CNTPGP().trim()%>" onKeyPress="enterInteger()">
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		  <div align="right">Lending Limit % (Accep) :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTLL2" size="4" maxlength="3" value="<%=bankOld.getE01CNTLL2().trim()%>" onKeyPress="enterInteger()">
		<td nowrap width="30%">
		  <div align="right">CDS Penalty Less 1 Month (Days) :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTIC4" size="3" maxlength="2" value="<%=bankOld.getE01CNTIC4().trim()%>" onKeyPress="enterInteger()">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		  <div align="right">Lending Limit % (Affil) :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTLL3" size="4" maxlength="3" value="<%=bankOld.getE01CNTLL3().trim()%>" onKeyPress="enterInteger()">
		<td nowrap width="30%">
		  <div align="right">CDS Penalty Less 1 Year (Months) :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTPG1" size="3" maxlength="2" value="<%=bankOld.getE01CNTPG1().trim()%>" onKeyPress="enterInteger()">
		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		  <div align="right">Regulation "D" Limits :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTRDL" size="10" maxlength="9" value="<%=bankOld.getE01CNTRDL().trim()%>" onKeyPress="enterInteger()">
		<td nowrap width="30%">
		  <div align="right">CDS Penalty Over 1 Year (Months) :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E01CNTPG2" size="3" maxlength="2" value="<%=bankOld.getE01CNTPG2().trim()%>" onKeyPress="enterInteger()">
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		  <div align="right">Outgoing Clearing Option :</div>
		</td>
		<td nowrap width="20%">
			<select name="E01CNTCAM">
				<option value=" " <%if (!(bankOld.getE01CNTCAM().equals("1") || bankOld.getE01CNTCAM().equals("2") || bankOld.getE01CNTCAM().equals("3")  || bankOld.getE01CNTCAM().equals("4") || bankOld.getE01CNTCAM().equals("5"))) out.print("selected");%>> </option>
				<option value="1" <%if (bankOld.getE01CNTCAM().equals("1")) out.print("selected");%>>Uncollected for Deposit-Reg CC</option>
				<option value="2" <%if (bankOld.getE01CNTCAM().equals("2")) out.print("selected");%>>Use Inclearing IBS</option>
				<option value="3" <%if (bankOld.getE01CNTCAM().equals("3")) out.print("selected");%>>Inclearing IBSBRANCH</option>
				<option value="4" <%if (bankOld.getE01CNTCAM().equals("4")) out.print("selected");%>>Interfase with ERAS</option>
				<option value="5" <%if (bankOld.getE01CNTCAM().equals("5")) out.print("selected");%>>Interfase with INTERCEPT</option>
			</select>
		<td nowrap width="30%">
			<div align="right">NSF/UNC Assessed by :</div>
		</td>
		<td nowrap width="25%">
			<select name="E01CNTCNV">
				<option value=" " <%if (!(bankOld.getE01CNTCNV().equals("1") || bankOld.getE01CNTCNV().equals("2"))) out.print("selected");%>> </option>
				<option value="1" <%if (bankOld.getE01CNTCNV().equals("1")) out.print("selected");%>>End of Day Process</option>
				<option value="2" <%if (bankOld.getE01CNTCNV().equals("2")) out.print("selected");%>>Return Items Process</option>
			</select>
		</td>
	</tr>
</table>
<%if (!bankOld.getH01FLGWK1().equals("N")){%>
<h4>G/L Account</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">P/L F/CCY Transf/Account :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTPRG" size="13" maxlength="12" value="<%=bankOld.getE01CNTPRG().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTPRG',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">
		<div align="right">Default G/L (Asset/Liab) :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTDGA" size="13" maxlength="12" value="<%=bankOld.getE01CNTDGA().trim()%>" onKeyPress="enterInteger()">
 			<a href="javascript:GetLedger('E01CNTDGA',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Default G/L (Contingncy) :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTDCA" size="13" maxlength="12" value="<%=bankOld.getE01CNTDCA().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTDCA',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">
		<div align="right">P/L Reevaluation Non-IBF :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTPLA" size="13" maxlength="12" value="<%=bankOld.getE01CNTPLA().trim()%>" onKeyPress="enterInteger()">
 			<a href="javascript:GetLedger('E01CNTPLA',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">P/L Reevaluation IBF :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTPLI" size="13" maxlength="12" value="<%=bankOld.getE01CNTPLI().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTPLI',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">
		<div align="right">Due From Agency (IBF Account) :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTDFA" size="13" maxlength="12" value="<%=bankOld.getE01CNTDFA().trim()%>" onKeyPress="enterInteger()">
 			<a href="javascript:GetLedger('E01CNTDFA',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Due to IBF (Agency Account) :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTDTI" size="13" maxlength="12" value="<%=bankOld.getE01CNTDTI().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTDTI',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">
		<div align="right">Outgoing Cash Letter Account :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTFDO" size="13" maxlength="12" value="<%=bankOld.getE01CNTFDO().trim()%>" onKeyPress="enterInteger()">
 			<a href="javascript:GetLedger('E01CNTFDO',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Incoming Clearing Account :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTFDI" size="13" maxlength="12" value="<%=bankOld.getE01CNTFDI().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTFDI',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">

		</td>
        <td nowrap width="25%">

 		</td>
	</tr>
	<tr id="trdark">
		<td nowrap width="25%">
		<div align="right">Consolidate Institution :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTREG" size="3" maxlength="2" value="<%=bankOld.getE01CNTREG().trim()%>">
		</td>
		<td nowrap width="30%">
		<div align="right">Duplicate Institution :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTBDB" size="3" maxlength="2" value="<%=bankOld.getE01CNTBDB().trim()%>">
 		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="25%">
		<div align="right">Income Purchase/Sale :</div>
		</td>
		<td nowrap width="20%">
			<input type="text" name="E01CNTFXI" size="13" maxlength="12" value="<%=bankOld.getE01CNTFXI().trim()%>" onKeyPress="enterInteger()">
			<a href="javascript:GetLedger('E01CNTFXI',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
		</td>
		<td nowrap width="30%">
		<div align="right">Expense Purchase/Sale :</div>
		</td>
        <td nowrap width="25%">
 			<input type="text" name="E01CNTFXO" size="13" maxlength="12" value="<%=bankOld.getE01CNTFXO().trim()%>" onKeyPress="enterInteger()">
 			<a href="javascript:GetLedger('E01CNTFXO',document.forms[0].E01CNTBNK.value,document.forms[0].E01CNTBCU.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
 		</td>
	</tr>
</table>
<%}%>

<div align="center"><p><input id="EIBSBTN" type=submit name="Submit" value="Submit"></p></div>

</form>
</body>
</html>

