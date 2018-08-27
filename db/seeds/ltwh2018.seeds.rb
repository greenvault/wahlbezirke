# Load seed data for LTW Hessen 2018
puts 'Loading data for LTW Hessen 2018'
@ltwh = Election.find_by(abbreviation: 'ltwh2018')
municipalities = 1
@state = State.find_by(name: "Hessen")

# Load seed data for municipalities and assign temporary district
@district = District.create(state: @state, name: 'temp_district',
                    election: @ltwh, district_identifier: 'test123')

File.readlines("#{Rails.root}/db/seeds/ltwh2018-municipalities.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    district_score = i.chomp.split(';')

  m = Municipality.find_by(municipality_identifier: ars, election: @ltwh)
  if m.nil?
    m = Municipality.create(name: municipality, election: @ltwh,
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

File.readlines("#{Rails.root}/db/seeds/ltwh2018-precincts.csv").drop(1).
  each do |i|
  state, ars, municipality, district_identifier, district_name,
    precinct_identifier, district_score, btw_district,
    precinct_name = i.chomp.split(';')

  d = District.find_by(district_identifier: district_identifier,
                       election: @ltwh)
  if d.nil?
    d = District.create(district_identifier: district_identifier, state: @state,
                        election: @ltwh, name: district_name)
    print " Creating district #{@state.abbreviation}
    #{district_name} - #{district_identifier}."
    districts += 1
  end

  m = Municipality.find_by(municipality_identifier: ars, election: @ltwh)
  if m.district == @district
    m.update(district: d)
    print " Updated municipality #{municipality} to #{d.district_identifier}"
    municipalities += 1
  end

  p = Precinct.find_by(precinct_identifier: precinct_identifier,
                       municipality: m, election: @ltwh)
  if p.nil?
    p = Precinct.create(precinct_identifier: precinct_identifier,
                        municipality: m, election: @ltwh, district: d,
                        btw_district: btw_district,
                        district_score: district_score,
                        name: precinct_name)
    precincts += 1
  end
  print '.'
end

puts "Imported #{districts} districts, #{municipalities} municipalities,
#{precincts} precincts."
