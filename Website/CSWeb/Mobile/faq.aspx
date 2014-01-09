<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.index" EnableSessionState="True" %>

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
<script src="/Scripts/bootstrap-transition.js"></script>
<script src="/Scripts/bootstrap-collapse.js"></script>
<script type="text/javascript" src="/Scripts/global_mobile.js"></script>
<link rel="stylesheet" type="text/css" href="/Styles/fontawesome/css/font-awesome.min.css">
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
<form runat="server" id="fm1">

<div class="container">

<!--#include file="popups.html"-->
<!--#include file="header.html"-->

<div class="content">
<h1>FAQs</h1>


<div class="accordion" id="faq_list">

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq1">
<i class="icon-minus"></i> Does Brainetics just help with math?</a>
<div id="faq1" class="collapse in">
<div class="faq_answer"><p>No - Brainetics techniques can apply to all aspects of your life.  Try Brainetics and see for yourself how much it can improve many different parts of your life!</p>
</div>
</div>
</div>


<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq2"><i class="icon-plus"></i> What makes Brainetics so fun?</a>
<div id="faq2" class="collapse">
<div class="faq_answer"><p>Brainetics was created with fun in mind – if it wasn't fun and engaging, Mike scrapped it and thought of something else. The result: Brainetics is wall-to-wall fun learning!</p>
</div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq3"><i class="icon-plus"></i> Do I have the right computer for Brainetics?</a>
<div id="faq3" class="collapse">
<div class="faq_answer"><p>Yes - Brainetics is not software, it's a DVD program, so as long as your computer has a video player, you can watch Brainetics!</p>
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

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq5"><i class="icon-plus"></i> How long does Brainetics take?</a>
<div id="faq5" class="collapse">
<div class="faq_answer"><p>There are about 20 sections in the Brainetics program. Everyone should go at their own pace, but each section takes approximately 15-20 minutes to learn and then there is also additional practice time to master the concepts. Anyone using Brainetics should master each section before moving to the next one.</p>
</div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq6"><i class="icon-plus"></i> My child is learning disabled – can he still do Brainetics?</a>
<div id="faq6" class="collapse">
<div class="faq_answer"><p>Since Brainetics is a learn-at-your-own-pace program, learning disabled children and gifted children alike can master Brainetics concepts.  Many students find that the confidence they gain by succeeding in math helps them in other areas of life as well.</p>
  </div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq7"><i class="icon-plus"></i> Who created Brainetics?</a>
<div id="faq7" class="collapse">
<div class="faq_answer"><p>Brainetics was created by one of the world's fastest mathematical minds, Mike Byster. With Brainetics techinques, Mike is teaching kids all over how to do complex math in their head faster than ever!</p>
</div>
</div>
</div>

<div class="faq-group">
<a class="faq-question" data-toggle="collapse" data-parent="#faq_list" href="#faq8"><i class="icon-plus"></i> How do teachers feel about Brainetics?</a>
<div id="faq8" class="collapse">
<div class="faq_answer"><p>Teachers love Brainetics because it gets kids motivated to learn and practice math, which is often the most challenging part of the teaching process. </p>
  </div>
</div>
</div>

<div style="height: 70px;"></div>

</div>




<!--#include file="bottomcta.html"-->

</div>
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
