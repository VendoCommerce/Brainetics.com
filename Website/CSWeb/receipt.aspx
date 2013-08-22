<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="CSWeb.receipt" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModule2.ascx" TagName="Receipt" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html><html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="robots" content="index,follow_all">
		<meta name="description" content="Now you can learn Brainetics from your computer, smartphone, or tablet.  Only available at www.brainetics.com">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
		
		<link rel="stylesheet" href="Styles/style.css">
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	

		<script src="Scripts/qzy1qcz.js"></script>
		<script>try{Typekit.load();}catch(e){}</script>
		
	</head>	<body class="thank">
    <form id="form1" runat="server">
  
    <uc:Receipt runat="server" />

    </form>

<uc:TrackingPixels runat="server" />

</body>
</html>
