<!-- frames -->

<jsp:useBean id= "listSource" class= "java.lang.String" scope="session" />
<jsp:useBean id= "detailSource" class= "java.lang.String" scope="session" />

<frameset  cols="38%,*">
<frame name="list" src="<%= listSource %>" marginwidth="10" marginheight="10" scrolling="auto" frameborder="NO">
<frame name="detail" src="<%= detailSource %>" marginwidth="10" marginheight="10" scrolling="auto" frameborder="NO">
</frameset>
