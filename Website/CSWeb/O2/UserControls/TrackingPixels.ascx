<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackingPixels.ascx.cs" Inherits="CSWeb.O2.UserControls.TrackingPixels" %>
<!-- All Pixels Here -->


<script type='text/javascript'>
    var ebRand = Math.random()+'';
    ebRand = ebRand * 1000000;
    //<![CDATA[ 
    document.write('<scr'+'ipt src="HTTPS://bs.serving-sys.com/Serving/ActivityServer.bs?cn=as&amp;ActivityID=764090&amp;rnd=' + ebRand + '"></scr' + 'ipt>');
    //]]>
</script>
<noscript>
<img width="1" height="1" style="border:0" src="HTTPS://bs.serving-sys.com/Serving/ActivityServer.bs?cn=as&amp;ActivityID=764090&amp;ns=1"/>
</noscript>
<asp:Panel ID="pnlHomePage" runat="server" Visible="false">
    
    
</asp:Panel>

<asp:Panel ID="pnlPoseSale" runat="server" Visible="false">
<!-- Rejoiner Conversion -->
<script type='text/javascript'>
    var _rejoiner = _rejoiner || [];
    _rejoiner.push(['setAccount', '53ac7676281cb7211fde64a9']);
    _rejoiner.push(['setDomain', '.brainetics.com']);
    _rejoiner.push(['sendConversion']);
    (function() {
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://s3.amazonaws.com/rejoiner/js/v3/t.js';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
    })();
</script>
<script type='text/javascript'>
    _rejoiner.push(['setCartData', {'customer_order_number': '<%= CartContext.OrderId.ToString() %>'}]);
</script>
<!-- End Rejoiner Conversion -->
    
</asp:Panel>

<asp:Panel ID="pnlAllPages" runat="server" Visible="false">

    <!-- AdRoll Retargeting Pixel - 6-13-2014 -->
    <script type="text/javascript">
        adroll_adv_id = "N7DMRUYYZ5CIFCNCMGHOAP";
        adroll_pix_id = "FDWNHPELWFAGFNTPCLQHJJ";
        (function () {
            var oldonload = window.onload;
            window.onload = function(){
                __adroll_loaded=true;
                var scr = document.createElement("script");
                var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
                scr.setAttribute('async', 'true');
                scr.type = "text/javascript";
                scr.src = host + "/j/roundtrip.js";
                ((document.getElementsByTagName('head') || [null])[0] ||
                 document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
                if(oldonload){oldonload()}};
        }());
    </script>


    <script type="text/javascript">
        var newPageName = '/' +
            <%=versionNameClientFunction %> + window.location.pathname +
            window.location.search;    
    </script>
    
    <!-- Google Code for Brainetics -->
    <!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
    <script type="text/javascript">
/* <![CDATA[ */
        var google_conversion_id = 968816316;
        var google_conversion_label = "rg2ECOTSzggQvO37zQM";
        var google_custom_params = window.google_tag_params;
        var google_remarketing_only = true;
/* ]]> */
    </script>
    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
    </script>
    <noscript>
        <div style="display:inline;">
            <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/968816316/?value=1.000000&amp;label=rg2ECOTSzggQvO37zQM&amp;guid=ON&amp;script=0"/>
        </div>
    </noscript>

    <!-- HitsLink.com tracking script -->
    <script type="text/javascript" id="wa_u" defer></script>
    <script type="text/javascript" async>//<![CDATA[
        var wa_pageName = location.pathname;    // customize the page name here;
        wa_account = "9D8D9E96919A8B969C8C"; wa_location = 214;
        wa_MultivariateKey = <%=versionNameClientFunction %>;    //  Set this variable to perform multivariate testing
        var wa_c = new RegExp('__wa_v=([^;]+)').exec(document.cookie), wa_tz = new Date(),
            wa_rf = document.referrer, wa_sr = location.search, wa_hp = 'http' + (location.protocol == 'https:' ? 's' : '');
        if (top !== self) { wa_rf = top.document.referrer; wa_sr = top.location.search }
        if (wa_c != null) { wa_c = wa_c[1] } else {
            wa_c = wa_tz.getTime();
            document.cookie = '__wa_v=' + wa_c + ';path=/;expires=1/1/' + (wa_tz.getUTCFullYear() + 2);
        } wa_img = new Image();
        wa_img.src = wa_hp + '://counter.hitslink.com/statistics.asp?v=1&s=214&eacct=' + wa_account + '&an=' +
                escape(navigator.appName) + '&sr=' + escape(wa_sr) + '&rf=' + escape(wa_rf) + '&mvk=' + escape(wa_MultivariateKey) +
                '&sl=' + escape(navigator.systemLanguage) + '&l=' + escape(navigator.language) +
                '&pf=' + escape(navigator.platform) + '&pg=' + escape(wa_pageName) + '&cd=' + screen.colorDepth + '&rs=' + escape(screen.width +
                    ' x ' + screen.height) + '&je=' + navigator.javaEnabled() + '&c=' + wa_c + '&tks=' + wa_tz.getTime()
            ; document.getElementById('wa_u').src = wa_hp + '://counter.hitslink.com/track.js';//]]>
    </script>

    <!-- Google Analytics Pixel -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-42891472-2', 'brainetics.com');
        ga('require', 'displayfeatures');
        ga('send', 'pageview', { 'page': newPageName });

    </script>

</asp:Panel>
<asp:Panel ID="pnlHomeAndSubPages" runat="server" Visible="false">

</asp:Panel>
<asp:Panel ID="pnlCartPages" runat="server" Visible="false">
  <!-- Rejoiner Tracking -->
    <script type='text/javascript'>
        var _rejoiner = _rejoiner || [];
        _rejoiner.push(['setAccount', '53ac7676281cb7211fde64a9']);
        _rejoiner.push(['setDomain', '.brainetics.com']);
        (function() {
            var s = document.createElement('script'); s.type = 'text/javascript';
            s.async = true;
            s.src = 'https://s3.amazonaws.com/rejoiner/js/v3/t.js';
            var x = document.getElementsByTagName('script')[0];
            x.parentNode.insertBefore(s, x);
        })();
    </script>
    <script type='text/javascript'>
        _rejoiner.push(['setCartData', {
            'value': '<%=  Math.Round(CartContext.CartInfo.SubTotalFullPrice, 2).ToString().Replace(".", "") %>',
            'totalItems': '<%= CartContext.CartInfo.ItemCount.ToString() %>',
            'returnUrl': 'https://www.brainetics.com/<%=GetVersionName() %>/'
        }]);
        
        <%= rejoinerPixel %>
    </script>
<!-- End Rejoiner Tracking -->

  
</asp:Panel>

<asp:Panel ID="pnlReceiptPage" runat="server" Visible="false">


    <!-- AdRoll Retargeting Pixel - Conversion - 6-13-2014 -->
    <script type="text/javascript">
        adroll_conversion_value_in_dollars = '<%= CurrentOrder.FullPriceSubTotal.ToString() %>';
        adroll_custom_data = {"ORDER_ID": "<%= CurrentOrder.OrderId.ToString() %>"};

        adroll_adv_id = "N7DMRUYYZ5CIFCNCMGHOAP";
        adroll_pix_id = "FDWNHPELWFAGFNTPCLQHJJ";
        (function () {
            var oldonload = window.onload;
            window.onload = function(){
                __adroll_loaded=true;
                var scr = document.createElement("script");
                var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
                scr.setAttribute('async', 'true');
                scr.type = "text/javascript";
                scr.src = host + "/j/roundtrip.js";
                ((document.getElementsByTagName('head') || [null])[0] ||
                 document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
                if(oldonload){oldonload()}};
        }());
    </script>


    <!-- HitsLink.com tracking script -->
    <script type="text/javascript" id="wa_u" defer></script>
    <script type="text/javascript" async>//<![CDATA[
        var wa_pageName = location.pathname;    // customize the page name here;
        wa_account = "9D8D9E96919A8B969C8C"; wa_location = 214;
        wa_MultivariateKey = <%=versionNameClientFunction %>;    //  Set this variable to perform multivariate testing
        ec_Orders_orderID = '<%= CurrentOrder.OrderId.ToString() %>';      //  Enter the Orders unique ID
        ec_Orders_orderAmt = '<%= CurrentOrder.Total.ToString() %>';  //  Enter the amount of the Orders
        var wa_c = new RegExp('__wa_v=([^;]+)').exec(document.cookie), wa_tz = new Date(),
            wa_rf = document.referrer, wa_sr = location.search, wa_hp = 'http' + (location.protocol == 'https:' ? 's' : '');
        if (top !== self) { wa_rf = top.document.referrer; wa_sr = top.location.search }
        if (wa_c != null) { wa_c = wa_c[1] } else {
            wa_c = wa_tz.getTime();
            document.cookie = '__wa_v=' + wa_c + ';path=/;expires=1/1/' + (wa_tz.getUTCFullYear() + 2);
        } wa_img = new Image();
        wa_img.src = wa_hp + '://counter.hitslink.com/statistics.asp?v=1&s=214&eacct=' + wa_account + '&an=' +
                escape(navigator.appName) + '&sr=' + escape(wa_sr) + '&rf=' + escape(wa_rf) + '&mvk=' + escape(wa_MultivariateKey) +
                '&sl=' + escape(navigator.systemLanguage) + '&l=' + escape(navigator.language) +
                '&pf=' + escape(navigator.platform) + '&pg=' + escape(wa_pageName) + '&cd=' + screen.colorDepth + '&rs=' + escape(screen.width +
                    ' x ' + screen.height) + '&je=' + navigator.javaEnabled() + '&c=' + wa_c + '&tks=' + wa_tz.getTime()
                + '&ec_type=126896&ec_uniqueId=' + ec_Orders_orderID + '&ec_orderAmount=' + ec_Orders_orderAmt
            ; document.getElementById('wa_u').src = wa_hp + '://counter.hitslink.com/track.js';//]]>
    </script>

    <script type="text/javascript">
        var newPageName = '/' +
            <%=versionNameClientFunction %> + window.location.pathname +
            window.location.search;    
    </script>

    <!-- Google Analytics Ecommerce Pixel -->
    <script type="text/javascript">
        
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        var hndl = window.setTimeout('StartTracking()', 100);
        function StartTracking(){
            if (typeof(_gat) == 'object')
            {
                window.clearTimeout(hndl);
                var pageTracker =_gat._getTracker('UA-42891472-2');
                pageTracker._initData();
                pageTracker._trackPageview(newPageName);
                <asp:Literal ID="litGAReceiptPixel" runat="server" />

                pageTracker._trackTrans();
            } else {
                hndl = window.setTimeout('StartTracking()', 1000);
            }
        }       
    </script>
      
    <!-- Google Code for Sale Conversion Page -->
    <script type="text/javascript">
/* <![CDATA[ */
        var google_conversion_id = 968816316;
        var google_conversion_language = "en";
        var google_conversion_format = "2";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "KX5OCOzRzggQvO37zQM";
        var google_conversion_value = "<%=cartTotal %>";
        var google_remarketing_only = false;
/* ]]> */
    </script>
    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
    </script>
    <noscript>
        <div style="display:inline;">
            <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/968816316/?value=1.000000&amp;label=KX5OCOzRzggQvO37zQM&amp;guid=ON&amp;script=0"/>
        </div>
    </noscript>

    <!-- Bing Conversion Pixel -->
    <script type="text/javascript">    if (!window.mstag) mstag = { loadTag: function () { }, time: (new Date()).getTime() };</script> <script id="mstag_tops" type="text/javascript" src="//flex.msn.com/mstag/site/818483c7-c4a9-4546-8395-99eb37baf5aa/mstag.js"></script> <script type="text/javascript">                                                                                                                                                                                                                                                                              mstag.loadTag("analytics", { dedup: "1", domainId: "1263508", type: "1", revenue: "", actionid: "36417" })</script> <noscript> <iframe src="//flex.msn.com/mstag/tag/818483c7-c4a9-4546-8395-99eb37baf5aa/analytics.html?dedup=1&domainId=1263508&type=1&revenue=&actionid=36417" frameborder="0" scrolling="no" width="1" height="1" style="visibility:hidden;display:none"> </iframe> </noscript>

<script type='text/javascript'>
    var ebRev = '<%=cartTotal.ToString("N2") %>';
    var ebOrderID = '<%= CurrentOrder.OrderId.ToString() %>';
    var ebProductID = '<%= ProductID %>';
    var ebProductInfo = '<%= ProductID %>';
    var ebQuantity = '<%= TotalQty.ToString() %>';
    var ebRand = Math.random()+'';
    ebRand = ebRand * 1000000;
    //<![CDATA[ 
    document.write('<scr'+'ipt src="HTTPS://bs.serving-sys.com/Serving/ActivityServer.bs?cn=as&amp;ActivityID=739313&amp;rnd=' + ebRand + '&amp;Value='+ebRev+'&amp;OrderID='+ebOrderID+'&amp;ProductID='+ebProductID+'&amp;ProductInfo='+ebProductInfo+'&amp;Quantity='+ebQuantity+'"></scr' + 'ipt>');
    //]]>
</script>
<noscript>
    <img width="1" height="1" style="border:0" src="HTTPS://bs.serving-sys.com/Serving/ActivityServer.bs?cn=as&amp;ActivityID=739313&amp;Value=<%=cartTotal.ToString("N2") %>&amp;OrderID=<%= CurrentOrder.OrderId.ToString() %>&amp;ProductID=<%= ProductID %>&amp;ProductInfo=<%= ProductID %>&amp;Quantity=<%= TotalQty.ToString() %>&amp;ns=1"/>
</noscript>
</asp:Panel>

