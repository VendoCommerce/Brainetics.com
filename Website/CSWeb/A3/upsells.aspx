<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A3.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>


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
<script src="/Scripts/global_A3.js"></script>
<link href="../Styles/global_A3.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1">
<div class="container_upsell">
<div class="page_upsell">
<div class="upsell_head"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a3/upsell_top.jpg" width="902" height="149" class="block" /></div>

<div class="upsell_txt">
<h2>Upgrade to the Accelerated Package</h2>
<div class="upsell_left">
  <p>Morbi luctus tristique mollis. Duis faucibus nulla vel vestibulum convallis. Sed tempus nibh vel elit facilisis pharetra. Vivamus commodo tellus at elit laoreet, sit amet ornare libero dictum. Integer egestas arcu ipsum, dapibus sollicitudin mi condimentum id.    </p>
  <p>Vivamus commodo tellus at elit laoreet, sit amet ornare libero dictum. Integer egestas arcu ipsum, dapibus sollicitudin mi condimentum id. </p>
</div>
<div class="upsell_right"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a3/upsell_accelerated.jpg" width="391" height="353" />
</div>
<div class="clear"></div>

<span class="ask">Would you like to take advantage of this special offer?
<span class="btns"><a><img src="//d1f7jvrzd4fora.cloudfront.net/images/a3/nothanks_btn.png" width="74" height="39" /></a><a><img src="//d1f7jvrzd4fora.cloudfront.net/images/a3/yes_btn.png" width="113" height="39" /></a></span>
</span>


</div>


</div>



</div>

<!--#include file="footer_upsell.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
