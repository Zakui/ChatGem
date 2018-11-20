// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require engine_cable
//= require toastr
//= require chat_engine/ion.sound
//= require_tree .

$(function () {
    // body...
    ion.sound({
        sounds: [
            {
                name: "pling_sound"
            }
            // ,
            // {
            //     name: "notify_sound",
            //     volume: 0.2
            // },
            // {
            //     name: "alert_sound",
            //     volume: 0.3,
            //     preload: false
            // }
        ],
        volume: 0.5,
        path: "/sounds/",
        preload: true
    });
    // ion.sound.play("pling_sound");
});
$(document).ready(function() {
$('#search-nodata').hideseek({
  nodata: 'No results found'
});    
$chat = $('.chat-app-window');
   
    height = 1000000000000; 
$chat.animate({
      scrollTop: height
    });     
function opacity(){
    $(".answer-btn-1").css('opacity','1');
    $(".answer-btn-1").css('pointer-events','auto');
    $(".answer-btn-1").css('cursor','pointer');
    $(".chat-submit").css('opacity','1');
    $(".chat-submit").css('pointer-events','auto');
    $(".chat-submit").css('cursor','pointer');
        
    }  
function opacityfa () {
    
    $(".answer-btn-1").css('opacity','1');
    $(".answer-btn-1").css('pointer-events','auto');
    $(".answer-btn-1").css('cursor','pointer');
}
function opacityf () {
    
    $(".chat-submit").css('opacity','1');
    $(".chat-submit").css('pointer-events','auto');
    $(".chat-submit").css('cursor','pointer');
}

function opacity0 () {
    $(".answer-btn-1").css('opacity','0.3');
    $(".answer-btn-1").css('pointer-events','none');
    $(".answer-btn-1").css('cursor','not-allowed');

}
function opacity0f () {
    $(".chat-submit").css('opacity','0.3');
    $(".chat-submit").css('pointer-events','none');
    $(".chat-submit").css('cursor','not-allowed');
}


$(".answer-btn-1").click(function() {
    $("#doc").click();
    opacity0();
});

$("#doc").change(function(){
    $(".chat-submit").click();
    setTimeout(opacityfa, 3000);
});

if ($('#message-body').val() == ''){
    opacity0f();
}

$("#message-body").keyup(function(){
if ($('#message-body').val() == ''){
    opacity0f();
}

else {
    opacity();
}



});




$("#message-body").keydown(function(e) {
    var key = e.charCode || e.keyCode;
if ($('#message-body').val() == '' && key === 13){
    e.preventDefault();
}

else if ($('#message-body').val() != '' && key === 13) {
    $(".chat-submit").click();
  }
  


});

$(".chat-submit").click(function() {
    opacity0f();
 
});

$("#message-body").keydown(function(event) {
    
    if (event.keyCode === 13) {
    opacity0f();
    }
});

       
});
