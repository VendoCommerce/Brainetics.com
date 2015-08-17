<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile_B2.UserControls.ShippingForm" CodeBehind="ShippingForm.ascx.cs" %>

<style>
.displayNone
{
display: none;
}
</style> 

<!-- ***************jquery popup stuff*************** -->
<a href="#openPaypal" class="openPaypal displayNone">Open Paypal</a>
<div class="displayNone">
    <div class="modalPopup" id="openPaypal">
        <!-- <a href="javascript:void(0)" onclick="$.fancybox.close();" class="paypalclosebtn">x close</a>-->
        <asp:LinkButton ID="LinkButton1" CssClass="paypalclosebtn" runat="server" CausesValidation="false" OnClick="btnCancelModalPopup_Click">x close</asp:LinkButton>
        <div class="modal_contain">
            <p><img src="//d39hwjxo88pg52.cloudfront.net/images/paypal_logo.jpg"> </p>
            <p>PayPal orders will be automatically converted to one payment of $164.80. Please click the button below to convert your order to One Payment.</p>
            <p>
                <asp:LinkButton ID="LinkButton2" Text="" runat="server" CausesValidation="false"
                    OnClick="ImageButtonOnePay_Click" CssClass="paypal_yesbtn">YES, PLEASE CONVERT MY <br> ORDER TO ONE PAYMENT!</asp:LinkButton>
            </p>
            <p>
                <strong>
                    <asp:LinkButton ID="btnCancelModalPopup" CssClass="paypal_no" runat="server" CausesValidation="false" OnClick="btnCancelModalPopup_Click">
                        No Thanks, I will select a different <br>payment method.</asp:LinkButton>
                </strong>
            </p>
        </div>
    </div>
</div>
<!-- *************** /jquery popup stuff*************** -->
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:LinkButton ID="btn" runat="server" Style="visibility: hidden;" />
<ajaxtoolkit:ModalPopupExtender runat="server" ID="mpePopup" TargetControlID="btn" BehaviorID="mpePopUpID"
    PopupControlID="PanelConvert" PopupDragHandleControlID="pnlModalPopUpPanel" BackgroundCssClass="modalBackground" />

<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upBillingForm" runat="server">
    <ContentTemplate>
        <%--<img src="<%= GetDynamicVersionData("cartimage")%>" alt="Brainetics&reg;" />--%>
        
        <div class="cart_mobile">
           <asp:Panel ID="pnlCartCheckoutSummary" runat="server" >
              <div class="form_line clearfix text-center" runat="server" style="padding-top: 3em;">
                    <div class="cart_totals clearfix">
                        <div class="cart_totals_left">
                            Subtotal<br />
                            Shipping & Handling<br />                 
                            Total
                        </div>
                        <div class="cart_totals_right">
                            $14.95<br />
                            $0.00<br />                
                            $14.95                 
                        </div>
                    </div>
               </div>
               <div class="form_line clearfix text-center" runat="server" style="padding-top: 3em;">
                   <p style="text-align: left; padding-left: 0;">To check out with your PayPal account, please click on the button below:</p>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/mobile_b2/paypal_checkout.png" OnClick="imgBtn_OnClickPayPal" CausesValidation="false" />                                      
                   <p class="pad0" style="text-align: left; padding-top: 1em; padding-left: 0;">Or, if you'd like to check out using your Credit Card, please fill out the form below:</p>
                   <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/mobile/btn_continue.png" OnClick="imgBtn_OnClickCreditCard" CausesValidation="false" />
               </div>
           </asp:Panel>
            <asp:Panel ID="pnlCreditCardCheckout" runat="server" Visible="false">
            <div class="form_line clearfix" runat="server">
                <div class="error-1">
                    <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID" AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged" CssClass="text-1">
                </asp:DropDownList>
            </div>
          <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic" ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingFirstNameError" runat="server" Visible="false">
                    </asp:Label>
                </div>
                <asp:TextBox ID="txtShippingFirstName" runat="server" MaxLength="14" CssClass="text-1" placeholder="First Name"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic"  ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingLastNameError" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:TextBox ID="txtShippingLastName" runat="server" MaxLength="14" CssClass="text-1" placeholder="Last Name"></asp:TextBox>
            </div>
             <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                                    Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                    <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>

                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="text-1" placeholder="Email Address"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                                                ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingAddress1Error" runat="server" Visible="false"></asp:Label></div>
                
                <asp:TextBox ID="txtShippingAddress1" runat="server" MaxLength="30" CssClass="text-1" placeholder="Shipping Address"></asp:TextBox>
                
                <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1" placeholder="Shipping Address 2" Visible="false"></asp:TextBox>
    
            </div>
     
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                                                ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingCityError" runat="server" Visible="false"></asp:Label></div>
                
                <asp:TextBox ID="txtShippingCity" runat="server" MaxLength="30" CssClass="text-1" placeholder="City"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                     <asp:RequiredFieldValidator ID="rfvShippingState" runat="server" Display="Dynamic"
                                                    ControlToValidate="ddlShippingState"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label>
                </div>
               
                <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="NAME" CssClass="text-1" >
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                                                ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label></div>

                <asp:TextBox ID="txtShippingZipCode" runat="server" MaxLength="7" CssClass="text-1" placeholder="ZIP Code"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                                                ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingPhoneNumberError" runat="server" Visible="false"></asp:Label></div>
             <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhoneNumber" EnableClientScript="true"
                Display="Dynamic" ValidationExpression="\d{3}-\d{3}-\d{4}" Enabled="False" />
               
                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" CssClass="text-1" placeholder="Phone"></asp:TextBox> 
            </div>
                     <div class="error-1">            
            <span id="phoneeg" style="margin-left: 25px; color: #333; display: none;">Eg.xxx-xxx-xxxx</span>
        </div>
 
            <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Quantity*</label>
                    <asp:DropDownList ID="ddlQuantityList" runat="server" CssClass="text-1" placeholder="">
                        <asp:ListItem Value="select" Text="Select"></asp:ListItem>
                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </asp:Panel>
      
            <div class="form_line_btn">
                 <div class="error-2">
                    <asp:Label ID="lblValidation" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                   
                     
                    </div>
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/mobile/btn_continue.png" OnClick="imgBtn_OnClick" />
               
            </div>
 
            </asp:Panel>
        </div>
        
        
</ContentTemplate>
</asp:UpdatePanel>