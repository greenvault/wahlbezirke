# Create states from seed file
File.readlines("#{Rails.root}/db/seeds/states.csv").drop(1).each do |state|
  name, abbreviation = state.chomp.split(';')
  State.create(name: name, abbreviation: abbreviation)
  print '.'
end

# Load data seed
puts 'Loading data...'

File.readlines("#{Rails.root}/db/seeds/data.csv").drop(1).
  each do |item|

end

# Create districts from seed file
puts 'Creating districts...'
File.readlines("#{Rails.root}/db/seeds/districts.csv").drop(1).
  each do |district|
  state_id, district_identifier, name = district.chomp.split(';')
  District.create(state: State.find(state_id),
                  district_identifier: district_identifier, name: name)
  print '.'
end

# Create municipalities from seed file
puts 'Creating municipalities...'
File.readlines("#{Rails.root}/db/seeds/municipalities.csv").drop(1).
  each do |municipality|
  name, municipality_identifier, district_identifier = municipality.
    chomp.split(';')
  Municipality.create(name: name,
                      municipality_identifier: municipality_identifier,
                      district: District.
                        find_by(district_identifier: district_identifier))
  print '.'
end

# Create precincts from seed file
puts 'Creating precincts...'
File.readline("#{Rails.root}/db/seeds/precincts.csv").drop(1).
  each do |precinct|
  municipality, district, district_score, precinct_identifier = precinct.
    chomp.split(';')
  Precinct.create(municipality: municipality, district:
                  district_score: district_score,
                  precinct_identifier: precinct_identifier

end

# Assign municipality rank
puts 'Assigning municipality rank...'
Municipality.all.each do |municipality|
  i = 1
  municipality.precincts.sort_by { |precinct| precinct.district_score }.
    reverse.each do |p|
      p.update(municipality_rank: i)
      i += 1
      print '.'
  end
end

# Assign district rank
puts 'Assigning district rank...'
District.all.each do |district|
  i = 1
  district.precincts.sort_by { |precinct| precinct.district_score }.
    reverse.each do |p|
      p.update(district_rank: i)
      i += 1
      print '.'
  end
end
