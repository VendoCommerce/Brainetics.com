<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.G2.Store.OfferChange" EnableSessionState="True" %>
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
 <p>Dear Customer, <br />
   The card you have entered is a <strong>prepaid credit card</strong>. To take advantage of our <strong>special installment offer,</strong> a regular credit card with a valid expiration date must be used. Otherwise a prepaid card may only be used to pay in full today.
 </p>
 <h3><img src="/content/images/d2/expire_arrow.png" width="31" height="28" style="float:left; margin-top: 8px; margin-left: 2px;" />&nbsp;Please select your preference:</h3>
 
    <div class="formline_expire clearfix">
        <asp:RadioButtonList runat="server" ID="rblPaymentOption">
            <asp:ListItem Selected="True" Text="<strong>Yes, convert my order to a single-pay on the prepaid card I already entered.</strong> <br>I understand that I will receive a 30-day trial and save $64.90 on my Brainetics Enhanced Package for a total charge of $149.85 including free shipping." Value="change"></asp:ListItem>
            <asp:ListItem Text="<strong>No, let me re-enter a different credit card for the installment pay plan.</strong>" Value="same"></asp:ListItem>
        </asp:RadioButtonList>
       
    </div>
 <div class="formline_expire"> <asp:ImageButton runat="server" ImageUrl="/content/images/d2/btn_continue.png" width="195" height="53" OnClick="BindSkus"/> 
 </div>
</div>  
 
  
 </form>
</body>
</html>
