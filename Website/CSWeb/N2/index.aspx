<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.H2.Store.index" EnableSessionState="True" %>
<%@ Register Src="/h2/UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/h2/UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script><link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global_A5.js"></script>
<link href="../Styles/global_e2.css" rel="stylesheet" type="text/css" />

</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
 
<!--#include file="header_main.html"-->
<div class="container">


<div class="page" style="background: url(//d1f7jvrzd4fora.cloudfront.net/images/a5/home_bg.jpg) no-repeat #fff">
<div class="home_left" style="width: 100%; padding-top: 20px;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/home_top_n2.png" usemap="#Maphometop" />
<map name="Maphometop">
    <area shape="circle" coords="511,304,58" href="#guarantee" class="guarantee" onclick="javascript:void(0);">
        <%-- <area shape="rect" coords="422,584,659,705" href="#newbook" class="fancynowrap"> --%>
        <area shape="rect" coords="683,632,866,684" href="AddProduct.aspx?pid=64&cid=1">
</map>
<div class="hometoptext gray" style="top: 177px">
<ul style="margin-bottom: 0;">
<li>Turbo charge your memory for better performance!</li>
<li>Increase confidence which translates into <br>better grades</li>

<li style="padding-bottom: 0;">Improve Focus and Concentration to make <br>learning more fun!</li>
</ul>
</div>
<div class="whatsincluded"  style="left: 827px; top: 455px"><a href="#included" onclick="javascript:void(0);" class="included  black scored">What's Included?</a></div>

<div class="aboutmike" style="left: 21px; top: 360px; height: 202px; width: 190px;">
<p class="white f31 webfont1" style="line-height: 1.1">Mike Byster</p>
  <p class="white lh20 f13">is the creator of the entertaining and engaging multi-disk 
    DVD program to build increased mental capacity called Brainetics, winner of the 2008 Parent’s Choice Award & 2012 Mom’s Best Award. <br>
    <a href="aboutmike.aspx" class="white scored bold">Read more...</a> </p>
</div>


<div class="video2020" style="left: 384px; top: 773px">
<div id="video2020"></div>
  <script type='text/javascript'>
  	jwplayer('video2020').setup({
  	file: "https://d1f7jvrzd4fora.cloudfront.net/video/2020_how1.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/a5/2020.JPG",
    primary: "flash",   
	controls: true,
    width: 351, height: 263,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('ctavideo').stop();
	}}
  });
</script>
</div>
<div class="homevideo" style="position: absolute; left: 620px; top: 11px; width: 296px; height: 222px;">
<div id="ctavideo"></div>
  <script type='text/javascript'>
  	jwplayer('ctavideo').setup({
  	file: "https://d1f7jvrzd4fora.cloudfront.net/video/ctavideo1_30day.mp4",
	autostart: true,
    primary: "flash",   
	controls: true,
    width: 296, height: 222,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('video2020').stop();
	}}
  });
</script>
 </div>
 </div>
 
<div class="clear"></div>
<div class="home_bottom"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/home_bottom.png" usemap="#Maphomebtm" class="block" />
  <map name="Maphomebtm">
    <area shape="rect" coords="579,1036,791,1095" href="AddProduct.aspx?pid=64&cid=1" class="try">
  </map>
  <div class="homebtmtext black f14 lh20">
    <p><strong>Brainetics TRAINS two different parts of the MIND</strong> to work simultaneously yet independently of each other. One part of your mind memorizes information while another part is sorting and processing new information. The mind will begin to work more efficiently and become more powerful <strong>giving Brainetics kids a huge advantage</strong> throughout their academic lives 
      and beyond. <br>
<br>
<strong>Your child HAS THE POTENTIAL to SUCCEED</strong>, and Brainetics unlocks that hidden cognitive ability! The Brainetics® Complete System increases your child's <strong>Comprehension and Memory</strong>, and re-introduces <strong>learning</strong> through an increasingly challenging step- by- step program, enabling progress with a fun and easy to use process. </p>
  </div>
</div>
<!--#include file="bottomcta.html"-->
</div>



</div>

<!--#include file="footer.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
