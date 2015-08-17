// JavaScript Document

$(document).ready(function () {

    //paypal open	
    $(".openPaypal").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 387,
        height: 406,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                locked: false,
                css: {
                    'background': 'rgba(0,0,0,.7)'
                }
            }
        }
    });


    $('.showcard,#mikecard').hover(function () {
	$('#mikecard').toggle();
});
/* faq functionality */

	$('.collapse').on('show', function(){
    $(this).parent().find(".icon-plus").removeClass("icon-plus").addClass("icon-minus");
	$(this).parent().find(".faq-question").addClass("hotpink");
}).on('hide', function(){
    $(this).parent().find(".icon-minus").removeClass("icon-minus").addClass("icon-plus");
	$(this).parent().find(".faq-question").removeClass("hotpink");
});

// toggle shipping price if Canada

//$(function() {
//    $('#ctl00_ddlCountry').change(function(){
//        if ($(this).val() == "46") {
//            $('.helper').show();
//        } else {
//           $('.helper').hide();
//        }
//    });
//});
$(function() {
        if ($('#ctl00_ddlCountry').val() == "46") {
            $('.helper').show();
        } else {
            $('.helper').hide();
		}
});


/* overlays */
   
    $(".fancybox").fancybox();


    $(".mgb").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 590,
        height: 850,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });
	
	$(".cvv").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 590,
        height: 710,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });

    $(".included").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 915,
        height: 550,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
    });
	
	$(".comparison").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 887,
        height: 656,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
    });
	
	$(".send_email").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 777,
        height: 547,
		type: 'iframe',
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
    });

    $(".guarantee").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 915,
        height: 352,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
    });
	
		    /*jQuery(".cvv").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 500,
        height: 685,
        autoSize: false,
        closeClick: true,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
    });*/
	
//how it works video toggle

$(".showhow1").bind("click touch", function(e){
	$("#howvid1").show();
	$("#howvid2").hide();
	jwplayer('howvideo1').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/2020_how1.mp4",
	autostart: true,
	image: "//d1f7jvrzd4fora.cloudfront.net/images/a5/2020.JPG",
    primary: "flash",   
	controls: true,
    width: 476, height: 370,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('howvideo2').stop();
	}}
  });
	e.preventDefault();
});	

$(".showhow2").bind("click touch", function(e){
	$("#howvid2").show();
	$("#howvid1").hide();
		jwplayer('howvideo2').setup({
    file: "https://d1f7jvrzd4fora.cloudfront.net/video/how2.mp4",
	autostart: true,
    primary: "flash",   
	controls: true,
    width: 476, height: 370,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('howvideo1').stop();
	}}
  });		
	e.preventDefault();
});	
	
	
	
	
  });

  WebFontConfig = {
    google: { families: [ 'Nunito:400,700:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();

    function MM_showHideLayers() { //v9.0    
    window.scrollTo(0, 0);
    var i, p, v, obj, args = MM_showHideLayers.arguments;
    for (i = 0; i < (args.length - 2); i += 3)
        with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
            v = args[i + 2];
            if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
            obj.visibility = v;
        }
    }

    function paypal_open() {
        $(".openPaypal").trigger('click');
    }