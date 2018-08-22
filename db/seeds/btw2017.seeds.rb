# Set up states hash
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

# Load seed data for BTW 2017
puts 'Loading data for BTW2017...'
@e = Election.find_by(abbreviation: 'btw2017')

File.readlines("#{Rails.root}/db/seeds/btw2017.csv").drop(1).
  each do |i|
  district_identifier, municipality, municipality_identifier,
    precinct_identifier, district_score, district_rank,
    municipality_rank, state = i.chomp.split(';')

  s = State.find_by(name: state)
  if s.nil?
    s = State.create(name: state, abbreviation: states[state.to_sym])
  end

  d = District.find_by(district_identifier: district_identifier)
  if d.nil?
    d = District.create(district_identifier: district_identifier,
                        state: s, election_id: @e.id)
  end

  m = Municipality.find_by(municipality_identifier: municipality_identifier)
  if m.nil?
    m = Municipality.create(name: municipality,
                            municipality_identifier: municipality_identifier,
                            district: d, election_id: @e.id)
  end

  p = Precinct.find_by(precinct_identifier: precinct_identifier,
                       municipality: m)
  if p.nil?
    p = Precinct.create(precinct_identifier: precinct_identifier,
                          district_score: district_score.gsub(',','.'),
                          district_rank: district_rank,
                          municipality_rank: municipality_rank,
                          municipality: m, election_id: @e.id)
  end
  print '.'
end

puts 'Import complete.'

