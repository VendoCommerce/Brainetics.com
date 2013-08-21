<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.A1.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="UserControls/CardDecline.ascx" TagName="Form" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
    <title></title>
    <link href="/styles/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Form id="ucCardDecline" runat="server" />

    </div>
    </form>
</body>
</html>
