<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_B2.Store.index" EnableSessionState="True" %>

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
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript" src="/Scripts/global_mobile.js"></script>
<link href="/styles/global_mobile.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
<form runat="server" id="fm1">

<div class="container">

<!--#include file="popups.html"-->
<!--#include file="header_home.html"-->

<div class="content">

<div class="hometop"><img src="<%= GetDynamicVersionData("homepageimage")%>" width="640" height="906" id="homeimage_amazon" usemap="#Maphome1" class="block" alt="Brainetics" />
  <map name="Maphome1">
    <area shape="rect" coords="421,150,618,288" href="https://d1f7jvrzd4fora.cloudfront.net/video/ctavideo1_30day.mp4" alt="Watch Video" target="_blank">
    <area shape="rect" coords="320,695,614,790" href="cart.aspx" alt="Order Now" accesskey="1">
    <area shape="circ" coords="560,364,63" href="#mgb" class="mgb" alt="60 Day Money-Back Guarantee">
  </map>
  <map name="Maphome2">
    <area shape="rect" coords="421,150,618,288" href="https://d1f7jvrzd4fora.cloudfront.net/video/ctavideo1_30day.mp4" alt="Watch Video" target="_blank">
    <area shape="rect" coords="320,695,614,790" href="cart.aspx" alt="Order Now" accesskey="1">
    <area shape="circ" coords="560,364,63" href="#mgb" class="mgb" alt="60 Day Money-Back Guarantee">
    <area shape="rect" coords="360,830,616,906" href="http://www.amazon.com/NEW-Brainetics-Enhanced-Includes-Exclusive/dp/B00JVUF0GY/ref=sr_1_1?ie=UTF8&qid=1409084938&sr=8-1&keywords=brainetics" alt="Buy on Amazon Prime" target="_blank">
  </map>
  
  <img src="//d1f7jvrzd4fora.cloudfront.net/images/mobile/nav2.png" width="640" height="812" usemap="#Maphome2" class="block" />
  <%-- Removed Terms of Service (we're waiting on that)
  <map name="Maphome2">
    <area shape="rect" coords="0,3,640,90" href="tel:1<%= GetCleanPhoneNumber(GetDynamicVersionData("phone"))%>" accesskey="2">
    <area shape="rect" coords="0,93,640,180" href="why_brainetics.aspx" alt="Why Brainetics">
    <area shape="rect" coords="0,183,640,268" href="howitworks.aspx" alt="How It Works">
    <area shape="rect" coords="0,271,640,358" href="testimonials.aspx">
    <area shape="rect" coords="0,361,640,448" href="about.aspx">
    <area shape="rect" coords="0,451,640,538" href="faq.aspx">
    <area shape="rect" coords="0,541,640,626" href="privacy.aspx">
    <area shape="rect" coords="0,629,640,715" href="terms.aspx" alt="Terms">
    <area shape="rect" coords="0,718,640,805" href="http://secure.datapakservices.com/OrderTrackingPortal/?comp_num=204&proj_num=003" target="_blank" alt="Track My Order">
    <area shape="rect" coords="0,808,640,901" href="mailto:[enter your email address]?subject=Email Reminder from Brainetics&body=Just sending you a reminder to order Brainetics! Simply visit http://www.brainetics.com to order the Award Winning System that works!" alt="Email a Reminder">
  </map>--%>
  <map name="Maphome2">
    <area shape="rect" coords="0,3,640,90" href="tel:1<%= GetCleanPhoneNumber(GetDynamicVersionData("phone"))%>" accesskey="2">
    <area shape="rect" coords="0,93,640,180" href="why_brainetics.aspx" alt="Why Brainetics">
    <area shape="rect" coords="0,183,640,268" href="howitworks.aspx" alt="How It Works">
    <area shape="rect" coords="0,271,640,358" href="testimonials.aspx">
    <area shape="rect" coords="0,361,640,448" href="about.aspx">
    <area shape="rect" coords="0,451,640,538" href="faq.aspx">
    <area shape="rect" coords="0,541,640,626" href="terms.aspx">
    <area shape="rect" coords="0,629,640,715" href="http://secure.datapakservices.com/OrderTrackingPortal/?comp_num=204&proj_num=003" target="_blank" alt="Track My Order">
    <area shape="rect" coords="0,718,640,805" href="mailto:[enter your email address]?subject=Email Reminder from Brainetics&body=Just sending you a reminder to order Brainetics! Simply visit http://www.brainetics.com to order the Award Winning System that works!" alt="Email a Reminder">
  </map>
  
</div>
</div>
<!--#include file="bottomcta.html"-->
<!--#include file="footer.html"-->
</div>

<uc:TrackingPixels ID="TrackingPixels" runat="server" />
</form>
</body>
</html>
