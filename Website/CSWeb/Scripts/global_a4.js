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

/* faq functionality */

	$('.collapse').on('show', function(){
    $(this).parent().find(".icon-plus").removeClass("icon-plus").addClass("icon-minus");
}).on('hide', function(){
    $(this).parent().find(".icon-minus").removeClass("icon-minus").addClass("icon-plus");
});

// toggle shipping price if Canada

$(function() {
    $('#ctl00_ddlCountry').change(function(){
        if ($(this).val() == "46") {
            $('.helper').show();
        } else {
            $('.helper').hide();
        }
    });
});


/* overlays */
   
    $(".fancybox").fancybox();

    $(".included").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 915,
        height: 515,
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
    file: "/content/video/2020_how1.mp4",
	autostart: true,
	image: "/content/images/a4/2020.jpg",
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
    file: "/content/video/how2.mp4",
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