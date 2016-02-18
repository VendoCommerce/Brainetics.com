<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="CSWeb.O2.receipt" EnableSessionState="True" %>
<%@ Register Src="/o2/UserControls/CheckoutThankYouModule.ascx" TagName="Receipt" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>


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
<body id="receipt">
    <form id="form1" runat="server">

<!--#include file="header.html"-->
  <div class="container">
      <div class="page">
    
    <uc:Receipt runat="server" />

 </div>


</div>

<!--#include file="footer.html"-->

  <uc:TrackingPixels ID="TrackingPixels1" runat="server" />
    </form>


</body>
</html>
