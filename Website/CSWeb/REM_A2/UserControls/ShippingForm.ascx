<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.REM_A2.UserControls.ShippingForm" CodeBehind="ShippingForm.ascx.cs" %>
<a name="tryitnow" id="tryitnow"></a>
<div class="cartB"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/form_top.png" />
    <div class="form_line clearfix" style="padding-top: 10px">
        <div class="error-1">
            <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            Country*</label>
        <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID" 
            AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" CssClass="text-1">
        </asp:DropDownList><div class="clear"></div>
        <div class="helper" style="display: none">A $10 Shipping Fee Applies</div>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
            </asp:Label>
        </div>
        <label class="label-1">
            First Name*</label>
        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
        </div>
        <label class="label-1">
            Last Name*</label>
        <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
            <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            Address*</label>
        <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix" runat="server" visible="false">
        <div class="error-1">
        </div>
        <label class="label-1">
        	Address 2</label>
        <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
            <asp:Label ID="lblCityError" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            City*</label>
        <asp:TextBox ID="txtCity" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            State*</label>
        <asp:DropDownList ID="ddlState" runat="server" DataTextField="NAME" CssClass="text-1">
        </asp:DropDownList>
    </div>

    <div class="form_line clearfix">
        <div class="error-1">
            <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
            <asp:Label ID="lblZiPError" runat="server" ForeColor="Red" Visible="false"></asp:Label></div>
        <label class="label-1">
            ZIP Code*</label>
        <asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">            
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
            <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label></div>
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" EnableClientScript="true"
                Display="Dynamic" ValidationExpression="\d{3}-\d{3}-\d{4}" />
        <label class="label-1">
            Phone*</label>
        <asp:TextBox ID="txtPhone" runat="server" MaxLength="12" CssClass="text-1"></asp:TextBox>
    </div>
            <div class="error-1">            
            <span id="phoneeg" style="margin-left: 25px; color: #333;">Eg.xxx-xxx-xxxx</span>
        </div>
    <div class="form_line clearfix">
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
   
  
    <div class="form_line_btn">
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/a5/btn_ordernow.png" OnClick="imgBtn_OnClick" />
    </div>
  <div id="offerdet" style="display:block;"><p><strong>Offer Details:</strong> As part of this special TV Offer you are getting to try Brainetics in the comfort of your home for a trial fee of $14.95 plus FREE shipping and handling. If you decide to keep the system, simply do nothing and beginning in 30 days following the date of your purchase you will be charged 4 easy monthly payments of $49.95, plus tax. All orders are backed by our 60-Day Money-Back Guarantee! <span style="white-space: nowrap;">Money-Back Guarantee!</span></p></div>
    <div class="form_line_guarantee">
        <a href="#guarantee" onclick="javascript:void(0);" class="guarantee">60-Day Money-Back Guarantee!</a>
    </div>
        
    <div class="form_line_guarantee">
        <div class="norton_ssl_cart"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.brainetics.com&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script><br />
<a href="http://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a></div>
     </div>
</div>
