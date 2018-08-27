# Load seed data for LTW Bayern 2018
puts 'Loading data for LTW Bayern 2018'
@election = Election.find_by(abbreviation: 'ltwb2018')
municipalities = 1
@state = State.find_by(name: "Bayern")

# Load seed data for municipalities and assign temporary district
@district = District.create(state: @state, name: 'temp_district',
                    election: @election, district_identifier: 'test123')

File.readlines("#{Rails.root}/db/seeds/ltwb2018-municipalities.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    district_score = i.chomp.split(';')

  m = Municipality.find_by(municipality_identifier: ars, election: @election)
  if m.nil?
    m = Municipality.create(name: municipality, election: @election,
                            municipality_identifier: ars,
                            district: @district,
                            district_score: district_score)
    municipalities += 1
  end

  print '.'
end

puts "Imported #{municipalities}."

# Load seed data for precincts and update municipalities
precincts = 0
districts = 0
municipalities = 0

File.readlines("#{Rails.root}/db/seeds/ltwb2018-precincts.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    precinct_identifier, district_score, = i.chomp.split(';')

  d = District.find_by(district_identifier: district_identifier,
                       election: @election)
  if d.nil?
    d = District.create(district_identifier: district_identifier, state: @state,
                        election: @election, name: district_name)
    print " Creating district #{@state.abbreviation}
    #{district_name} - #{district_identifier}."
    districts += 1
  end

  m = Municipality.find_by(municipality_identifier: ars, election: @election)
  if m.district == @district
    m.update(district: d)
    print " Updated municipality #{municipality} to #{d.district_identifier}"
    municipalities += 1
  end

  p = Precinct.find_by(precinct_identifier: precinct_identifier,
                       municipality: m, election: @election)
  if p.nil?
    p = Precinct.create(precinct_identifier: precinct_identifier,
                        municipality: m, election: @election, district: d,
                        district_score: district_score)
    precincts += 1
  end
  print '.'
end

puts "Imported #{districts} districts, #{municipalities} municipalities,
#{precincts} precincts."
