<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoaderOverlay.ascx.cs" Inherits="CSWeb.RETARGETING.UserControls.LoaderOverlay" %>

<script type="text/javascript">

    if (typeof (ValidatorUpdateIsValid) != 'undefined') {
        var pointerToMicrosoftValidator = ValidatorUpdateIsValid;
        ValidatorUpdateIsValid = function () {
            pointerToMicrosoftValidator();
            if (Page_IsValid) {

            } else {
                MM_showHideLayers('mask', '', 'hide');
            }
            // do something after Microsoft finishes 
        }
    }
</script>
        
<div id="mask" style="position:fixed; width: 100%; height: 100%; background: url(//d1f7jvrzd4fora.cloudfront.net/images/mask_bg.png) repeat; top: 0; left: 0; z-index: 100; visibility:hidden;">
    <div style="margin: 250px auto; position:relative; width: 312px; height: 170px; background: white; text-align:center;">

  <p style="margin: 0; padding: 20px 0 10px 0;">
          <img src="//d1f7jvrzd4fora.cloudfront.net/images/loading-gif-animation.gif" style="width: 36px;height: 36px" />
        </p>
        <p style="color: black; text-align:center; font-size: 12px; margin: 0 23px; line-height: 19px;">Your order is currently being processed. <br />
            Please do not exit or refresh this page to ensure that your order is processed accurately.</p>

    </div>

</div>