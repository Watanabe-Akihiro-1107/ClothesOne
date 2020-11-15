document.addEventListener("turbolinks:load", function() {
	// ↑リロードでJSが効かなくなるのを防止するコマンド
$(function(){
  $('.sidebar').hover(function(){
    $('.sidebar').stop().animate({'marginLeft':'200px'},500);},
    function () {
        $('.sidebar').stop().animate({'marginLeft':'0'},500);}
      );
});
})