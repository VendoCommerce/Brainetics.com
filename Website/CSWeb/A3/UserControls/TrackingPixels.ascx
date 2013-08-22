﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackingPixels.ascx.cs" Inherits="CSWeb.A3.UserControls.TrackingPixels" %>
<!-- All Pixels Here -->

<asp:Panel ID="pnlHomePage" runat="server" Visible="false">
    
    
</asp:Panel>

<asp:Panel ID="pnlAllPages" runat="server" Visible="false">

<!-- HitsLink.com tracking script -->
<script type="text/javascript" id="wa_u" defer></script>
<script type="text/javascript" async>//<![CDATA[
    var wa_pageName = location.pathname;    // customize the page name here;
    wa_account = "9D8D9E96919A8B969C8C"; wa_location = 214;
    wa_MultivariateKey = '<%= GetVersionName() %>';    //  Set this variable to perform multivariate testing
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
        ga('send', 'pageview');

    </script>

</asp:Panel>
<asp:Panel ID="pnlHomeAndSubPages" runat="server" Visible="false">

</asp:Panel>
<asp:Panel ID="pnlCartPages" runat="server" Visible="false">
    
  
</asp:Panel>

<asp:Panel ID="pnlReceiptPage" runat="server" Visible="false">
    <!-- HitsLink.com tracking script -->
<script type="text/javascript" id="wa_u" defer></script>
<script type="text/javascript" async>//<![CDATA[
    var wa_pageName = location.pathname;    // customize the page name here;
    wa_account = "9D8D9E96919A8B969C8C"; wa_location = 214;
    wa_MultivariateKey = '<%= GetVersionName() %>';    //  Set this variable to perform multivariate testing
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
pageTracker._trackPageview();
    <asp:Literal ID="litGAReceiptPixel" runat="server" />

        pageTracker._trackTrans();
} else {
hndl = window.setTimeout('StartTracking()', 1000);
}
}       
    </script>
      

</asp:Panel>

