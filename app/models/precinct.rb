class Precinct < ApplicationRecord
  belongs_to :election
  belongs_to :district
  belongs_to :municipality
end
