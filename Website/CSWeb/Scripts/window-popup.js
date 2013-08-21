var _popupWindow;

$(function () {

	$('.js-popup-window').on('click', function () {

		if (_popupWindow != undefined) {
			_popupWindow.close();
		}

		_popupWindow = window.open($(this).attr('href'), 'Detail', 'toolbar=no,location=no,left=0,top=0,width=500,height=500,status=no,scrollbars=yes,resizable=yes');

		return false;

	});
});