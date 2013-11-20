<%@Control Language="C#" Inherits="CSWeb.B2.UserControls.CheckoutThankYouModule2" %>
<%@ Register Src="../UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="../UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
	<div id="header_bg">
    <uc:Header ID="Header" runat="server" />
  </div>
  <div id="main" class="receipt">
    
    <div class="page_receipt">
        <div class="printfriendly">
            <a href="receipt_friendly.aspx" target="_blank">
                <img src="../Content/Images/printer_icon.jpg" />Printer Friendly Version</a></div>
        <h2>
            Order Confirmation</h2>
        <div class="shoppingmain clearfix">
            <h4>
                THANK YOU!
            </h4>
            <p class="your_order_number">
                Your order number is
                <%=orderId.ToString()%>, and an email confirmation will be sent to <span class="receipt_email">
                    <%=LiteralEmail.Text%>.</span></p>
            
            <div class="receipt_row rowheader clearfix shaded2">
                <div class="receipt_row1">
                    Description</div>
                <div class="receipt_row2">
                    Quantity</div>
                <div class="receipt_row3">
                  Price per item  </div>
                <div class="receipt_row4">
                  S&H </div>
                <div class="receipt_row5">
                    Total</div>
            </div>
            <div class="receipt_row clearfix">
                <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <ItemTemplate>

                        <img src="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>" />

                        <div class="receipt_row1">
                            

                            <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                        </div>
                        <div class="receipt_row2">
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </div>
                        <div class="receipt_row3">
                           $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%> 
                        </div>
                        <div class="receipt_row4">
                            $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))), 2).ToString()%>
                        </div>
                        <div class="receipt_row5">
                           $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))) + Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                        </div>
                            <br clear="all" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
            </div>
            <div class="receipt_row clearfix shaded2">
                <div class="receipt_row_totaldescription">
                    Subtotal:<br />
                    <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                        Discount:<br />
                    </asp:Panel>
                    Shipping:<br />
                    <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        Rush S &amp; H:<br />
                    </asp:Panel>
                    Est. Tax:<br />
                    <span class="black">Total:</span></div>
                <div class="receipt_row_total">
                    $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                    </asp:Panel>
                    $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    </asp:Panel>
                    $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal></div>
            </div>
            <div class="receipt_divider">
            </div>
            <div class="billing_left">
                <h4 class="billinghead1">
                    billing address</h4>
                <p>
                    Name:
                    <asp:Literal ID="LiteralName_b" runat="server"></asp:Literal><br />
                    Address:
                    <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlBAddress2" CssClass="panel" runat="server">
                        <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                    </asp:Panel>
                   </p>
                   <p>
                    City:
                    <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                   
                    State:
                    <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                    
                    Zip/Postal Code:
                    <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                    
                    Country:
                    <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal><br />
                     Phone:
                    <asp:Literal ID="LiteralPhone" runat="server"></asp:Literal><br/>
                    Email:
                    <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></p>
            </div>
            <div class="billing_right">
                <h4 class="billinghead1">
                    SHIPPING ADDRESS</h4>
                <p>
                    Name:
                    <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                    Address:
                    <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlSAddress2" Font-Size="11px" CssClass="panel" runat="server">
                        <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                    </asp:Panel>
                    </p>
                    <p>
                    City:
                    <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                    State:
                    <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                    Zip/Postal Code:
                    <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                    Country:
                    <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></p>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</div><!--- /main --->
  <uc:Footer ID="Footer" runat="server" />
  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
