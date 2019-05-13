
// 面向微擎的接口请求方法
function post(url, data, callback, useTip) {
    useTip = useTip == undefined ? true : useTip;
    if (!useTip && callback === false) {
        useTip = false;
    }
    $.post(url, data, function (res) {
        if (typeof res != 'object') {
            xalert('服务器繁忙，请稍后再试。');
            return;
        }
        if (res.errno == 0) {
            xalert(res.message, true, useTip);
            callback && callback(res);
            return;
        }
        if (res.errno == 1000) {
            location.reload();
            return;
        }
        xalert(res.message, false, useTip);
    })
}

// 自定义提示信息
function xalert(message, isSuccess, useTip) {
    if (!useTip) {
        return;
    }
    clearPageTip();
    if (isSuccess) {
        var template = '\
            <div id="pageTip" class="modal fade modal-success" tabindex="-1" role="dialog" aria-hidden="true" style="display: block; padding-right: 17px;">\
                <div class="modal-dialog we7-modal-dialog">\
                    <div class="modal-content">\
                        <div class="modal-body">\
                            <div class="text-center">\
                                <i class="text-success fa fa-check-circle"></i> '+ message + '         \
                            </div>          \
                            <div class="clearfix"></div>\
                        </div>  \
                    </div>\
                </div>\
            </div>\
        ';
        var t = '<div class="alert alert-success" role="alert" id="pageTip" style="position:absolute;width:100%;top:50px;left:0">' + message + '</div>';
        $('.right-content').append(template);
    } else {
        var template = '\
            <div id="pageTip" class="modal fade modal-success" tabindex="-1" role="dialog" aria-hidden="true" style="display: block; padding-right: 17px;">\
                <div class="modal-dialog we7-modal-dialog">\
                    <div class="modal-content" style="background-color:#a94442;border-color:#a94442">\
                        <div class="modal-body">\
                            <div class="text-center">\
                                <i class="text-error fa fa-exclamation-circle"></i> '+ message + '         \
                            </div>          \
                            <div class="clearfix"></div>\
                        </div>  \
                    </div>\
                </div>\
            </div>\
        ';
        var t = '<div class="alert alert-danger" role="alert" id="pageTip" style="position:absolute;width:100%;top:50px;left:0">' + message + '</div>';
        $('.right-content').append(template);
    }
    setTimeout(function () {
        $('#pageTip').addClass('in');
    }, 1);
    clearPageTip(2000);
}

var frame_clearTimeout = null;

// 清除信息
function clearPageTip(delay) {
    clearTimeout(frame_clearTimeout);
    delay = delay || 0;
    if (delay == 0) {
        $('#pageTip').remove();
        return true;
    }
    frame_clearTimeout = setTimeout(function () {
        $('#pageTip').remove();
    }, delay + 300)
}

// 验证是否为json字符串
function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

// ajax请求不跳转
$(function () {
    $('.ajax-post').on('click', function () {

        if ($(this).hasClass('confirm')) {
            if (!confirm($(this).attr('data-confirm') || '继续执行当前操作吗？')) {
                return false;
            }
        }

        var url = $(this).prop('href') || $(this).attr('url');
        var data = $('#form').serialize();
        if (url == undefined) {
            return false;
        }
        post(url, data, function () {
            setTimeout(function () {
                location.reload();
            }, 2000);
        });
        return false;
    })
});

// 全选，同一页面只能生效一次
$(function () {
    $('.check-all-control').on('click', function () {
        var checkall = $('.check-all');
        var len = checkall.length;
        for (var i = 0; i < len; i++) {
            if (!$(checkall[i]).prop('checked')) {
                checkall.prop('checked', true)
                return;
            }
        }

        checkall.prop('checked', false);
    });
})

// get搜索：表单ID必须为form_search，使用于已筛选列表的分页处理
$(function () {
    $('#form_search').on('submit', function () {
        if ($(this).prop('method') != 'get') {
            return true;
        }
        var protocol = window.location.protocol;
        var host = window.location.host;
        var pathname = window.location.pathname;
        var search = window.location.search;
        var hash = window.location.hash;
        var serializes = $(this).serializeArray();
        var searchIgnore = ($(this).attr('data-search-ignore') || '').split(',');
        var searchObj = {};
        search.substr(1).split('&').forEach(function (item) {
            item = item.split('=');
            searchObj[item[0]] = item[1];
        });
        serializes.forEach(function (item) {
            searchObj[item.name] = item.value;
        });
        search = [];
        for (key in searchObj) {
            if (searchIgnore.indexOf(key) >= 0) {
                continue;
            }
            search.push(key + '=' + searchObj[key]);
        }
        search = '?' + search.join('&');
        var href = protocol + '//' + host + pathname + search + hash;
        location.href = href;
        return false;
    });
});


// rgb颜色值转为十六进制颜色值
function RGBToHex(rgb) {
    var regexp = /[0-9]{0,3}/g;
    var re = rgb.match(regexp);//利用正则表达式去掉多余的部分，将rgb中的数字提取
    var hexColor = "#"; var hex = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
    for (var i = 0; i < re.length; i++) {
        var r = null, c = re[i], l = c;
        var hexAr = [];
        while (c > 16) {
            r = c % 16;
            c = (c / 16) >> 0;
            hexAr.push(hex[r]);
        } hexAr.push(hex[c]);
        if (l < 16 && l != "") {
            hexAr.push(0)
        }
        hexColor += hexAr.reverse().join('');
    }
    //alert(hexColor)
    return hexColor;
}

// 倒计时
$(function () {
    function changeViewTime(outtime, parentSelector) {
        var second = outtime % 60;
        $(parentSelector + ' .viewtime-second').text(second);
        var minute = (outtime - second) / 60 % 60;
        $(parentSelector + ' .viewtime-minute').text(minute);
        var hour = (outtime - second - minute * 60) / (60 * 60) % 24;
        $(parentSelector + ' .viewtime-hour').text(hour);
        var day = (outtime - second - minute * 60 - hour * 60 * 60) / (60 * 60 * 24);
        $(parentSelector + ' .viewtime-day').text(day);
        if (outtime <= 0) {
            return;
        }

        outtime--;
        setTimeout(function () {
            changeViewTime(outtime, parentSelector);
        }, 1000);
    }
    window.changeViewTime = changeViewTime;
});

// 播放音乐
$(function () {
    function autoplay(music, toggleSelector, callback) {
        wx.ready(function () {
            var audio = new Audio();
            audio.src = music;
            if (!$(toggleSelector).hasClass('off')) {
                audio.volume = 0.7;
                audio.loop = true;
                audio.play();
            }
            $(toggleSelector).on('click', function () {
                if ($(toggleSelector).hasClass('off')) {
                    callback && callback(true);
                    $(toggleSelector).removeClass('off');
                    audio && audio.play();
                } else {
                    callback && callback(false);
                    $(toggleSelector).addClass('off');
                    audio && audio.pause();
                }
            });
        });
    }
    window.autoplay = autoplay;
});


// 动态图片转为可保存图片（ios端兼容）
$(function () {
    function img2base64(imageSelector, imageprop) {
        var imgresource = new Image();
        imgresource.src = $(imageSelector).prop(imageprop || 'src');
        imgresource.onload = function () {
            $(imageSelector).prop('src', getBase64Image(this));
        }
    }
    function getBase64Image(img) {
        var canvas = document.createElement("canvas");
        canvas.width = img.width;
        canvas.height = img.height;
        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, img.width, img.height);
        var dataURL = canvas.toDataURL("image/png");
        return dataURL // return dataURL.replace("data:image/png;base64,", ""); 
    }
    window.img2base64 = img2base64;
});

// 解决活动详情显示过长问题
$(function () {
    $('.limithigh').each(function (index, item) {
        var _this = this;
        if ($(this).height() <= 180) {
            return false;
        }
        $(this).css({
            'height': 120,
            'overflow': 'hidden',
            'position': 'relative'
        });
        var showBoth = $('<div>').css({
            'position': 'absolute',
            'bottom': '0',
            'left': '0',
            'z-index': '999',
            'width': '100%',
            'height': '80',
            'text-align': 'center',
            'background-image': 'linear-gradient(-180deg,rgba(255,255,255,0) 0%,#fff 70%)'
        });
        var showBtn = $('<a>').prop('href', 'javascript:;').css({
            'display': 'inline-block',
            'margin-top': '60px',
            'color': '#ca0c16',
            'font-size': '14px',
            'text-decoration': 'underline'
        }).text('点击显示全部').on('click', function () {
            $(_this).css('height', 'auto');
            showBoth.hide();
        });
        showBoth.append(showBtn);
        $(this).append(showBoth);
    });
});


// 遮罩层 outer
$(function () {
    $('.outer-show').on('click', function () {
        $('#' + $(this).data('outerid')).addClass('show');
    });
    $('.outer-close').on('click', function () {
        $(this).parents('.outer').removeClass('show');
    });
});