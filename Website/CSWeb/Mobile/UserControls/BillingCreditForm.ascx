<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingCreditForm.ascx.cs"
    Inherits="CSWeb.Mobile.UserControls.BillingCreditForm" %>
    <script type="text/javascript" src="/Scripts/autoTab.js"></script>
<script type="text/javascript">

    var pointerToMicrosoftValidator = ValidatorUpdateIsValid;
    ValidatorUpdateIsValid = function () {
        pointerToMicrosoftValidator();
        if (Page_IsValid) {

        } else {
            MM_showHideLayers('mask', '', 'hide');
        }
        // do something after Microsoft finishes 
    }
</script>
 <%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc" %>
<asp:ScriptManager runat="server" ID="smss1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upBillingForm" runat="server">
    <ContentTemplate>

    <!-- implement this expire soon code on all versions needed -->
<a href="#expiresoon" class="openexpiresoon"></a>
<div style="display: none">
<div id="expiresoon" style="width: 563px;
	height: 449px;
	background: #fff;
	padding: 30px;
	border: 9px solid #5375b6;">
<iframe height="470" frameborder="0" width="580" scrolling="no" src="OfferChange.aspx"></iframe>
</div>
</div>
<!-- END implement this expire soon code on all versions needed -->
  <img src="/Content/Images/mobile/cart2_top.png" alt="Brainetics&reg;" style="margin-bottom: 20px" />
   <uc:ShoppingCartControl ID="ShoppingCartControl1" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"></uc:ShoppingCartControl>     
   <img src="/Content/Images/mobile/paymentinfo.png" alt="Payment Information" style="margin-bottom: 20px" />
<div class="cart_mobile">

            <div class="form_line clearfix">
                <div class="error-2">
              </div>
                <asp:CheckBox ID="cbBillingDifferent" runat="server" CssClass="checkbox-left" OnCheckedChanged="cbBillingDifferent_CheckedChanged" AutoPostBack="true" Checked="false" />
              <label class="label-2" for="bcfBillingCreditInfo_cbBillingDifferent">
               My billing address is different than shipping.</label>
            
            </div>
          
            <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic"
                            ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
                        </asp:Label>
                    </div>
                  <asp:TextBox ID="txtFirstName" runat="server" MaxLength="14" CssClass="text-1" placeholder="First Name"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                    </div>
                 
                  <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="text-1" placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
                  
                  <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID" AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                      <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>
                  
                  <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="text-1" placeholder="Billing Address"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    
                  <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="text-1" placeholder="Billing Address 2"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic"
                            ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblCityError" runat="server" Visible="false"></asp:Label></div>
                  <asp:TextBox ID="txtCity" runat="server" MaxLength="30" CssClass="text-1" placeholder="City"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="Dynamic"
                        ControlToValidate="ddlState"></asp:RequiredFieldValidator>

                        <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label></div>
                  
                  <asp:DropDownList ID="ddlState" runat="server" DataTextField="NAME" CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                      <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label></div>     
                  <asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="text-1" placeholder="ZIP Code"></asp:TextBox>
                </div>
            </asp:Panel>
              
            <div class="form_line clearfix" style="padding-top: 20px;">
              
              <div class="form_ssl"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.brainetics.com&amp;size=S&amp;use_flash=NO&amp;use_transparent=YES&amp;lang=en"></script><br />
  <a href="http://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a>
  </div>
              
              <div class="form_cards"><img src="/Content/Images/mobile/cards.jpg" alt="Accepted Credit Cards" /></div>
            
            </div>
            <div class="form_line clearfix" runat="server" Visible="False" >
                <div class="error-2">
                   
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
              <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="RfvCCNumberError" ControlToValidate="txtCCNumber1" runat="server" Display="Dynamic" ErrorMessage="*" />
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label></div>
              <asp:TextBox ID="txtCCNumber1" runat="server" CssClass="text-1" MaxLength="16" placeholder="Credit Card Number"></asp:TextBox>
              
            </div>
            <div class="form_line clearfix">
                <div class="error-2">
                <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-3">
                </asp:DropDownList>
                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-3">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
             
               
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-4" MaxLength="4" placeholder="CVV"></asp:TextBox>    <a class="cvv" href="#cvv">What is this?</a>
            </div>
            <div class="form_line clearfix" runat="Server" visible="false">
              <asp:CheckBox CssClass="checkbox-left" Checked="false" id="chkboxOffers" runat="server" />
                <label class="label-2" for="specialoffers">
                    Yes, I’d like to receive news and savings from Brainetics&reg;!</label>
            </div>
            <div class="form_line clearfix" runat="server" Visible="false">
                <div class="error-2">
                    <asp:Label ID="lblAgreeError" runat="server" Visible="false" ForeColor="Red" placeholder="CheckBoxAgree"></asp:Label>
                     
                    </div>
                 <asp:CheckBox CssClass="checkbox-left" id="CheckBoxAgree" runat="server" />
              
              <label class="label-2" for="bcfBillingCreditInfo_CheckBoxAgree">
              I agree to the terms and conditions.</label>
              

            </div>
            <div class="form_line_btn" style="padding-bottom: 70px;">
                <div class="error-2">
                    <asp:Label ID="lblValidation" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                     
                    </div>
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/content/images/mobile/btn_ordernow_big.png" OnClick="imgBtn_OnClick" />
            </div>
          
      </div>
  


    
    </ContentTemplate>
</asp:UpdatePanel>


    
 