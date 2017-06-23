var tablesort = function() {
  $(".tablesorter").tablesorter();
};

var flashfade = function() {
  $("#flashBox").click(function() {
    $(this).fadeOut(500, function() {
      $(this).hide();
    });
  });
};

var flashhide = function() {
  setTimeout(function() {
    $('#flashBox').fadeOut(500, function() {
      $(this).hide();
    });
  }, 3500);
};


$(document).on('turbolinks:load', flashfade);
$(document).on('turbolinks:load', flashhide);
$(document).on('turbolinks:load', tablesort);

