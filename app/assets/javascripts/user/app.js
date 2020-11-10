document.addEventListener("turbolinks:load", function() {
	// ↑リロードでJSが効かなくなるのを防止するコマンド
$(function(){
  $('.box1').fadeOut(4000);
});
})