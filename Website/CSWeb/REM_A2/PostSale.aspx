<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostSale.aspx.cs" Inherits="CSWeb.REM_A2.Store.PostSale"
    EnableEventValidation="false" EnableSessionState="true" %>
    <%@ Register Src="UserControls/header.ascx" TagName="Header_Cart" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script><link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>

<script src="/Scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global_A5.js"></script>
<link href="../Styles/global_e2.css" rel="stylesheet" type="text/css" />
<script>

$(document).ready(function () {
	  $('.slides').cycle({
                fx: 'fade',
                timeout: 3500,
                speed: 500,
                cleartypeNoBg: true
     });
	 
	   	jwplayer('demo1').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo1.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster1.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo2').stop();
   	jwplayer('demo3').stop();
	}}
  });


  	jwplayer('demo2').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo2.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster2.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo1').stop();
   	jwplayer('demo3').stop();
	}}
  });

 	jwplayer('demo3').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/cinchydemo5.mp4",
	autostart: false,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/upsell_cinchy_poster3.png",
    primary: "flash",   
	controls: true,
    width: 259, height: 146,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('demo2').stop();
   	jwplayer('demo1').stop();
	}}
  });
	 
     });	 
</script>
</head>
<body>
<!--#include file="popups.html"-->
    <form id="form1" runat="server">
    <div class="container_upsell">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>    
    <asp:Panel ID="pnlManual" runat="server">
    
        <!-- show the content with yes or no button to process logic -->

    </asp:Panel>

    <div runat="server" id="mainContainer">
    </div>
    <asp:Button ID="btnYes" runat="server" Text="Button" OnClick="btnYes_OnClick" Visible="false" />
    <asp:Button ID="btnNo" runat="server" Text="Button" OnClick="btnNo_OnClick" Visible="false" />
    
</div>

<!--#include file="footer_upsell.html"-->
    
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>
    <script type="text/javascript">
        function validateForm() {
            var container = $('#mainContainer');
            var isValid = true;
            $('*[required=true]', container).each(function (a) {
                if (this.id == "") {
                    this.id = "required_" + a;
                }
                var errorMessageControlID = this.id + "_error";

                if ($("#" + errorMessageControlID).size() == 0) {
                    var message = this.getAttribute('error');
                    if (message == null) {
                        message = "*";
                    }
                    //Create control to display error message
                    $(this).after($('<span style="display:none;" class="error" id="' + errorMessageControlID + '">' + message + "</span>"));
                }

                if (!(typeof this.value === 'undefined') && this.value == "") {
                    isValid = isValid && false;
                    $("#" + errorMessageControlID).fadeIn();
                }
                else {
                    $("#" + errorMessageControlID).fadeOut();
                }
            });

            if (typeof (customValidateForm) == 'function') {
                isValid = isValid && customValidateForm();
            }

            return isValid            
        }
    </script>
</body>
</html>
