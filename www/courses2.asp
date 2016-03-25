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
<form method="post" action="mobilecourselist.asp">
<p align="center">
		

<%
set conn= server.CreateObject("ADODB.Connection")
sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath("../db/lcf.mdb") & ";User Id=admin;Password=;"
conn.open sconn
%>
<%


set rsi=createobject("adodb.recordset")
ssql="select * from courses where url is not null order by course"
		
rsi.open ssql, conn
rsi.movefirst
%>

<nav> 
<select name ="course"> 
<option value="" selected="selected">Select Course</option> 
<%do until rsi.eof
stitle=lcase(rsi("course"))
surl=rsi("url")
%>
 <option value="<%=surl%>"><%=stitle%></option> 
<%
rsi.movenext
loop
%>
    
    
  </select> 

</nav>
        </ul>   
   
<p align="center">
<input type="submit" name="submit" value="Search">   

</form>
</p>
        <div class="clear"></div>
<nav class="vertical menu">
		<ul>
			<li><a href="default.html">Home page</a></li>
                
		
		</ul>
	</nav> 
   
    
	<footer>
        <p class="copy">&copy; londoncoursefinder.com | All right reserved </p>
    </footer>
</body>
</html>
