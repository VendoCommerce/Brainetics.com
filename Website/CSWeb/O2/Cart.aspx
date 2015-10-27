<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.O2.Store.cart" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/BillingShippingCreditForm.ascx" TagName="BillingCreditForm"
    TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">

<!--#include file="scripts.html"-->

</head>
<body id="cartpage">
 <form runat="server" id="fm1">
<!--#include file="header.html"-->
<div id="cart">
    <div class="container">
 <uc:BillingCreditForm runat="server" RedirectUrl="AddProduct.aspx" />

 </div>


</div>

<!--#include file="footer_cart.html"-->
<!--#include file="popups.html"-->
  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>


</body>
</html>
