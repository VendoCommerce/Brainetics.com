<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.H2.UserControls.BillingShippingCreditForm" CodeBehind="BillingShippingCreditForm.ascx.cs" %>
<%@ Register src="/H2/UserControls/ShoppingCartControl.ascx" tagname="ShoppingCartControl" tagprefix="uc1" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
  <div class="cart_left">
        <h2>Cart</h2>
    <uc1:ShoppingCartControl ID="ShoppingCartControl1" runat="server" />
    </div>

    <a name="tryitnow" id="tryitnow"></a>
        <div class="cartB" style="float: left; margin-top: 6px;"><img src="//d1f7jvrzd4fora.cloudfront.net/images/k2/form_top_cart.png" width="294" height="143" style="margin-bottom: 6px;" />        
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
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic"
                        ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                </div>
                <label class="label-1">
                    Last Name*</label>
                <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
            </div>
          
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic"
                        ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Billing Address*</label>
                <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="text-1 billingad1"></asp:TextBox>
                 
            </div>
              <div class="form_line clearfix">
              
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
                <asp:DropDownList ID="ddlState" runat="server" DataTextField="Abbreviation" CssClass="text-1"
                    size="1">
                </asp:DropDownList>
            </div>
                  <div class="form_line clearfix">
                <div class="error-1">
                    <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Country*</label>
                <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Name" DataValueField="COUNTRYID"
                    AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                    CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic"
                        ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Zip Code*</label>
                <asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                        ControlToValidate="txtPhoneNumber1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Phone*</label>
                <asp:TextBox ID="txtPhoneNumber1" runat="server" MaxLength="15" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                    <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Email Address*</label>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="text-1"></asp:TextBox>
            </div>
              <div class="form_line clearfix" style="padding-bottom: 0">
            <label class="label-1"></label>
            </div>
            <div class="form_line clearfix" style="padding: 10px 0 16px 0">
                      
                   <%-- <asp:RadioButtonList ID="rblShippingDifferent" runat="server" OnSelectedIndexChanged="rblShippingDifferent_CheckedChanged"
        CssClass="text-5" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="124">
        <asp:ListItem Value="true">Yes</asp:ListItem>
        <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
    </asp:RadioButtonList>--%>
     <asp:CheckBox ID="cbShippingSame" runat="server" CssClass="checkbox-left" OnCheckedChanged="cbShippingSame_CheckedChanged"
            AutoPostBack="true" Checked="true" /><label class="label-3">
                   Billing information is the same as the shipping information
</label>          
            </div>
               <asp:Panel ID="pnlShippingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                            ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblShippingFirstName" runat="server" Visible="false">
                        </asp:Label>
                    </div>
                    <label class="label-1">
                        First Name*</label>
                    <asp:TextBox ID="txtShippingFirstName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic" ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblShippingLastName" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Last Name*</label>
                    <asp:TextBox ID="txtShippingLastName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="Abbreviation" CssClass="text-1" size="1" AutoPostBack="true">
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
                  <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Credit Card*</label>
          
                <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-1">
                </asp:DropDownList>
            </div>
           
           
             <div class="form_line clearfix">
               <div class="error-1">
                <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Expiration Date*</label>
              
                <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-2" style="width: 70px; margin-right: 4px;">
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
                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-2" style="width: 70px; margin-right: 0;">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2018">2018</asp:ListItem>
                    <asp:ListItem Value="2019">2019</asp:ListItem>
                    <asp:ListItem Value="2020">2020</asp:ListItem>
                </asp:DropDownList>
            </div>
             <div class="form_line clearfix">
             <div class="error-1">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtCCNumber1" runat="server" Display="Dynamic" ErrorMessage="Please enter card number" />
                    </div>
                <label class="label-1">
                    Card Number*</label>
                     <asp:TextBox ID="txtCCNumber1" runat="server"  CssClass="text-1" MaxLength="16"></asp:TextBox>
               
            </div>
            <div class="form_line clearfix">
             <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Card Verification*
                </label>
               
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-2" MaxLength="4"></asp:TextBox>
            </div>
            
            <div class="form_line clearfix" style="padding: 10px 0"><input type="checkbox"  class="checkbox-left" />
                <label class="label-2">
                  I would like to get product updates and special offers</label>
            </div>
<%--            <div class="form_line clearfix" runat="server">
               <div class="error-2">                     
                    <asp:Label ID="lblAgreeError" runat="server" ></asp:Label></div>
            <asp:CheckBox ID="chkAgree" runat="server"  CssClass="checkbox-left" />            
                <label class="label-2">
                I agree to the <a href="#terms" class="terms">Terms and Conditions and Privacy Policy</a>.</label>
            </div>--%>
        
            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/a5/btn_ordernow.png" OnClick="imgBtn_OnClick" />
            </div>
           <div id="offerdet" style="display:block;"><p><strong>Offer Details:</strong>  As part of this special TV Offer you are getting to try Brainetics in the comfort of your home for a trial fee of $14.95 plus FREE shipping and handling. If you decide to keep the system, simply do nothing and beginning in 30 days following the date of your purchase you will be charged 4 easy monthly payments of $49.95, plus tax. All orders are backed by our 30-Day Money-Back Guarantee!</p></div>
           
            <div class="form_line_guarantee"><a href="#guarantee" class="guarantee">View 30-Day Guarantee</a></div>
            <div class="form_line_guarantee">
                <div class="norton_ssl_cart">
                    <script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.brainetics.com&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script>
                    <br />
                    <a href="http://www.symantec.com/ssl-certificates" target="_blank" style="color: #000000; text-decoration: none; font: bold 7px verdana,sans-serif; letter-spacing: .5px; text-align: center; margin: 0px; padding: 0px;">ABOUT SSL CERTIFICATES</a>
                </div>
            </div>

        </div>
<div class="clear"></div>
