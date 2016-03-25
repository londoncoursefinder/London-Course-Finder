<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
        <title>London Course Finder</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <meta name="keywords" content="london course finder" />
        <meta name="description" content="londoncoursefinder" />
<style>
	.demo select {
		border: 0 !important;  /*Removes border*/
		-webkit-appearance: none;  /*Removes default chrome and safari style*/
		-moz-appearance: none; /* Removes Default Firefox style*/
		background: #0088cc url(img/select-arrow.png) no-repeat 90% center;
		width: 100px; /*Width of select dropdown to give space for arrow image*/
		text-indent: 0.01px; /* Removes default arrow from firefox*/
		text-overflow: "";  /*Removes default arrow from firefox*/ /*My custom style for fonts*/
		color: #FFF;
		border-radius: 15px;
		padding: 5px;
		box-shadow: inset 0 0 5px rgba(000,000,000, 0.5);
	}

.demo select.black {
	background-color: #000;
}

</style>
    </head>
<body>
	<header>
        <div class="logo">
            <a href="default.html">
                <p align="center"><img src="../images/lcf.jpg" alt="londoncoursefinder" /></p>
            </a>
        </div>
    </header> 
<form method="post" action="mobilecourselist.asp" form class="demo">
<p align="center">



<%
set conn= server.CreateObject("ADODB.Connection")
sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath(".../db/lcf.mdb") & ";User Id=admin;Password=;"
conn.open sconn

response.end
'Response.Write Server.MapPath(Request.ServerVariables("PATH_INFO"))
'response.end
'set conn= server.CreateObject("ADODB.Connection")

'sConn="Provider=sqloledb; Data Source=lcfdb.db.8211586.hostedresource.com; Initial Catalog=lcfdb;"
'sConn=sConn & " User ID=lcfdb;Password='Jaylo2014#';"


'sConn="Provider=sqloledb; Data Source=Data Source=188.121.44.212;Integrated Security=False;User ID=jay; Initial Catalog=lcfdb;"
'sConn=sConn & " User ID=lcfdb;Password='lcf2012#';"


dbpath="G:\PleskVhosts\londoncoursefinder.com\httpdocs\db\lcf.mdb"
'set conn= server.CreateObject("ADODB.Connection")
'sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath("../db/lcf.mdb") & ";User Id=admin;Password=;"
'sConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath(dbpath) & ";User Id=admin;Password=;"


'set conn= server.CreateObject("ADODB.Connection")


'sConn="Provider=sqloledb; Data Source=188.121.44.212; Initial Catalog=lcfdb;"
'sConn=sConn & " User ID=jay;Password='jay2012#';"
'conn.open sconn



response.end

'set conn= server.CreateObject("ADODB.Connection")

'sConn="Provider=sqloledb; Data Source=lcfdb.db.8211586.hostedresource.com; Initial Catalog=lcfdb;"
'sConn=sConn & " User ID=lcfdb;Password='Jaylo2014#';"
'conn.open sconn


set rsi=createobject("adodb.recordset")
ssql="select * from courses where (url is not null) and (url <> '-') order by course"
		
rsi.open ssql, conn
rsi.movefirst
%>

<nav> 
<select name ="course" class="black"> 
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
