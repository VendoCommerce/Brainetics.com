<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="send_email.aspx.cs" Inherits="CSWeb.A4.send_email" EnableSessionState="True" %>
<%@ Register Src="UserControls/Contact.ascx" TagName="Contact" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<link href="../Styles/global_a2.css" rel="stylesheet" type="text/css" />
</head>
<body style="background: none;">
<form id="form1" runat="server">
<div id="write_to_mike">
        <uc:Contact runat="server" />
</div>
</form>

    <uc:TrackingPixels ID="TrackingPixels" runat="server" />
</body>
</html>
