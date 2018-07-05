var styleChange = {pause:{}, play:{}, plsbutton:{}};

styleChange.play.change = function(){
		$('#play').addClass('hidden');
		$('#pause').removeClass('hidden');
	};

styleChange.pause.change = function(){
		$('#pause').addClass('hidden');
		$('#play').removeClass('hidden');
	};

styleChange.plsbutton.change = function(){
		$('#t_pls_show').addClass('selectpls');
		$('#t_pls_show').removeClass('noselectpls');
	};
	
styleChange.plsbutton.recovery = function(){
		$('#t_pls_show').addClass('noselectpls');
		$('#t_pls_show').removeClass('selectpls');
	};

function initAudio(elem) {
        var title = elem.attr('t_name');
        var cover = elem.attr('t_cover');
        var artist = elem.attr('t_artist');
		
        $('.title').text(' - ' + title);
        $('.artist').text(artist);
        $('#t_cover').html('<img src="Images/' + cover+'">');
		}
		
$(document).ready(function(){
		var dur, durM, val, mus, elem, prog;		
		var Pl = 0;		
		$('#playlist ul li a').click(function(){
				$('#t_title_info').animate({top: "-1.5em",opacity: "hide"}, 0);
				initAudio($(this).parent("li"));
				$('#error').text('');
				styleChange.play.change();
				console.log(mus);
				if(mus){mus[0].pause();
						mus[0].currentTime = 0;
						$('li').removeClass('active');
					}
				mus = $(this).next("audio");
				$(this).parent("li").addClass('active');
				mus[0].play();
			});
			
		$('#t_progress').slider({
				value: 0,
				orientation: "horizontal",
				range: "min",
				animate: true,
				step: 1
			});
			
			$('audio').on("timeupdate", function() {
				mus[0].volume = val/100;
				d = this.duration;
				c = this.currentTime;
				curM = Math.floor(c/60);
				curS = Math.round(c - curM*60);
				$('#current').text(curM + ':' + curS);
				$('#t_progress').slider({
						max: d,
						min: 0,
						value: c
					});
			});
				
			$('audio').on("playing", function () {
					dur = this.duration;
					durM = Math.floor(dur/60) + ':' + Math.round((dur - Math.floor(dur/60))/10);
        			$('#duration').text(durM);
					$(this).parent("li").addClass('active');
					$('#t_title_info').animate({top: "0em",opacity: "show"}, 500);	
    		});
			
			$('audio').on("ended", function(){
					mus = $(this).parent('li').next('li').first();
					mus = mus.children('audio');
					$(this).parent("li").addClass('active');
					var next = $('li.active').next();
					$('li').removeClass('active');
					if(mus[0]){
						initAudio(next);
						mus[0].play();
					}
					else{
							$('#error').text('最后一首歌！');
							$('#t_cover').html('<img src="Images/logo.png">');
						}
				});
			
			//play button
			$('#play').click(function(){
				if(mus){
					mus[0].play();
					styleChange.play.change();
				$('#error').text('');
				}	
				else {
					$('#error').text('请先选择要播放的歌曲！');
				}

			}); 
			
			// pause button
			$('#pause').click(function() {
				
				if(mus){
					mus[0].pause();
					styleChange.pause.change();
				}
				else {
					$('#error').text('请先选择要播放的歌曲！');
				}
				
			});
			
			//next button
			$('#next').click(function(){
					mus[0].pause();
					mus[0].currentTime = 0;
					mus = mus.parent('li').next('li').first();
					mus = mus.children('audio');
					var next = $('li.active').next();
					$('#t_title_info').animate({top: "-1.25em",opacity: "hide"}, 0);
					$('li').removeClass('active');
					if(mus[0]){
						initAudio(next);
						mus[0].play();
					}
					else{
							$('#error').text('已经到底啦，请选择歌曲！');
							$('#t_cover').html('<img src="Images/logo.png">');
							mus = null;
						}
				});
				
			//prev button
			$('#prev').click(function(){
					mus[0].pause();
					mus[0].currentTime = 0;
					mus = mus.parent('li').prev('li').last();
					mus = mus.children('audio');
					var prev = $('li.active').prev();
					$('li').removeClass('active');
					$('#t_title_info').animate({top: "-1.25em",opacity: "hide"}, 0);
					if(mus[0]){
						initAudio(prev);
						mus[0].play();
					}
					else{
							$('#error').text('已经到顶啦，请选择歌曲！');
							$('#t_cover').html('<img src="Images/logo.png">');
							
							mus = null;
						}
				});

			//volume
			$('#rangeVal').slider({
					value: 60,
					orientation: "horizontal",
					range: "min",
					animate: true,
					step: 1
				});
		
			// volume text
			val = $('#rangeVal').slider("value");
			$('#val').text(val);
			
			var tooltip = $('#val');
			tooltip.hide();
			
			$('#rangeVal').slider({
				start: function( event, ui ) {
					  tooltip.fadeIn('fast');
				},
				stop: function(event,ui) {
				tooltip.fadeOut('fast');
				},
					slide: function( event, ui ) {
						val = ui.value;
						tooltip.css('left', val-30).text(ui.value);
						$('#val').text(val);
						
						if(mus){
							mus[0].volume = val/100;
						}
						else {
							$('#error').text('请先选择要播放的歌曲！');
						}
					}
				});
				
			// progress
			$('#t_progress').slider({
				start: function( event, ui ) {
					mus[0].pause();
					},
				stop: function( event, ui ) {
					prog = ui.value;
					mus[0].currentTime = prog;
					mus[0].play();
					styleChange.play.change();
				}
			});
			
			//playlist button
			$('#t_pls_show').click(function(){
					if (Pl == 0) {
					  styleChange.plsbutton.change();
					  Pl = 1;
					  }
					else {
					  styleChange.plsbutton.recovery();
					  Pl = 0;
					}
					$('#playlist').slideToggle();
				});
	});