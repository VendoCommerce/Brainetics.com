<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="/styles/global.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
 <form runat="server" id="fm1">

 <uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" />

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
