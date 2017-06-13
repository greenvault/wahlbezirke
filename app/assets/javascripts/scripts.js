var tablesort = function() {
  $(".tablesorter").tablesorter();
};

var flashfade = function() {
  $("#flashBox").click(function() {
    $(this).fadeOut(300, function() {
      $(this).hide();
      console.log('Hidden.');
    });
  });
};

$(document).on('turbolinks:load', flashfade);
$(document).on('turbolinks:load', tablesort);

