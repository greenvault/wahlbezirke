# Create elections
[
  [ 'name': 'Bundestagswahl 2017', 'abbreviation': 'btw2017', 'comment':
    'Aufteilung Wahlkreise/-bezirke nach BTW 2013'],
  [ 'name': 'Landtagswahl Hessen 2018', 'abbreviation': 'ltwh2018' ],
  [ 'name': 'Landtagswahl Bayern 2018', 'abbreviation': 'ltwb2018' ]
].each { |e| Election.create e }

puts 'Initial data imported.'
