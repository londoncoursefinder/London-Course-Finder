<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<%slearn=request("learn")

stitle=replace(slearn, "-", " ")%>
	<title><%=stitle%> | Training | Courses, Lessons, Classes | Study | London Course Finder</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!--#INCLUDE FILE="conn.asp"-->
<%
set rs=createobject("adodb.recordset")

'get id

ssql="select * from courses where url='" & request.querystring("learn") & "'"
rs.open ssql, conn
rs.movefirst
courseid=rs("courseid")
rs.close
set rs=nothing
set rs2=createobject("adodb.recordset")
ssql2="SELECT courses.courseid, courses.course, courses.privatetutor,courses.mdesc, tbladvertiser.advertiserid, "
ssql2=ssql2 & "tbladvertiser.Company, tbladvertiser.Website,tbladvertiser.email, tbladvertiser.pic, tbladvertiser.address,tbladvertiser.youtube,tbladvertiser.facebook,tbladvertiser.linkedin, tbladvertiser.twitter,tbladvertiser.googleplus," 
ssql2=ssql2 & "tbladvertiser.postcode, tbladvertiser.tel,coursesub.coursesub "
ssql2=ssql2 & "FROM (tbladvertiser INNER JOIN (coursemain INNER JOIN courses ON coursemain.courseid "
ssql2=ssql2 & "= courses.courseid) ON tbladvertiser.advertiserid = coursemain.advertiser) INNER JOIN "
ssql2=ssql2 & "coursesub ON coursemain.listid = coursesub.listid "
ssql2=ssql2 & "WHERE (((coursemain.courseid)=" & courseid & "))"
set rsgroup=createobject("adodb.recordset")
ssqlg="select distinct tbladvertiser.advertiserid,tbladvertiser.Company,tbladvertiser.address,tbladvertiser.email,"
ssqlg=ssqlg & " tbladvertiser.postcode, tbladvertiser.tel, tbladvertiser.website,tbladvertiser.Pic,"
ssqlg=ssqlg & " tbladvertiser.youtube, tbladvertiser.facebook, tbladvertiser.twitter,tbladvertiser.linkedin, tbladvertiser.googleplus, courses.mdesc from ("
ssqlg=ssqlg & ssql2 & ") order by tbladvertiser.Company"
rsgroup.open ssqlg, conn,1,2,1
rsgroup.movefirst
mdesc= rsgroup("mdesc")
%>
<meta name="description" content="<%=mdesc%>" />
	<meta name="keywords" content="london courses, courses london, london classes, classes london, london class, class london, london course, course london, uk courses, courses uk, north london courses, south london courses, east london courses, west london courses, central london courses" />
	<meta name="language" content="english" />
<meta name="robots" content="index,follow" />
	<meta name="google" content="notranslate"/>
	<meta name="googlebot" content="archive,follow, index "/>

	<link href="styles-b.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tinybox.js"></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-25016756-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
	<style type="text/css">
.style1 {
	color: #008000;
	font-style: italic;
}


#tbls
{

	color:#FFF;

	background:#009933;

	border-collapse:collapse;

	width:850px;

	border:5px solid #000000;

}



#tbls thead

{



}



#tbls thead th

{

	padding:1em 1em .5em;

 	border-bottom:1px dotted #000000;

 	font-size:120%;

 	text-align:left;

}







#tbls thead tr

{



}



#tbls td

{

	padding:.5em 1em;

}







#tbls tbody tr.odd td

{

	background:transparent url(tr_bg.png) repeat top left;

}



#tbls tfoot

{



}



#tbls tfoot td

{



	padding-bottom:1.5em;

}



#tbls tfoot tr

{



}





* html tr.odd td

{

	background:#C00;

	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='tr_bg.png', sizingMethod='scale');

}





#middle

{

	background-color:#900;

}

.style2 {
	border-width: 1px;
	background-color: #000000;
}

.style3 {
	border-color: #000000;
	border-style: solid;
	background-color: #66FF66;
}
.style4 {
	color: #000000;
	border-width: 1px;
	background-color: #C0C0C0;
}
.style5 {
	border-style: none;
	padding-left: 0;
	padding-right: 0;
}
.style7 {
	font-size: medium;
	color: #FFFFFF;
}

.style12 {
	color: #000000;
	border-width: 1px;
	background-color: #000000;
}
.style13 {
	border-style: solid;
	background-color: #000000;
}

.style14 {
	color: #FFFFFF;
}

.style15 {
	border-width: 1px;
	background-color: #333333;
}

</style>
</head>

<body>

	<div id="container">
		<div id="navigation-cell"></div>
		<div id="body-cell">
			<div id="londoncoursefinder">
				<img src="images/londoncoursefinder.jpg" width="886" height="150" border="0" alt="london course finder" />
			</div>
		<!--#include file="topnav.asp"-->

<div id="sbanner">
			<%learn= replace(request("learn"), "-", " ")
			response.write lcase(learn) & " - course providers London"%>
						</div>
	<div id="cblock">

		</div>				

			
<div id="main-content" style="width: 757px">
<b>
<%'response.write url2 & " " & url3 & " " & "courses"%>
</b>
<p>
<%
do until rsgroup.eof

sdetail="<i>" & rsgroup("address") & " " & rsgroup("postcode") 
if rsgroup("tel")<> "" then
sdetail=sdetail & "<br>Tel: " & rsgroup("tel") 
end if
sdetail =sdetail &  "</i>"
postcode=rsgroup("postcode")
%>
<table border="1" id="tbls" style="width: 850px" class="style13"><tr>
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
	
<td style="height: 185px" class="style2">
<img src=<%="course-providers/" & spic%> width="180" height="110">
</td>
<td style="width: 371px" class="style15">
<table><tr><td>
<%
response.write "<b>" & ucase(rsgroup("Company")) & "</b><br>"
response.write sdetail%>
 <p><b><%'response.write request("learn") & " courses:"%></b></p>

<p>
<%rs2.open ssql2, conn
rs2.movefirst

rs2.filter="advertiserid= " & rsgroup("advertiserid")'#
if rsgroup("youtube")<>"" then
youtube=rsgroup("youtube")
else
youtube=""
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

do until rs2.eof
'response.write rs2("courseid") & " " & rs2("coursesub")  & "<br>"
response.write rs2("coursesub")  & "<br>"
rs2.movenext
loop


rs2.close
response.write "<br>"
%>
</p>

</td></tr>
<tr>
<td><table><tr><td style="width: 21px">
<%if youtube<>"" then
%>
<img alt="youtube clip" src="images/youtube.jpg" width="28" height="28" onmouseover="this.style.cursor='pointer';" onclick="TINY.box.show({iframe:'http://www.londoncoursefinder.com/youtube.asp?youtube=<%=youtube%>',boxid:'frameless',width:600,height:400,fixed:false,maskid:'bluemask',maskopacity:40,closejs:function(){closeJS()}})" />


<%end if%> </td>
	<td>

<%if facebook<>"" then
%>
<a href=<%=facebook%>>
<img src="images/fb.jpg" width="28" height="28"></a>
<%end if%>
</td>
<td>



<%if twitter<>"" then
%>
<a href=<%=twitter%>>
<img src="images/tw.jpg" width="28" height="28"></a>
<%end if%>

</td>
<td>

<%if googleplus<>"" then
%>
<a href=<%=googleplus%>>
<img src="images/googleplus.jpg" width="28" height="28"></a>
<%end if%>

<%if linkedin<>"" then
%>
<a href=<%=linkedin%>>
<img src="images/linkedin.png" width="28" height="28"></a>
<%end if%>

</td>
	<td>
<%if postcode<>"" then%>
<img alt="location map" src="images/google-maps.jpg" width="28" height="28" onmouseover="this.style.cursor='pointer';"onclick="TINY.box.show({iframe:'http://www.londoncoursefinder.com/gmap.asp?postcode=<%=postcode%>',boxid:'frameless',width:400,height:350,fixed:false,maskid:'bluemask',maskopacity:40,closejs:function(){closeJS()}})"/>
<%end if%>
</td></tr></table>

</td></tr></table>

</td>
<td style="height: 185px; width: 213px;" class="style2">
<p><b>Quick Enquiry</b>
<form method="post" action="sendenquiry.asp">
<table><tr><td>Name: </td><td><input type="text" name="studentname" size="15"></td></tr>
<tr><td>Tel: </td><td><input type="text" name="tel" size="15"></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" size="15"></td></tr>
</table>
</p>
<p align="right">
<input type="hidden" name="courseprovider" value="<%=rsgroup("website")%>" />
<input type="hidden" name="cpemail" value="<%=rsgroup("email")%>" />
<INPUT TYPE="image" SRC="images/request-info.png" BORDER="0" ALT="Request details on these courses.">
</p>
</form>
</td>

</tr>
	
</table>
<%

rsgroup.movenext
loop
'end if
set rs2=nothing
%>


<table border="1" id="tbls" style="width: 850px" class="style3"><tr>
	
<td style="height: 185px" class="style2">

<%
learn=request("learn")
select case learn
case "life-coaching-training"
sceleb="Paul Mckenna" & "<br>"
sceleb=sceleb & "<b>NLP Life Training</b>"%>
<a href="http://www.nlplifetraining.com" target="_blank">
<img src="celebs/paul-mckenna.jpg" alt="Paul Mckenna - NLP Life Training">
</a>

<%case "hypnotherapy-training"
sceleb="Paul Mckenna" & "<br>"
sceleb=sceleb & "<b>Hypnotist</b>"%>
<a href="http://www.nlplifetraining.com" target="_blank">
<img src="celebs/paul-mckenna.jpg" alt="Paul Mckenna - Hypnotist">
</a>
<%case "hairdressing-lessons"
sceleb="Daniel Galvin" & "<br>"
sceleb=sceleb & "<b>Hair Colourist</b>"%>
<a href="http://www.danielgalvin.com" target="_blank">
<img src="celebs/daniel-galvin.jpg" alt="Daniel Galvin" height="200" width="180">
</a>

<%case "interior-design"
sceleb="Jo Hamilton" & "<br>"
sceleb=sceleb & "<b>Celebrity Interior Designer</b>"%>
<a href="http://www.johamilton.co.uk/" target="_blank">
<img src="celebs/interior-designer-jo-hamilton.jpg" alt="Jo Hamilton" height="220" width="180">
</a>
<%case "art-school"
sceleb="Ulla Turner" & "<br>"
sceleb=sceleb & "<b>Artist</b><p>"
sceleb=sceleb & "www.ulla-art.com</p>"
%>
<a href="http://www.ulla-art.com" target="_blank">
<img src="celebs/ulla-art.jpg" alt="Ulla Turner" height="220" width="180">
</a>

<%case "yoga-lessons"
sceleb="Kristin McGee" & "<br>"
sceleb=sceleb & "<b>Reknowned celebrity trainer</b><br>"
sceleb=sceleb & "Kristin McGee, is certified in Yoga, Pilates and Fitness—and<br>" 
sceleb=sceleb & "dedicated to a program of healthy eating for all. She has just<br>" 
sceleb=sceleb & "introduced her latest DVD, STRONG SEXY SVELTE: Three Total <br>"
sceleb=sceleb & "Workouts for a Rocking Body all focused on Fitness for the Mind<br>"
sceleb=sceleb & "and Body! And her most recent APP is YOGA AND PILATRES WITH <br>"
sceleb=sceleb & "KRISTIN MCGEE.  CNN, CBS Morning Show, Fox, Good Morning<br>" 
sceleb=sceleb & "America, Tyra Banks to name a few, a Health Magazine<br>" 
sceleb=sceleb & "Contributing Editor, a Fila Yoga Ambassador, and teaches<br>" 
sceleb=sceleb & "at Reebok/Sports Club LA, Clay Health and Fitness, Equinox<br>" 
sceleb=sceleb & "Fitness, Yoga Works, and more.  Kristin works with many celebs,<br>" 
sceleb=sceleb & "from Steve Martin, Tina Fey, LeAnn Rimes to<br>"
sceleb=sceleb & "her appearance in the DVD, Body by Bethenny."  %> 
<a href="http://www.kristinmcgee.com" target="_blank">
<img src="celebs/kristin-mcgee.jpg" alt="Kristin McGee" height="220" width="180">
</a>


<%case "sales-training"
sceleb="Shahin Miah" & "<br>"
sceleb=sceleb & "<b>Sales Expert</b><br>"
sceleb=sceleb & "Shahin Miah is a Business to Business & Business to Consumer<br>"
sceleb=sceleb & "Sales Expert Shahin Miah, is a Sales and Marketing expert <br>"
sceleb=sceleb & "with over 10 years experience. His experience lies within <br>" 
sceleb=sceleb & "large businesses in addition to small businesses across<br>"
sceleb=sceleb & "number of verticals on a local, national and global level.<br>"
sceleb=sceleb & "Shahin is an affiliate professional member of the Chartered<br>" 
sceleb=sceleb & "Institute of Marketing, has a BA (Hons) Degree in Marketing,<br>"
sceleb=sceleb & "also a Higher National Diploma in Business & Finance. Shahin <br>"
sceleb=sceleb & "is the Founder and Owner of many, Marketing and Strategy<br>"
sceleb=sceleb & "based businesses such as, Integrated Marketing and Business<br>"
sceleb=sceleb & "Solutions, www.ineedsales.co.uk and www.shahin-miah.com to <br>"
sceleb=sceleb & "name a few which all belong to Shahin Miah Group of Companies.<br>"
sceleb=sceleb & "Shahin was previously the founder and owner of very successful <br>" 
sceleb=sceleb & "online recruitment portal www.careerfruit.co.uk enabling 300,000<br>"
sceleb=sceleb & "graduates look for work and connect with employers. Community <br>"  
sceleb=sceleb & "based TV channels and Press regularly feature Shahin due to <br>"
sceleb=sceleb & "his great knowledge of sales and marketing especially in <br>"
sceleb=sceleb & "the digital field. Shahin plays a vital role in growing <br>"
sceleb=sceleb & "clients businesses in any sector, Shahin strongly believes sales<br>"
sceleb=sceleb & "are the lifeblood of any business and with this belief <br>"
sceleb=sceleb & "Shahin becomes a key strategic driver of sales in growing<br>" 
sceleb=sceleb & "any business he works with. He is an inspiration to any<br>" 
sceleb=sceleb & "strategy or sales team, and always delivers game changing <br>"
sceleb=sceleb & "results whether it’s online or offline.  His sales training<br>" 
sceleb=sceleb & "programmes are mind blowing."
%>
<p align="center">
<a href="http://www.shahinmiah.com" target="_blank">
<img src="celebs/shahin.jpg" alt="Shahin Miah">
</a>
</p>
<%case "singing-lessons"


sceleb="<b>Kim Wilde</b>" & "<br>"
sceleb=sceleb & "Photo taken to promote her 2011 album 'Snapshots'<br> "
sceleb=sceleb & "- the 12th studio album in a career that stands<br>"
sceleb=sceleb & "at 31 years and counting..."
'sceleb=sceleb & "<b>Singer/Songwriter</b><br>"
'sceleb=sceleb & "Edwige, (pronounced as Eduee(d)ge with the second d silent) ,<br>"
'sceleb=sceleb & "one of the most original and inspired  singer/songwriter, currently <br>"
'sceleb=sceleb & "on the acoustic circuit , singled out not only for the quality of her<br>" 
'sceleb=sceleb & "songs but for the uniqueness and beauty of her voice; <br>"
'sceleb=sceleb & "and exhilarating, she will lift your spirits. Inimitable, incomparable "%>
<a href="http://www.kimwilde.com" target="_blank">
<img src="celebs/kim-wilde.jpg">
</a>


<%case "comedy-classes"
sceleb="Drew Cameron" & "<br>"
sceleb=sceleb & "<b>Impressionist</b><br>"
sceleb=sceleb & "Award winning , stand-up chameleon Voted 'Best new comedian on ITV '.<br>"
sceleb=sceleb & "Comedy Impressionist <br>"
%>
<a href="http://www.comedyimpressionist.com/" target="_blank">
<img src="celebs/drew-cameron.jpg" alt="drew cameron">
</a>


<%case "acting-school"
sceleb="Sean Connery" & "<br>"
sceleb=sceleb & "<b>Actor</b><br>"
%>

<a href="http://www.seanconnery.com"><img src="http://www.seanconnery.com/banners/images/sc_bnr_125x125.gif" width="125" height="125" border="0" alt="Visit SeanConnery.com" /></a>



<%case "dancing-lessons"
sceleb="Karen Hardy" & "<br>"
sceleb=sceleb & "<b>Celebrity Dancer</b><br>"

 
%>
<p align="center">
<a href="http://www.karenhardystudios.com"><img src="celebs/karen-hardy.jpg" border="0" /></a>
</p>
<%
sceleb=sceleb & "<b>Former:</b> UK, International, World Masters and<br>"
sceleb=sceleb & "British National Champion of Latin American Dance.<br>"
sceleb=sceleb & "Strictly Come Dancing Champion Series 4<br>"
sceleb=sceleb & "Director of Karen Hardy Studios, luxury lifestyle dance studio for all classes.<br>"
sceleb=sceleb & "Please telephone 08455671155,<br>www.karenhardystudios.com"

case "music-courses-and-lessons"%>

<script type="text/javascript"><!--
iDevAffiliate_BoxWidth = "220";
iDevAffiliate_BoxHeight = "80";
iDevAffiliate_OutlineColor = "#000099";
iDevAffiliate_TitleTextColor = "#FFFFFF";
iDevAffiliate_LinkColor = "#0033CC";
iDevAffiliate_TextColor = "#000000";
iDevAffiliate_TextBackgroundColor = "#F3F3F3";
//-->
</script>

<script language="JavaScript" type="text/javascript" src="http://www.pointblankonline.net/373-textad-2.html"></script>
<%

case else
learn=replace(learn, "-"," ")
sceleb="<h1>Looking for Private Tuition in " & learn &  "?</h1>"
if privatetutor="tutorfair" then
sceleb=sceleb & "<p><a href='http://www.tutorfair.com/?regcode=LCN'><h1>Find a Tutor (TutorFair)</h1></a></p>"
else
sceleb=sceleb & "<p><a href='https://bluetutors.co.uk/find-a-tutor.php'><h1>Find a Tutor (Blue Tutors)</h1></a></p>"
end if
end select%>


</td>
<td style="width: 371px" class="style12">
<% if sceleb="" then%>
<span class="style5"><strong><span class="style7">London Course Finder&nbsp; 
Mailing List </span></strong><span class="style14">&nbsp;==&gt;</span></span><span class="style14"><br>
 <p>Join our mailing list to receive special offers/discounts and deals on <%response.write request("learn")%> 
	</p>

<p>

We respect your privacy
and will only share your data with course providers registered with us.</span></p>
<%else%>
<font color="#ffffff">
<%response.write sceleb%>
</font>
<%end if%>

</td>
<td style="height: 185px; width: 213px;" class="style4">
<p><b>London Course Finder Mailing List</b>
<form method="post" action="sendenquiry.asp">
<table><tr><td>Name: </td><td><input type="text" name="studentname" size="15"></td></tr>
<tr><td>Tel: </td><td><input type="text" name="tel" size="15"></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" size="15"></td></tr>
</table>
</p>
<p align="right">
<input type="hidden" name="courseprovider" value="lcf-mailinglist" />

<INPUT TYPE="image" SRC="images/join-mailing-list.png" BORDER="0" ALT="Subscribe to our course mailing list.">
</p>
</form>
</td>

</tr>
</table>
<p>Internships and Trainee Apprenticeships
- coming soon !
</p>


<p class="style1">More London courses coming soon !</p>

				
			</div>
			
			
			
			<br class="clear" />
		</div>
		
		<div id="footer-cell">

		<div id="sbanner2">
				
			</div>		
			<!--#include file="footer.asp"-->
			</div>
		</div>
	</div>
<script type="text/javascript">
function openJS(){alert('loaded')}
function closeJS(){}
</script>


</body>
</html>