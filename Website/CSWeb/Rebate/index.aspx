<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CSWeb.Rebate.index"
         EnableEventValidation="false" EnableSessionState="true" %>
         <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>   
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>  
        <asp:Panel ID="pnlRebateForm" runat="server">
            <asp:RequiredFieldValidator runat="server" ID="rfBookStore" ControlToValidate="ddlBookStore" ValidationGroup="group1" Display="Dynamic" ErrorMessage="* This field is required"></asp:RequiredFieldValidator>
            <asp:DropDownList runat="server" ID="ddlBookStore">
                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Apple iBooks Store" Value="Apple iBooks Store"></asp:ListItem>
                <asp:ListItem Text="Barnes & Noble" Value="Barnes & Noble"></asp:ListItem>
                <asp:ListItem Text="Apple iBooks Store" Value="Apple iBooks Store"></asp:ListItem>
                <asp:ListItem Text="Google Play Store" Value="Google Play Store"></asp:ListItem>
                <asp:ListItem Text="Amazon.Com" Value="Amazon.Com"></asp:ListItem>
                <asp:ListItem Text="IndieBound" Value="IndieBound"></asp:ListItem>
            </asp:DropDownList>
            
            <br/>
             
            <asp:TextBox ID="textboxDate" runat="server" CssClass="text" MaxLength="10" Columns="12" autocomplete="off" Style="border: 1px solid #567890; width: 75px; float:left;" />
             <asp:Image runat="server" ID="calendericon" ToolTip="Calendar" ImageUrl="/Content/Images/admin/calendar.gif" />
            <ajaxToolkit:CalendarExtender ID="calendarExtenderDate" runat="server" TargetControlID="textboxDate"/>
           <asp:RequiredFieldValidator runat="server" ControlToValidate="textboxDate" ID="valRequired" ErrorMessage="* This field is required" ValidationGroup="group1" Display="Dynamic"/>
                                        
                                           <br/>
             
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtReceipt" ValidationGroup="group1" ErrorMessage="* This field is required" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" ID="txtReceipt"></asp:TextBox>
            
               <br/>
             
            <asp:ImageButton runat="server" ID="imgButton" OnClick="imgbtnOnClick" ValidationGroup="group1"/>

        </asp:Panel>
        <asp:Panel ID="pnlNotEligible" runat="server" Visible="False">
    
         <asp:Literal runat="server" ID="ltMessage" Text="You have passed the time limit of purchasing the book. Thanks You!"></asp:Literal>   

        </asp:Panel>
    </form>
     
</body>
</html>
