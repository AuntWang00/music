; (function ($) {
    $.extend({
        'foucs': function (con) {
            var $container = $('#index_b_hero');
            var $imgs = $container.find('li.hero');
            var $leftBtn = $container.find('a.prev');
            var $rightBtn = $container.find('a.next');
            var config = {
                interval: con && con.interval || 4000,
                animateTime: con && con.animateTime || 600,
                direction: con && (con.direction === 'right'),
                _imgLen: $imgs.length
            };
            var i = 0;
            var getNextIndex = function (y) { return i + y >= config._imgLen ? i + y - config._imgLen : i + y; };
            var getPrevIndex = function (y) { return i - y < 0 ? config._imgLen + i - y : i - y; };
            var silde = function (d) {
                $imgs.eq((d ? getPrevIndex(2) : getNextIndex(2))).css('left', (d ? '-2000px' : '2000px'))
                $imgs.animate({
                    'left': (d ? '+' : '-') + '=1000px'
                }, config.animateTime);
                i = d ? getPrevIndex(1) : getNextIndex(1);
            };
            var s = setInterval(function () {
				silde(config.direction);
			}, config.interval);
            $imgs.eq(i).css('left', 0).end().eq(i + 1).css('left', '1000px').end().eq(i - 1).css('left', '-1000px');
            $container.find('.hero-wrap').add($leftBtn).add($rightBtn).hover(function () {
				clearInterval(s);
			}, function () {
				s = setInterval(function () {
					silde(config.direction);
				}, config.interval);
			});
            $leftBtn.click(function () {
                if ($(':animated').length === 0) {
                    silde(true);
                }
            });
            $rightBtn.click(function () {
                if ($(':animated').length === 0) {
                    silde(false);
                }
            });
        }
    });
}(jQuery));