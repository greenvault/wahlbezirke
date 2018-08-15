items.each do |i|
  s = State.find_by(name: i.state)
  if s.nil?
    s = State.create(name: i.state, abbreviation: states[i.state.to_sym])
  end

  d = District.find_by(district_identifier: i.district_identifier)
  if d.nil?
    d = District.create(district_identifier: i.district_identifier, state: s)
  end

  m = Municipality.find_by(municipality_identifier: i.municipality_identifier)
  if m.nil?
    m = Municipality.create(name: i.municipality, municipality_identifier: i.municipality_identifier, district: d)
  end

  p = Precinct.find_by(precinct_identifier: i.precinct_identifier, municipality: m)
  if p.nil?
    p = Precinct.create(precinct_identifier: i.precinct_identifier, district_score: i.district_score.gsub(',', '.'), district_rank: i.district_rank, municipality_rank: i.municipality_rank, municipality: m)
  end
end
