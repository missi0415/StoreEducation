$(document).on('turbolinks:load',function(){
  $(".list").each(function() {
    $(this).hover(function(a, b) {
        $(this)
          .children("p")
          .fadeIn();
      },
      function() {
        $(this)
          .children("p")
          .fadeOut();
      }
    );
  });
});