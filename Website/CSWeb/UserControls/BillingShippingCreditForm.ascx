<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.UserControls.BillingShippingCreditForm" CodeBehind="BillingShippingCreditForm.ascx.cs" %>

      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      
      <script type="text/javascript">
          var stateIds = jQuery.parseJSON('{ "billing": "<%= ddlState.ClientID  %>", "shipping": "<%= ddlShippingState.ClientID  %>" }');
          
          function populateStates(o,id) {
              $.ajax({
                  type: "POST",
                  url: "order.aspx/populateStates",
                  data: "{data:'" + $('#' + o.id).val() + "'}",
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  async: false,
                  success: function (msg) {
                      var listItems = "";
                      var jsonData = jQuery.parseJSON(msg.d);
                      listItems += "<option value='0'>State/Province</option>";
                      for (var i = 0; i < jsonData.length; i++) {                      
                          listItems += "<option value='" + jsonData[i].StateProvinceId + "'>" + jsonData[i].Name + "</option>";
                      }
                      $('#' + stateIds[id]).html(listItems);
                  }
              });
          }
          
        </script>

        
        <asp:PlaceHolder ID="phCardError" runat="server" Visible="false">
        
            <script type="text/javascript">

                var popUpMsg = '<asp:Literal ID="litPopUpMsg" runat="server" EnableViewState="false" />';

                if (popUpMsg != '')
                    alert(popUpMsg);

            </script>
        </asp:PlaceHolder>

<script type="text/javascript">

    var ValidationSubmit = function (o) {        
        <asp:Literal ID="litValidationSubmitScripts" runat="server" />        

        return true;
    }

    var ShippingDifferentChange = function (o) {        
        return true;
    }

    function SetCursorAtTheBeginning(element) {
        if (element.setSelectionRange) {
            element.setSelectionRange(0, 0);

        } else if (element.createTextRange) {
            var range = element.createTextRange();
            range.collapse(true);
            range.moveEnd('character', 0);
            range.moveStart('character', 0);
            range.select();
        };
    };

    $(document).ready(function () {
        $('#<%= txtPhoneNumber.ClientID %>').keydown(function (data) {
            if (data.keyCode == 86 && data.ctrlKey) {
                var $this = $(this);
                setTimeout(function () {
                    var val = $this.val();
                    var newVal = '';
                    for (var index in val) {

                        if (newVal.length > 11)
                            break;

                        var char = val[index];

                        if (validator.numbers.indexOf(char) > -1) {
                            if (newVal.length == 3 || newVal.length == 7) {
                                newVal = newVal + '-';
                            };
                            newVal = newVal + char;
                        } else if ((newVal.length == 3 || newVal.length == 7) && char == '-') {
                            newVal = newVal + char;
                        };
                    };

                    $this.val(newVal);
                }, 0);
            };
        });

        var phoneCharCodes = [0, 45, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
        var numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        
	    if ($.browser.msie && $.browser.version < 9){
		
	    } else {
            $('#<%= txtPhoneNumber.ClientID %>').keypress(function (data) {
                var $this = $(this);
                if (((data.charCode == 99 || data.charCode == 118 || data.charCode == 120) && data.ctrlKey) || data.charCode == 0) {
                    return true;
                };

                if (phoneCharCodes.indexOf(data.charCode) == -1) {
                    return false;
                };

                var val = $this.val();

                if ((val.length != 3 && val.length != 7) && data.charCode == 45) {
                    return false;
                };

                if ((val.length == 3 || val.length == 7) && data.charCode != 45) {
                    $(this).val(val + '-');
                };

                if (val.length > 11 && val != $this.attr('format') && val != $this.attr('hidingLabel')) {
                    return false;
                };
            });
	    };

        // initialize inputs
        var selectDivClass;
        var notDefaultTextClass;
        var inputs = jQuery('input[hidingLabel]');

        inputs.focusin(function () {
            var curElement = jQuery(this);
            var format = curElement.attr('format');
        
            if (curElement.val() == curElement.attr('hidingLabel') || curElement.val() == curElement.attr('format')) {
                if (format != undefined) {
                    curElement.val(format);
                } else if (hideLabelOnFocusin) {
                    curElement.val('');
                    return;
                }
                setTimeout(function () {
                    SetCursorAtTheBeginning(curElement[0]);
                }, 0);
            };
        });

    //    inputs.keypress(function (data) {
    //        var obj = data;
    //        return false;
        //    });


        var specKeys = [8, 9, 13, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37,
                        38, 39, 40, 45, 46, 91, 92, 93, 112, 113, 114, 115, 116, 
                        117, 118, 119, 120, 121, 122, 123, 144, 145, 186, 187];

        inputs.keydown(function (data) {
            var curElement = jQuery(this);

            var hl = curElement.attr('hidingLabel');
            var format = curElement.attr('format');

            if (specKeys.indexOf(data.keyCode)  == -1) {
                var val = curElement.val();    
                if (val.indexOf(hl) > -1) {
                    curElement.val('');
                    if (notDefaultTextClass != undefined) {
                        curElement.addClass(notDefaultTextClass);
                    };
                } else if (format != undefined && val.indexOf(format) > -1) {
                    curElement.val('');
                    if (notDefaultTextClass != undefined) {
                        curElement.addClass(notDefaultTextClass);
                    };
                }
            }

            setTimeout(function () {
                if (curElement.val() == '') {
                    curElement.removeClass(notDefaultTextClass);
                    if (format != undefined) {
                        curElement.val(format);
                    } else {
                        if (hideLabelOnFocusin) {
                            curElement.val('');
                            return;
                        }
                        curElement.val(hl);
                    }
                    SetCursorAtTheBeginning(curElement[0]);
                };
            }, 0);
        });

        inputs.change(function () {
            var curElement = jQuery(this);
            if (notDefaultTextClass && curElement.val() != curElement.attr('hidingLabel') && curElement.val() != curElement.attr('format') && !curElement.hasClass(notDefaultTextClass)) {
                    curElement.addClass(notDefaultTextClass);
            };
        });

        inputs.focusout(function () {
            var curElement = jQuery(this);
            if (curElement.val() == '' || curElement.val() == curElement.attr('hidingLabel') || curElement.val() == curElement.attr('format')) {
                if (notDefaultTextClass) {
                    curElement.removeClass(notDefaultTextClass);
                };
                curElement.val(curElement.attr('hidingLabel'));
            };
        });

        inputs.each(function () {
            var curElement = jQuery(this);
            if (curElement.val() == '' || curElement.val() == curElement.attr('format')) {
                curElement.val(curElement.attr('hidingLabel'));
            } else if (notDefaultTextClass != undefined && curElement.val() != curElement.attr('hidingLabel')) {
                curElement.addClass(notDefaultTextClass);
            };
        });

        if (notDefaultTextClass != undefined) {
            var selector = ".";
            if (selectDivClass != null && selectDivClass != undefined) {
                selector = selector + selectDivClass;
            } else {
                selector = selector + 'selectWr';
            };
            var selectsBlock = $('.' + selectDivClass);
		
		    if (selectsBlock.find('.jqTransformSelectWrapper').length) {
			    selectsBlock.on('change', 'select', function(){
				    if ($(this).val() == 0) {
					    $(this).parent().find('span').removeClass(notDefaultTextClass);
				    }
				    else {
					    $(this).parent().find('span').addClass(notDefaultTextClass);
				    }
			    });
		    }
		    else {
			    selectsBlock.on('change', 'select', function(){
				    if ($(this).val() == 0) {
					    $(this).removeClass(notDefaultTextClass);
				    }
				    else {
					    $(this).addClass(notDefaultTextClass);
				    }
			    });
		    }
		    selectsBlock.find('select').trigger('change');
        };
    });

</script>

    <div class="check-section clearfix">
					
					<div class="right">
						
						<h3 class="check-section-title">Credit Card Information</h3>
						
						<div class="line">					
                            <div class="error-1">
                        <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label>
                           <asp:RequiredFieldValidator ID="rfvCreditCard" ControlToValidate="txtCCNumber" runat="server" Display="Dynamic" ErrorMessage="Please enter card number" />                           
                        </div>		
                            <asp:TextBox ID="txtCCNumber" runat="server" CssClass="defaultText" MaxLength="16" placeholder="Credit card number"></asp:TextBox>
						</div>
						
						<div class="line">
                        <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
							<asp:DropDownList ID="ddlCCType" runat="server">
                            </asp:DropDownList>
						</div>
						
						<div class="line multi-line clearfix">
						  <div class="error-1"><asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>

							<div class="line-part">
								<asp:DropDownList ID="ddlExpMonth" runat="server">
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
                                <asp:DropDownList ID="ddlExpYear" runat="server">
                                    <asp:ListItem Value="" Text="Year"></asp:ListItem>                                    
                                    <asp:ListItem Value="2013">13</asp:ListItem>
                                    <asp:ListItem Value="2014">14</asp:ListItem>
                                    <asp:ListItem Value="2015">15</asp:ListItem>
                                    <asp:ListItem Value="2016">16</asp:ListItem>
                                    <asp:ListItem Value="2017">17</asp:ListItem>
                                    <asp:ListItem Value="2018">18</asp:ListItem>
                                    <asp:ListItem Value="2019">19</asp:ListItem>
                                    <asp:ListItem Value="2020">20</asp:ListItem>
                                    <asp:ListItem Value="2021">21</asp:ListItem>
                                    <asp:ListItem Value="2022">22</asp:ListItem>
                                    <asp:ListItem Value="2023">23</asp:ListItem>
                                    <asp:ListItem Value="2024">24</asp:ListItem>
                                    <asp:ListItem Value="2025">25</asp:ListItem>
                                    <asp:ListItem Value="2026">26</asp:ListItem>
                                    <asp:ListItem Value="2027">27</asp:ListItem>
                                </asp:DropDownList>
							</div>
							
						</div>
						
						<div class="line multi-line clearfix">
						
							<div class="line-part">
                            <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
								<asp:TextBox ID="txtCvv" runat="server" CssClass="defaultText" MaxLength="4" placeholder="Security Code"></asp:TextBox>
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
                                <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="defaultText" placeholder="Address 2"></asp:TextBox>
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
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="Dynamic"
                                    ControlToValidate="ddlState" InitialValue="0"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlState" runat="server" DataTextField="Abbreviation" CssClass="text-1"
                                    size="1">
                                </asp:DropDownList>
							</div>
							
							<div class="line">
                            <%--AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged"--%>
                            <div class="error-1">
                                <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Name" DataValueField="COUNTRYID"                                    
                                    CssClass="text-1" onchange="populateStates(this, 'billing');">
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
                                <asp:RegularExpressionValidator ID="rev" runat="server" ControlToValidate="txtPhoneNumber"
                                    Display="Dynamic" ValidationExpression="^[0-9]{3}\-[0-9]{3}\-[0-9]{4}$" ErrorMessage="Please check phone number format (XXX-XXX-XXXX)" />
                                <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false"></asp:Label></div>					
                                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="12" CssClass="defaultText" placeholder="Phone Number" hidingLabel="Phone Number" format="xxx-xxx-xxxx" validation="required:phone"></asp:TextBox>
							</div>
							
						</div>
						
                        

						<div class="checkbox">
							<input type="checkbox" style="display:none">

                            <input id="chkShippingDifferent" name="chkShippingDifferent" type="checkbox" class="shippingdifferent" value="1" onchange="return ShippingDifferentChange(this);">

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
                                <asp:RequiredFieldValidator ID="rfvShippingState" runat="server" Display="Dynamic"
                                    ControlToValidate="ddlShippingState"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="Abbreviation" CssClass="text-1" size="1">
                                </asp:DropDownList>
							</div>
							
							<div class="line">
                                <div class="error-1">
                                    <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
								<asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                                    onchange="populateStates(this, 'shipping');"
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
                            <asp:LinkButton ID="imgBtnSubmit" runat="server" OnClick="imgBtn_OnClick" CausesValidation="true" OnClientClick="return ValidationSubmit(this);">COMPLETE ORDER!</asp:LinkButton>
						</div>

						<div class="thawte">
							<script type="text/javascript" src="https://seal.thawte.com/getthawteseal?host_name=m2.mojocheckout.com&amp;size=S&amp;lang=en"></script>
						</div>

					</div>
					
		</div>

        
        <asp:PlaceHolder ID="phExpandShippingDifferent" runat="server" Visible="false" EnableViewState="false">
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".shippingdifferent").click();
                });
            </script>

        </asp:PlaceHolder>