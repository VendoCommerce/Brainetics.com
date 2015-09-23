<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_D2.Store.index" EnableSessionState="True" %>

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
<h1>Contact Us</h1>
<p>We are committed to providing excellent customer service to all of our important customers.  </p>
<p><a href="https://trackmyorderstatus.com/(S(wfbd5b2qmcsugw55sx2kkmb0))/Introduction.aspx" target="_blank"><strong>To Track or Check the Status of your order, please click here.</strong></a></p>
<p>Please note:  there may be a 24-48 hour delay from the time you place your order until it becomes visible here. </p>
<p><strong>If you have a product question:</strong><br>
Please email us at <a href="mailto:brainetics@webcsr.info">brainetics@webcsr.info</a> or call customer at 1-877-444-3776 Monday-Friday between 5:00 AM and  5:00 PM PST.</p>

<p><strong>To order By Mail:</strong><br>

Please send a check or money order for the amount of $214.75 PLUS applicable taxes to:
</p>

<p>Brainetics<br>
PO Box 48<br>
Howell, MI 48844
</p>

<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
