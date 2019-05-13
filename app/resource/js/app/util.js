! function(e) {
    var i = {};
    i.dialog = function(e, i, t, a) {
        a || (a = {}), a.containerName || (a.containerName = "modal-message");
        var n = $("#" + a.containerName);
        0 == n.length && ($(document.body).append('<div id="' + a.containerName + '" class="modal animated" tabindex="-1" role="dialog" aria-hidden="true"></div>'), n = $("#" + a.containerName));
        var o = '<div class="modal-dialog modal-sm">\t<div class="modal-content">';
        if (e && (o += '<div class="modal-header">\t<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>\t<h3>' + e + "</h3></div>"), i && ($.isArray(i) ? o += '<div class="modal-body">正在加载中</div>' : o += '<div class="modal-body">' + i + "</div>"), t && (o += '<div class="modal-footer">' + t + "</div>"), o += "\t</div></div>", n.html(o), i && $.isArray(i)) {
            var s = function(e) {
                n.find(".modal-body").html(e)
            };
            2 == i.length ? $.post(i[0], i[1]).success(s) : $.get(i[0]).success(s)
        }
        return n
    }, i.image = function(t, a, n) {
        require(["webuploader", "cropper", "previewer"], function(o) {
            var s, r, d, c = i.querystring("i"),
                l = i.querystring("j");
            defaultOptions = {
                pick: {
                    id: "#filePicker",
                    label: "点击选择图片",
                    multiple: !1
                },
                auto: !0,
                swf: "./resource/componets/webuploader/Uploader.swf",
                server: "./index.php?i=" + c + "&j=" + l + "&c=utility&a=file&do=upload&type=image&thumb=0",
                chunked: !1,
                compress: !1,
                fileNumLimit: 1,
                fileSizeLimit: 4194304,
                fileSingleSizeLimit: 4194304,
                crop: !1,
                preview: !1,
                name: ""
            }, "android" == i.agent() && (defaultOptions.sendAsBinary = !0), n = $.extend({}, defaultOptions, n), t && (t = $(t), n.pick = {
                id: t,
                multiple: n.pick.multiple
            }), n.multiple && (n.pick.multiple = n.multiple, n.fileNumLimit = 8), n.crop && (n.auto = !1, n.pick.multiple = !1, n.preview = !1, o.Uploader.register({
                "before-send-file": "cropImage"
            }, {
                cropImage: function(e) {
                    if (!e || !e._cropData) return !1;
                    var i, t, a = e._cropData;
                    return e = this.request("get-file", e), t = o.Deferred(), i = new o.Lib.Image, t.always(function() {
                        i.destroy(), i = null
                    }), i.once("error", t.reject), i.once("load", function() {
                        i.crop(a.x, a.y, a.width, a.height, a.scale)
                    }), i.once("complete", function() {
                        var a, n;
                        try {
                            a = i.getAsBlob(), n = e.size, e.source = a, e.size = a.size, e.trigger("resize", a.size, n), t.resolve()
                        } catch (e) {
                            t.resolve()
                        }
                    }), e._info && i.info(e._info), e._meta && i.meta(e._meta), i.loadFromBlob(e.source), t.promise()
                }
            })), r = o.create(n), t.data("uploader", r), n.preview && (d = mui.previewImage({
                footer: e.util.templates["image.preview.html"]
            }), $(d.element).find(".js-cancel").click(function() {
                d.close()
            }), $(document).on("click", ".js-submit", function(e) {
                var i = $(d.element).find(".mui-slider-group .mui-active").index(),
                    t = n.preview;
                if (d.groups[t] && d.groups[t][i] && d.groups[t][i].el) {
                    var a = "./index.php?i=" + c + "&j=" + l + "&c=utility&a=file&do=delete&type=image",
                        o = $(d.groups[t][i].el).data("id");
                    $.post(a, {
                        id: o
                    }, function(e) {
                        var e = $.parseJSON(e);
                        $(d.groups[t][i].el).remove(), d.close()
                    })
                }
                return e.stopPropagation(), !1
            })), r.on("fileQueued", function(e) {
                i.loading().show(), n.crop && r.makeThumb(e, function(i, t) {
                    r.file = e, i || s.preview(t)
                }, 1, 1)
            }), r.on("uploadSuccess", function(e, t) {
                if (t.error && t.error.message) i.toast(t.error.message, "error");
                else {
                    r.on("uploadFinished", function() {
                        i.loading().close(), r.reset(), s.reset()
                    });
                    var o = $('<img src="' + t.url + '" data-preview-src="" data-preview-group="' + n.preview + '" />');
                    n.preview && d.addImage(o[0]), $.isFunction(a) && a(t)
                }
            }), r.onError = function(e) {
                s.reset(), i.loading().close(), "Q_EXCEED_SIZE_LIMIT" != e ? "Q_EXCEED_NUM_LIMIT" != e ? alert("错误信息: " + e) : i.toast("单次最多上传8张") : alert("错误信息: 图片大于 4M 无法上传.")
            }, s = function() {
                var t, a;
                return {
                    preview: function(o) {
                        return (t = $(e.util.templates["avatar.preview.html"])).css("height", $(e).height()), $(document.body).prepend(t), (a = t.find("img")).attr("src", o), a.cropper({
                            aspectRatio: n.aspectRatio ? n.aspectRatio : 1,
                            viewMode: 1,
                            dragMode: "move",
                            autoCropArea: 1,
                            restore: !1,
                            guides: !1,
                            highlight: !1,
                            cropBoxMovable: !1,
                            cropBoxResizable: !1
                        }), t.find(".js-submit").on("click", function() {
                            var e = a.cropper("getData"),
                                i = s.getImageSize().width / r.file._info.width;
                            e.scale = i, r.file._cropData = {
                                x: e.x,
                                y: e.y,
                                width: e.width,
                                height: e.height,
                                scale: e.scale
                            }, r.upload()
                        }), t.find(".js-cancel").one("click", function() {
                            t.remove(), r.reset()
                        }), i.loading().close(), this
                    },
                    getImageSize: function() {
                        var e = a.get(0);
                        return {
                            width: e.naturalWidth,
                            height: e.naturalHeight
                        }
                    },
                    reset: function() {
                        return $(".js-avatar-preview").remove(), r.reset(), this
                    }
                }
            }()
        })
    }, i.map = function(e, t) {
        require(["map"], function(a) {
            function n(e) {
                s.getPoint(e, function(e) {
                    map.panTo(e), marker.setPosition(e), marker.setAnimation(BMAP_ANIMATION_BOUNCE), setTimeout(function() {
                        marker.setAnimation(null)
                    }, 3600)
                })
            }
            e || (e = {}), e.lng || (e.lng = 116.403851), e.lat || (e.lat = 39.915177);
            var o = new a.Point(e.lng, e.lat),
                s = new a.Geocoder,
                r = $("#map-dialog");
            if (0 == r.length) {
                (r = i.dialog("请选择地点", '<div class="form-group"><div class="input-group"><input type="text" class="form-control" placeholder="请输入地址来直接查找相关位置"><div class="input-group-btn"><button class="btn btn-default"><i class="icon-search"></i> 搜索</button></div></div></div><div id="map-container" style="height:400px;"></div>', '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button><button type="button" class="btn btn-primary">确认</button>', {
                    containerName: "map-dialog"
                })).find(".modal-dialog").css("width", "80%"), r.modal({
                    keyboard: !1
                }), map = i.map.instance = new a.Map("map-container"), map.centerAndZoom(o, 12), map.enableScrollWheelZoom(), map.enableDragging(), map.enableContinuousZoom(), map.addControl(new a.NavigationControl), map.addControl(new a.OverviewMapControl), marker = i.map.marker = new a.Marker(o), marker.setLabel(new a.Label("请您移动此标记，选择您的坐标！", {
                    offset: new a.Size(10, -20)
                })), map.addOverlay(marker), marker.enableDragging(), marker.addEventListener("dragend", function(e) {
                    var i = marker.getPosition();
                    s.getLocation(i, function(e) {
                        r.find(".input-group :text").val(e.address)
                    })
                }), r.find(".input-group :text").keydown(function(e) {
                    13 == e.keyCode && n($(this).val())
                }), r.find(".input-group button").click(function() {
                    n($(this).parent().prev().val())
                })
            }
            r.off("shown.bs.modal"), r.on("shown.bs.modal", function() {
                marker.setPosition(o), map.panTo(marker.getPosition())
            }), r.find("button.btn-primary").off("click"), r.find("button.btn-primary").on("click", function() {
                if ($.isFunction(t)) {
                    var e = i.map.marker.getPosition();
                    s.getLocation(e, function(i) {
                        var a = {
                            lng: e.lng,
                            lat: e.lat,
                            label: i.address
                        };
                        t(a)
                    })
                }
                r.modal("hide")
            }), r.modal("show")
        })
    }, i.toast = function(e, i, t) {
        if (t && "success" != t) {
            if ("error" == t) a = mui.toast('<div class="mui-toast-icon"><span class="fa fa-exclamation-circle"></span></div>' + e)
        } else var a = mui.toast('<div class="mui-toast-icon"><span class="fa fa-check"></span></div>' + e);
        if (i) var n = 3,
            o = setInterval(function() {
                if (n <= 0) return clearInterval(o), void(location.href = i);
                n--
            }, 1e3);
        return a
    }, i.loading = function(e) {
        var e = e || "show",
            i = {};
        if ((t = $(".js-toast-loading")).size() <= 0) var t = $('<div class="mui-toast-container mui-active js-toast-loading"><div class="mui-toast-message"><div class="mui-toast-icon"><span class="fa fa-spinner fa-spin"></span></div>加载中</div></div>');
        return i.show = function() {
            document.body.appendChild(t[0])
        }, i.close = function() {
            t.remove()
        }, i.hide = function() {
            t.remove()
        }, "show" == e ? i.show() : "close" == e && i.close(), i
    }, i.message = function(i, t, a, n) {
        var o = $("<div>" + e.util.templates["message.html"] + "</div>");
        if (o.attr("class", "mui-content fadeInUpBig animated " + mui.className("backdrop")), o.on(mui.EVENT_MOVE, mui.preventDefault), o.css("background-color", "#efeff4"), n && o.find(".mui-desc").html(n), t) {
            var s = t.replace("##auto");
            if (o.find(".mui-btn-success").attr("href", s), t.indexOf("##auto") > -1) var r = 5,
                d = setInterval(function() {
                    if (r <= 0) return clearInterval(d), void(location.href = s);
                    o.find(".mui-btn-success").html(r + "秒后自动跳转"), r--
                }, 1e3)
        }
        o.find(".mui-btn-success").click(function() {
            if (t) {
                var e = t.replace("##auto");
                location.href = e
            } else history.go(-1)
        }), a && "success" != a ? (a = "error") && (o.find(".title").html(i), o.find(".mui-message-icon span").attr("class", "mui-msg-error")) : (o.find(".title").html(i), o.find(".mui-message-icon span").attr("class", "mui-msg-success")), $("html").append(o[0])
    }, i.alert = function(e, i, t, a) {
        return mui.alert(e, i, t, a)
    }, i.confirm = function(e, i, t, a) {
        return mui.confirm(e, i, t, a)
    }, i.pay = function(t) {
        var a = {
            enableMethod: [],
            defaultMethod: "wechat",
            payMethod: "wechat",
            orderTitle: "",
            orderTid: "",
            success: function() {},
            faild: function() {},
            finish: function() {}
        };
        if ((t = $.extend({}, a, t)).orderFee && !(t.orderFee <= 0)) {
            !t.defaultMethod && t.payMethod && (t.defaultMethod = t.payMethod);
            var n = mui.className("active"),
                o = mui.className("backdrop"),
                s = $("#pay-detail-modal").size() > 0 ? $("#pay-detail-modal") : $('<div class="mui-modal ' + n + ' js-pay-detail-modal" id="pay-detail-modal"></div>'),
                r = function(e) {
                    e ? ($(".mui-content")[0].setAttribute("style", "overflow:hidden;"), document.body.setAttribute("style", "overflow:hidden;")) : ($(".mui-content")[0].setAttribute("style", ""), document.body.setAttribute("style", ""))
                },
                d = function() {
                    var e = document.createElement("div");
                    return e.classList.add(o), e.addEventListener(mui.EVENT_MOVE, mui.preventDefault), e.addEventListener("click", function(e) {
                        if (s) return s.remove(), $(d).remove(), document.body.setAttribute("style", ""), !1
                    }), e
                }(),
                c = function(e) {
                    "main" == e ? (s.find(".js-main-modal").show().addClass("fadeInRight animated"), s.find(".js-switch-pay-modal").hide(), s.find(".js-switch-modal").hide()) : "pay" == e && (s.find(".js-main-modal").hide(), s.find(".js-switch-pay-modal").show().addClass("fadeInRight animated"), s.find(".js-switch-modal").show())
                };
            return i.loading().show(), t.enableMethod && t.enableMethod.length > 1 ? $.post("index.php?i=" + e.sysinfo.uniacid + "&j=" + e.sysinfo.acid + "&c=entry&m=core&do=paymethod", {
                module: t.module,
                tid: t.orderTid,
                title: t.orderTitle,
                fee: t.orderFee
            }, function(e) {
                if (i.loading().hide(), s.html(e), d.setAttribute("style", ""), $(document.body).append(s), $(document.body).append(d), r(!0), s.find(".js-switch-modal").click(function() {
                        c("main")
                    }), s.find(".js-switch-pay").click(function() {
                        c("pay")
                    }), s.find(".js-switch-pay-close").click(function() {
                        s.remove(), $(d).remove(), document.body.setAttribute("style", "")
                    }), s.find(".js-order-title").html(t.orderTitle), s.find(".js-pay-fee").html(t.orderFee), !(s.find(".js-switch-pay-modal li").size() > 0)) return i.toast("暂无有效支付方式"), s.remove(), $(d).remove(), document.body.setAttribute("style", ""), !1;
                t.enableMethod && t.enableMethod.length > 0 ? s.find(".js-switch-pay-modal li").each(function() {
                    -1 == $.inArray($(this).data("method"), t.enableMethod) && $(this).remove()
                }) : s.find(".js-switch-pay-modal li").each(function() {
                    t.enableMethod.push($(this).data("method"))
                })
            }) : "wechat" == t.payMethod ? function() {
                var a = 0;
                "miniprogram" === e.__wxjs_environment && (a = 1), $.post("index.php?i=" + e.sysinfo.uniacid + "&j=" + e.sysinfo.acid + "&c=entry&m=core&do=pay&iswxapp=" + a, {
                    method: t.payMethod,
                    tid: t.orderTid,
                    title: t.orderTitle,
                    fee: t.orderFee,
                    module: t.module
                }, function(e) {
                    if (i.loading().hide(), (e = $.parseJSON(e)).message.errno) {
                        if ("2" == e.message.errno) return void i.message("确认您的支付身份，跳转支付中", e.message.message, "success");
                        var a = {
                            errno: e.message.errno,
                            message: e.message.message
                        };
                        return t.fail(a), void t.complete(a)
                    }
                    payment = e.message.message, WeixinJSBridge.invoke("getBrandWCPayRequest", {
                        appId: payment.appId,
                        timeStamp: payment.timeStamp,
                        nonceStr: payment.nonceStr,
                        package: payment.package,
                        signType: payment.signType,
                        paySign: payment.paySign
                    }, function(e) {
                        if ("get_brand_wcpay_request:ok" == e.err_msg) i = {
                            errno: 0,
                            message: e.err_msg
                        }, t.success(i), t.complete(i);
                        else if ("get_brand_wcpay_request:cancel" == e.err_msg) i = {
                            errno: -1,
                            message: e.err_msg
                        }, t.complete(i);
                        else {
                            var i = {
                                errno: -2,
                                message: e.err_msg
                            };
                            t.fail(i), t.complete(i)
                        }
                    })
                })
            }() : "alipay" == t.payMethod ? (i.loading().hide(), $.post("index.php?i=" + e.sysinfo.uniacid + "&j=" + e.sysinfo.acid + "&c=entry&m=core&do=pay", {
                method: t.payMethod,
                tid: t.orderTid,
                title: t.orderTitle,
                fee: t.orderFee,
                module: t.module
            }, function(e) {
                if (i.loading().hide(), (e = $.parseJSON(e)).message.errno) {
                    var a = {
                        errno: e.message.errno,
                        message: e.message.message
                    };
                    return t.fail(a), void t.complete(a)
                }
                require(["../payment/alipay/ap.js"], function() {
                    _AP.pay(e.message.message)
                })
            })) : (i.loading().hide(), $.post("index.php?i=" + e.sysinfo.uniacid + "&j=" + e.sysinfo.acid + "&c=entry&m=core&do=pay", {
                method: t.payMethod,
                tid: t.orderTid,
                title: t.orderTitle,
                fee: t.orderFee,
                module: t.module
            }, function(e) {
                if (e = $.parseJSON(e), i.loading().hide(), e.message.errno) {
                    var a = {
                        errno: e.message.errno,
                        message: e.message.message
                    };
                    return t.fail(a), void t.complete(a)
                }
                location.href = e.message.message
            })), !0
        }
        i.toast("请确认支付金额", "", "error")
    }, i.poppicker = function(e, i) {
        require(["mui.datepicker"], function() {
            mui.ready(function() {
                var t = new mui.PopPicker({
                    layer: e.layer || 1
                });
                t.setData(e.data), $.isFunction(e.setSelectedValue) && e.setSelectedValue(t.pickers), t.show(function(e) {
                    $.isFunction(i) && i(e), t.dispose()
                })
            })
        })
    }, i.districtpicker = function(e, t) {
        require(["mui.districtpicker"], function(a) {
            mui.ready(function() {
                var n = {
                        layer: 3,
                        data: a
                    },
                    o = {};
                $.map(a, function(e, i) {
                    if (e.text != t.province);
                    else {
                        if (o.province = i, !a[i].children) return;
                        $.map(a[i].children, function(e, n) {
                            if (e.text == t.city) {
                                if (o.city = n, !a[i].children[n].children) return;
                                return console.dir(a[i].children[n].children), void $.map(a[i].children[n].children, function(e, i) {
                                    e.text != t.district || (o.district = i)
                                })
                            }
                        })
                    }
                }), n.setSelectedValue = function(e) {
                    console.dir(o), o.province && e[0].setSelectedIndex(o.province), o.city && e[1].setSelectedIndex(o.city), o.district && e[2].setSelectedIndex(o.district)
                }, i.poppicker(n, e)
            })
        })
    }, i.datepicker = function(e, i) {
        require(["mui.datepicker"], function() {
            mui.ready(function() {
                var t;
                t = new mui.DtPicker(e), console.dir(t), t.show(function(e) {
                    $.isFunction(i) && i(e), t.dispose()
                })
            })
        })
    }, i.querystring = function(e) {
        var i = location.search.match(new RegExp("[?&]" + e + "=([^&]+)", "i"));
        return null == i || i.length < 1 ? "" : i[1]
    }, i.tomedia = function(i, t) {
        if (!i) return "";
        if (0 == i.indexOf("./addons")) return e.sysinfo.siteroot + i.replace("./", ""); - 1 != i.indexOf(e.sysinfo.siteroot) && -1 == i.indexOf("/addons/") && (i = i.substr(i.indexOf("images/"))), 0 == i.indexOf("./resource") && (i = "app/" + i.substr(2));
        var a = i.toLowerCase();
        return -1 != a.indexOf("http://") || -1 != a.indexOf("https://") ? i : i = t || !e.sysinfo.attachurl_remote ? e.sysinfo.attachurl_local + i : e.sysinfo.attachurl_remote + i
    }, i.sendCode = function(i, t) {
        var a = {
            btnElement: "",
            showElement: "",
            showTips: "%s秒后重新获取",
            btnTips: "重新获取验证码",
            successCallback: arguments[3]
        };
        if ("object" != typeof arguments[1]) {
            var n = i,
                i = t;
            t = {
                btnElement: $(n),
                showElement: $(n),
                showTips: "%s秒后重新获取",
                btnTips: "重新获取验证码",
                successCallback: arguments[2]
            }
        } else t = $.extend({}, a, t);
        if (!i) return t.successCallback("1", "请填写正确的帐号");
        if (!/^1[3|4|5|7|8][0-9]{9}$/.test(i) && !/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(i)) return t.successCallback("1", "格式错误");
        var o = 60;
        t.showElement.html(t.showTips.replace("%s", o)), t.showElement.attr("disabled", !0);
        var s = setInterval(function() {
                --o <= 0 ? (clearInterval(s), o = 60, t.showElement.html(t.btnTips), t.showElement.attr("disabled", !1)) : t.showElement.html(t.showTips.replace("%s", o))
            }, 1e3),
            r = {};
        r.receiver = i, r.uniacid = e.sysinfo.uniacid, $.post("../web/index.php?c=utility&a=verifycode", r).success(function(e) {
            return "success" == e ? t.successCallback("0", "验证码发送成功") : t.successCallback("1", e)
        })
    }, i.loading1 = function() {
        var e = $("#modal-loading");
        return 0 == e.length && ($(document.body).append('<div id="modal-loading" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>'), e = $("#modal-loading"), html = '<div class="modal-dialog">\t<div style="text-align:center; background-color: transparent;">\t\t<img style="width:48px; height:48px; margin-top:100px;" src="../attachment/images/global/loading.gif" title="正在努力加载...">\t</div></div>', e.html(html)), e.modal("show"), e.next().css("z-index", 999999), e
    }, i.loaded1 = function() {
        var e = $("#modal-loading");
        e.length > 0 && e.modal("hide")
    }, i.cookie = {
        prefix: "",
        set: function(e, i, t) {
            expires = new Date, expires.setTime(expires.getTime() + 1e3 * t), document.cookie = this.name(e) + "=" + escape(i) + "; expires=" + expires.toGMTString() + "; path=/"
        },
        get: function(e) {
            for (cookie_name = this.name(e) + "=", cookie_length = document.cookie.length, cookie_begin = 0; cookie_begin < cookie_length;) {
                if (value_begin = cookie_begin + cookie_name.length, document.cookie.substring(cookie_begin, value_begin) == cookie_name) {
                    var i = document.cookie.indexOf(";", value_begin);
                    return -1 == i && (i = cookie_length), unescape(document.cookie.substring(value_begin, i))
                }
                if (cookie_begin = document.cookie.indexOf(" ", cookie_begin) + 1, 0 == cookie_begin) break
            }
            return null
        },
        del: function(e) {
            new Date;
            document.cookie = this.name(e) + "=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/"
        },
        name: function(e) {
            return this.prefix + e
        }
    }, i.agent = function() {
        var e = navigator.userAgent,
            i = e.indexOf("Android") > -1 || e.indexOf("Linux") > -1,
            t = !!e.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
        return i ? "android" : t ? "ios" : "unknown"
    }, i.removeHTMLTag = function(e) {
        if ("string" == typeof e) return e = e.replace(/<script[^>]*?>[\s\S]*?<\/script>/g, ""), e = e.replace(/<style[^>]*?>[\s\S]*?<\/style>/g, ""), e = e.replace(/<\/?[^>]*>/g, ""), e = e.replace(/\s+/g, ""), e = e.replace(/&nbsp;/gi, "")
    }, i.card = function() {
        $.post("./index.php?c=utility&a=card", {
            uniacid: e.sysinfo.uniacid,
            acid: e.sysinfo.acid
        }, function(t) {
            if (i.loading().hide(), 0 == (t = $.parseJSON(t)).message.errno) return i.message("没有开通会员卡功能", "", "info"), !1;
            1 == t.message.errno && wx.ready(function() {
                wx.openCard({
                    cardList: [{
                        cardId: t.message.message.card_id,
                        code: t.message.message.code
                    }]
                })
            }), 2 == t.message.errno && (location.href = "./index.php?i=" + e.sysinfo.uniacid + "&c=mc&a=card&do=mycard"), 3 == t.message.errno && (alert("由于会员卡升级到微信官方会员卡，需要您重新领取并激活会员卡"), wx.ready(function() {
                wx.addCard({
                    cardList: [{
                        cardId: t.message.message.card_id,
                        cardExt: t.message.message.card_ext
                    }],
                    success: function(e) {}
                })
            }))
        })
    }, "function" == typeof define && define.amd ? define(function() {
        return i
    }) : e.util = i
}(window),
function(e, i) {
    e["avatar.preview.html"] = '<div class="fadeInDownBig animated js-avatar-preview avatar-preview" style="position:relative; width:100%;z-index:9999"><img src="" alt="" class="cropper-hidden"><div class="bar-action mui-clearfix"><a href="javascript:;" class="mui-pull-left js-cancel">取消</a> <a href="javascript:;" class="mui-pull-right mui-text-right js-submit">选取</a></div></div>', e["image.preview.html"] = '<div class="bar-action mui-clearfix"><a href="javascript:;" class="mui-pull-left js-cancel">取消</a> <a href="javascript:;" class="mui-pull-right mui-text-right js-submit">删除</a></div>', e["message.html"] = '<div class="mui-content-padded"><div class="mui-message"><div class="mui-message-icon"><span></span></div><h4 class="title"></h4><p class="mui-desc"></p><div class="mui-button-area"><a href="javascript:;" class="mui-btn mui-btn-success mui-btn-block">确定</a></div></div></div>'
}(this.window.util.templates = this.window.util.templates || {});