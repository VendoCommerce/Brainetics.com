<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckoutSessionExpired.aspx.cs" Inherits="CSWeb.C2.CheckoutSessionExpired" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>

    Your session has expired. You will be redirected to the home page in <span id="counter"><%= SessionExpireRedirectSeconds.ToString() %></span> seconds. Click <a href="<%= LinkFromSessExpPage %>">here</a> to go now.

    <script type="text/javascript">

        function redirCountdown() {
            
            var c = parseInt($('#counter').html());
            c--;
            $('#counter').html(c);
            if (c <= 0) {
                window.location = '<%= LinkFromSessExpPage %>';
            }

            setTimeout(redirCountdown, 1000);
        }

        redirCountdown();

    </script>
    </div>

    <uc:TrackingPixels runat="server" />
    </form>
</body>
</html>
