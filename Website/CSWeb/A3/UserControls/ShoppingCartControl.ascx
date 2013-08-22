﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs" Inherits="CSWeb.A3.UserControls.ShoppingCartControl" %>


<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound"
    OnItemCommand="rptShoppingCart_OnItemCommand">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
    <div class="cart_table clearfix bold">
    <div class="cart_image">Item</div>
    <div class="cart_text">&nbsp;</div>
    <div class="cart_select">Qty</div>
    <div class="product_price">Price</div>
    <div class="clear"></div>
    <div class="horizontal_dots"></div>
    </div>
        <div class="cart_table clearfix">
        
            <div class="cart_image">
                <asp:Image runat="server" ID="imgProduct" />
            </div>
            <div class="cart_text">
                <p class="basket_title">
                    <asp:Label runat="server" ID="lblSkuCode"></asp:Label></p>
                <p class="basket_description">
                    <asp:Label runat="server" ID='lblSkuDescription'></asp:Label></p>
            </div>
            <div class="cart_select">
           
                <asp:TextBox runat="server" ID="txtQuantity" Text='1' MaxLength="3"
                    Columns="2" OnTextChanged="OnTextChanged_Changed"></asp:TextBox>
                <asp:Label runat="server" ID="lblQuantity" CssClass="cart_select">
                </asp:Label>
              </div>
            <div class="product_price">
                <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>
                <td runat="server" width="1%" id='holderRemove' visible="false">
                    <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                        Visible="" CssClass="ucRemoveButtonOverlay" ImageUrl="../Content/images/delete.gif" />
                </td>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Panel ID="pnlTotal" runat="server">
    <asp:PlaceHolder runat="server" ID="holderTaxAndShipping">
        <div class="horizontal_dots">
        </div>
        <div class="cart_totals clearfix">
            <div class="cart_totals_left">
                Subtotal:<br />
                Shipping & Handling:<br />
                Tax:
                <br />
                Total:</div>
            <div class="cart_totals_right">
                <asp:Literal runat="server" ID='lblSubtotal'></asp:Literal><br />
                <asp:Literal runat="server" ID="lblShipping"></asp:Literal><br />
                <asp:Literal runat="server" ID="lblTax"></asp:Literal>
                <br />
                <asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal>
                <asp:Literal runat="server" ID="lblRushShipping" Visible="false"></asp:Literal>
                <table>
                    <tr id='holderRushShippingTotal' runat="server">
                        <td class='cartSubtotalTitle' align="right" colspan="3">
                            Rush Shipping:
                        </td>
                        <td class='cartSubtotalValue' align="center">
                        </td>
                    </tr>
                    <tr id='holderRushShipping' runat="server" visible="false">
                        <td colspan="4" class="rushShipping">
                            <asp:CheckBox runat="server" ID="chkIncludeRushShipping" OnCheckedChanged="chkIncludeRushShipping_OnCheckedChanged"
                                AutoPostBack="true" Text="Rush Shipping" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Panel>
   <div class="cart_offer">
            <strong>Offer Details:</strong> As part of the Special TV Offer – you will have the convenience of a 5 installment payment plan. You will be initially charged a $14.95 trial fee + free S&H. In 30 days, the same method of payment you use to make your purchase will automatically be charged the second of five payments in the amount of $39.95 for the Enhanced Package and $59.90 for the Accelerated Package. The grand total that will be charged for the Enhanced Package will be $199.75 and $299.50 for the Accelerated Package.<br>
<br>

The full purchase of this product has a 30 day money-back guarantee (less S&H).</div>