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
<link href="../Styles/global_A5.css" rel="stylesheet" type="text/css" />

</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
<!--#include file="header_main.html"-->
<div class="container">

<div class="page" style="background: url(../content/images/A5/page_bg.jpg) repeat-x top #fff">
<div class="left">
<h2>Contact Us</h2>
  <p>We are committed to providing excellent customer service to all of our important customers.  </p>
<p><a href="http://secure.datapakservices.com/OrderTrackingPortal/?comp_num=204&proj_num=003" target="_blank"><strong>To Track or Check the Status of your order, please click here.</strong></a></p>
<p>Please note:  there may be a 24-48 hour delay from the time you place your order until it becomes visible here. </p>
<p><strong>If you have a product question:</strong><br>
Please email us at <a href="mailto:Brainetics@datapakservices.com">Brainetics@datapakservices.com</a> or call customer at 1-877-444-3776 Monday-Friday between 8:00 AM and 8:00 PM Eastern time and Saturday 9:00 AM to 6:00 PM Eastern time.</p>

<p><strong>To order By Mail:</strong><br>

Please send a check or money order for the amount of $214.75 PLUS applicable taxes to:
</p>

<p>Brainetics<br>
PO Box 48<br>
Howell, MI 48844
</p>
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
