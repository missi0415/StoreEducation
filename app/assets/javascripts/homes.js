$(function() {
$(".list").hover(function() {
  //ホバーはマウスがあたっているときだけ
    $(this).children("p").toggleClass("active")
  //トグルはクラスが付与してあったら外す
});
});

$(function() {
$(".check").hover(function() {
  //ホバーはマウスがあたっているときだけ
    $(this).children("p").toggleClass("active")
  //トグルはクラスが付与してあったら外す
});
});







// $(document).on('turbolinks:load',function(){
//   $(".list").each(function() {
//     $(this).hover(function(a, b) {
//         $(this)
//           .children("p")
//           .fadeIn();
//       },
//       function() {
//         $(this)
//           .children("p")
//           .fadeOut();
//       }
//     );
//   });
// });
$(document).on('turbolinks:load',function(){
  $(".members ").each(function() {
    $(this).hover(function(a, b) {
        $(this)
          .children("h5")
          .fadeIn();
      },
      function() {
        $(this)
          .children("h5")
          .fadeOut();
      }
    );
  });
});


$(function(){
  $('textarea.auto-resize')
  .on('change keyup keydown paste cut online', function(){
    if ($(this).outerHeight() > this.scrollHeight){
      $(this).height(1)
    }
    while ($(this).outerHeight() < this.scrollHeight){
      $(this).height($(this).height() + 1)
    }
  }).trigger('change');
});

$(function(){
  $('textarea#auto-resize')
  .on('change keyup keydown paste cut online', function(){
    if ($(this).outerHeight() > this.scrollHeight){
      $(this).height(1)
    }
    while ($(this).outerHeight() < this.scrollHeight){
      $(this).height($(this).height() + 1)
    }
  }).trigger('change');
});

$(function(){
	 $(".sidebar").frix();
});