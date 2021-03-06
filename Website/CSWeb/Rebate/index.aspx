﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CSWeb.Rebate.index"
         EnableEventValidation="false" EnableSessionState="true" %>
         <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server"><link rel="stylesheet" type="text/css" href="/Styles/rebatestyles.css"/>
    <title></title>   
</head>
<body class="rebatepage">
    <form id="form1" runat="server">
    <div class="container">
       <div class="landingrebateform">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>  
        <asp:Panel ID="pnlRebateForm" runat="server">
       <div class="formline clearfix">
<div class="error">
            <asp:RequiredFieldValidator runat="server" ID="rfBookStore" ControlToValidate="ddlBookStore" ValidationGroup="group1" Display="Dynamic" ErrorMessage="* This field is required"></asp:RequiredFieldValidator>
</div>
<label>Where did you purchase
<br />The Power of Forgetting:</label>
  <asp:DropDownList runat="server" ID="ddlBookStore" CssClass="text1">
                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Apple iBooks Store" Value="Apple iBooks Store"></asp:ListItem>
                <asp:ListItem Text="Barnes & Noble" Value="Barnes & Noble"></asp:ListItem>
                <asp:ListItem Text="Apple iBooks Store" Value="Apple iBooks Store"></asp:ListItem>
                <asp:ListItem Text="Google Play Store" Value="Google Play Store"></asp:ListItem>
                <asp:ListItem Text="Amazon.Com" Value="Amazon.Com"></asp:ListItem>
                <asp:ListItem Text="IndieBound" Value="IndieBound"></asp:ListItem>
            </asp:DropDownList>
   </div>         
    
<div class="formline clearfix">
<div class="error">       
            <asp:RequiredFieldValidator runat="server" ControlToValidate="textboxDate" ID="valRequired" ErrorMessage="* This field is required" ValidationGroup="group1" Display="Dynamic"/>
            
                </div>       
       <label>Date:</label>                 
            <asp:TextBox ID="textboxDate" runat="server" MaxLength="10" Columns="12" autocomplete="off" CssClass="text1" />

             <asp:Image runat="server" ID="calendericon" ToolTip="Calendar" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/admin/calendar.gif" />
            <ajaxToolkit:CalendarExtender ID="calendarExtenderDate" runat="server" TargetControlID="textboxDate"/>
                     
           </div>         
    
<div class="formline clearfix">    <div class="error">  
           <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtReceipt" ValidationGroup="group1" ErrorMessage="* This field is required" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>     <label>Receipt Number:</label>              
            <asp:TextBox runat="server" ID="txtReceipt" CssClass="text1"></asp:TextBox>
                               
           </div>            
   
     <div class="formline" style="text-align:right;">        
            <asp:ImageButton runat="server" ID="imgButton" OnClick="imgbtnOnClick" ValidationGroup="group1" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/d2/submit_rebate_btn.jpg" CssClass="submitrebatebtn" />
</div>
        </asp:Panel>
        <asp:Panel ID="pnlNotEligible" runat="server" Visible="False">
    <div class="message">
         <asp:Literal runat="server" ID="ltMessage" Text="You have passed the time limit of purchasing the book. <br>Thank You!"></asp:Literal>   
</div>
        </asp:Panel>   </div>
        </div>
        <div class="footer">© <script>document.write(new Date().getFullYear())</script> Brainetics, All Rights Reserved.</div>
    </form>
     
</body>
</html>
