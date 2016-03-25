<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
        <title></title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <meta name="keywords" content="" />
    </head>
<body>
	<header>
        <div class="logo">
            <a href="index.html">
                <img src="../images/lcf.jpg" alt="" />
            </a>
        </div>
        <div class="clear"></div>
    </header>    


<%
set conn= server.CreateObject("ADODB.Connection")
sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath("../db/lcf.mdb") & ";User Id=admin;Password=;"
conn.open sconn
%>



<%

set rs=createobject("adodb.recordset")
coursecat=request.form("course")
response.write "<b>" & coursecat & "</b>"

ssql="select * from courses where url='" & coursecat & "'"
rs.open ssql, conn
rs.movefirst

courseid=rs("courseid")
rs.close
set rs=nothing
set rs2=createobject("adodb.recordset")
ssql2="SELECT courses.courseid, courses.course, courses.privatetutor,courses.mdesc, tbladvertiser.advertiserid, "
ssql2=ssql2 & "tbladvertiser.Company, tbladvertiser.Website,tbladvertiser.email, tbladvertiser.pic, tbladvertiser.address,tbladvertiser.youtube,tbladvertiser.facebook,tbladvertiser.linkedin, tbladvertiser.twitter,tbladvertiser.googleplus,tbladvertiser.youtubechannel," 
ssql2=ssql2 & "tbladvertiser.postcode, tbladvertiser.tel,coursesub.coursesub, coursemain.sponsored "
ssql2=ssql2 & "FROM (tbladvertiser INNER JOIN (coursemain INNER JOIN courses ON coursemain.courseid "
ssql2=ssql2 & "= courses.courseid) ON tbladvertiser.advertiserid = coursemain.advertiser) INNER JOIN "
ssql2=ssql2 & "coursesub ON coursemain.listid = coursesub.listid "
ssql2=ssql2 & "WHERE (((coursemain.courseid)=" & courseid & "))"
'response.write ssql2
'response.end
set rsgroup=createobject("adodb.recordset")
ssqlg="select distinct tbladvertiser.advertiserid,tbladvertiser.Company,tbladvertiser.address,tbladvertiser.email,"
ssqlg=ssqlg & " tbladvertiser.postcode, tbladvertiser.tel, tbladvertiser.website,tbladvertiser.Pic,"
ssqlg=ssqlg & " tbladvertiser.youtube, tbladvertiser.youtubechannel, tbladvertiser.facebook, tbladvertiser.twitter,tbladvertiser.linkedin, tbladvertiser.googleplus, courses.mdesc, coursemain.sponsored from ("
ssqlg=ssqlg & ssql2 & ") order by tbladvertiser.Company"
rsgroup.open ssqlg, conn,1,2,1

if not rsgroup.eof then
rsgroup.movefirst
mdesc= rsgroup("mdesc")
end if


%>


        </ul>   
<font color="#ffffff">
<%

'##############################

rsgroup.movefirst
do until rsgroup.eof 


sdetail="<i>" & rsgroup("address") & " " & rsgroup("postcode") 
if rsgroup("tel")<> "" then
sdetail=sdetail & "<br>Tel: " & rsgroup("tel") 
end if
sdetail =sdetail &  "</i>"
postcode=rsgroup("postcode")
%>
<%
if rsgroup("Pic")<>"" then
spic=rsgroup("Pic")
else
spic=rsgroup("website")
'response.write spic
spic="testlogo.jpg"
end if
'response.write rsgroup("advertiserid")
%>
	

<p align="left">

<img src=<%="../course-providers/" & spic%> width="100" height="75">
</p><font size="1" color="#ffffff">
<%
response.write "<b>" & ucase(rsgroup("Company")) & "</b><br>"%></font><font size="1" color="#ffffff"><%
response.write sdetail%></font><font size="2">

<p><b>Quick Enquiry</b>
<form method="post" action="sendmobileenquiry.asp">
<table><tr><td>Name: </td><td><input type="text" name="studentname" size="15"></td></tr>
<tr><td>Tel: </td><td><input type="text" name="tel" size="15"></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" size="15"></font></td></tr>
</table>
</p>
<p align="right">
<input type="hidden" name="courseprovider" value="<%=rsgroup("website")%>" />
<input type="hidden" name="cpemail" value="<%=rsgroup("email")%>" />
<INPUT TYPE="image" SRC="../images/request-info.png" BORDER="0" ALT="Request details on these courses.">
</p>
</form>

</td>
<td width="400">
<table><tr><td width="400">

 <br><b><%response.write "Courses:"%></br>

<%rs2.open ssql2, conn
rs2.movefirst

rs2.filter="advertiserid= " & rsgroup("advertiserid")'#



counter=0


%>


######




    <div class="content">
        <article class="underline">
			
<img src=<%="../course-providers/" & spic%> width="100" height="75">
<P>			
		
<%

response.write "<b>" & ucase(rsgroup("Company")) & "</b><br>"%></font><font size="1" color="#ffffff"><%
response.write sdetail%></font><font size="2">	<h2>COURSE PROVIDER</h2>
			<P>COURSE LIST</p>	


do until rs2.eof
'response.write rs2("courseid") & " " & rs2("coursesub")  & "<br>"%>
<font size="1">
<%
response.write rs2("coursesub")  & "<br>"
%>
</font><br>
<%

rs2.movenext
counter=counter + 1
if counter =7 then
response.write "..."
exit do
end if
loop		
	
%>

<p><b>Quick Enquiry</b>
<form method="post" action="sendmobileenquiry.asp">
<table><tr><td>Name: </td><td><input type="text" name="studentname" size="15"></td></tr>
<tr><td>Tel: </td><td><input type="text" name="tel" size="15"></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" size="15"></font></td></tr>
</table>
</p>
<p align="right">
<input type="hidden" name="courseprovider" value="<%=rsgroup("website")%>" />
<input type="hidden" name="cpemail" value="<%=rsgroup("email")%>" />
<INPUT TYPE="image" SRC="../images/request-info.png" BORDER="0" ALT="Request details on these courses.">
</p>
</form>		
ENUIRY FORM
			<div class="date"><span></span></div>
    </article>
    </div>
	<nav class="vertical menu">
		<ul>
			<li><a href="index.html">Home page</a></li>
                <li><a href="single.html">Portfolio Single</a></li>
			<li><a href="basic_markup.html">Basic Markup</a></li>
			<li><a href="contact.html">Contact</a></li>
		</ul>
	</nav> 
	<footer>
        <p class="copy">&copy; 2012 yourdomainname.com | All right reserved &bull; Design By&nbsp;&nbsp;</p>
    </footer>
</body>
</html>
