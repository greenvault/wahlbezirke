json.states do
  json.array!(@states) do |state|
    json.name state.name
    json.url state_path(state)
  end
end

json.districts do
  json.array!(@districts) do |district|
    json.name district.name
    json.url district_path(district)
  end
end

json.municipalities do
  json.array!(@municipalities) do |municipality|
    json.name municipality.name
    json.url municipality_path(municipality)
  end
end
