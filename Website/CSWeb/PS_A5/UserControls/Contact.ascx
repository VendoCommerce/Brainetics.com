<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="CSWeb.PS_A5.UserControls.Contact" %>
<div id="contact_form" style="margin: 0;">
    <asp:Label ID="lblStatus" runat="server" />
    <asp:Panel ID="pnlSubmitSuccessMsg" runat="server" Visible="false">
        <div style="color: #449015; font-weight: bold;">
            Thank you!</div>
    </asp:Panel>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ValidationGroup="test" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
            </asp:Label>
        </span>
        <asp:TextBox ID="txtFirstName" runat="server" CausesValidation="false" MaxLength="14" CssClass="input_1 jq_watermark" title="FIRST NAME*" placeholder="FIRST NAME*"></asp:TextBox>
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ValidationGroup="test" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="input_1 jq_watermark" title="LAST NAME*" placeholder="LAST NAME*"></asp:TextBox>
    </div>
    <div class="clear" style="height: 17px;">
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ValidationGroup="test" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" ValidationGroup="test" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
            <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="input_1 jq_watermark" title="EMAIL ADDRESS*" placeholder="EMAIL ADDRESS*"></asp:TextBox>
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="test" runat="server" Display="Dynamic"
                ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ControlToValidate="txtEmailConfirm" ValidationGroup="test" ControlToCompare="txtEmail"
                ID="CompareValidator" ErrorMessage="*Email Address does not match" EnableClientScript="true"
                Display="Dynamic" Text="Email does not match"></asp:CompareValidator>
        </span>
        <asp:TextBox ID="txtEmailConfirm" runat="server" MaxLength="100" CssClass="input_1 jq_watermark" title="RETYPE EMAIL ADDRESS*" placeholder="RETYPE EMAIL ADDRESS*"></asp:TextBox>
    </div>
    <div class="clear" style="height: 17px;">
    </div>
        <div class="input_wrap">
        <span class="error-1">            
            <asp:Label ID="lblSchoolNameError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtSchoolName" runat="server" MaxLength="100" CssClass="input_1 jq_watermark" title="SCHOOL NAME" placeholder="SCHOOL NAME"></asp:TextBox>
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:Label ID="lblCityError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtCity" runat="server" MaxLength="100" CssClass="input_1 jq_watermark" title="CITY" placeholder="CITY"></asp:TextBox>
    </div>

    <div class="clear" style="height: 17px;">
    </div>

    <div class="input_wrap">
        <span class="error-1">            
            <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtState" runat="server" MaxLength="50" CssClass="input_1 jq_watermark" title="STATE" placeholder="STATE"></asp:TextBox>
    </div>

    <div class="input_wrap">
        <span class="error-1">            
            <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="20" CssClass="input_1 jq_watermark" title="PHONE NUMBER" placeholder="PHONE NUMBER"></asp:TextBox>
    </div>

    <div class="clear" style="height: 17px;">
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvSubject" ValidationGroup="test" runat="server" Display="Dynamic" ControlToValidate="txtSubject" ErrorMessage="Please enter a subject"></asp:RequiredFieldValidator>
            <asp:Label ID="lblSubject" runat="server" Visible="false"></asp:Label>
        </span>
        <asp:TextBox ID="txtSubject" runat="server" MaxLength="100" CssClass="input_1 jq_watermark" title="SUBJECT*" placeholder="SUBJECT*"></asp:TextBox>
    </div>
    <div class="clear" style="height: 17px;">
    </div>

    <span class="error-1">
        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" Display="Dynamic" ValidationGroup="test" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
    </span>
    <asp:TextBox ID="txtMessage" runat="server" MaxLength="2000" CssClass="textarea_2 jq_watermark"
        Rows="5" TextMode="MultiLine" title="MESSAGE*" placeholder="MESSAGE*"></asp:TextBox>
    <div class="clear" style="height: 17px;">
    </div>
    
    <p style="padding-left: 440px;">
        <asp:ImageButton ID="imgBtn" runat="server" ValidationGroup="test" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/btn_submit.png"
            OnClick="imgBtn_OnClick" /></p>

</div>
<!-- END testimonial_form, or in this case, a contact form -->
