<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>CD/TIME DEPOSIT CONFIRMATION</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="receipt" class="datapro.eibs.beans.EDL014030Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
 String bnkname = currUser.getE01NME();
 bnkname = bnkname.replace('*',' ').trim();
  %>
<script Language="Javascript">

window.onbeforeprint = function(){
   document.getElementById('IMGDIV').style.display="none";
};

window.onafterprint = function(){
	document.getElementById('IMGDIV').style.display="";
};

function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir";
	   alert(msg);
	   return;
	}
	   
	window.print();
} 

function checkClose() {
	if ( window.name !="main" ) top.close(); 
	else window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

</script>
<style>
 body {
	margin-left: 0mm;
	margin-right: 0mm;
	margin-top: 25mm;
	margin-bottom: 0mm;  	
 	}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Arial Narrow";
	panose-1:2 11 6 6 2 2 2 3 2 4;}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Arial Narrow","sans-serif";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Arial Narrow","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Arial Narrow","sans-serif";}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Courier New";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}

 @page WordSection1
	{size:8.5in 11.0in;
	margin:1.2in 1.0in 73.35pt 1.2in;}
div.WordSection1
	{page:WordSection1;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
	
@media print {
.footer, .hide { visibility: hidden }
}
</style>
</head>

<body lang=EN-US>
<div class=WordSection1 style="width:176mm">

<p class=MsoNormal align="center"><span style='font-family:"Courier New"; font-weight: bold;'>CD/TIME DEPOSIT CONFIRMATION</span></p>
<p/>
<p class=MsoNormal>
 <table cellspacing="0" cellpadding="0" style="width:176mm; height:3mm;font-size:8.0pt;font-family:'Courier New'" >
    <tr>
        <td style="width:19pt">To:
  		</td>
        <td style="width:3.3in"><%= receipt.getE30CUSNME().trim()%>
  		</td>
        <td style="width:1in">DATE:
  		</td>
        <td style="text-align: left;"><%=Util.formatDate(currUser.getE01RDM(),currUser.getE01RDD(),currUser.getE01RDY())%>
  		</td>
    </tr>
    <tr >
        <td>
  		</td>
        <td><%= receipt.getE30CUSMA1().trim()%>
  		</td>
        <td>Account NBR:
  		</td>
        <td align="left"><%=receipt.getE30DEAACC().trim()%>
  		</td>
    </tr>
    <tr >
        <td>
  		</td>
        <td><%= receipt.getE30CUSMA2().trim()%>
  		</td>
        <td>G/L NBR:
  		</td>
        <td align="left"><%=receipt.getE30DEAGLN().trim()%>
  		</td>
    </tr>
    <tr >
        <td>
  		</td>
        <td><%= receipt.getE30CUSMA3().trim()%>
  		</td>
        <td>Our Ref:
  		</td>
        <td align="left"><%=receipt.getE30DEAACC().trim()%>
  		</td>
    </tr>
    <tr >
        <td>
  		</td>
        <td><%= receipt.getE30CUSMA4().trim()%>
  		</td>
        <td>
  		</td>
        <td>
  		</td>
    </tr>
  </table>
<p/>
<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>This is to
confirm your deposit as follows;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>______________________________________________________________</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>currency
of your deposit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=receipt.getE30CCYDSC().trim()%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>amount of
your deposit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= Util.formatCCY(receipt.getE30DEAOAM().trim())%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>term of
your deposit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= receipt.getE30DEATRM().trim()%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>value
date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatDate(receipt.getE30DEAOD1().trim(),receipt.getE30DEAOD2().trim(),receipt.getE30DEAOD3().trim())%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>maturity
date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatDate(receipt.getE30DEAMD1().trim(),receipt.getE30DEAMD2().trim(),receipt.getE30DEAMD3().trim())%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>interest
rate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= receipt.getE30DEARTE().trim()%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>APY
(Annual Percentage Yield):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= receipt.getE30DEASPR().trim()%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>interest
amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= receipt.getE30INTMAT().trim()%></span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>______________________________________________________________</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>When your deposit matures, you have a number of
options. You can:</span></p>

<p class=MsoNormal style='margin-left:40.5pt;text-indent:-.25in'><span
style='font-size:8.0pt;font-family:Symbol'>*<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:8.0pt;font-family:"Courier New"'>Rollover principal plus interest on maturity for a shorter or longer term</span></p>

<p class=MsoNormal style='margin-left:40.5pt;text-indent:-.25in'><span
style='font-size:8.0pt;font-family:Symbol'>*<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:8.0pt;font-family:"Courier New"'>Principal increase on maturity</span></p>

<p class=MsoNormal style='margin-left:40.5pt;text-indent:-.25in'><span
style='font-size:8.0pt;font-family:Symbol'>*<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:8.0pt;font-family:"Courier New"'>Partial withdrawal on maturity</span></p>

<p class=MsoNormal style='margin-left:40.5pt;text-indent:-.25in'><span
style='font-size:8.0pt;font-family:Symbol'>*<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:8.0pt;font-family:"Courier New"'>Withdraw all of your balance on maturity.</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>Unless you provide us with other maturity
instructions, your Term Deposit will automatically rollover for the same term
at the applicable interest rate offered on the maturity date.</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><u><span style='font-size:8.0pt;
font-family:"Courier New"'>EARLY WITHDRAWAL PENALTIES</span></u></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>A penalty may be imposed for withdrawals before
maturity.</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>For CDs with terms of less than 90 days, the greater
of all interest earned on the amount withdrawn or an amount equal to seven days
interest on the amount withdrawn;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>For CDs with terms of 90 days up to 12 months, the
penalty is an amount equal to 90 days interest on the amount withdrawn;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span
	style='font-size: 8.0pt; font-family: "Courier New"'>For CDs
with terms of 12 months up to 60 months, the penalty is an amount equal
to 180 days interest on the amount withdrawn; and For CDs with terms of
60 months or longer, the penalty is an amount equal to 365/366 days
interest on the amount withdrawn.</span><span
	style='font-size: 8.0pt; font-family: "Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>In certain circumstances such as the death or
incompetence of an owner of this account, the law permits, or in some cases
requires, the waiver of the early withdrawal penalty. Early withdrawal is
permitted without penalty for the following reasons: Death, Extraordinary
Health Expenses or College Education or a line withdrawal through this Bank. </span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><u><span style='font-size:8.0pt;
font-family:"Courier New"'>WITHDRAWAL OF INTEREST PRIOR TO MATURITY</span></u></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>A withdrawal of interest before maturity will reduce
earnings.  The early withdrawal penalty is calculated as a forfeiture of part
of the accrued interest that has or would be earned on the Account.  If your
Account has not yet earned enough interest for the penalty to be deducted from
earned interest, or if the interest has been paid, the difference between the
penalty and the interest earned will be deducted from the principal amount of
your Account.</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><u><span style='font-size:8.0pt;
font-family:"Courier New"'>AUTOMATICALLY RENEWABLE TIME ACCOUNT</span></u></p>

<p class=MsoNormal style='margin-left:22.5pt'><span
	style='font-size: 8.0pt; font-family: "Courier New"'>This
account will automatically renew at maturity. You may prevent renewal if
you withdraw the funds in the account at maturity (or within any grace
period mentioned below) or we receive written notice from you within any
grace period mentioned below. We can prevent renewal if we mail notice
to you at least 30 calendar days before maturity. If either you or we
prevent renewal, interest will not accrue after final maturity.&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span
	style='font-size: 8.0pt; font-family: "Courier New"'>Each
renewal term will be the same as the original term, beginning on the
maturity date. The interest rate will be the same we offer on new time
deposits on the maturity date which have the same term, minimum balance
(if any) and other features as the original time deposit.&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span
	style='font-size: 8.0pt; font-family: "Courier New"'>You will
have 10 calendar days after maturity to withdraw the funds without a
penalty.&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>During the 10 day grace period after CD matures you
will forfeit the accrued interest from the date of maturity if the CD is
withdrawn.</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-size:8.0pt;
font-family:"Courier New"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>This
is a computer generated confirmation which does not require an authorized signature. </span></p>

<p class=MsoNormal style='margin-left:22.5pt'><span style='font-family:"Courier New"'>
Your Deposit is not FDIC Insured. </span></p>

 <table cellspacing="0" cellpadding="0" style="width:176mm; height:3mm;" >
    <tr >
        <td style="BORDER-BOTTOM: 1pt dashed;">
         &nbsp;
  		</td>
    </tr>
  </table>
</div>
  <div id="IMGDIV">
    <table  width="100%">
          <tr > 
            <td nowrap> 
              <div align="center">
              	<input id="EIBSBTN" type=button name="Submit1" value="Print" OnClick="doPrint();">
              </div>
            </td>
            <td nowrap>
              <div align="center">
              	<input id="EIBSBTN" type=button name="Submit2" value="Close" OnClick="checkClose();">
             </div>
            </td>
          </tr>
    </table>   
  </div>


</body>
</html>
