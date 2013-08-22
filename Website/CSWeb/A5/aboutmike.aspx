<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A5.Store.index" EnableSessionState="True" %>
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
<script src="/Scripts/global_A5.js"></script>
<link href="../Styles/global_A5.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
<!--#include file="header_main.html"-->
<div class="container">
<div class="page" style="background: url(../content/images/A5/page_bg.jpg) repeat-x top #fff">
<div class="left">
<h2>About Mike</h2>
  <p><img src="../Content/images/a5/mike.jpg" width="208" height="321" class="fright" style="margin: 0 0 20px 20px" />Quisque et rhoncus arcu. Etiam lobortis, ligula ut imperdiet porttitor, lorem quam consequat urna, non congue velit ligula sed tellus. Vivamus placerat mauris scelerisque justo vulputate laoreet. Vestibulum posuere felis eget tellus gravida, eu bibendum orci malesuada. Integer feugiat, metus eget cursus lobortis, turpis velit feugiat tortor, non sagittis mauris risus id nulla. Nulla facilisi. Aenean tempor eros vel dictum pulvinar. Sed convallis fringilla leo, in ullamcorper sem tincidunt nec. Nunc laoreet molestie odio eu lacinia. In vel venenatis nisl, a bibendum nisl. Vivamus commodo, lorem in tempus interdum, lectus sem aliquet nisi, eget mattis risus magna quis elit.</p>
</div>
<div class="right" style="padding-top: 30px">
 <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /></div>
<div class="clear"></div>
<!--#include file="bottomcta.html"-->
</div>



</div>

<!--#include file="footer.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
