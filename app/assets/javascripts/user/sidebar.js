document.addEventListener("turbolinks:load", function() {
	// ↑リロードでJSが効かなくなるのを防止するコマンド
$(function(){
  $('.sidebar').hover(function(){
    $('.sidebar').animate({'marginLeft':'200px'},500);},
    function () {
        $('.sidebar').animate({'marginLeft':'0'},500);}
      );
});
})