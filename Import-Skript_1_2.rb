# data needs to be exported to CSV format, UTF-8 encoded and
# with a semicolon separator. Save CSV file at the folder level just
# above the application or modify line 6 with correct location.

# states name hash for correct abbreviations according to ISO
states = {
'Baden-Württemberg': 'BW',
'Bayern': 'BY',
'Berlin': 'BE',
'Brandenburg':	'BB',
'Bremen': 'HB',
'Hamburg': 'HH',
'Hessen': 'HE',
'Mecklenburg-Vorpommern': 'MV',
'Niedersachsen': 'NI',
'Nordrhein-Westfalen':	'NW',
'Rheinland-Pfalz': 'RP',
'Saarland': 'SL',
'Sachsen': 'SN',
'Sachsen-Anhalt': 'ST',
'Schleswig-Holstein': 'SH',
'Thüringen':	'TH'
}

arr = []
file = File.open('data.csv')
file.each_line { |l| arr << l }
arr.shift

class Item < Struct.new(:district_identifier, :municipality, :municipality_identifier, :precinct_identifier, :district_score, :district_rank, :municipality_rank, :state)
end

items = []

arr.each do |a|
  puts a
  input = a.chomp.split(';')
  item = Item.new(*input)
  items << item
end
