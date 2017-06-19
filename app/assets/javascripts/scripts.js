var tablesort = function() {
  $(".tablesorter").tablesorter();
};

$(document).on('turbolinks:load', tablesort);
