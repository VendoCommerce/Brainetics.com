<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.BRAINETICS_YT.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="UserControls/CardDecline.ascx" TagName="Form" TagPrefix="uc1" %>
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
<script src="/Scripts/global_a2.js"></script>
<link href="../Styles/global_a2.css" rel="stylesheet" type="text/css" />
<style>
.cartB {padding-left: 20px;}
.cartB .label-2 {display: block; width: 100%; padding: 3px 0;}
.cartB .label-3 {width: 150px; padding-top: 3px;}
.cartB .form_line {clear: both; display: block; width: 100%;}
#ucCardDecline_rblUpdateShippingAddress input, 
#ucCardDecline_rblUpdateBillingAddress input {margin-left: 10px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
  <div class="container">
<!--#include file="header_nonav.html"-->
<div class="page">
        <uc1:Form id="ucCardDecline" runat="server" />

    </div>


</div>

<!--#include file="footer_upsell.html"-->
    </form>
</body>
</html>
