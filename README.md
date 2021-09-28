# WAHLBEZIRKE

Diese Anwendung stellt die Wahlkreis-Analyse der Grünen dar.
Die folgenden Features sind ausführlich im Trello-Board
[greenvault/wahlbezirke](https://trello.com/b/xY9t6lKG/greenvault-wahlbezirke)
dokumentiert.

Diese Anwendung wurde in den Wahlatlas übertragen und wird daher nicht mehr weiterentwickelt.

## Implementiert
- Modellierung der zu importierenden Daten
- Frontend-Darstellung auf Gemeinde- und WK-Ebene
- korrekte alphabetische Sortierung der Gemeindenamen
- `tablesort` Library im Frontend
- umschaltbare Darstellung Wahlbezirke / Gemeinden je Wahlkreis
- Suchfunktion mit Autocomplete via `ransack` + `easyautocomplete.js`
- SAML-Login mit `netz.gruene.de`


## To-do
- tbd. Geplante Features wurden implementiert.

## License
Released under the [MIT License](http://www.opensource.org/licenses/MIT)

- sessions_path?
- change root page, redirect to states#index from session#create?
- add state to election?
- regex: ^[\S]+
