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
<h1>Testimonials</h1>
<p class="webfont1 f34" style="color: #ff6c00; padding-left: 36px; line-height: 44px;">These People Got the Brainetics Advantage and Love It!</p>
<div class="clearfix">
	<div class="fleft" style="width: 227px;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/test1.jpg" width="227" height="771" alt="" usemap="#Map" class="block" /></div>
    <div class="fleft" style="width: 413px;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/test2.png" width="413" height="771" alt="" usemap="#Map" class="block" /></div>
</div>

    <div class="reviews">
        <h2 class="text-center"><span>Brainetics Reviews</span></h2>
        <ul>
            <li><a href="http://helpkidsbreakth.hubpages.com/hub/brainetics-review-math-memory-sysytem" target="_blank">HubPages - December 11, 2014</a></li>
        </ul>
    </div>

<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/hdr_more_amazing_stories.png" width="640" height="99" alt="" usemap="#Map" class="block" />
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/test3.png" width="640" height="1245" alt="" usemap="#Map" class="block" />
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/test4.png" width="640" height="1545" alt="" usemap="#Map" class="block" />
<img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/test5.jpg" width="640" height="309" alt="" usemap="#Map" class="block" />




<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
