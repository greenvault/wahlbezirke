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

# Create elections
[
  [ 'name': 'Bundestagswahl 2017', 'abbreviation': 'btw2017', 'comment':
    'Aufteilung Wahlkreise/-bezirke nach BTW 2013'],
  [ 'name': 'Landtagswahl Hessen 2018', 'abbreviation': 'ltwh2018' ],
  [ 'name': 'Landtagswahl Bayern 2018', 'abbreviation': 'ltwb2018' ]
].each { |e| Election.create e }

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

# Load seed data for LTW Hessen 2018
puts 'Loading data for LTW Hessen 2018'
@ltwh = Election.find_by(abbreviation: 'ltwh2018')

File.readlines("#{Rails.root}/db/seeds/ltwh2018-districts.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    precinct_identifier, district_score, btw_district,
    precinct_name = i.chomp.split(';')

  s = State.find_by(name: "Hessen")
  d = District.find_by(district_identifier: district_identifier, election_id:
                       @ltwh.id)
  if d.nil?
    d = District.create(district_identifier: district_identifier, state: s,
                        election_id: @ltwh.id, name: district_name)
  end

  m = Municipality.find_by(municipality_identifier: ars, election_id: @ltwh.id)
  if m.nil?
    m = Municipality.create(name: municipality, district: d,
                            municipality_identifier: ars,
                            election_id: @ltwh.id)
  end

  p = Precinct.find_by(precinct_identifier: precinct_identifier,
                       municipality: m, election_id: @ltwh.id)
  if p.nil?
    p = Precinct.create(precinct_identifier: precinct_identifier,
                        municipality: m, election_id: @ltwh.id, district: d,
                        btw_district: btw_district,
                        district_score: district_score,
                        name: precinct_name)
  end
  print '.'
end

File.readlines("#{Rails.root}/db/seeds/ltwh2018-municipalities.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    district_score = i.chomp.split(';')

  s = State.find_by(name: "Hessen")
  d = District.find_by(district_identifier: district_identifier,
                       election_id: @ltwh.id)
  if d.nil?
    d = District.create(district_identifier: district_identifier,
                        state: s, election_id: @ltwh.id,
                        name: district_name)
  end

  m = Municipality.find_by(municipality_identifier: ars, election_id: @ltwh.id)
  if m.nil?
    m = Municipality.create(name: municipality, district: d,
                            election_id: @ltwh.id, municipality_identifier: ars,
                            district_score: district_score)
  else
    m.update(district_score: district_score)
    print ' Updated. '
  end

  print '.'
end

# Load seed data for LTW Bayern 2018
puts 'Loading data for LTW Bayern 2018'
e = Election.find_by(abbreviation: 'ltwb2018')

File.readlines("#{Rails.root}/db/seeds/ltwb2018-districts.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    precinct_identifier, district_score = i.chomp.split(';')
  print '.'
end

File.readlines("#{Rails.root}/db/seeds/ltwb2018-municipalities.csv").drop(1).
  each do |i|
  state, ars, municipality, precinct_identifier, precinct_name,
    district_score = i.chomp.split(';')
  print '.'
end
