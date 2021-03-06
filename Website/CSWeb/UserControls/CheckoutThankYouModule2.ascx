<%@Control Language="C#" Inherits="CSWeb.UserControls.CheckoutThankYouModule2" %>
 		<div class="all-wr">
			
			<div class="header-wr">
			
				<header class="header clearfix">
					
					<a href="index.aspx" class="logo"><img src="content/images/logo.png" alt="Brainetics"></a>
					
				</header>
				
				<div class="header-second-wr">
					<div class="header-second"></div>
				</div>
				
			</div>
			
			<div class="thank-wr">
				
				<section class="order-info">
			
					<h3 class="order-thank">Thank you for your order - we appreciate your business!</h3>
					<h4 class="order-number">Your order number is <%=orderId.ToString()%></h4>
		 
					<p class="order-description">You will receive a confirmation email shortly with this order information <span>(check your Junk Mail if you don't see it soon)</span> but be sure to write down your confirmation number to be safe.</p>
					
					<ul class="people-info iib">
						<li>Ship to:</li>
                        <li><asp:Literal ID="LiteralName" runat="server"></asp:Literal></li>
                        <li><span>|</span> <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal>
                            <asp:PlaceHolder ID="phSAddress2" runat="server">
                                <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal>
                            </asp:PlaceHolder>
                        </li>
                        <li><span>|</span> <asp:Literal ID="LiteralCity" runat="server"></asp:Literal>, <asp:Literal ID="LiteralState" runat="server"></asp:Literal> <asp:Literal ID="LiteralZip" runat="server"></asp:Literal></li>
                        <li><span>|</span> <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></li>
					</ul>
					
                    <asp:Literal ID="LiteralCountry" runat="server" Visible="false"></asp:Literal>

				</section>
				
				<section class="table-wr">
                
                

<!-- Please replace this with table markup from sample here - it is the <table></table> portion of sample receipt ONLY -->

            
			<table>
				<tr>

					<th class="one">QTY</th>
					<th class="two">Item Description</th>
					<th class="three">Price</th>
					<th class="four">P&amp;H</th>
					<th class="five">Total</th>
				</tr>            
            <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </td>
                        <td class='left'>
                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                        </td>
                        <td>
                            $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%> 
                        </td>
                        <td>
                            $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))), 2).ToString()%>
                        </td>
                        <td>
                            $<%# Math.Round(CalculateSkuBaseShipping(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "skuid"))) 
                                + Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
            
                <tr class="total">
					<td class="one" colspan="2">Item Total:</td>
					<td class="three">$<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal></td>
					<td class="four"></td>
					<td class="five"></td>
				</tr>    
                <tr class="total">
					<td class="one" colspan="2">Shipping Total:</td>
					<td class="three"></td>
					<td class="four">$<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal></td>
					<td class="five"></td>
				</tr>
				<tr class="total">
					<td class="one" colspan="2">Tax:</td>
					<td class="three"></td>
					<td class="four"></td>
					<td class="five">$<asp:Literal ID="LiteralTax" runat="server"></asp:Literal></td>
				</tr>
				<tr class="total">
					<td class="one" colspan="2">Total:</td>
					<td class="three"></td>
					<td class="four"></td>
					<td class="five">$<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal></td>
				</tr>
            </table>
                
            <div style="display: none">
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
                    <br />
                    <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    </asp:Panel>
                    <br />
                    </div>
            </div>
            


            <div class="billing_left" style="display: none">
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
                    </p>

            </div>
  <!-- ************ </table> at this point - the rest is done ************** -->          
            
            
          	</section>

				<section class="order-info">
					
					<p class="people-contact">If you have questions about this order, please email <a href="mailto:brainetics@datapakservices.com" target="_blank">brainetics@datapakservices.com</a> or call us at <span>877-444-3776</span> <br>Please note that your order may not appear in our customer service system for another 24-48 hours.</p>
					
					
				</section>
				
			</div>
			
		</div>