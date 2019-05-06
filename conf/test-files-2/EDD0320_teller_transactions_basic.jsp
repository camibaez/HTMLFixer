<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Retail Account</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="teller" class="datapro.eibs.beans.EDD032001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Teller Transactions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="teller_transactions_basic, EDD0320"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0320" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Code :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E01TDRTCD" size="6" maxlength="6" value="<%= teller.getE01TDRTCD().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Description :</b></div>
            </td>
            <td nowrap  >
              <div align="left">
                <input type="text" name="E01TDRITD" size="40" maxlength="40" value="<%= teller.getE01TDRITD().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <H4>Accounting Information</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>

   <table id="headTable1">
    <tr id="trdark">
      <td nowrap align="center" ></td>
      <td nowrap align="center" >Account Flag</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >G/L Account</td>
      <td nowrap align="center" >Account</td>
    </tr>
    </table>

    <div id="dataDiv1"  >
     <table id="dataTable1" >
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">Debit Account :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDRDAF">
                <option value=" " <% if (!(teller.getE01TDRDAF().equals("1") ||teller.getE01TDRDAF().equals("2")||teller.getE01TDRDAF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRDAF().equals("1")) out.print("selected");%>>Teller Cash G/L</option>
                <option value="2" <% if(teller.getE01TDRDAF().equals("2")) out.print("selected");%>>Customer Account</option>
                <option value="3" <% if(teller.getE01TDRDAF().equals("3")) out.print("selected");%>>To Be Entered</option>
              </select>
              </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRDBN" size="3" maxlength="2" value="<%= teller.getE01TDRDBN().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRDCY" size="4" maxlength="3" value="<%= teller.getE01TDRDCY().trim()%>">
              <a href="javascript:GetCurrency('E01TDRDCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRDGL" size="19" maxlength="17" value="<%= teller.getE01TDRDGL().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRDGL',document.forms[0].E01TDRDBN.value,document.forms[0].E01TDRDCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRDRA" size="12" maxlength="9"  value="<%= teller.getE01TDRDRA().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetAccount('E01TDRDRA','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">Credit Account :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDRCAF">
                <option value=" " <% if (!(teller.getE01TDRCAF().equals("1") ||teller.getE01TDRCAF().equals("2")||teller.getE01TDRCAF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRCAF().equals("1")) out.print("selected");%>>Teller Cash G/L</option>
                <option value="2" <% if(teller.getE01TDRCAF().equals("2")) out.print("selected");%>>Customer Account</option>
                <option value="3" <% if(teller.getE01TDRCAF().equals("3")) out.print("selected");%>>To Be Entered</option>
              </select>
              </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCBN" size="3" maxlength="2" value="<%= teller.getE01TDRCBN().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRCCY" size="4" maxlength="3" value="<%= teller.getE01TDRCCY().trim()%>">
              <a href="javascript:GetCurrency('E01TDRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCGL" size="19" maxlength="17" value="<%= teller.getE01TDRCGL().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRCGL',document.forms[0].E01TDRCBN.value,document.forms[0].E01TDRCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCRA" size="12" maxlength="9"  value="<%= teller.getE01TDRCRA().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetAccount('E01TDRDRA','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	    </tr>
     </table>
    </div>
  </TD>
</TR>
</TABLE>

  <H4>Checks Information</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>

   <table id="headTable4">
    <tr id="trdark">
      <td nowrap align="center" ></td>
      <td nowrap align="center" >Account Flag</td>
      <td nowrap align="center" >Bank </td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >G/L Account</td>
      <td nowrap align="center" >Hold Days</td>
    </tr>
    </table>

    <div id="dataDiv4"  >
     <table id="dataTable4" >
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">On-Us No Hold :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDRONF">
                <option value=" " <% if(!teller.getE01TDRONF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRONF().equals("1")) out.print("selected");%>>Teller G/L Account</option>
              </select>
              </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRONB" size="3" maxlength="2" value="<%= teller.getE01TDRONB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
				<input type="text" name="E01TDRONC" size="4" maxlength="3" value="<%= teller.getE01TDRONC().trim()%>">
                <a href="javascript:GetCurrency('E01TDRONC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
			</div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRONG" size="19" maxlength="17" value="<%= teller.getE01TDRONG().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRONG',document.forms[0].E01TDRONB.value,document.forms[0].E01TDRONC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">

	        </div>
	      </td>
	    </tr>
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">On-Us With Hold :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDROHF">
                <option value=" " <% if(!teller.getE01TDROHF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDROHF().equals("1")) out.print("selected");%>>Teller G/L Account</option>
              </select>
              </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDROHB" size="3" maxlength="2" value="<%= teller.getE01TDROHB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDROHC" size="4" maxlength="3" value="<%= teller.getE01TDROHC().trim()%>">
              <a href="javascript:GetCurrency('E01TDROHC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	         <input type="text" name="E01TDROHG" size="19" maxlength="17" value="<%= teller.getE01TDROHG().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDROHG',document.forms[0].E01TDROHB.value,document.forms[0].E01TDROHC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDROHD" size="3" maxlength="2" value="<%= teller.getE01TDROHD().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">Local Banks :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDRLOF">
                <option value=" " <% if(!teller.getE01TDRLOF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRLOF().equals("1")) out.print("selected");%>>Teller G/L Account</option>
              </select>
               </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRLOB" size="3" maxlength="2" value="<%= teller.getE01TDRLOB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRLOC" size="4" maxlength="3" value="<%= teller.getE01TDRLOC().trim()%>">
              <a href="javascript:GetCurrency('E01TDRLOC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	         <input type="text" name="E01TDRLOG" size="19" maxlength="17" value="<%= teller.getE01TDRLOG().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRLOG',document.forms[0].E01TDRLOB.value,document.forms[0].E01TDRLOC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRLOD" size="3" maxlength="2" value="<%= teller.getE01TDRLOD().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear">
	      <td nowrap >
	        <div align="right">Non-Local Banks :</div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <select name="E01TDRNLF">
                <option value=" " <% if(!teller.getE01TDRNLF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRNLF().equals("1")) out.print("selected");%>>Teller G/L Account</option>
              </select>
               </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRNLB" size="3" maxlength="2" value="<%= teller.getE01TDRNLB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRNLC" size="4" maxlength="3" value="<%= teller.getE01TDRNLC().trim()%>">
              <a href="javascript:GetCurrency('E01TDRNLC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	         <input type="text" name="E01TDRNLG" size="19" maxlength="17" value="<%= teller.getE01TDRNLG().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRNLG',document.forms[0].E01TDRNLB.value,document.forms[0].E01TDRNLC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRNLD" size="3" maxlength="2" value="<%= teller.getE01TDRNLD().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	    </tr>

     </table>
    </div>
  </TD>
</TR>
</TABLE>
   <H4>Commissions</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
   <table id="headTable2">
    <tr id="trdark">
      <td nowrap align="center" >Bank</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >G/L Account</td>
      <td nowrap align="center" >Percent</td>
      <td nowrap align="center" >Amount</td>
      <td nowrap align="center" >Maximum</td>
      <td nowrap align="center" >Minimum</td>
    </tr>
    </table>

    <div id="dataDiv2"  >
     <table id="dataTable2" >
	    <tr id="trclear">
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCMB" size="3" maxlength="2" value="<%= teller.getE01TDRCMB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRCMC" size="4" maxlength="3" value="<%= teller.getE01TDRCMC().trim()%>">
              <a href="javascript:GetCurrency('E01TDRCMC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCMG" size="19" maxlength="17" value="<%= teller.getE01TDRCMG().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRCMG',document.forms[0].E01TDRCMB.value,document.forms[0].E01TDRCMC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <input type="text" name="E01TDRCOP" size="10" maxlength="10"  value="<%= teller.getE01TDRCOP().trim()%>" >
             </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCOA" size="17" maxlength="15"  value="<%= teller.getE01TDRCOA().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCMX" size="17" maxlength="15"  value="<%= teller.getE01TDRCMX().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRCMN" size="17" maxlength="15"  value="<%= teller.getE01TDRCMN().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	    </tr>
     </table>
    </div>
  </TD>
</TR>
</TABLE>
   <H4>Taxes</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
   <table id="headTable3">
    <tr id="trdark">
      <td nowrap align="center" >Bank</td>
      <td nowrap align="center" >Currency</td>
      <td nowrap align="center" >G/L Account</td>
      <td nowrap align="center" >Percent</td>
      <td nowrap align="center" >Amount</td>
      <td nowrap align="center" >Maximum</td>
      <td nowrap align="center" >Minimum</td>
    </tr>
    </table>

    <div id="dataDiv3"  >
     <table id="dataTable3" >
	    <tr id="trclear">
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRTMB" size="3" maxlength="2" value="<%= teller.getE01TDRTMB().trim()%>" onkeypress="enterInteger()">
	        </div>
	      </td>
	      <td nowrap  >
	        <div align="center">
	          <input type="text" name="E01TDRTMC" size="4" maxlength="3" value="<%= teller.getE01TDRTMC().trim()%>">
              <a href="javascript:GetCurrency('E01TDRTMC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a>
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRTGL" size="19" maxlength="17" value="<%= teller.getE01TDRTGL().trim()%>" onkeypress="enterInteger()">
        	  <a href="javascript:GetLedger('E01TDRTGL',document.forms[0].E01TDRTMB.value,document.forms[0].E01TDRTMC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0" ></a>
	        </div>
	      </td>
	      <td nowrap >
	      	<div align="center">
              <input type="text" name="E01TDRTAP" size="10" maxlength="10"  value="<%= teller.getE01TDRTAP().trim()%>" >
             </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRTAA" size="17" maxlength="15"  value="<%= teller.getE01TDRTAA().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRTMX" size="17" maxlength="15"  value="<%= teller.getE01TDRTMX().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	      <td nowrap >
	        <div align="center">
	          <input type="text" name="E01TDRTMN" size="17" maxlength="15"  value="<%= teller.getE01TDRTMN().trim()%>" onkeypress="enterDecimal()" style="text-align: right;">
	        </div>
	      </td>
	    </tr>
     </table>
    </div>
  </TD>
</TR>
</TABLE>

<H4>Transactions Attributes</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Is it a Deposit :</div>
            </td>
            <td nowrap width="30%">
              <input type="radio" name="E01TDRDYN" value="Y" <%if(teller.getE01TDRDYN().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRDYN" value="N" <%if(!teller.getE01TDRDYN().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="20%" >
              <div align="right">Mix Deposit (Cash & Checks) :</div>
            </td>
            <td nowrap width="30%" >
              <input type="radio" name="E01TDRMYN" value="Y" <%if(teller.getE01TDRMYN().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRMYN" value="N" <%if(!teller.getE01TDRMYN().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">Cash Transaction :</div>
            </td>
            <td nowrap width="30%">
              <select name="E01TDREFE">
                <option value=" " <% if(teller.getE01TDREFE().equals(" ")) out.print("selected");%>>Transaction Values</option>
                <option value="N" <% if(teller.getE01TDREFE().equals("N")) out.print("selected");%>>No Cash Involved</option>
                <option value="Y" <% if(teller.getE01TDREFE().equals("Y")) out.print("selected");%>>Cash Transaction</option>
              </select>
            </td>
            <td nowrap width="20%" >
              <div align="right">Cash Back Transaction :</div>
            </td>
            <td nowrap width="30%" >
              <input type="radio" name="E01TDRCYN" value="Y" <%if(teller.getE01TDRCYN().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRCYN" value="N" <%if(!teller.getE01TDRCYN().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Reject O/D Trans. :</div>
            </td>
            <td nowrap width="30%">
              <select name="E01TDRRSG">
                <option value="N" <% if(teller.getE01TDRRSG().equals("N")) out.print("selected");%>>Do not Verify O/D</option>
                <option value="Y" <% if(teller.getE01TDRRSG().equals("Y")) out.print("selected");%>>If O/D Ask for Supv Override</option>
                <option value="R" <% if(teller.getE01TDRRSG().equals("R")) out.print("selected");%>>Reject O/D Transactions</option>
              </select>
            </td>
            <td nowrap width="20%" >
              <div align="right">Supervisor Override :</div>
            </td>
            <td nowrap width="30%" >
              <input type="radio" name="E01TDRSYN" value="Y" <%if(teller.getE01TDRSYN().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRSYN" value="N" <%if(!teller.getE01TDRSYN().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">Stop Payment Verification :</div>
            </td>
            <td nowrap width="30%">
              <input type="radio" name="E01TDRRSP" value="Y" <%if(teller.getE01TDRRSP().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRRSP" value="N" <%if(!teller.getE01TDRRSP().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="20%" >
              <div align="right">Place Hold in Account :</div>
            </td>
            <td nowrap width="30%" >
              <input type="radio" name="E01TDRHYN" value="Y" <%if(teller.getE01TDRHYN().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRHYN" value="N" <%if(!teller.getE01TDRHYN().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Display on Teller Screen :</div>
            </td>
            <td nowrap width="30%">
              <input type="radio" name="E01TDRSHT" value="Y" <%if(teller.getE01TDRSHT().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRSHT" value="N" <%if(!teller.getE01TDRSHT().equals("Y")) out.print("checked");%>>No
            </td>
            <td nowrap width="20%" >
              <div align="right">Print Customer Label :</div>
            </td>
            <td nowrap width="30%" >
              <input type="radio" name="E01TDRPCL" value="Y" <%if(teller.getE01TDRPCL().equals("Y")) out.print("checked");%>>Yes
              <input type="radio" name="E01TDRPCL" value="N" <%if(!teller.getE01TDRPCL().equals("Y")) out.print("checked");%>>No
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%" >
              <div align="right">IBS Debit Trans. Code :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E01TDRDIC" size="3" maxlength="2" value="<%= teller.getE01TDRDIC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRDIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
            <td nowrap width="20%" >
              <div align="right">IBS Credit Trans. Code :</div>
            </td>
            <td nowrap width="30%" >
              <input type="text" name="E01TDRCIC" size="3" maxlength="2" value="<%= teller.getE01TDRCIC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRCIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Amount Used to Compute Commission :</div>
            </td>
            <td nowrap width="30%">
              <select name="E01TDRBCC">
                <option value=" " <% if (!(teller.getE01TDRBCC().equals("1") ||teller.getE01TDRBCC().equals("2")||teller.getE01TDRBCC().equals("3")||teller.getE01TDRBCC().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRBCC().equals("1")) out.print("selected");%>>Local Checks Amount</option>
                <option value="2" <% if(teller.getE01TDRBCC().equals("2")) out.print("selected");%>>Non Local Checks Amount</option>
                <option value="3" <% if(teller.getE01TDRBCC().equals("3")) out.print("selected");%>>Local + Non Local Checks Amount</option>
                <option value="4" <% if(teller.getE01TDRBCC().equals("4")) out.print("selected");%>>Transaction Amount</option>
              </select>
            </td>
            <td nowrap width="20%" >
              <div align="right">Special Attribute :</div>
            </td>
            <td nowrap width="30%" >
              <select name="E01TDRCOC">
                <option value=" " <% if (!(teller.getE01TDRCOC().equals("E") ||teller.getE01TDRCOC().equals("P")||teller.getE01TDRCOC().equals("F")||teller.getE01TDRCOC().equals("N"))) out.print("selected"); %>></option>
                <option value="E" <% if(teller.getE01TDRCOC().equals("E")) out.print("selected");%>>Certified Check Sale</option>
                <option value="P" <% if(teller.getE01TDRCOC().equals("P")) out.print("selected");%>>Certified Check Payment</option>
                <option value="F" <% if(teller.getE01TDRCOC().equals("F")) out.print("selected");%>>Uncollected Line of Credit</option>
                <option value="N" <% if(teller.getE01TDRCOC().equals("N")) out.print("selected");%>>No Applicable</option>
              </select>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

<H4>Teller Interface Attributes</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">Transaction Process Type :</div>
            </td>
            <td nowrap width="30%">
				<input type="text" name="E01TDRTYP" size="3" maxlength="2" value="<%= teller.getE01TDRTYP().trim()%>">
				<a href="javascript:GetCode('E01TDRTYP','STATIC_teller_trans_process_type.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
			</td>
            <td nowrap width="20%" >
              <div align="right">Inclearing Process :</div>
            </td>
            <td nowrap width="30%" >
				<input type="text" name="E01TDRCNJ" size="3" maxlength="2" value="<%= teller.getE01TDRCNJ().trim()%>">
				<a href="javascript:GetCode('E01TDRCNJ','STATIC_teller_inclearing_process.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" >
              <div align="right">PassBook Process :</div>
            </td>
            <td nowrap width="30%">
              <select name="E01TDRVPB">
                <option value=" " <% if (!(teller.getE01TDRVPB().equals("N") ||teller.getE01TDRVPB().equals("Y")||teller.getE01TDRVPB().equals("P"))) out.print("selected"); %>></option>
                <option value="N" <% if(teller.getE01TDRVPB().equals("N")) out.print("selected");%>>No PassBook Transaction</option>
                <option value="Y" <% if(teller.getE01TDRVPB().equals("Y")) out.print("selected");%>>Print PassBook On-Line</option>
                <option value="P" <% if(teller.getE01TDRVPB().equals("P")) out.print("selected");%>>Store In PassBook Pending File</option>
              </select>
			</td>
            <td nowrap width="20%" >
              <div align="right">Checkbook/Off. Check Process :</div>
            </td>
            <td nowrap width="30%" >
              <select name="E01TDRVCK">
                <option value=" " <% if (!(teller.getE01TDRVCK().equals("N") ||teller.getE01TDRVCK().equals("Y")||teller.getE01TDRVCK().equals("E")||teller.getE01TDRVCK().equals("C"))) out.print("selected"); %>></option>
                <option value="N" <% if(teller.getE01TDRVCK().equals("N")) out.print("selected");%>>No Checkbook</option>
                <option value="Y" <% if(teller.getE01TDRVCK().equals("Y")) out.print("selected");%>>Verify Checkbook</option>
                <option value="E" <% if(teller.getE01TDRVCK().equals("E")) out.print("selected");%>>Official Check Sale</option>
                <option value="C" <% if(teller.getE01TDRVCK().equals("C")) out.print("selected");%>>Official Check Payment</option>
              </select>
            </td>
          </tr>

         </table>
      </td>
    </tr>
  </table>

<SCRIPT language="javascript">
    function tableresize() {
     adjustEquTables(document.getElementById("headTable1"),document.getElementById("dataTable1"),document.getElementById("dataDiv1"),0,false);
     adjustEquTables(document.getElementById("headTable2"),document.getElementById("dataTable2"),document.getElementById("dataDiv2"),0,false);
     adjustEquTables(document.getElementById("headTable3"),document.getElementById("dataTable3"),document.getElementById("dataDiv3"),0,false);
     adjustEquTables(document.getElementById("headTable4"),document.getElementById("dataTable4"),document.getElementById("dataDiv4"),0,false);
   }
  tableresize();
  window.onresize=tableresize;
</SCRIPT>

 <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
  </form>
</body>
</html>
