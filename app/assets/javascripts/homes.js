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
