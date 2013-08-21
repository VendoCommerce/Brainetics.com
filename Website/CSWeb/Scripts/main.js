if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function (obj, start) {
		for (var i = (start || 0), j = this.length; i < j; i++) {
			if (this[i] === obj) { return i; }
		}
		return -1;
	};
}

var _offer = '';
var _isMobile;
var _mobileElem;

jQuery(document).ready(function (e) {

	_mobileElem = $('.is-mobile');

	_isMobile = _mobileElem.filter(':visible').length > 0;
	$(window).resize(function () {
		_isMobile = _mobileElem.filter(':visible').length > 0;
	});

	$('.tabs-menu a').on('click', function () {
		$('.tabs-menu a').removeClass('active');
		$(this).addClass('active');
		tabState();
	});

	tabState();
	
	
	
	
	
	
});

function tabState() {
	var activeTab = $('.tabs-menu .active').data('tab-id');
	$('.tabs-wr .tab-kit').attr('hidden', '').filter('#' + activeTab).removeAttr('hidden');
}


$(document).ready(function()
{
	
// make default text on input boxes 

    $(".defaultText").focus(function(srcc)
    {
        if ($(this).val() == $(this)[0].title)
        {
            $(this).val("");
        }
    });
    
    $(".defaultText").blur(function()
    {
        if ($(this).val() == "")
        {
            $(this).val($(this)[0].title);
        }
    });
    
    $(".defaultText").blur();   
	
	
//show/hide shipping info on checkbox click
$('.shippingdifferent').prop('checked', false); 
    $(".shippingdifferent").click(function() {
        $(".shipping-info").slideToggle(500);
	});
	     
});