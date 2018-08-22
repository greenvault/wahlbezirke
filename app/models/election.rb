class Election < ApplicationRecord
  has_many :districts
  has_many :municipalities
  has_many :precincts
end
