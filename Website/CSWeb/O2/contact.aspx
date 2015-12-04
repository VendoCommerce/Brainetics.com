<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.O2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


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
<body>
 <form runat="server" id="fm1">
<!--#include file="header.html"-->
     <div id="how_it_works">
         <div class="container">

             <!--#include file="sidecta.html"-->
             <div style="margin-right: 400px;">
                 <h1>Contact Us</h1>
                 <p>We are committed to providing excellent customer service to all of our important customers.  </p>
                 <p><a href="https://trackmyorderstatus.com/(S(wfbd5b2qmcsugw55sx2kkmb0))/Introduction.aspx" target="_blank"><strong>To Track or Check the Status of your order, please click here.</strong></a></p>
                 <p>Please note:  there may be a 24-48 hour delay from the time you place your order until it becomes visible here. </p>
                 <p>
                     <strong>If you have a product question:</strong><br>
                     Please email us at <a href="mailto:brainetics@webcsr.info">brainetics@webcsr.info</a> or call customer service at 1-877-444-3776 Monday-Friday between 5:00 AM and  5:00 PM PST.
                 </p>
             </div>
         </div>




     </div>






     <%--<uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" />--%>
<!--#include file="bottomcta.html"-->
<!--#include file="footer.html"-->
<!--#include file="popups.html"-->
  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
