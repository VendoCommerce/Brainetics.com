﻿<%@ Control Language="C#" Inherits="CSWeb.RETARGETING.UserControls.CheckoutThankYouModule" %>

  
    <!-- implement this expire soon code on all versions needed -->
    <a href="#bookrebate" class="openbookrebate"></a>
    <div style="display: none">
        <div id="bookrebate">
            <iframe height="470" frameborder="0" width="580" scrolling="no" src="/Rebate/rebate.aspx"></iframe>
        </div>
    </div>
    <!-- END implement this expire soon code on all versions needed -->

    <div id="receipt_content"  style="height: auto; width: 950px; position:relative;padding: 30px 60px;color: #5c5c5c;">

        <p class="lh f34 webfont1 black pad20">Thank you for Your Purchase!</p>
        
        
        <%--<img src="//d1f7jvrzd4fora.cloudfront.net/images/e2/receipt_rebatecall.jpg" usemap="#receipt_offer">
<map name="receipt_offer" id="receipt_offer">
	<area shape="rect" coords="24,209,120,238" href="https://itunes.apple.com/us/book/the-power-of-forgetting/id468751842?mt=11" target="_blank" />
	<area shape="rect" coords="125,209,222,238" href="http://www.barnesandnoble.com/w/the-power-of-forgetting-mike-byster/1115378322?ean=9780307985873" target="_blank" />
	<area shape="rect" coords="227,209,324,238" href="http://books.google.com/books?id=2vaI2Vynx44C&dq=mike+byster&hl=en&sa=X&ei=GDvwUqrtFovzoATN-4DIBw&ved=0CFIQ6AEwAg" target="_blank" />
    
    <area shape="rect" coords="24,243,120,272" href="http://www.amazon.com/The-Power-Forgetting-Essential-Sharpest/dp/0307985873/ref=sr_1_1?ie=UTF8&qid=1391475182&sr=8-1&keywords=mike+byster+power+of+forgetting" target="_blank" />
    <area shape="rect" coords="125,243,222,272" href="http://www.indiebound.org/book/9780307985873" target="_blank" />
	
    <area shape="rect" coords="513,303,736,366" href="javascript:void(0)" onclick="open_book_rebate();" />
</map> --%>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
            <tr class="horzline1">
                <td valign="top" class="pad0 black">
                    <strong>Item</strong>
                </td>
                <td valign="top" class="pad0 black">
                   
                </td>
                <td valign="top" class="pad0 text-center black">
                    <strong>Quantity</strong>
                </td>
                <td valign="top" class="pad0 black">
                    <strong>Total</strong>
                </td>
            </tr>
            <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr> <td valign="top">
                             <img src="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>" />
                         </td>
                        <td valign="top">
                            

                            <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                        </td>
                        <td valign="top" class="black bold text-center">
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </td>
                        
                        <td valign="top" class="black bold">
                            $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%></td>
                           
                    </tr>
                </ItemTemplate>
            </asp:DataList>

           
            <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
            <tr><td colspan="4"><p>As part of this special TV Offer you are getting to try Brainetics in the comfort of your home for a trial fee of $14.95 plus FREE shipping and handling. If you decide to keep the system, simply do nothing and beginning in 30 days following the date of your purchase you will be charged 4 easy monthly payments of $49.95, plus tax. All orders are backed by our 30-Day Money-Back Guarantee!</p></td></tr>
            <tr class="horzline2">
                <td valign="top">&nbsp;
                    
                </td> <td valign="top">&nbsp;
                    
                      </td>
                <td valign="top" class="black bold">
                    Subtotal:<br />
                    S &amp; H:
                    <br />
                    <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        Rush S &amp; H:<br />
                    </asp:Panel>
                    Tax:
                    <br />
                    <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                        Discount:<br />
                    </asp:Panel>
                    Total:
                </td>
                <td valign="top" class="black bold">
                    $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlRush" runat="server" Visible="false">
                        $<asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
                    </asp:Panel>
                    $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                    </asp:Panel>
                    $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
            <tr>
                <td colspan="2" valign="top" class="caps pink f16 pad0">
                    <strong>Shipping Information:</strong>
                </td>
                <td colspan="2" valign="top" class="caps pink f16 pad0">
                    <strong>Billing Information:</strong>
                </td>
            </tr>
            <tr>
                <td width="158" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:
                    <br />
                    Country:
                    <br />
                    Email Address:
                </td>
                <td width="206" valign="top">
                    <strong><asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></strong>
                </td>
                <td width="189" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:<br />
                    Country:
                </td>
                <td width="266" valign="top">
                    <strong><asp:Literal ID="LiteralName_b" runat="server">
                            </asp:Literal><br />
                        <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                        <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal></strong>
                </td>
            </tr>
        </table>
      
    </div>


