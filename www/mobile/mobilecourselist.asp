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
<p align="center">
            <a href="default.html">

                <img src="../images/lcf.jpg" alt="" />
            </a>
</p>
        </div>
        <div class="clear"></div>
    </header>    

    <div class="content">


<%
set conn= server.CreateObject("ADODB.Connection")

sConn="Provider=sqloledb; Data Source=lcfdb.db.8211586.hostedresource.com; Initial Catalog=lcfdb;"
sConn=sConn & " User ID=lcfdb;Password='Jaylo2014#';"
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


s3="select * from coursesub"
set rssub=createobject("adodb.recordset")
rssub.open s3, conn

s4="select * from tbladvertiser"
set rsad=createobject("adodb.recordset")
rsad.open s4, conn


s2="select * from coursemain where courseid=" & courseid
set rsmain=createobject("adodb.recordset")
rsmain.open s2, conn
rsmain.movefirst



%>

        </ul>   
<font color="#ffffff">




<%

do until rsmain.eof
'response.write rsmain("listid") & rsmain("advertiser") & "<br>"
sponsored=rsmain("sponsored")

rsad.filter= "advertiserid= " & rsmain("advertiser") 
rsad.movefirst
'response.write rsad("company") & "<br>"
spic=rsad("pic")
company=rsad("company")
address=rsad("address")
postcode=rsad("postcode")
tel=rsad("tel")
facebook=rsad("facebook")
twitter=rsad("twitter")
youtube=rsad("youtube")
youtubechannel=rsad("youtubechannel")
linkedin=rsad("linkedin")
googleplus=rsad("googleplus")
pinterest=rsad("pinterest")
blog=rsad("blog")
instagram=rsad("instagram")
email=rsad("email")
website=rsad("website")

rsad.filter=""

rssub.filter = "listid = " & rsmain("listid")%>

<img src=<%="../course-providers/" & spic%> width="180" height="110"><p>

<%if sponsored=true then%>
<a href=<%=website%>>Visit Website</a>
<%end if%>
<p>

<b><%response.write company & "</b><br>"
response.write address & "<br>"
response.write postcode & "<br>"
response.write "Tel: " & tel & "<p>&nbsp;</p>"
if not rssub.eof then
rssub.movefirst
do until rssub.eof
response.write "<b>" & rssub("coursesub") & "<b><br>"
rssub.movenext
loop
else
response.write "<b>" & slearn & "<b>"
end if
rssub.filter=""

%>


<p><b>Quick Enquiry</b>
<form method="post" action="sendmobileenquiry.asp">
<table><tr><td>Name: </td><td><input type="text" name="studentname" size="15"></td></tr>
<tr><td>Tel: </td><td><input type="text" name="tel" size="15"></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" size="15"></font></td></tr>
</table>
</p>
<p align="left">
<input type="hidden" name="courseprovider" value="<%=website%>" />
<input type="hidden" name="cpemail" value="<%=email%>" />
<INPUT TYPE="image" SRC="../images/request-info.png" BORDER="0" ALT="Request details on these courses.">
</p>
</form>		

			<div class="date"><span></span></div>
<%rsmain.movenext
loop%>
    </article>
    </div>
	<nav class="vertical menu">
		<ul>
			<li><a href="default.html">Home page</a></li>
                
			<li><a href="courses.asp">Course Search</a></li>
		</ul>
	</nav> 
	<footer>
        <p class="copy">&copy; 2015-2016 londoncoursefinder.com | All right reserved</p>
    </footer>
</body>
</html>
