<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A4.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


<!doctype html>
<html>
<head>
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global_A4.js"></script>
<link href="../Styles/global_A4.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
<div class="container">
<!--#include file="headernav.html"-->
<!--#include file="header.html"-->
<div class="page">
<div class="home_left"><img src="../Content/images/A4/home_leftside.png" width="664" height="914" style="margin-left: -25px"/>
<div class="hometoptext gray">
<ul>
<li>Imagine storing, processing, and recalling information faster than ever!</li>
<li>Boost your child's confidence</li>

<li>Obliterate learning anxieties 
that hold kids back</li>

</ul>
<p class="bold">It doesn’t matter if you’re 9 or 99. 
Brainetics is guaranteed to give you better 
focus, concentration, and problem solving skills. 
Best of all, you’ll be able to memorize ANYTHING. </p>
</div>
<div class="whatsincluded"><a href="#included" class="included gray scored">What's Included?</a></div>
<div class="video2020">
<div id="video2020"></div>
  <script type='text/javascript'>
  	jwplayer('video2020').setup({
    file: "/content/video/2020_how1.mp4",
	autostart: false,
	image: "/content/images/A4/2020.jpg",
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
</div>
<div class="right">
<div class="homevideo">
<div id="ctavideo"></div>
  <script type='text/javascript'>
  	jwplayer('ctavideo').setup({
    file: "/content/video/ctavideo.mp4",
	autostart: true,
    primary: "flash",   
	controls: true,
    width: 295, height: 221,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('video2020').stop();
	}}
  });
</script>
</div>

 <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /></div>
<div class="clear"></div>
<div class="home_bottom"><img src="../Content/images/A4/home_bottom.jpg" width="950" height="1612" usemap="#Maphomebtm" />
  <map name="Maphomebtm">
    <area shape="rect" coords="574,1457,795,1520" href="#tryitnow" class="try">
    <area shape="rect" coords="681,329,931,401" href="#tryitnow" class="try">
  </map>
  <div class="homebtmtext black lh20">
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
