<%@Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingCreditForm.ascx.cs" Inherits="CSWeb.A3.UserControls.ShippingCreditForm" %>
    <%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc" %>

    <asp:ScriptManager runat="server" ID="sm1">
    </asp:ScriptManager>

    <div class="cart_content_B clearfix">

    <div class="cart_left">
        <h2>Shopping Basket</h2>
        <div class="horizontal_dots">
        </div>
        
        <uc:ShoppingCartControl ID="ShoppingCartControl1" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"></uc:ShoppingCartControl>     
    </div>
     <div class="vertical_dots">
    </div>
<div class="cart_right">
<div class="cartB"> 
<h2>
                Billing Address</h2>
                <div class="form_line clearfix">
                <div class="error-2">
                    </div>
                <label class="label-2">
                    Billing information is same<br />
          as Shipping</label>
                <asp:CheckBox ID="cbBillingDifferent" runat="server" CssClass="checkbox-right" OnCheckedChanged="cbShippingDifferent_CheckedChanged"
                    AutoPostBack="true" Checked="true" />
            </div>                  
            
            <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                            ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
                        </asp:Label>
                    </div>
                    <label class="label-1">
                        First Name*</label>
                    <asp:TextBox ID="txtShippingFirstName" runat="server" MaxLength="60" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic" ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Last Name*</label>
                    <asp:TextBox ID="txtShippingLastName" runat="server" MaxLength="60" CssClass="text-1"></asp:TextBox>
                </div>                
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                            ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblShippingAddress1Error" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Shipping Address*</label>
                    <asp:TextBox ID="txtShippingAddress1" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    </div>
                    <label class="label-1">
                    </label>
                    <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                            ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblShippingCityError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        City*</label>
                    <asp:TextBox ID="txtShippingCity" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        State*</label>
                    <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="NAME" CssClass="text-1" size="1" OnSelectedIndexChanged="ShippingState_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                            ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Zip Code*</label>
                    <asp:TextBox ID="txtShippingZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
                </div>
            </asp:Panel>
            <div class="form_line clearfix">
                <label class="label-3">
                    Credit Card*</label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-2">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Exp Date*</label>
                <div class="error-2">
                <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-3">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
                    <asp:ListItem Value="1">01</asp:ListItem>
                    <asp:ListItem Value="2">02</asp:ListItem>
                    <asp:ListItem Value="3">03</asp:ListItem>
                    <asp:ListItem Value="4">04</asp:ListItem>
                    <asp:ListItem Value="5">05</asp:ListItem>
                    <asp:ListItem Value="6">06</asp:ListItem>
                    <asp:ListItem Value="7">07</asp:ListItem>
                    <asp:ListItem Value="8">08</asp:ListItem>
                    <asp:ListItem Value="9">09</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-3">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
                    <asp:ListItem Value="2012">2012</asp:ListItem>
                    <asp:ListItem Value="2013">2013</asp:ListItem>
                    <asp:ListItem Value="2014">2014</asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2018">2018</asp:ListItem>
                    <asp:ListItem Value="2019">2019</asp:ListItem>
                    <asp:ListItem Value="2020">2020</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Number*</label>
                <div class="error-2">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label></div>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td><asp:TextBox ID="txtCCNumber1" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtCCNumber1" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber2" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtCCNumber2" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber3" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCCNumber3" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber4" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtCCNumber4" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                    </tr>
                </table>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Verification #* <a class="cvv" href="#" style="display:none">what's this?</a>
                </label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <label class="label-2">
                    Send me new Product Updates
                    <br />
                    and Special Offers.</strong></label>
                <input type="checkbox" checked="checked" class="checkbox-right" />
            </div>
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/content/images/b2/try_it_now_btn.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
            <div class="form_line_guarantee" style="display:none"><a href="#">View 30-Day Guarantee</a></div>
           
        </div>
    <!-- end cartB -->
  
</div>
<!-- end checkout_right -->
</div>


    
