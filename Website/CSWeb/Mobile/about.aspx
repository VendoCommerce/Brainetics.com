<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>

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
<h1>About Mike Byster</h1>
<img src="../Content/images/mobile/about_mike.jpg" width="228" height="366" alt="Mike Byster, creator of Brainetics&reg;" usemap="#Map" class="about_mike" />
<p class="gray about_p">Mike Byster is the creator of the <br>
entertaining and engaging multi-disk <br>
DVD program to build increased mental <br>
capacity called Brainetics, winner of <br>
the 2008 Parent’s Choice Award <br>
&amp; 2012 Mom’s Best Award. </p>
<p style="padding-bottom: 44px;"><img src="../Content/images/mobile/about_awards.png" width="325" height="100" alt="" usemap="#Map" class="block" /></p>
<p class="gray about_p" style="padding-bottom: 44px;">He is one of the fastest mathematical <br>
minds in the world. But his real passion is in teaching kids to have the academic confidence that both sets them apart from the crowd, and sets them up for success in all parts of life for decades to come.
Featured on 20/20 for his ground breaking techniques to help kids master complex math concepts, Mike 
has traveled the country working with kids and painstakingly refining the Brainetics programs to 
make it the most fun, and the most effective it can be.</p>




<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
