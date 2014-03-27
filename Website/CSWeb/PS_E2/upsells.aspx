<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.PS_E2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>


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
<div class="page_upsell">
<div style="position:absolute; top: 50px; left: 300px; z-index: 1000; color: #ff6c00;" class="f60 webfont1">Our Best Value!</div>
<div class="upsell_head"><img width="902" height="149" src="//d1f7jvrzd4fora.cloudfront.net/images/a2/upsell_top.jpg" class="block" /></div>
<div class="upsell_txt">
<h2>Try Brainetics Accelerated Package <br>
  at No Additional Cost <span style="position:relative;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/e2/upsell_underline.png" style="position:absolute; bottom: -6px; left: -3px;">Today!</span></h2>
<div class="upsell_left" style="width: 400px">  
<p>Try our Accelerated Package at <strong>47% savings</strong> which includes 
all these extras:</p>  
<ul class="ul_upsell f14">
<li>The <strong>Challenge Board Game</strong> for Brainetics tournaments in 
  your own home.</li>
<li><strong>30 Quick Learning Cards</strong> where Mike teaches you 5 different 
  learning skills.</li>
<li><strong>Digital Experience:</strong> Access Brainetics on tablets or smart 
  phones 24/7, anywhere!</li></ul>
<p>Act now to get these bonuses for only <strong>4 additional payments of $24<sup>.95</sup></strong> 
you'll have the <strong>Brainetics Accelerated Package</strong>! Rest assured, you're 
still covered by our <strong class="pink">60-day Money-Back Guarantee</strong>! </p></div>
<div class="upsell_right"><img width="411" height="339" src="//d1f7jvrzd4fora.cloudfront.net/images/e2/upsell_accelerated.jpg" />
<div class="comparison_link"><a href="#comparison" class="comparison f12 bold" style="color: #00a7e9">See Comparison Chart</a></div></div>
<div class="clear"></div>
<span class="ask">Would you like to take advantage of this special offer?<span class="btns"><a href="javascript:void(0)" bind="no"><img width="74" height="39" src="//d1f7jvrzd4fora.cloudfront.net/images/a2/nothanks_btn.png" /></a><a href="javascript:void(0)" bind="yes"><img width="113" height="39" src="//d1f7jvrzd4fora.cloudfront.net/images/a2/yes_btn.png" /></a></span></span></div></div>



</div>

<!--#include file="footer_upsell.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
