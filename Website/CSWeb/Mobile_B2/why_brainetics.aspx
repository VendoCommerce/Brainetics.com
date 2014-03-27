<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_B2.Store.index" EnableSessionState="True" %>

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
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript" src="/Scripts/global_mobile.js"></script>
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
<form runat="server" id="fm1">

<div class="container">

<!--#include file="popups.html"-->
<!--#include file="header.html"-->

<div class="content">
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/why1.png" width="640" height="133" class="block" alt="Why Brainetics?" />
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/why2.png" width="640" height="575" class="block" alt="Top 5 Reasons To Try Brainetics" />

<div style="padding-bottom: 37px;">
  <img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/why3.png" width="640" height="874" class="block" alt="Award Winning System That Everyone is Talking About!" />
  <div class="why3">
      <p style="width: 380px;"><strong>Brainetics TRAINS two 
  different parts of the MIND</strong> to 
  work simultaneously yet 
  independently of each other. 
  One part of your mind memorizes 
  information while another part is 
  sorting and processing new 
  information. The mind will begin 
  to work more efficiently and 
  become more powerful <strong>giving 
  Brainetics kids a huge advantage </strong>
  throughout their academic lives 
  and beyond. </p>
      <p><strong>Your child HAS THE POTENTIAL to SUCCEED,</strong> and Brainetics unlocks that hidden cognitive ability! The Brainetics® Complete System increases your child's <strong>Comprehension and Memory</strong>, and re-introduces <strong>learning</strong> through an increasingly challenging step-by- step program, enabling progress with a fun and easy to use process.</p>
  </div>
</div>

<div class="why4">
	<a href="https://d1f7jvrzd4fora.cloudfront.net/video/2020_how1.mp4"><img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/why4.jpg" width="593" height="527" class="block" alt="As Seen On ABC's 20/20" /></a>
</div>

<div class="why5">
	<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/hdr_whatyouget.png" width="640" height="36" class="block" alt="What You Get" />
	<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/hdr_brainetics_enhanced.png" width="640" height="91" class="block" alt="Brainetics&reg; Enhanced Package" />
    <div style="padding-left: 13px;">
      <p>Brainetics is made up of fun games and creative exercises that improve concentration and focus by teaching kids how to process and retain more information. Your Brainetics kit includes:</p>
      <ul>
          <li>Brainetics<sup>®</sup> Complete DVD Set (Levels 1-5)</li>
          <li>Interactive Playbook</li>
          <li>Flash and Play Cards</li>
          <li>Quick Start Guide</li>
      </ul>
      <p class="hotpink f30 webfont1 lh36">PLUS 4 Bonuses Worth Over $70</p>
      <ul>
      	<li>On the Move Brain Games</li>
      	<li>Brain Boosting Guide</li>
      	<li>Disc 6</li>
      	<li>Disc 7</li>
      </ul>
      <p class="hotpink f30 webfont1 lh36">PLUS our 30-Day Money Back Guarantee!</p>
    </div>
    <img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/why5.jpg" width="640" height="566" class="block" alt="What You Get" />
</div>
  

<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
