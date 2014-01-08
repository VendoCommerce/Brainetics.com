<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.D2.Store.OfferChange" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/Scripts/global_a5.js"></script>
<link href="/styles/expirestyles.css" rel="stylesheet" type="text/css" />
</head>
 
<body>
    <form runat="server" id="fm1">
<div id="expire">
<h2>Attention!</h2>
 <p><strong>Dear Customer, </strong><br />
   The card you have entered <span class="purple">is not allowed to place order with multile payments</span>. To take advantage of our <span class="purple">4 easy monthly payments</span> you may enter a different card, or you may choose to <span class="purple">pay in full today!</span>
 </p>
 <h3><img src="/content/images/expire_arrow.jpg" width="33" height="31" style="float:left" />&nbsp;Please select your preference:</h3>
 
    <div class="formline_expire clearfix">
        <asp:RadioButtonList runat="server" ID="rblPaymentOption">
            <asp:ListItem Selected="True" Text="Yes, convert my order to a single-pay." Value="change"></asp:ListItem>
            <asp:ListItem Text="No, let me re-enter another credit card for the installment pay plan." Value="same"></asp:ListItem>
        </asp:RadioButtonList>
       
    </div>
 
  
 <div class="formline_expire"> <asp:ImageButton runat="server" ImageUrl="/content/images/expire_continue_btn.jpg" width="202" height="69" OnClick="BindSkus"/> 
 </div>
</div>  
 
  
 </form>
</body>
</html>
