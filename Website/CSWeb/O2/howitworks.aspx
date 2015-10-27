<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.O2.Store.index" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingForm.ascx" TagName="ShippingFormControl" TagPrefix="uc" %>


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
<div id="how_it_works">
            <div  class="container">
                <div class="videos">

                    <!--#include file="sidecta.html"-->

                    <h1>Get the Brainetics Advantage for School, Work - For Life!</h1>

                    <div class="videos">
                        <iframe width="760" height="430" frameborder="0" allowfullscreen
                                src="https://www.youtube.com/embed/videoseries?list=PLAa2xEQdnBI8wPQcxfLdGYB0k4qA4E6va">
                        </iframe>
                    </div>
                </div>

                <div class="athletics">
                    <h3>Brainetics is athletics for your brain!</h3>

                    <p class="text-center">Brainetcis teaches you to use your brain more efficiently to process and memorize information so you can do amazing things with math and memory!</p>

                    <br>

                    <div class="box orange">
                        <div class="bignumber one">1</div>
                        <div class="title">Brainetics is the key to soaring <br> confidence... and grades!</div>
                        <p>You're getting an edge on every other student in the classroom and every other co-worker in your office with Brainetics! That's because Brainetics techniques are not taught In classrooms, so you're processing information faster than anyone, because you've got the Bran.. secret!</p>
                    </div>

                    <div class="box cyan">
                        <div class="bignumber two">2</div>
                        <div class="title">Muscle memory</div>
                        <p>With Brainetics, you're practicing tricks for doing math quickly and correctly in a way that becomes second nature. In time, you're rattling off answers to math problems you never thought possible - all because you've practiced Brainetics techniques!</p>
                    </div>

                    <div class="box green">
                        <div class="bignumber three">3</div>
                        <div class="title">Get your brain working fast!</div>
                        <p>By learning Brainetics techniques, you're training2 parts of your brain to work independently yet at the same time, so while one peals memorizing, the other part of your brain is processing new information. Your brain is more powerful this way becausa it's working so efficiently- giving you an edge for life!</p>
                    </div>

                </div>

                <div class="how_it_works">
                    <h2>How it works</h2>

                    <div class="row">
                        <div class="col md-4">
                            <div>
                                <div class="text-center"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/how_it_works/dvds.png" alt="" /></div>
                                <div class="title">Watch the DVD's</div>
                                <div class="text">The Brainetics DVD's are a fun and easy way to learn how to concentrate, improve your memory, overcome learning anxieties and develop skills that will help you succeed in school, at work and in life!</div>
                            </div>
                        </div>
                        <div class="col md-4">
                            <div>
                                <div class="text-center"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/how_it_works/playbook.png" alt="" /></div>
                                <div class="title">Read the books</div>
                                <div class="text">The Brainetics, full color IMeractive, playbook helps you practice as well as master the Brainetics secrets.</div>
                            </div>
                        </div>
                        <div class="col md-4">
                            <div>
                                <div class="text-center"><img src="//d1f7jvrzd4fora.cloudfront.net/images/o2/how_it_works/cards.png" alt="" /></div>
                                <div class="title">Play the games</div>
                                <div class="text">The Brainetics Games can be fun for the whole family. You can practice and leam while you're having fun!</div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
        </div>



 <%--<uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" /> --%>

<!--#include file="bottomcta.html"-->

<!--#include file="footer.html"-->
<!--#include file="popups.html"-->
  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
