<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="CSWeb.H3.receipt" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModule.ascx" TagName="Receipt" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>


<!doctype html>
<html>
<head runat="server">
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
<script src="/Scripts/global_A5.js"></script>
<script src="/Scripts/popup.js"></script>
<link href="../Styles/global_e2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
  <div class="container">
<!--#include file="header.html"-->
<div class="page">
    
    <uc:Receipt runat="server" />

 </div>


</div>

<!--#include file="footer_receipt.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>


</body>
</html>
