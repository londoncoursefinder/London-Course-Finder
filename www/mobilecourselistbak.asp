<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
        <title>London Course Finder</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <meta name="keywords" content="london course finder" />
        <meta name="description" content="londoncoursefinder" />
    </head>
<body>
	<header>
        <div class="logo">
            <a href="default.html">
                <p align="center"><img src="../images/lcf.jpg" alt="londoncoursefinder" /></p>
            </a>
        </div>
 </header> 

<p align="center">
		

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
rsgroup.movefirst
mdesc= rsgroup("mdesc")



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
<table border="0" style="width: 200px" bgcolor="#000000"><tr>
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
	
<td align="top">
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
if rsgroup("youtube")<>"" then
youtube=rsgroup("youtube")
else
youtube=""
end if
if rsgroup("youtubechannel")<>"" then
youtubechannel=rsgroup("youtubechannel")
else
youtubechannel=""
end if

if rsgroup("linkedin")<>"" then
linkedin=rsgroup("linkedin")
else
linkedin=""
end if
if rsgroup("facebook")<>"" then
facebook=rsgroup("facebook")
else
facebook=""
end if

if rsgroup("twitter")<>"" then
twitter=rsgroup("twitter")
else
twitter=""
end if

if rsgroup("googleplus")<>"" then
googleplus=rsgroup("googleplus")
else
googleplus=""
end if


if rsgroup("postcode")<>"" then
postcode=rsgroup("postcode")
else
postcode=""
end if
response.write "<br>"
if rs2("privatetutor")="tutorfair" then
privatetutor="tutorfair"
else
privatetutor="blue tutors"
end if
counter=0
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


rs2.close

%>


</td></tr>
<tr>
<td>

</td></tr></table>

</td>


</tr>
	
</table>
============================================
<%'response.end '####

rsgroup.movenext
loop



'end if
set rs2=nothing
%>










        <div class="clear"></div>
<p align="center">
		<nav class="vertical menu">
            <ul>
                <li><a href="default.html">Home</a></li>
                <
            </ul>
        </nav> 
</p>
      
    
	<footer>
        <p class="copy">&copy; londoncoursefinder.com | All right reserved </p>
    </footer>
</body>
</html>
