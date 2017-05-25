var tablesort = function() {
  $(".tablesorter").tablesorter();
  console.log('Tablesorter loaded.');
};

$(document).on('turbolinks:load', tablesort);
