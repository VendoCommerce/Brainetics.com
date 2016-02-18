<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.O2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/o2/UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


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
<div id="">
         <div class="container">

             <!--#include file="sidecta.html"-->
             <div style="margin-right: 400px;">
<h1>About Mike</h1>
  <p><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/mike.jpg" width="208" height="321" class="fright" style="margin: 0 0 20px 20px" />Mike Byster is one of the fastest mathematical minds 
in the world. But his real passion is in teaching kids to have the academic confidence that both sets them apart from the crowd, and sets them up for success in all parts of life for decades to come. </p>

<p>Featured on 20/20 for his ground breaking techniques 
to help kids master complex math concepts, Mike has traveled the country working with kids and painstakingly refining the Brainetics programs to make it the most fun, and the most effective it can be.</p>


             </div>
         </div>




     </div>

<%-- <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /> --%> 
<!--#include file="bottomcta.html"-->
<!--#include file="footer.html"-->
<!--#include file="popups.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
