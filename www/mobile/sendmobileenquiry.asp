<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Londoncoursefinder</title>
<style type="text/css"> @charset "utf-8";
/* CSS Document */

body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 13px;
}

td {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 13px;
}

th {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 13px;
}

.medium {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px; font-weight: bold;
}

.mediumwhite{
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px;
    font-weight: bold;
  color: #FFF;
}

.big {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px; font-weight: bold;
}

.xbig {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 24px;
    font-weight: bold;
}
</style>

</head>

<body> 

<p align="center">
<img src="../images/lcf.jpg">
</p>
<div data-role="page" id="page">
    <div data-role="header">
        <h1>Londoncoursefinder</h1>
    </div>
    <div data-role="content"> 
<%
'-----------------------------------------------
'CHECK IS VALID EMAIL ADDRESS FORMAT
'-----------------------------------------------


'response.write request.form("studentname") & " " & request.form("email") & " " & request.form("tel") & "<br>"
backpage= Request.ServerVariables("HTTP_REFERER")


course=request.form("course")
studentname=request.form("studentname")
email=request.form("email")
tel=request.form("tel")


sbody=""

    for each x in Request.Form 
       sbody=sbody & x & " = " & Request.Form(x) & "<br>" 
    next 


sbody=sbody & "courseprovider=" & request.form("courseprovider") & "<br>"
sbody=sbody & "courseprovider-email=" & request.form("cpemail") & "<br>"
sbody=sbody & "url=" & backpage


set conn= server.CreateObject("ADODB.Connection")
sConn="Provider=sqloledb; Data Source=lcfdb.db.8211586.hostedresource.com; Initial Catalog=lcfdb;"
sConn=sConn & " User ID=lcfdb;Password='Jaylo2014#';"
conn.open sconn


ssql="select * from enq"
set rs=createobject("adodb.recordset")
rs.open ssql, conn,1 ,2,1
'response.write sbody
'response.end
rs.addnew
rs("enq")=sbody 
rs.update

rs.close
set rs=nothing
conn.close
set conn=nothing


%>

<p class="style1">Thank you for you enquiry. You will be contacted by the course provider very soon !

</p>



</p>

<p>
You are now being redirected to the course list page - Please wait !

</p>

<p>
    
  <META HTTP-EQUIV=REFRESH CONTENT="3; URL=<%="http://www.londoncoursefinder.co.uk/mobile/courses.asp"%>">.         
    </div>



   
</div>




</form>
</body>