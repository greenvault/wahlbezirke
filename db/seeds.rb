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

  m = Municipality.find_by(ars: ars, election_id: @ltwh.id)
  if m.nil?
    m = Municipality.create(name: municipality, district: d, ars: ars,
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
