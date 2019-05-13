function marque(ul, height, show_number, delay) {
    var ul = $(ul);
    // 元素个数
    var length = ul.find('li').length;
    // 所有元素总高度
    var height_both = length * height;

    // 元素大于指定个数时开始轮播
    if (length > show_number) {
        setTimeout(marque_doing,delay * 1000);//滚动间隔时间 现在是3秒
    }

    var notFirstMove = false;

    function marque_doing() {
        // 只取整数部分，移至哪个位置
        var during = parseInt(ul.css('top'));

        if(notFirstMove) {
            // 将第一个li复制到最后面
            ul.append(ul.find('li').first());
            ul.css('top', 0);
        }

        // 如果到了最后一个元素，恢复显示到第一个元素
        if(Math.abs(during) == height_both - height) {
            ul.css('top', 0);
            during = 0;
        }
        ul.animate({
            top: 0 - height + 'px'
        }, 'slow');

        notFirstMove = true;

        setTimeout(marque_doing, delay * 1000); //滚动间隔时间 现在是3秒
    }
}

define && define(['jquery'], function ($) {
    return marque
});