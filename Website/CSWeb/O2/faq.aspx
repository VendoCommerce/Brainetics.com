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
<div id="faqs">
            <div  class="container">
                <!--#include file="sidecta.html"-->

                <h1>Frequently Asked Questions</h1>

                <ul>
                    <li class="clicked">
                        Does Brainetics just help with math
                    	<div>No - Brainetics techniques can apply to all aspects of your life. Try Brainetics and see for yourself how much it can improve many different parts of your life!</div>
                    </li>
                    <li>
                        What makes Brainetics so fun?
                        <div>Brainetics was created with fun in mind – if it wasn't fun and engaging, Mike scrapped it and thought of something else. The result: Brainetics is wall-to-wall fun learning!</div>
                    </li>
                    <li>
                        Do I Have the right computer for Brainetics?
                        <div>Yes - Brainetics is not software, it's a DVD program, so as long as your computer has a video player, you can watch Brainetics!</div>
                    </li>
                    <li>
                        Do I have to help my child along with Brainetics?
                        <div>No. By design, Brainetics is an independent learning program. But valuable processing and thought development skills are great for everyone in the family, so why not get everyone involved!</div>
                    </li>
                    <li>
                        How long does Brainetics take?
                        <div>There are about 20 sections in the Brainetics program. Everyone should go at their own pace, but each section takes approximately 15-20 minutes to learn and then there is also additional practice time to master the concepts. Anyone using Brainetics should master each section before moving to the next one.</div>
                    </li>
                    <li>
                        My child is learning disabled - can he still do Brainetics?
                        <div>Since Brainetics is a learn-at-your-own-pace program, learning disabled children and gifted children alike can master Brainetics concepts. Many students find that the confidence they gain by succeeding in math helps them in other areas of life as well.</div>
                    </li>
                    <li>
                        Who created Brainetics?
                        <div>Brainetics was created by one of the world's fastest mathematical minds, Mike Byster. With Brainetics techinques, Mike is teaching kids all over how to do complex math in their head faster than ever!</div>
                    </li>
                    <li>
                        How do teachers fell about Brainetics?
                       <div>Teachers love Brainetics because it gets kids motivated to learn and practice math, which is often the most challenging part of the teaching process.</div>
                    </li>
                </ul>
                <script type="text/javascript">
                    // Behaviour for the questions in the FAQs.
                    $(document).ready(function () {
                        $("#faqs ul li").click(function () {
                            $("#faqs ul li").removeClass("clicked");
                            $(this).addClass("clicked");
                        })
                    });
                </script>

                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>

<%--<uc:ShippingFormControl runat="server" RedirectUrl="AddProduct.aspx" />--%>
<!--#include file="bottomcta.html"-->
<!--#include file="footer.html"-->
<!--#include file="popups.html"-->
  <uc:TrackingPixels ID="TrackingPixels" runat="server" />
 </form>
</body>
</html>
