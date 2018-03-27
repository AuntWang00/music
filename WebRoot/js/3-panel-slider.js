$(function() { 

var slideTiming = 10000; // this variable is the time it takes before the slide is changed
var animationTime = 500; // this variable changes the animation duration
var controlsHideTime = 200; // this variable changes the time it takes for the next and previous buttons to hide
var current = 1; // slide to be opened at the load of the page

// hide controls buttons
$("#slider-panels-next").hide();
$("#slider-panels-previous").hide();

// hide & show slider next & previous buttons based on mouse hover
$("#slider-panels").hover(function(){
$("#slider-panels-next").show("drop", { direction: "right" }, controlsHideTime);
$("#slider-panels-previous").show("drop", { direction: "left" }, controlsHideTime);
},function(){
$("#slider-panels-next").hide("drop", { direction: "right" }, controlsHideTime);
$("#slider-panels-previous").hide("drop", { direction: "left" }, controlsHideTime);
});

// a function that checks the slide position and animates it it also controls the small dots at the bottom of the slide
function check_slide(){
$("#slider-panel-left-carousel").animate({"right": -(300*(current-1))}, animationTime, "easeInOutExpo");
$("#slider-panel-center-carousel").animate({"top": -(400*(current-1))}, animationTime, "easeInOutExpo");
$("#slider-panel-right-carousel").animate({"left": -(300*(current-1))}, animationTime, "easeInOutExpo");	
$('.slider-dot').removeClass('slider-dot-current');
$('.slider-dot[data-slide="'+current+'"]').addClass('slider-dot-current');
}

// next slide and previous slide functions
function nextslide() {if(current==total_slides){current = 1}else{current++} check_slide();}
function previousslide() {if(current==1){current = total_slides}else{current--} check_slide();}

// click functions for next and previous slide
$("#slider-panels-next").click(function() {nextslide();});
$("#slider-panels-previous").click(function() {previousslide();});


// auto change the slide position in certain amount of time
var refreshIntervalId = setInterval(nextslide, slideTiming);

// looping through the images located in #slider-panel-images and add them in all of the 3 slides and add slider control dots this is also where we set the size of the slider carousel
var total_slides = 0;
$("#slider-panel-images img").each(function() {
total_slides++;
$("#slider-panel-left-carousel").append('<div class="slider-panel-left-carousel-tab"><img src="'+$(this).attr('src')+'" width="'+$(this).attr('width')+'" height="'+$(this).attr('height')+'" /></div>');
$("#slider-panel-center-carousel").append('<div class="slider-panel-center-carousel-tab"><img src="'+$(this).attr('src')+'" width="'+$(this).attr('width')+'" height="'+$(this).attr('height')+'" /></div>');
$("#slider-panel-right-carousel").append('<div class="slider-panel-right-carousel-tab"><img src="'+$(this).attr('src')+'" width="'+$(this).attr('width')+'" height="'+$(this).attr('height')+'" /></div>');
$("#slider-dots").append('<div class="slider-dot" data-slide="'+total_slides+'"></div>');
$("#slider-panel-left-carousel").css('width',(300*total_slides));
$("#slider-panel-right-carousel").css('width',(300*total_slides));
$("#slider-panel-center-carousel").css('height',(400*total_slides));
$("#slider-dots").css('width',(total_slides*26));
});

// this changes the slide based on the dot clicked
$(".slider-dot").click(function() { current = $(this).attr('data-slide'); check_slide();  });

// this summons the check_slide() function when the page loads
check_slide();

});