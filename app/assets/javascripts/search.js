document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "states",
        header: "<div class='searchHeader'>Bundesländer</div>"
      },
      {
        listLocation: "districts",
        header: "<div class='searchHeader'>Wahlkreise</div>"
      },
      {
        listLocation: "municipalities",
        header: "<div class='searchHeader'>Gemeinden</div>"
      }
    ],
    list: {
      maxNumberOfElements: 16,
      match: {
        enabled: true
      },
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});
