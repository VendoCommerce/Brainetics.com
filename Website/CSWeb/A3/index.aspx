<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.A3.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="/styles/global.css" rel="stylesheet" type="text/css" />

</head>
 
<body>
 <form runat="server" id="fm1">

<asp:LinkButton ID="lbOrderNow" runat="server" OnClick="lbOrderNow_Click">Order now</asp:LinkButton>
 

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
