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
<div class="container">
<!--#include file="headernav.html"-->
<!--#include file="header.html"-->
<div class="page">
<div class="left">
<h2>Contact Us</h2>
  <p>We are committed to providing the best products and friendliest customer service. If you should have any questions about ordering or about any of our great products, please feel free to contact us via the information provided below:</p>
  <p>You can also check your order status 24 hours a day at <a href="http://www.customerstatus.com" target="_blank">www.customerstatus.com</a>.</p>
  <p><strong>Send checks or money orders to:</strong><br>
    Brainetics<br>
    P.O. Box 3062<br>
    Wallingford, CT 06494<br>
    Phone: 877-444-3776</p>
  <p>Customer service is available Monday through Friday from 8:00am to 10:00pm Eastern Time. If you have any questions regarding your order that can not be answered by going to www.customerstatus.com, please feel free to email us <a href="mailto:brainetics@customerstatus.com">brainetics@customerstatus.com</a>.</p>
  <p>Please allow 24-48 hours for customer service to have information on your order.<br>
    Your Credit Card will not be charged until your order ships.</p>
  <p>For all customers looking to return, please visit <a href="http://www.customerstatus.com" target="_blank">www.customerstatus.com</a>. For your convenience, please have your order information handy.</p>
</div>
<div class="right">
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
