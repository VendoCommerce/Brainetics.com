<%@Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorizeOrder.aspx.cs" Inherits="CSWeb.Mobile_D2.Store.AuthorizeOrder" EnableEventValidation="false" EnableSessionState="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>   
    <script type="text/javascript" src="/scripts/NoBack.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="pnlManual" runat="server">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" /><br />
        Please wait while we authorize your order. Please do not hit back or refresh. Thanks You!

    </asp:Panel>
    </form>
     
</body>
</html>
