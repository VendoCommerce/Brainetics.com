﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="CSWeb.order" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/BillingShippingCreditForm.ascx" TagName="BillingShippingCreditForm"
    TagPrefix="uc" %>

<!doctype html>

<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="robots" content="index,follow_all">
		<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Brainetics&reg; by Mike Byster-Award Winning-Guaranteed!</title>
		
		<link rel="stylesheet" href="Styles/style.css">
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		
			<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>



<script src="Scripts/main.js"></script>
		<script src="scripts/qzy1qcz.js"></script>
		<script>		    try { Typekit.load(); } catch (e) { }</script>

	</head>
	
	<body class="checkout">
		
		<div class="all-wr">
			
			<div class="header-wr">
			
				<header class="header clearfix">
					
					<a href="index.aspx" class="logo"><img src="content/images/logo.png" alt="Brainetics"></a>
					
				</header>
				
			</div>
			
			<div class="checkout-form">
				
				<form id="checkoutForm" runat="server">

                <uc:BillingShippingCreditForm id="ucBillingShippingCreditForm" runat="server" />
				
				<div class="check-section other-form">
					
					<div class="send-form">
						

						
					</div>
					
				</div>
				
				<div class="check-section complite">
					
				</div>
				
				
				</form>

			</div>
			
		
        
        </div>

		<uc:TrackingPixels runat="server" />

	</body>
	
</html>