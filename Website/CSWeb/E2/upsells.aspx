<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.E2.Store.index" EnableSessionState="True" %>


<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
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
 <form runat="server" id="fm1">
<div class="container_upsell">
<div class="page_upsell"><script type="text/javascript">function updateUpsellSku(fld) { document.getElementById('addsku').value = fld.value; }</script>  
<div class="upsell_head"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/upsell_top.jpg" width="902" height="149" class="block" /><h2 style="position: absolute; top: 49px; left: 254px; width: 550px; line-height: 42px;">Get the Most Versatile Bag You'll Ever Own!</h2></div>

<div class="upsell_txt">
<p class="f23 bold">Cinchy – You CAN Take it With You – Fast & Easy!</p>
<div class="upsell_left" style="width: 550px;">
  <p>As a special offer for our customers you can order a Cinchy bag! The most versatile bag you'll ever own, it quickly transforms from a bag into a mat and back.</p>
  <p>Today for only $19<sup>.99</sup> plus <strong>FREE</strong> shipping and handling, add a Cinchy bag to your order plus we'll include two free gifts! Choose from any of the 5 fashionable patterns below.</p>
  <p class="fleft" style="margin: 0 20px 20px 0; display: inline-block;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_pic.png" width="292" height="226"  /></p>
  <ul class="pad20 f13" style="display: inline-block">
    <li style="list-style: none; background: url(//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_check.png) no-repeat; padding-left: 27px; padding-bottom: 16px;">Use it at the beach</li>
    <li style="list-style: none; background: url(//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_check.png) no-repeat; padding-left: 27px; padding-bottom: 16px;"> For a picnic in the park</li>
    <li style="list-style: none; background: url(//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_check.png) no-repeat; padding-left: 27px; padding-bottom: 16px;">At sporting events</li>
    <li style="list-style: none; background: url(//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_check.png) no-repeat; padding-left: 27px; padding-bottom: 16px;">Pack an overnight bag <br>in just seconds</li>
    <li style="list-style: none; background: url(//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_check.png) no-repeat; padding-left: 27px; padding-bottom: 16px;">Organize toys, clothes – anything!</li>
    </ul>
  <p class="f17">Cinchy has more uses 
    than you can even think of!</p>
    <div class="clear"></div>
    <p class="pad6" style="margin-left: 310px"><strong>SELECT YOUR PATTERN</strong></p>
  <img src="//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_freeshipcall.png" width="136" height="52" class="fleft" style="margin-right: 10px; margin-left: 165px;"/>  
    <div class="upsell_error"><input type="hidden" name="addsku" id="addsku" required="true" error="Please select an item." /></div>                             
<div class="color_radio"><label for="radio2"><span class="select_gray"><input type="radio" name="skuitem1" value="gray" onclick="updateUpsellSku(this)" id="radio2" /></span></label><label for="radio3"><span class="select_peacock"><input type="radio" name="skuitem1" value="peacock" onclick="updateUpsellSku(this)" id="radio3" /></span></label></div>

<div class="selected_color"><img src="//d1f7jvrzd4fora.cloudfront.net/images/swatch_blank.jpg" /></div>
<div class="clear"></div>



<span class="btns" style="text-align:left; margin-left: 50px; position:relative; margin-top: 20px;"><a href="javascript:void(0)" bind="no"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a2/nothanks2_btn.png" width="100" height="39" /></a><a href="javascript:void(0)" bind="yes"><img src="//d1f7jvrzd4fora.cloudfront.net/images/yes_cinchy.png" width="314" height="37" /></a>
<img src="//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_arrow.jpg" width="61" height="78" style="margin-top: -6px; position: absolute; left: 433px; top: -30px;" />
</span>
  </div>
<div class="upsell_right" style="width: 259px">
  <p class="text-center pink f17 pad6">Perfect for on-the-go life!</p>
  <div class="pad20">
  <div id="demo1"></div>
  <script type='text/javascript'>
  	jwplayer('demo1').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo1.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster1.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo2').stop();
   	jwplayer('demo3').stop();
	}}
  });
</script>
  </div>
  <p class="text-center pink f17 pad6">Makes a handy play mat </p>
    <div class="pad20">
      <div id="demo2"></div>
  <script type='text/javascript'>
  	jwplayer('demo2').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo2.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster2.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo1').stop();
   	jwplayer('demo3').stop();
	}}
  });
</script>
    </div>
  <p class="text-center pink f17 pad6">Keeps you organized!</p>
    <div class="pad20">
      <div id="demo3"></div>
  <script type='text/javascript'>
  	jwplayer('demo3').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo5.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster3.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo2').stop();
   	jwplayer('demo1').stop();
	}}
  });
</script>
    </div>
</div>
<div class="clear"></div>

</div>


</div>


</div>




<!--#include file="footer_upsell.html"-->
 </form>
</body>
</html>
