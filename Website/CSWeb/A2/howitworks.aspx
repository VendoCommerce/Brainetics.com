﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A2.Store.index" EnableSessionState="True" %>
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
<script src="/Scripts/global_a2.js"></script>
<link href="../Styles/global_a2.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
<div class="container">
<!--#include file="headernav.html"-->
<!--#include file="header.html"-->
<div class="page">
<div class="left">
<h2>Get the Brainetics advantage <br>
for School, Work – For Life!</h2>
<div>
<img src="../Content/images/a2/howitworks_top.jpg" width="627" height="610" usemap="#Map" style="margin-left: -34px" />
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
	image: "/content/images/a2/2020.jpg",
	controls: true,
    width: 380, height: 285,
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
    width: 380, height: 285,
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
<div class="how1">
  <p><span class="webfont1 black f24 block pad6 lh">Develop Savvy Skills -
    Not Taught in the Classroom</span>
    Morbi pretium sem felis, bibendum luctus sapien aliquet ac. Nulla lobortis eleifend pulvinar. Maecenas id dictum risus, a bibendum nulla. Nam lacus justo, ultrices ac ligula eu, sodales tempus lectus. In porta diam id diam bibendum, eget convallis sem porttitor. Aliquam justo turpis, vulputate quis scelerisque non, lobortis vel arcu. Maecenas at purus mauris.
  </p>
</div>

</div>
</div>
<div class="right">
 <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /></div>
<div class="clear"></div>
<div class="lh20">
<img src="../Content/images/a2/howitworks_bottom.jpg" width="950" height="1561" />
<div class="how2">
  <p><span class="webfont1 black f24 block pad6 lh">Muscle Memory -
Amazing Exercises for the Brain</span>
    Morbi pretium sem felis, bibendum luctus sapien aliquet ac. Nulla lobortis eleifend pulvinar. Maecenas id dictum risus, a bibendum nulla. Nam lacus justo, ultrices ac ligula eu, sodales tempus lectus. In porta diam id diam bibendum, eget convallis sem porttitor. Aliquam justo turpis, vulputate quis scelerisque non, lobortis vel arcu. Maecenas at purus mauris.
  </p>
</div>

<div class="how3">
  <p><span class="webfont1 black f24 block pad6 lh">Muscle Memory -
Amazing Exercises for the Brain</span>
    Morbi pretium sem felis, bibendum luctus sapien aliquet ac. Nulla lobortis eleifend pulvinar. Maecenas id dictum risus, a bibendum nulla. Nam lacus justo, ultrices ac ligula eu, sodales tempus lectus. In porta diam id diam bibendum, eget convallis sem porttitor. Aliquam justo turpis, vulputate quis scelerisque non, lobortis vel arcu. Maecenas at purus mauris.
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