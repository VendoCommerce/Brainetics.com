<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostSale.aspx.cs" Inherits="CSWeb.Store.PostSale"
    EnableEventValidation="false" EnableSessionState="true" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<!doctype html><html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="robots" content="index,follow_all">
		<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
		
		<link rel="stylesheet" href="Styles/style.css">
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


		<script src="Scripts/qzy1qcz.js"></script>
		<script>try{Typekit.load();}catch(e){}</script>

	</head>
	
	<body class="upsell">
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>    
    <asp:Panel ID="pnlManual" runat="server">
    
        <!-- show the content with yes or no button to process logic -->

    </asp:Panel>

    <div runat="server" id="mainContainer">
    </div>
    <asp:Button ID="btnYes" runat="server" Text="Button" OnClick="btnYes_OnClick" Visible="false" />
    <asp:Button ID="btnNo" runat="server" Text="Button" OnClick="btnNo_OnClick" Visible="false" />
    
    
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
