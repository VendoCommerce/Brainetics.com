<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CSWeb.A1.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!doctype html><html lang="en">

	
<head>
		<meta charset="UTF-8">
		<meta name="robots" content="index,follow_all">
		<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Brainetics&reg; by Mike Byster-Award Winning-Guaranteed!</title>
		
		<link rel="stylesheet" href="Styles/style.css">
		
		<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		
		<script src="Scripts/window-popup.js"></script>
		<script src="Scripts/main.js"></script>

		<script>
		    var _orderLink = 'order.aspx';
		</script>

		<script src="Scripts/qzy1qcz.js"></script>
		<script>		    try { Typekit.load(); } catch (e) { }</script>
		
	</head>
	
	<body>
	<form runat="server">
		<div class="all-wr">
			
			<div class="header-wr">
			
				<header class="header clearfix">
					
					<a href="index.aspx" class="logo"><img src="Content/images/logo.png" alt="Brainetics"></a>
					
					<h1 class="slogan">Not sold in stores!</h1>
					
					<nav class="header-menu">
						<span><a href="sub-features.aspx">Product Features</a></span>
						<span><a href="sub-stories.aspx">Amazing Stories</a></span>
						<span><a href="sub-work.aspx">How It Works</a></span>
						<span><a href="sub-faq.aspx">FAQ</a></span>
					</nav>
					
				</header>
				
			</div>
			
			<div class="media-wr">
			
				<div class="extra-mobile-bg">
				
					<article class="media clearfix">
					
						<div class="media-info">
							
							<div class="media-seen">
								
								<img src="Content/images/20-20.png" alt="">
								
								<p>As seen on <span>20/20!</span></p>
								
							</div>
							
							<div class="media-award">
								
								<p>The Award Winning System that Everyone is Talking About!</p>
								
								<a href="sub-stories.aspx" class="all-reviews">Click here to read Reviews</a>
								
								<img src="Content/images/rating.png" alt="4.8" class="img-rating">
								
								<img src="Content/images/awards.jpg" alt="" class="img-awards">
								
							</div>
							
						</div>
						
						<div class="media-content">
						
							<h2 class="media-title">Unleash Your Child's Full Potential!</h2>
							
							<div class="video">
								<iframe width="100%" height="100%" src="http://www.youtube.com/embed/s3v6G0rMDs8?autoplay=1&amp;fs=1&amp;rel=0&amp;showinfo=0&amp;loop=0&amp;enablejsapi=0&amp;showsearch=0&amp;controls=0&amp;wmode=transparent" frameborder="0" allowfullscreen=""></iframe>
							</div>
							
							<a href="#order" class="btn-media-try">
								<span class="money-text"><i>Only</i> <sup>$</sup>14<sup>95</sup> <sub>Trial <br>+s&amp;h</sub></span>
								<span class="btn-text">TRY NOW</span>
							</a>
							
						</div>
						
						<div class="ages"><img src="Content/images/ages.png" alt="Recommended for ages 9 to 99!"></div>
						
					</article>
				
				</div>
				
			</div>
			
			<div class="pricing-wr" id="order">
				
				<article class="pricing accelerated clearfix">
			
					<h2 class="pricing-title"> Begin to see results in as little as 2 weeks with Brainetics<sup>&reg;</sup></h2>
					
					<p class="pricing-subtitle">Brainetics will train your mind to work in powerful, fun, and cool ways!</p>
					<p class="pricing-subtitle">Improve your focus, concentration, memory, and math skills in as little as 2 weeks.  You and your kids will feel your confidence soar!</p>
					
					<h2 class="pricing-chose-title">Not available in stores! Choose Your Package:</h2>
					
					<ul class="tabs-menu">
						<li class="compare"><a href="javascript://" data-tab-id="tab-compare">Compare Packages</a></li>
						<li class="enhanced"><a href="javascript://" data-tab-id="tab-enhanced">Brainetics<sup>&reg;</sup> Enhanced Package</a></li>
						<li class="package"><a href="javascript://" data-tab-id="tab-accelerated" class="active">Brainetics<sup>&reg;</sup> Accelerated Package</a></li>
					</ul>
					
					<div class="tabs-wr">
						
						<div id="tab-enhanced" class="tab-kit tab-enhanced" hidden="">
							
							<div class="tab-photo">
							
								<img src="Content/images/product-12.jpg" alt="" class="tab-digital-photo">
								
								<div class="enh-guarantee">
									<img src="Content/images/guarantee.png" alt="GUARANTEE">
								</div>
								
							</div>
							
							<div class="tab-content">
								
								<h3 class="tab-content-title-black">Brainetics<sup>&reg;</sup> Enhanced Package</h3>
									<p class="tab-content-text"><b>This is the groundbreaking math and memory and focus system that has changed millions of lives.</b>  In 5 (+2 bonus) levels Mike Byster helps you transform your mind from ordinary to extraordinary, powerful, and confident. With the <b>4 bonus items included</b> take advantage of even more Brainetics memory and learning skills!</p>
								
								<h3 class="tab-content-title">What's included in the package:</h3>
								
								<ul class="tab-content-list">
									<li>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</li>
									<li>DVD Levels 6 &amp; 7: Memory and More Cool Math</li>
									<li>Two 86-Page Interactive Playbooks</li>
									<li>On The Move...10 Mind-Building Games for the Whole Family</li>
									<li>Brain Boosting Guide</li>
									<li>Online Support from Mike Byster</li>
									<li>Parent's Manual</li>
								</ul>
								
								<div class="tab-action">
									
									<a href="sub-features.aspx" class="see-full">See full product details here</a>
																		
                                    <asp:LinkButton ID="lbOrderNowEnhanced" runat="server" class="btn-now" OnClick="lbOrderNowEnhanced_Click">Order Now</asp:LinkButton>
								
								</div>
								
								<div class="tab-info">
									
									<div class="tab-info-money"><span><sup>$</sup>14<sup>95</sup></span> Trial + <b>s&amp;h</b></div>
									
									<p class="tab-info-descr">And then only 5 payments of $39.95<br> Or single payment option (trial fee and 1 payment of $39.95 waived) after checkout</p>
									
								</div>
								
								<div class="medal-mobile">
									<img src="Content/images/medal-phone.jpg" alt="">
								</div>
								
								<a href="#" class="link-next">More<i class="link-next-arrow"></i></a>
								
							</div>
							
						</div>
						
						<div id="tab-accelerated" class="tab-kit no-bg tab-accelerated" hidden="">
							
							<div class="tab-photo">
							
								<img src="Content/images/product-11.jpg" alt="" class="tab-ultimate-photo">
								
								<div class="enh-guarantee">
									<img src="Content/images/guarantee.png" alt="GUARANTEE">
								</div>
								
							</div>
							
							<div class="tab-content">
								
								<h3 class="tab-content-title-black">Brainetics<sup>&reg;</sup> Accelerated Package</h3>
									<p class="tab-content-text"><b>The best value of all!</b>  Get everything in the Brainetics Enhanced Package <b>PLUS</b> Brainetics Online Language Lab (learn one or more of 38 different languages), access to Brainetics through any smartphone, tablet, or computer, the Brainetics Challenge Game for the whole family, and much more!</p>

								<h3 class="tab-content-title">What's included in the package:</h3>
								
								<ul class="tab-content-list">
									<li>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</li>
									<li>DVD Levels 6 &amp; 7: Memory and More Cool Math</li>
									<li>Two 86-Page Interactive Playbooks</li>
									<li>On The Move...10 Mind-Building Games for the Whole Family</li>
									<li>Brain Boosting Guide</li>
									<li>Online Support from Mike Byster</li>
									<li>Parent's Manual</li>
									<li>Challenge Game: Have a Brainetics Tournament at Home with the Family</li>
									<li>Brainetics<sup>&reg;</sup> Online Language Lab Powered by Live Mocha</li>
									<li>Quick Card Set: Summary of Amazing Methods from DVD 1-5</li>
									<li>Complete Brainetics<sup>&reg;</sup> Digital Experience</li>
									<li class="arrow-li">Can be accessed at any time!</li>
								</ul>
								
								<div class="tab-action">
									
									<a href="sub-features.aspx" class="see-full">See full product details here</a>
																		
                                    <asp:LinkButton ID="lbOrderNowAccelerated" runat="server" class="btn-now" OnClick="lbOrderNowAccelerated_Click">Order Now</asp:LinkButton>
									
								</div>
								
								<div class="tab-info">
									
									<div class="tab-info-money"><span><sup>$</sup>14<sup>95</sup></span> Trial + <b> s&amp;h</b></div>
									
									<p class="tab-info-descr">And then only 5 payments of $59.90 <br>Or single payment option (and Trial fee waived) at checkout</p>
									
								</div>
								
								<div class="medal-mobile">
									<img src="Content/images/medal-3.jpg" alt="">
								</div>
								
								<a href="details-accelerated-package.aspx" class="link-next">More<i class="link-next-arrow"></i></a>
								
							</div>
							
						</div>
						
						<div id="tab-compare" class="tab-kit no-bg tab-compare" hidden="">
							
							<div class="tab-line-header">
								
								<div class="name">
									
									<div class="enh-guarantee">
										<img src="Content/images/guarantee.png" alt="GUARANTEE">
									</div>
									
									<p>Choose Your Package</p>
									
								</div>

								<div class="value">
									
									<div class="value-photo">
										<img src="Content/images/product-14.jpg" alt="">
									</div>
									
									<div class="value-name">Brainetics<sup>&reg;</sup> <b>Enhanced</b> Package</div>
									
									<div class="value-more"><a href="sub-features.aspx">See full product details here</a></div>
									
									<div class="value-money"><span><sup>$</sup>14<sup>95</sup></span> Trial + s&amp;h</div>
									
									<div class="value-descr">(Then only 5 payments of $39.95 )</div>
									
									<a href="order.aspx" class="btn-now">Order Now</a>
									
								</div>
								
								<div class="value">
									
									<div class="value-photo">
										<img src="Content/images/product-13.jpg" alt="">
									</div>
									
									<div class="value-name">Brainetics<sup>&reg;</sup> <b>Accelerated</b> Package</div>
									
									<div class="value-more"><a href="sub-features.aspx">See full product details here</a></div>
									
									<div class="value-money"><span><sup>$</sup>14<sup>95</sup></span> Trial + s&amp;h</div>
									
									<div class="value-descr">(Then only 5 payments of $59.90 )</div>
									
									<a href="order.aspx" class="btn-now">Order Now</a>
									
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p>DVD Levels 6 &amp; 7: Memory and More Cool Math</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Two 86-Page Interactive Playbooks</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p>On The Move&hellip;10 Mind-Building Games for the Whole Family</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Brain Boosting Guide</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p>Online Support from Mike Byster</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Parent's Manual</p>
								</div>
								
								<div class="value">
									<i class="icon-check"></i>
								</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p>Challenge Game: Have a Brainetics Tournament at Home with the Family</p>
								</div>
								
								<div class="value">&nbsp;</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Brainetics<sup>&reg;</sup> Online Language Lab Powered by Livemocha </p>
								</div>
								
								<div class="value">&nbsp;</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p>Quick Card Set: Summary of Amazing Methods from DVD 1-5</p>
								</div>
								
								<div class="value">&nbsp;</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
								
							</div>
							
							<div class="tab-line-body odd">
								
								<div class="name">
									<p>Complete Brainetics<sup>&reg;</sup> Digital Experience <span class="small-pur-text"><i>Can be accessed on any tablet or smartphone at any time!</i></span></p>
								</div>
								
								<div class="value">&nbsp;</div>
								
								<div class="value last">
									<i class="icon-check"></i>
								</div>
					
							</div>
							
							<div class="tab-line-body">
								
								<div class="name">
									<p><a href="#">Want to learn more about the above products? Click here!</a></p>
								</div>
								
								<div class="value">&nbsp;</div>
								
								<div class="value last">&nbsp;</div>
								
							</div>
							
						</div>
						
						<div id="tab-deluxe-mobile" class="tab-kit" hidden="">
							
							<div class="tab-photo">
							
								<img src="Content/images/product-12.jpg" alt="" class="tab-digital-photo">
								
							</div>
							
							<div class="tab-content">
								
								<h3 class="tab-content-title-black">Brainetics<sup>&reg;</sup> Enhanced Package</h3>
								
								<h3 class="tab-content-title">What's Included in the package:</h3>

								<div class="tab-title-info-money"><span><sup>$</sup>14.<sup>95</sup></span> Trial + <b>s&amp;h</b></div>
								
								<p class="tab-content-text">Get mind-blowing results from Brainetics, plus get these extra tools to help more family members participate in the fun and build incredible memory skills!</p>
								
								<ul class="tab-content-list">
									<li>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</li>
									<li>Playbook</li>
									<li>On The Move Brain Boosting Guide</li>
									<li>DVD Levels 6 &amp; 7: Memory and More Cool Math</li>
									<li>Extra Playbook</li>
								</ul>
								
								<div class="tab-action">
									
									
									
									<a href="order.aspx" class="btn-now">Order Now</a>

								</div>
								
								<div class="tab-info">
									
									<div class="tab-info-money"><span><sup>$</sup>14.<sup>95</sup></span> Trial + <b>s&amp;h</b></div>
									
									<p class="tab-info-descr">Then only 3 payments of $59.90</p>
									
									<p class="tab-info-descr">Or select a single payment option during checkout.</p>
									
								</div>
								
								<div class="medal-mobile">
									<img src="Content/images/medal-phone.jpg" alt="">
								</div>
								
								<a href="details-enhanced-package.aspx" class="link-next">More<i class="link-next-arrow"></i></a>
								
							</div>
							
						</div>
						
						<div id="tab-ultimate-mobile" class="tab-kit no-bg" hidden="">
							
							<div class="tab-photo">
							
								<img src="Content/images/product-11.jpg" alt="" class="tab-ultimate-photo">
								
							</div>
							
							<div class="tab-content">
								
								<h3 class="tab-content-title-black">Brainetics<sup>&reg;</sup> Accelerated Package</h3>
								
								<h3 class="tab-content-title">What's Included in the package:</h3>

								<div class="tab-title-info-money"><span><sup>$</sup>14.<sup>95</sup></span> Trial + <b>s&amp;h</b></div>
								
								<ul class="tab-content-list">
									<li>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</li>
									<li>Playbook</li>
									<li>On The Move Brain Boosting Guide</li>
									<li>DVD Levels 6 &amp; 7: Memory and More Cool Math</li>
									<li>Extra Playbook</li>
								</ul>
								
								<div class="tab-action">
									
									<a href="order.aspx" class="btn-now">Order Now</a>

								</div>
								
								<div class="tab-info">
									
									<div class="tab-info-money"><span><sup>$</sup>14<sup>95</sup></span> Trial + <b> s&amp;h</b></div>
									
									<p class="tab-info-descr">Then only 5 payments of $59.90 Or select a single payment option during checkout.</p>
									
								</div>
								
								<div class="medal-mobile">
									
								</div>
								
								<a href="details-accelerated-package.aspx" class="link-next">More<i class="link-next-arrow"></i></a>
								
							</div>
							
						</div> 

					</div>
					
				</article> 
				

				
			</div>
			
			<div class="about-wr">
				
				<div class="second-bg">
					
					<article class="about">
					
						<div class="about-award">
							
							<h3 class="about-title">Brainetics<sup>&reg;</sup> trains your mind!</h3>
							
							<div class="about-text">
								
								<p><b>Brainetics <span>TRAINS</span> two different parts of the <br><span>MIND</span></b> to work simultaneously yet independently of each other. One part of your mind memorizes information <br>while another part is sorting and processing new information. The mind will begin <br>to work much more efficiently and <br>be more powerful <b>giving <br>Brainetics kids a huge <br> advantage</b> throughout their <br>academic lives and beyond.</p>
								
							</div>
							
							<a href="#order" class="btn-about-try">Try now</a>
						
						</div>
						
						<div class="about-get">
							
							<h3 class="about-title">Brainetics<sup>&reg;</sup> gets an <span class="a-plus">A + !</span></h3>
							
							<div class="about-text move-text">
								
								<p><b>Your child HAS THE POTENTIAL to succeed,</b> <br>and Brainetics unlocks that hidden cognitive ability!</p>
								
								<p>The Brainetics<sup>&reg;</sup> Complete System increases your child's <b>Comprehension</b> and <b>Memory</b>, and re-introduces <b>learning</b> through an increasingly challenging step- by- step program, enabling progress with a fun and easy to use process.</p>
								
								<div class="about-list-title">
									<p>The Enhanced Package Includes the following:</p>
								</div>
								
								<ul class="about-list">
									<li>Brainetics<sup>&reg;</sup> Complete DVD Set (Levels 1-5)</li>
									<li>DVD Levels 6 &amp; 7: Memory and More Cool Math</li>
									<li>Two 86-Page Interactive Playbooks</li>
									<li>On The Move&hellip;10 Mind-Building Games for the Whole Family</li>
									<li>Brain Boosting Guide</li>
									<li>Online Support from Mike Byster</li>
									<li>Parent's Manual</li>
								</ul>
									
								<div class="about-guarantee">
									<img src="Content/images/guarantee.png" alt="">
								</div>	
									
							</div>
							
						</div>

					</article>
					
				</div>
				
			</div>
			
			<div class="divider-wr">
				
				<article class="divider">
					
					<p>Think your child can do better? We KNOW they can! <a href="#order">Start the Brainetics<sup>&reg;</sup> Trial today!</a></p>

				</article>
				
			</div>
			
			<div class="footer-wr">
				
				<footer class="footer clearfix">
				
					<div class="footer-text">
						
						<img src="Content/images/footer-text.png" alt="You won't believe what your child can do!">
						
					</div>
					
					<div class="footer-money">
						
						<img src="Content/images/footer-money.png" alt="$14.95 trial + s&amp;h"> 
						
						<a href="#order" class="btn-footer-try">Try now</a>
						
					</div>
					
					<hr>
					
					<nav class="footer-nav">
						
						<span><a href="sub-features.aspx">Product Features</a></span>
						<span><a href="sub-stories.aspx">Amazing Stories</a></span>
						<span><a href="sub-work.aspx">How It Works</a></span>
						<span><a href="sub-faq.aspx">FAQ</a></span>
						<span><a href="ext-customer.aspx" class="js-popup-window">Customer Service</a></span>
						<span><a href="ext-privacy.aspx" class="js-popup-window">Privacy Policy</a></span>

					</nav>
					
					<div class="footer-copy">&copy; <script>					                                    document.write(new Date().getFullYear())</script> <span>Brainetics</span>. All rights reserved.</div>
					
					<div class="footer-social">
						<a href="https://www.facebook.com/Brainetics" class="fb">facebook</a>
						<a href="http://pinterest.com/brainetics/" class="pin">pinterest</a>
						<a href="https://twitter.com/Brainetics" class="tw">twitter</a>
					</div>
					
					
					
				</footer>
				
			</div>
			
		</div>
		
		<div class="is-mobile"></div>

	    <uc:TrackingPixels runat="server" />
    </form>	
    </body>
	

</html>