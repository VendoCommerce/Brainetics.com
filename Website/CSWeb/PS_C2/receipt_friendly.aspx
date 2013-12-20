<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt_friendly.aspx.cs" Inherits="CSWeb.PS_C2.receipt_friendly" EnableEventValidation="true" %>
<%@ Register Src="UserControls/CheckoutThankYouModulePrint2.ascx" TagName="Receipt" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <uc:Receipt runat="server" />

    </div>
    </form>

    <uc:TrackingPixels runat="server" />
</body>
</html>
