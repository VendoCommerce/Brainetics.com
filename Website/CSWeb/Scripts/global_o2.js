// JavaScript Document

$(document).ready(function () {
     $(this).scrollTop(0); 

/* try scroll functionality */
	
$('a.try,area.try').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    return false;
});

$('.showcard,#mikecard').hover(function(){
	$('#mikecard').toggle();
});
/* faq functionality */

	$('.collapse').on('show', function(){
    $(this).parent().find(".icon-plus").removeClass("icon-plus").addClass("icon-minus");
}).on('hide', function(){
    $(this).parent().find(".icon-minus").removeClass("icon-minus").addClass("icon-plus");
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
   $(".fancynowrap").fancybox({
        wrapCSS: 'nowrapper', 
        padding: 0,
        closeBtn: false,
        scrolling: 'no',
        closeClick: false,
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(255,255,255,.8)'
					}
            }
        }
   });
   
    $(".fancybox").fancybox();

    $(".included").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 630,
        height: 782,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(0,0,0,.8)'
					}
            }
        }
    });
	
	    $(".terms").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 877,
        height: 489,
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
        width: 787,
        height: 567,
		type: 'iframe',
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(0,0,0,.8)'
					}
            }
        }
    });

    $(".guarantee").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 654,
        height: 434,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
				locked: false,
				css : {
					'background' : 'rgba(0,0,0,.8)'
					}
            }
        }
    });
	
		    jQuery(".cvv").fancybox({
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
    });
	
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
    width: 448, height: 336,
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
    width: 448, height: 336,
	stretching: 'exactfit',
	skin: '/scripts/jwplayer/five.xml',
	events:{
	onPlay: function() {
   	jwplayer('howvideo1').stop();
	}}
  });		
	e.preventDefault();
});	


  
  
	
	

$('.color_radio input:radio').change(function(){
    if($('.select_blue input:radio').is(":checked")) {
        $('.select_blue').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Blue.jpg');
    } else  $('.select_blue').removeClass("bordered");


    if($('.select_gray input:radio').is(":checked")) {
        $('.select_gray').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Grey.jpg');
    } else  $('.select_gray').removeClass("bordered");
	
	    if($('.select_pink input:radio').is(":checked")) {
        $('.select_pink').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Pink.jpg');
    } else  $('.select_pink').removeClass("bordered");
	
	    if($('.select_peacock input:radio').is(":checked")) {
        $('.select_peacock').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Green.jpg');
    } else  $('.select_peacock').removeClass("bordered");
	
	    if($('.select_owl input:radio').is(":checked")) {
        $('.select_owl').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Owl.jpg');
    } else  $('.select_owl').removeClass("bordered");
});
}); // end document ready


//trigger the color selector outlines
function pageLoad() //use to resolve postback issues
{

    if($('.select_blue input:radio').is(":checked")) {
        $('.select_blue').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Blue.jpg');
    }

    if($('.select_gray input:radio').is(":checked")) {
        $('.select_gray').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Grey.jpg');
    }
	
	    if($('.select_pink input:radio').is(":checked")) {
        $('.select_pink').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Pink.jpg');
    }
	
	    if($('.select_peacock input:radio').is(":checked")) {
        $('.select_peacock').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Green.jpg');
    }
	
	    if($('.select_owl input:radio').is(":checked")) {
        $('.select_owl').addClass("bordered");
		$('.selected_color img').attr('src', '//d1f7jvrzd4fora.cloudfront.net/images/Swatch_Owl.jpg');
    }


} //end page load function


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