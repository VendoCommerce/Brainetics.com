//function pageLoad() {
//    $(".openexpiresoon").fancybox({
//        fitToView: false,
//        closeBtn: false,
//        width: 641,
//        height: 527,
//        padding: 30,
//        scrolling: 'no',
//        autoSize: false,
//        wrapCSS: 'nowrapper',
//        modal: true,
//        helpers: {
//            overlay: {
//                opacity: 0.6
//            }
//        }
//    });
//}

function open_expire_soon() {
    $(".openexpiresoon").trigger('click');
};

$(".openexpiresoon").fancybox({
    fitToView: false,
    closeBtn: false,
    width: 590,
    height: 1150,
    scrolling: 'no',
    autoSize: false,
    wrapCSS: 'nowrapper',
    modal: true,
    helpers: {
        overlay: {
            opacity: 0.6
        }
    },
afterClose: function () {
    parent.location.reload(true);
}

}); 


function openPopup(pURL, pName, pHeight, pWidth, pTop, pLeft, pAttrib) {
    var url;
    var name;
    var attrib;
    var newWindow;
    ua = navigator.userAgent;
    isMSIE = (ua != null && ua.indexOf("MSIE") != -1);

    if (pURL == '')
    { url = window.location.href; }
    else { url = pURL; }
    name = pName;
    // IE *requires* this...
    if (isMSIE)
    { name = 'newMail'; }
    if (pAttrib == '') {
        attrib = 'scrollbars=no,toolbar=no,location=no,menubar=no,status=no,resizable=no';
        attrib = attrib + ',directories=false,statusbar=false,locationbar=false,ontop=true';
    }
    // location=no
    // copyhistory=no';
    // dependent
    else { attrib = pAttrib; }
    if (pTop != '')
    { attrib = 'top=' + pTop + ',' + attrib; }
    //   else {attrib='top=100,'+attrib;}
    if (pLeft == '')
    { attrib = 'left=' + pLeft + ',' + attrib; }
    //   else {attrib='left=100,'+attrib;}
    if (pHeight == '')
    { attrib = 'height=500,' + attrib; }
    else { attrib = 'height=' + pHeight + ',' + attrib; }
    if (pWidth == '')
    { attrib = 'width=300,' + attrib; }
    else { attrib = 'width=' + pWidth + ',' + attrib; }

    newWindow = window.open(url, name, attrib);
    if (newWindow.focus) { newWindow.focus(); }
}

