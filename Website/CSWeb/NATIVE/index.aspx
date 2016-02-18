<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.O2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="/o2/UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">    
<title>Brainetics® by Mike Byster-Award Winning-Guaranteed!</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta name="description" content="Brainetics improves your focus, concentration, memory, and math skills in as little as 2 weeks. Feel your confidence soar!">
<meta name="keywords" content="Brainetics, Brain Boosting, Memory, Child Learning, Memory Challenge">

<!--#include file="scripts.html"-->

</head>
<body>
 <form runat="server" id="fm1">
 
<!--#include file="header.html"-->
<div id="index">
            <div  class="container">
                <h1>Have FUN Becoming a Genius!</h1>

                <div id="top_cta">
    <div class="container">
        <div class="row">
            <div class="col sm-7" style="padding-left: 4px;">
                <div class="subtitle">Brainetics is Both FUN and Challenging!</div>
                <ul>
                    <li>Your kids will get better grades!</li>
                    <li>Your kids will be smarter in school and beyond!</li>
                    <li>For ages 9-99</li>
                </ul>
                <div class="slogan">Turn your kids into Whizkids!</div>
                <div class="money_back"><a href="#guarantee" class="guarantee"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/30_day_money_back.png" alt="" title="30 day money-day back guarantee" /></a></div>
            </div>
            <div class="col sm-5" style="margin-top: -3em;">
                <div class="video" style="float: right; width: 85%;margin-top: -1em;">
                    <div id="ctavideo"></div>
  <script type='text/javascript'>
      jwplayer('ctavideo').setup({
          file: "https://d1f7jvrzd4fora.cloudfront.net/video/ctavideo1_30day.mp4",
          autostart: true,
          primary: "flash",
          controls: true,
          width: 360, height: 271,
          stretching: 'exactfit',
          skin: '/scripts/jwplayer/five.xml',
          events: {
              onPlay: function () {
                  jwplayer('video2020').stop();
              }
          }
      });
</script>
                </div>
            </div>
        </div>
        <div class="images">
            <p class="familyfun">Fun for the<br />                <strong>Whole Family</strong><br />                to learn!</p>
            <div class="product">
                <div>
                    <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/product_boxes.png" alt="" title="Brainetics" />
                    <div class="sold_200"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/over_200k_sold.png" alt="" title="Over 200.000 kits sold" /></div>
                    <div class="link"><a href="#included" class="included whats_included">See What's Included!</a></div>
                </div>
                <div>
                    <a class="button" href="AddProduct.aspx?pid=64&cid=1">Order now</a>
                    <div class="price">Only <small>$</small>14<small>.95</small></div>
                    <div class="free">+ FREE S&amp;H!</div>
                </div>
            </div>
            <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/family2.jpg" alt="" class="block" style="margin-left: -2em;"/>
            <div class="demi_circle"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/orange_circle.png" style="display: block;" alt=""/></div>
        </div>
    </div>
</div>


                <div class="mike">
                    <div class="awards">
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/circle_braintoy.png" alt="" />
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/circle_parentchoice.png" alt="" />
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/circle_mombest.png" alt="" />
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/circle_drtoy.png" alt="" />
                    </div>
                    <div class="triangle">
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/triangle.png" alt="" />
                    </div>
                    <div class="author">
                        <strong>Mike  Byster</strong>
                        is the creator of the entertaining and engaging multi-disk DVD program to build increased mental capacity called Brainetics, winner of the 2008 Parents' Choice Award and the 2012 Mom's <span class="iblock">Best Award.</span>
                        <a href="aboutmike.aspx">Read more...</a>
                        <div class="photo">
                            <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/mike.png" alt="" class="block" />
                        </div>
                    </div>
                </div>

                <br>

                <h3 style="font-size: 28px;">The award winning system that everyone is talking about</h3>

                <div class="text-center"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/blue-line.png" alt="" /></div>

                <br><br>

                <div class="row award_wining">
                    <div class="col sm-4">
                        <p>Brainetics is a fun and cool way to turbocharge your child's learning skills. It can even be done together with the whole family at once - making it a great way to spend time together!</p>
                        <p>The training and tools provided by Brainetics help your mind work more efficiently by training it to get better at processing information while also memorizing the information simultaneously -even though these are two completely independent skills.</p>
                        <p>With the tools provided by Brainetics the mind can begin to work more efficiently and become more powerful - giving your kids a HUGE advantage throughout their academic lives and beyond!</p>
                    </div>
                    <div class="col sm-4 text-center">
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/brain.png" alt="" />
                    </div>
                    <div class="col sm-4 text-center">
                        <img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/home/as_seen_2020.png" alt="" />
                        <br>
                        <div class="video">
                            <%--<iframe width="344" height="194" src="https://www.youtube.com/embed/Y7OQGyQUez0" frameborder="0" allowfullscreen></iframe>--%>
                            <div id="video2020"></div>
  <script type='text/javascript'>
      jwplayer('video2020').setup({
          file: "https://d1f7jvrzd4fora.cloudfront.net/video/2020_how1.mp4",
          autostart: false,
          image: "//d1f7jvrzd4fora.cloudfront.net/images/a5/2020.JPG",
          primary: "flash",
          controls: true,
          width: 351, height: 263,
          stretching: 'exactfit',
          skin: '/scripts/jwplayer/five.xml',
          events: {
              onPlay: function () {
                  jwplayer('ctavideo').stop();
              }
          }
      });
</script>
                        </div>
                        <div class="sign">
                            Your child <br>
                            <strong style="text-decoration: underline;">HAS THE POTENTIAL to SUCCEED</strong>, <br>
                            and Brainetics unlocks that hidden <br>
                            cognitive ability!
                        </div>
                        <br>
                    </div>
                </div>
                <div class="row award_wining">
                    <div class="col sm-4">
                        <a href="#included" class="included button">See what's included</a>
                    </div>
                    <div class="col sm-4"></div>
                    <div class="col sm-4 text-center">
                        <a href="AddProduct.aspx?pid=64&cid=1" class="button">Order yours today!</a>
                    </div>
                </div>

                <div class="reviews">
                    <div class="col-right">
                        <br><br>
                        <h4>Real people. Real results.</h4>

                        <div class="quotes">
                            <blockquote>
                                There's not only one way to learn, and there's not only one way to arrive at the answer to a problem!
                                <div class="author">- Woody G.</div>
                            </blockquote>
                            <blockquote>
                                I was really surprised that I liked it — math isn't my favorite subject, so I wasn't expecting it to be super fun!
                                <div class="author">- Britanny B.</div>
                            </blockquote>
                        </div>
                    </div>
                    <div class="col-left">
                        <br><br>
                        <h4>Top five reasons to try Brainetics</h4>

                        <div class="reasons">
                            <div class="reason">
                                Brainetics will<br>
                                help kids in school,<br>
                                and in their career
                            </div>

                            <div class="reason">
                                Gives your child<br>
                                an edge<br>
                                over other students.
                            </div>

                            <div class="reason">
                                Brainetics<br>
                                is FUN!
                            </div>

                            <div class="reason">
                                Watch grades<br>
                                soar along with<br>
                                your child's<br>
                                self-esteem
                            </div>

                            <div class="reason">
                                Brainetics<br>
                                really works!
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End of container -->
        </div>


<!--#include file="bottomcta.html"-->


<!--#include file="footer.html"-->
     <!--#include file="popups.html"-->

  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
