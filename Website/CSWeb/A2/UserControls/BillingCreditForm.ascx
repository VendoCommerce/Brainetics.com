<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingCreditForm.ascx.cs"
    Inherits="CSWeb.A2.UserControls.BillingCreditForm" %>
<%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc" %>
        
<div class="cart_content_B clearfix">
    <div class="cart_left">
        <h2>Cart</h2>

        
        <uc:ShoppingCartControl ID="ShoppingCartControl1" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"></uc:ShoppingCartControl>     
    </div>

    <div class="cart_right">
        
       
        <div class="cartB"><img src="/Content/images/a2/cart_form_top.jpg" width="293" height="56" />
           
           <div class="form_line clearfix" style="width: 200px; padding: 10px 0 20px">
<div class="cart_callout"><img src="../Content/Images/cart_callout.png" width="186" height="115" /></div>
<div class="radiooo" style="padding-bottom: 14px">
<asp:RadioButton ID="rbEnhancedPackage" runat="server" GroupName="PackageOption" AutoPostBack="true" OnCheckedChanged="Package_CheckedChanged"/> 
<label><span class="black bold">Enhanced Package</span></label>
</div>

<div class="radiooo">
<asp:RadioButton ID="rbAcceleratedPackage" runat="server" GroupName="PackageOption" AutoPostBack="true" OnCheckedChanged="Package_CheckedChanged" />
<label><span class="black bold">Accelerated Package</span></label>
</div>
</div> 

   <div class="form_line clearfix" style="padding: 0 0 10px 0;">
      <div class="error-1"> <asp:RegularExpressionValidator ID="revQuantity" runat="server" ControlToValidate="txtQuantity"
                Display="Dynamic" ValidationExpression="^[1-999]$" ValidationGroup="QuantityUpdate" ErrorMessage="Please enter a valid quantity." /></div>
   <label class="label-1" style="width: 70px">Quantity: </label>
            <asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" CssClass="text-4" />
                <asp:LinkButton ID="lbUpdate" runat="server" OnClick="lbUpdate_Click" CausesValidation="true" ValidationGroup="QuantityUpdate" CssClass="scored bold f12 fleft" Style="padding-top: 3px; margin-left: 5px;">Update</asp:LinkButton>
            
           </div>
            
           
           <div class="form_line text-center"><img src="/Content/images/a2/cards.jpg" width="246" height="41" /></div>
           
            <div class="form_line clearfix" style="padding: 10px 0">
         <asp:CheckBox ID="cbBillingDifferent" runat="server" CssClass="checkbox-left" OnCheckedChanged="cbBillingDifferent_CheckedChanged"
                    AutoPostBack="true" Checked="true" />
                <label class="label-2">
                   My billing address is the same as shipping</label>
              
            </div>
            <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic"
                            ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
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
                        <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic"
                            ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Billing Address*</label>
                    <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    </div>
                    <label class="label-1">
                    </label>
                    <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic"
                            ControlToValidate="txtCity"></asp:RequiredFieldValidator>
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
                    <asp:DropDownList ID="ddlState" runat="server" DataTextField="NAME" CssClass="text-1" size="1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic"
                            ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        ZIP Code*</label>
                    <asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
                </div>
            </asp:Panel>
            <div class="form_line clearfix">
                <label class="label-1">
                    Credit Card Type</label>
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-1">
                </asp:DropDownList>
            </div>
            
            <div class="form_line clearfix">   <div class="error-1">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtCCNumber" runat="server" Display="Dynamic" ErrorMessage="*" />
                    
                    </div>
                <label class="label-1">
                    Card Number</label>
             
               <asp:TextBox ID="txtCCNumber" runat="server" MaxLength="16" CssClass="text-1"></asp:TextBox></td>          
            </div>
            <div class="form_line clearfix">
             <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Card Verification 
                </label>
               
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-2" MaxLength="4"></asp:TextBox><a class="cvv" href="/content/images/a2/cvv.png">What's this?</a>
            </div>
            <div class="form_line clearfix"> <div class="error-1">
                <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Expiration Date</label>
               
                <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-2">
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
                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-2">
                    <asp:ListItem Value="" Text=""></asp:ListItem>                    
                    <asp:ListItem Value="2013">2013</asp:ListItem>
                    <asp:ListItem Value="2014">2014</asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2018">2018</asp:ListItem>
                    <asp:ListItem Value="2019">2019</asp:ListItem>
                    <asp:ListItem Value="2020">2020</asp:ListItem>
                    <asp:ListItem Value="2021">2021</asp:ListItem>
                </asp:DropDownList>
            </div>
              <div class="form_line clearfix" style="padding: 10px 0"><input type="checkbox" checked="checked" class="checkbox-left" />
                <label class="label-2">
                  I would like to get product updates and special offers</label>
            </div>
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/content/images/a2/complete_btn.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
            <div class="form_line_guarantee"><a href="#guarantee" class="guarantee">30-Day Money-Back Guarantee!</a></div>
                     <div class="form_line_guarantee">
         <img src="/Content/images/a2/truste.png" />&nbsp;&nbsp;<img src="" alt="norton">
         </div>
        </div>
    <!-- end cartB -->
</div>
<!-- end cart_right -->
</div>
<!-- end cart_content -->
    