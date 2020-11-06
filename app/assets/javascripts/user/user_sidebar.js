document.addEventListener("turbolinks:load", function() {
	// ↑リロードでJSが効かなくなるのを防止するコマンド
$(function(){
  $('.user_sidebar').hover(function(){
    $('.user_sidebar').animate({'marginLeft':'200px'},500);},
    function () {
        $('.user_sidebar').animate({'marginLeft':'0'},500);}
      );
});
})