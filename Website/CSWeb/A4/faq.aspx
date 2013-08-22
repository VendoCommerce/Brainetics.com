<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A4.Store.index" EnableSessionState="True" %>

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
<script src="/Scripts/bootstrap-transition.js"></script>
<script src="/Scripts/bootstrap-collapse.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global_A4.js"></script>
<link rel="stylesheet" type="text/css" href="/Styles/fontawesome/css/font-awesome.min.css">
<link href="../Styles/global_A4.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form runat="server" id="fm1"><!--#include file="popups.html"-->
<!--#include file="header_main.html"-->
<div class="container">
<div class="page" style="background: url(../content/images/a4/page_bg.jpg) repeat-x top #fff">
<div class="left">
<h2>Frequently Asked Questions</h2>
 <div class="accordion" id="faq_list">

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq1">
<i class="icon-plus"></i> Do I have to help my child along with Brainetics?</a>
<div id="faq1" class="collapse">
<div class="faq_answer"><p>No. By design, Brainetics is an independent learning program. But valuable processing and thought development skills are great for everyone in the family, so why not get everyone involved!</p>
</div>
</div>
</div>


<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq2"><i class="icon-plus"></i> Do I have to help my child along with Brainetics?</a>
<div id="faq2" class="collapse">
<div class="faq_answer"><p>No. By design, Brainetics is an independent learning program. But valuable processing and thought development skills are great for everyone in the family, so why not get everyone involved!</p>
</div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq3"><i class="icon-minus"></i> Do I have to help my child along with Brainetics?</a>
<div id="faq3" class="collapse in">
<div class="faq_answer"><p>No. By design, Brainetics is an independent learning program. But valuable processing and thought development skills are great for everyone in the family, so why not get everyone involved!</p>
</div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq4"><i class="icon-plus"></i> Do I have to help my child along with Brainetics?</a>
<div id="faq4" class="collapse">
<div class="faq_answer"><p>No. By design, Brainetics is an independent learning program. But valuable processing and thought development skills are great for everyone in the family, so why not get everyone involved!</p>
  </div>
</div>
</div>



</div>
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
