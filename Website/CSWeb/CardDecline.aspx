<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="UserControls/CardDecline.ascx" TagName="Form" TagPrefix="uc1" %>

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
<style>
.label-1 {float: left; width: 130px; padding: 3px 0 0 0;}
.label-2 {display: block; padding: 10px 0;}
.label-3 {display: block; padding: 2px 0;}
.check-section select {width: 200px;}
.check-section input[type="text"] {margin-right: 4px; width: 50%;}
#ucCardDecline_rblUpdateShippingAddress input, 
#ucCardDecline_rblUpdateBillingAddress input {margin-left: 10px;}
.form_line {padding-bottom: 6px;}
</style>
	</head>
	
	<body class="checkout">
		
		<div class="all-wr">
			
			<div class="header-wr">
			
				<header class="header clearfix">
					
					<a href="index.aspx" class="logo"><img src="content/images/logo.png" alt="Brainetics"></a>
					
				</header>
				
			</div>
			
			<div class="checkout-form">
              <form id="form1" runat="server">
              <div>
                  <uc1:Form id="ucCardDecline" runat="server" />
          
              </div>
              </form>
    
            </div>
                    
                
                
        </div>
</body>
</html>
