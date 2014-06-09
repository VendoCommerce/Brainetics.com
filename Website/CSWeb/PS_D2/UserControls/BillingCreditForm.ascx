<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingCreditForm.ascx.cs"
    Inherits="CSWeb.PS_D2.UserControls.BillingCreditForm" %>
<%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="LoaderOverlay" Src="LoaderOverlay.ascx" %>

<asp:ScriptManager ID="ScriptManager1" runat="server">

</asp:ScriptManager>       
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<uc:LoaderOverlay ID="LoaderOverlay1" runat="server" />

<!-- implement this expire soon code on all versions needed -->
<a href="#expiresoon" class="openexpiresoon"></a>
<div style="display: none">
<div id="expiresoon">
<iframe height="500" frameborder="0" width="620" scrolling="no" src="OfferChange.aspx"></iframe>
</div>
</div>
<!-- END implement this expire soon code on all versions needed -->
        
<div class="cart_content_B clearfix">
    <div class="cart_left">
        <h2>Cart</h2>

        
        <uc:ShoppingCartControl ID="ShoppingCartControl1" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"></uc:ShoppingCartControl>     
    </div>

    <div class="cart_right">
        
       
        <div class="cartB"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/cart_form_top.jpg" width="293" height="56" />
           
           <div class="form_line clearfix" style="width: 200px; padding: 10px 0 20px" runat="server" visible="false">

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
                Display="Dynamic" ValidationExpression="^[1-9]{1,1}[0-9]{0,1}$" ValidationGroup="QuantityUpdate" ErrorMessage="Please enter a valid quantity." /></div>
   <label class="label-1" style="width: 70px">Quantity: </label>
            <asp:TextBox ID="txtQuantity" runat="server" MaxLength="2" CssClass="text-4" />
                <asp:LinkButton ID="lbUpdate" runat="server" OnClick="lbUpdate_Click" CausesValidation="true" ValidationGroup="QuantityUpdate" 
                    CssClass="scored bold f12 fleft" Style="padding-top: 3px; margin-left: 5px;">Update</asp:LinkButton>
            
           </div>
            
           
           <div class="form_line text-center"><img src="//d1f7jvrzd4fora.cloudfront.net/images/a5/cards.jpg" width="246" height="41" /></div>
           
            <div class="form_line clearfix" style="padding: 10px 0">
         <asp:CheckBox ID="cbBillingDifferent" runat="server" CssClass="checkbox-left" OnCheckedChanged="cbBillingDifferent_CheckedChanged"
                    AutoPostBack="true" Checked="false" />
                <label class="label-2">
                  My billing address is different than shipping</label>
              
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
               
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-2" MaxLength="4"></asp:TextBox><a class="cvv" onclick="javascript:void(0);" href="//d1f7jvrzd4fora.cloudfront.net/images/a5/cvv.png">What's this?</a>
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
                    <asp:ListItem Value="" Text="">Month</asp:ListItem>
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
                    <asp:ListItem Value="" Text="">Year</asp:ListItem>                    
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
              <div class="form_line clearfix" style="padding: 10px 0"><input type="checkbox"  class="checkbox-left" />
                <label class="label-2">
                  I would like to get product updates and special offers</label>
            </div>
            <div class="form_line clearfix" style="padding: 10px 0" id="divTerms" runat="server">
               <div class="error-2">                     
                    <asp:Label ID="lblTermsError" runat="server" Visible="false"></asp:Label></div>
            <asp:CheckBox ID="cbTerms" runat="server"  CssClass="checkbox-left" />            
               <label class="label-2">
                I agree to the <a href="#terms" class="terms">Terms and Conditions and Privacy Policy</a>.</label>
            </div>
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/a5/btn_ordernow.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" OnClientClick="MM_showHideLayers('mask', '', 'show');" />
            </div>
            <div class="form_line_guarantee"><a href="#guarantee" onclick="javascript:void(0);" class="guarantee">30-Day Money-Back Guarantee!</a></div>
                     <div class="form_line_guarantee">
         <div class="norton_ssl_cart"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.brainetics.com&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script><br />
<a href="http://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a></div>
         </div>
        </div>
    <!-- end cartB -->
</div>
<!-- end cart_right -->
</div>
<!-- end cart_content -->
    
     </ContentTemplate>
</asp:UpdatePanel>