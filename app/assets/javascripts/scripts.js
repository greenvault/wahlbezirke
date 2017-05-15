$(function(){
  $(".tablesorter").tablesorter();
  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  });
  console.log('Scripts loaded.');
});
