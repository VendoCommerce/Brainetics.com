<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_NATIVE.Store.index" EnableSessionState="True" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="viewport" content="width=640px, initial-scale=.5, maximum-scale=1" />
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script type="text/javascript" src="/Scripts/global_mobile.js"></script>
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
<form runat="server" id="fm1">

<div class="container">

<!--#include file="popups.html"-->
<!--#include file="header.html"-->

<div class="content">
<h1>How It Works</h1>

<div style="margin-left: 10px;">
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/how1.jpg" width="612" height="392" alt="" usemap="#Map" class="block" />
<map name="Map">
  <area shape="rect" coords="6,29,107,130" href="javascript:void(0);" class="showhow1">
  <area shape="rect" coords="6,136,107,238" href="javascript:void(0);" class="showhow2">
</map>

<div class="howvid">
<div id="howvid1">
<div id="howvideo1"></div>
  <script type='text/javascript'>
  	jwplayer('howvideo1').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/2020_how1.mp4",
	autostart: false,
    primary: "flash",   
	image: "//d1f7jvrzd4fora.cloudfront.net/images/a5/2020.JPG",
	controls: true,
    width: 476, height: 370,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('howvideo2').stop();
	}}
  });
</script>
</div>
<div id="howvid2" style="display: none">
<div id="howvideo2"></div>
  <script type='text/javascript'>
  	jwplayer('howvideo2').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/how2.mp4",
	autostart: true,
    primary: "flash",   
	controls: true,
    width: 476, height: 370,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('howvideo1').stop();
	}}
  });
</script>
</div>
</div>
</div>

<p class="f32 webfont1 blue lh36" style="padding-top: 38px;">Brainetics is athletics for your brain! </p>
<p>Brainetics teaches you to use your brain more efficiently to process and memorize information so you can do amazing things with math and memory! </p>

<div class="clearfix" style="padding-bottom: 50px;">
	<div class="how_number" style="color: #f6adc7;">1</div>
    <div class="how_text">
    	<p class="webfont1 f30" style="padding-bottom: 18px; line-height: 32px;">Brainetics is the key to 
soaring confidence... 
and grades!</p>
		<p>You're getting an edge on every other student in the classroom and every other co-worker in your office with Brainetics! That's because <strong>Brainetics techniques are not taught in classrooms</strong>, so you're processing information faster than anyone, because you've got the Brainetics secret!</p>
    </div>
</div>

<div class="clearfix" style="padding-bottom: 50px;">
	<div class="how_number" style="color: #ffbea3;">2</div>
    <div class="how_text">
    	<p class="webfont1 f30" style="padding-bottom: 10px;">Muscle Memory</p>
		<p>With Brainetics, you're practicing tricks for doing math quickly and correctly in a way that becomes second nature. In time, you're rattling off answers to math problems you never thought possible – all because you've practiced Brainetics techniques!</p>
    </div>
</div>

<div class="clearfix" style="padding-bottom: 50px;">
	<div class="how_number" style="color: #d7e8b0;">3</div>
    <div class="how_text">
    	<p class="webfont1 f30" style="padding-bottom: 18px;">Get Your Brain <br>
        Working Fast!</p>
		<p>By learning Brainetics techniques, you're training 2 parts of your brain to work independently yet at the same time, so while one part is memorizing, the other part of your brain is processing new information. Your brain is more powerful this way because it's working so efficiently – giving you an edge for life!</p>
    </div>
</div>

<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/how2.png" width="640" height="925" alt="Processing plus Storage = Increased Mental Capacity" usemap="#Map" class="block" />

<p class="webfont1 f48" style="padding-top: 84px;">How It Works</p>
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile_b2/how3_4_15_15.png" width="640" height="992" alt="Watch the DVDs, Read the Books, Play the Games" usemap="#Map" class="block" />

<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
