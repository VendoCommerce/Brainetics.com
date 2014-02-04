<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.E2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>






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
<div class="page" style="background: url(../content/images/A5/page_bg.jpg) repeat-x top #fff">
<div class="left">
<h2 style="padding-bottom: 5px; padding-left: 84px;">Get the Brainetics Advantage <br>
  for School, Work – For Life!</h2>
<div>
<img src="../Content/images/A5/howitworks_top.png" usemap="#Map" style="margin-left: -34px" />
<map name="Map">
  <area shape="rect" coords="16,35,125,140" href="javascript:void(0);" class="showhow1">
  <area shape="rect" coords="17,145,125,247" href="javascript:void(0);" class="showhow2">
</map>

<div class="howvid">
<div id="howvid1">
<div id="howvideo1"></div>
  <script type='text/javascript'>
  	jwplayer('howvideo1').setup({
    file: "/content/video/2020_how1.mp4",
	autostart: false,
    primary: "flash",   
	image: "/content/images/A5/2020.jpg",
	controls: true,
    width: 448, height: 336,
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
    file: "/content/video/how2.mp4",
	autostart: true,
    primary: "flash",   
	controls: true,
    width: 448, height: 336,
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
<div class="how_intro">
  <p class="f14"><span class="webfont1 blue f24 block pad6 lh">Brainetics is athletics for your brain!</span>
   Brainetics teaches you to use your brain more efficiently to process and memorize information so you can do amazing things with math and memory!
  </p>
</div>
<div class="how1">
  <p class="f14"><span class="webfont1 gray2 f24 block pad6 lh">Brainetics is the key to soaring 
confidence... and grades!</span>
    You're getting an edge on every other student in the <br>
    classroom and every other co-worker in your office with <br>
    Brainetics! That's because <strong>Brainetics techniques are not <br>
    taught in classrooms</strong>, so you're processing information <br>
    faster than anyone, because you've got the Brainetics secret!
  </p>
</div>

</div>
</div>
<div class="right" style="padding-top: 30px">
 <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /></div>
<div class="clear"></div>
<div class="lh20">
<img src="../Content/images/A5/howitworks_bottom.jpg" width="950" height="1561" />
<div class="how2">
  <p class="f14"><span class="webfont1 gray2 f24 block pad6 lh">Muscle Memory</span>
    With Brainetics, you're practicing tricks for doing math quickly and correctly in a way that becomes second nature. In time, you're rattling off answers to math problems you never thought possible – all because you've practiced Brainetics techniques!
  </p>
</div>

<div class="how3">
  <p class="f14"><span class="webfont1 gray2 f24 block pad6 lh">Get Your Brain Working Fast!</span>
    By learning Brainetics techniques, you're training 2 parts of your brain to work independently yet at the same time, so while one part is memorizing, the other part of your brain is processing new information. Your brain is more powerful this way because it's working so efficiently – giving you an edge for life!
  </p>
</div>
<div class="how4">
  <p class="webfont1 gray2 f34 block pad6 lh">How It Works</p>
</div>
<div class="how5">
  <p class="f14">
    The Brainetics DVD's are a fun and easy way to learn how to concentrate, improve your memory, overcome learning anxieties and develop skills that will help you succeed in school, at work and in life!
  </p>
</div>
<div class="how6">
  <p class="f14">
    The Brainetics, full color, interactive, playbook helps you practice as well as master the Brainetics secrets.
  </p>
</div>
<div class="how7">
  <p class="f14">
    The Brainetics Games can be fun for the whole family. 
You can practice and learn while you're having fun!
  </p>
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
