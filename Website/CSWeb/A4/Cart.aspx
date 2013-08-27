<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A4.Store.cart" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/BillingCreditForm.ascx" TagName="BillingCreditForm"
    TagPrefix="uc" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global_A4.js"></script>
<link href="../Styles/global_A4.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1">
   <div class="container">
<!--#include file="header.html"-->
<div class="page">
 <uc:BillingCreditForm runat="server" RedirectUrl="AddProduct.aspx" />

 </div>


</div>

<!--#include file="footer_cart.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>


</body>
</html>
