<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.K2.UserControls.ShippingForm" CodeBehind="ShippingForm.ascx.cs" %>
<a name="tryitnow" id="tryitnow"></a>
<div class="cartB"><img src="//d1f7jvrzd4fora.cloudfront.net/images/k2/30_form_top.png" />
    <div class="form_line clearfix" style="padding-top: 16px; padding-bottom: 14px;">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
            <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            Email Address*</label>
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix" style="display: none">
        <div class="error-1">
            <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            Quantity*</label>
        <asp:DropDownList ID="ddlQuantityList" runat="server" CssClass="text-1">
            <asp:ListItem Value="select" Text="Select"></asp:ListItem>
            <asp:ListItem Value="1" Text="1"></asp:ListItem>
            <asp:ListItem Value="2" Text="2"></asp:ListItem>
            <asp:ListItem Value="3" Text="3"></asp:ListItem>
            <asp:ListItem Value="4" Text="4"></asp:ListItem>
            <asp:ListItem Value="5" Text="5"></asp:ListItem>
            <asp:ListItem Value="6" Text="6"></asp:ListItem>
        </asp:DropDownList>
    </div>
   
  
    <div class="form_line_btn" style="padding-bottom: 10px;">
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/a5/btn_ordernow.png" OnClick="imgBtn_OnClick" />
    </div>
    <div class="form_line_guarantee">
        <a href="#guarantee" onclick="javascript:void(0);" class="guarantee">30-Day Money-Back Guarantee!</a>
    </div>
    <div class="form_line_guarantee" id="link_amazonprime" style="padding-top: 12px;"><div class="bold" style="color: #ff6c02; padding-bottom: 6px;">Also available from</div><a href="http://www.amazon.com/NEW-Brainetics-Enhanced-Includes-Exclusive/dp/B00JVUF0GY/ref=sr_1_1?ie=UTF8&qid=1409084938&sr=8-1&keywords=brainetics" target="_blank"><img src="//d1f7jvrzd4fora.cloudfront.net/images/btn_amazonprime.png" alt="Buy on Amazon Prime" /></a></div>
        
    <div class="form_line_guarantee">
        <div class="norton_ssl_cart"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.brainetics.com&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script><br />
<a href="https://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a></div>
     </div>
</div>
