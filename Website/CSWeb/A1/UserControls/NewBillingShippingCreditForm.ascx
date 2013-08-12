<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.A1.UserControls.NewBillingShippingCreditForm" CodeBehind="NewBillingShippingCreditForm.ascx.cs" %>

      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>

<%--      <script type="text/javascript">

          function validateForm() {

              alert($("select").serialize());

              var success = 0;
              $.ajax({
                  type: "POST",
                  url: "/A1/order.aspx/validateInputAjax",
                  data: "{data:'" + $("select").serialize() + "'}",
                  contentType: "application/json; charset=utf-8",
                  dataType: "text",
                  async: false,
                  success: function (msg) {                      
                      success = msg;
                  }
              });
              
              if (success = "1")
                return true;
             else
                 return false;
                
          }
        
</script>--%>

    <div class="check-section clearfix">
					
					<div class="right">
						
						<h3 class="check-section-title">Credit Card Information</h3>
						
						<div class="line">					
                            <div class="error-1">
                        <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
                           <asp:RequiredFieldValidator ID="rfvCreditCard" ControlToValidate="txtCCNumber" runat="server" Display="Dynamic" ErrorMessage="Please enter card number" />                           
                        </div>		
                            <asp:TextBox ID="txtCCNumber" runat="server" CssClass="defaultText" MaxLength="16"></asp:TextBox>
						</div>
						
						<div class="line">
                        <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
							<asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-2">
                            </asp:DropDownList>
						</div>
						
						<div class="line multi-line clearfix">
						<asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>

							<div class="line-part">
								<asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-3">
                                    <asp:ListItem Value="" Text="Month"></asp:ListItem>
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
							</div>
							
							<div class="line-part">
                                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-3">
                                    <asp:ListItem Value="" Text="Year"></asp:ListItem>
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
							
						</div>
						
						<div class="line multi-line clearfix">
						
							<div class="line-part">
                            <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
								<asp:TextBox ID="txtCvv" runat="server" CssClass="defaultText" MaxLength="4"></asp:TextBox>
							</div>
							
							<div class="line-part">	
								<p>Visa &amp; Mastercard: 3 digit code on back <br>American Express: 4 digit code on front</p>
							</div>
							
						</div>
						
						<div class="line">
							<img src="content/images/card.jpg" alt="">
						</div>

					<div class="spinner-for-order-btn" style="display: none">
						<img src="content/images/loading-gif-animation.gif"> <span>Processing. Please wait.</span>
					</div>
						
					
					<div class="left">
						
						<div class="billing-info">
							
							<h3 class="check-section-title">Billing Information</h3>
							
                            <div class="line">
                                <div class="error-1">
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic"
                                        ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>                                    
                                    <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
                                    </asp:Label>
                                </div>
                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="14" CssClass="defaultText" placeholder="First Name"></asp:TextBox>
							</div>
							
							<div class="line">				
                                <div class="error-1">
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic"
                                        ControlToValidate="txtLastName"></asp:RequiredFieldValidator>                                        
                                    <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                                </div>				
                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="defaultText" placeholder="Last Name"></asp:TextBox>
							</div>
							
							<div class="line">			
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic"
                                    ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>                                    
                                <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>					
                                <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="defaultText" placeholder="Address"></asp:TextBox>
							</div>
							
							<div class="line">								
                                <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="defaultText"></asp:TextBox>
							</div>
							
							<div class="line">
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic"
                                    ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>                                    
                                <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label></div>
								<asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="defaultText" placeholder="Zip / Postal"></asp:TextBox>
							</div>
							
							<div class="line">			
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic"
                                    ControlToValidate="txtCity"></asp:RequiredFieldValidator>                                    
                                <asp:Label ID="lblCityError" runat="server" Visible="false"></asp:Label></div>					
                                <asp:TextBox ID="txtCity" runat="server" MaxLength="30" CssClass="defaultText" placeholder="City"></asp:TextBox>
							</div>
							
							<div class="line">
                            <div class="error-1">
                                <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlState" runat="server" DataTextField="Abbreviation" CssClass="text-1"
                                    size="1">
                                </asp:DropDownList>
							</div>
							
							<div class="line">
                            <div class="error-1">
                                <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Name" DataValueField="COUNTRYID"
                                    AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                                    CssClass="text-1">
                                </asp:DropDownList>
							</div>

							<div class="line">			
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                                <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>				
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="defaultText" placeholder="Email Address"></asp:TextBox>
							</div>

							<div class="line">			
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                                    ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>                                
                                <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label></div>					
                                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" CssClass="defaultText" placeholder="Phone Number"></asp:TextBox>
							</div>
							
						</div>
						
						<div class="checkbox">
							<input type="checkbox" style="display:none">

                            <input id="chkShippingDifferent" name="chkShippingDifferent" type="checkbox" class="shippingdifferent" value="1">

							<p>Check if your shipping address is different <br>from your billing address</p>
						</div>
						
						<div class="shipping-info" id="slide" style="display: none">
							
							<h3 class="check-section-title">Shipping Information</h3>
							
							<div class="line">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingFirstName" runat="server" Visible="false">
                                </asp:Label>
                            </div>
                                <asp:TextBox ID="txtShippingFirstName" runat="server" MaxLength="14" CssClass="defaultText" placeholder="First Name"></asp:TextBox>
							</div>
							
							<div class="line">				
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic" ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingLastName" runat="server" Visible="false"></asp:Label>
                            </div>				
                                <asp:TextBox ID="txtShippingLastName" runat="server" MaxLength="14" CssClass="defaultText" placeholder="Last Name"></asp:TextBox>
							</div>
							
							<div class="line">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingAddress1Error" runat="server" Visible="false"></asp:Label></div>
								<asp:TextBox ID="txtShippingAddress1" runat="server" MaxLength="30" CssClass="defaultText" placeholder="Address"></asp:TextBox>
							</div>
							
							<div class="line">								
                                <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="defaultText" placeholder="Address 2"></asp:TextBox>
							</div>
							
							<div class="line">				
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label></div>				
                                <asp:TextBox ID="txtShippingZipCode" runat="server" MaxLength="7" CssClass="defaultText" placeholder="Zip / Postal"></asp:TextBox>
							</div>
							
							<div class="line">
                                <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingCityError" runat="server" Visible="false"></asp:Label></div>
								<asp:TextBox ID="txtShippingCity" runat="server" MaxLength="30" CssClass="defaultText" placeholder="City"></asp:TextBox>
							</div>
							
							<div class="line">
                            <div class="error-1">
                            <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="Abbreviation" CssClass="text-1" size="1" AutoPostBack="true">
                                </asp:DropDownList>
							</div>
							
							<div class="line">
								<asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                                    AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                                    CssClass="text-1">
                                </asp:DropDownList>
							</div>
							<div class="line" style="display:none">
								<input type="text">
							</div>

							<div class="line" style="display:none">
								<input type="text">
							</div>
							
						</div>
						
						<div class="checkbox">							
                            <asp:CheckBox ID="chkMailingListOptIn" runat="server" />
							<p>Add me to your mailing list! <br>(We will not share with anyone)</p>
						</div>
						
					</div>

					<div class="wrap-order">

						<div class="order">
							<span id="offer_accelerated"><p id="offer-details"><span><b>Yes! Send me:</b> Get the Brainetics Accelerated Package for just $14.95 Trial + $14.95 S&amp;H (then 5 easy payments of $59.90 totaling $299.50.) Or select a single payment option after checkout.</span></p></span>
                            
                            <span id="offer_enhanced" style="display: none"><p id="offer-details"><span><b>Yes! Send me:</b>
Get the Brainetics Enhanced Package for just $14.95 Trial + $14.95 S&H (then 5 easy payments of $39.95 totaling $199.75.) Or select a single payment option after checkout.</span></p></span>
                            
                            
                            </div>
                            
                            


						<div class="compline-btn order-btn-for-spinner">
							<%--<a href="upsell_enhanced1pay.aspx" class="CheckoutSubmit"></a>--%>
                            <asp:LinkButton ID="imgBtnSubmit" runat="server" OnClick="imgBtn_OnClick" CausesValidation="true">COMPLETE ORDER!</asp:LinkButton>
						</div>

						<div class="thawte">
							<script type="text/javascript" src="https://seal.thawte.com/getthawteseal?host_name=m2.mojocheckout.com&amp;size=S&amp;lang=en"></script>
						</div>

					</div>
					
		</div>