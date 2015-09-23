﻿<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_D2.Store.cart2" EnableSessionState="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/BillingCreditForm.ascx" TagName="ShippingCreditForm"
    TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="viewport" content="width=640px, initial-scale=.5, maximum-scale=.5" />
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>

     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript" src="/Scripts/global_mobile.js"></script>
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />
 <script src="/Scripts/popup_mobile.js"></script>
</head>
<body>
 <form runat="server" id="fm1">
 
  
<div class="container">
<!--#include file="popups.html"-->
<!--#include file="header_cart.html"-->

<div class="content">

 <uc:ShippingCreditForm ID="bcfBillingCreditInfo" runat="server" RedirectUrl="Store/AddProduct.aspx" />

</div>
 <!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
