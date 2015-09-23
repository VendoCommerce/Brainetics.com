﻿<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_D2.Store.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModule2.ascx" TagName="Form"
    TagPrefix="uc1" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="viewport" content="width=640px, initial-scale=.5, maximum-scale=.5" />
<title>Brainetics</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript" src="/Scripts/global.js"></script>
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/scripts/NoBack.js"></script>
</head>
<body id="receipt">

<div class="container">
<!--#include file="popups.html"-->
<!--#include file="header_cart.html"-->

<div class="content">
     <uc1:Form ID="Form1" runat="server" />
</div>
<!--#include file="footer.html"-->
</div>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
