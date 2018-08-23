class Precinct < ApplicationRecord
  belongs_to :election
  belongs_to :district
  belongs_to :municipality
  scope :election, -> (election) { where(election: election) }
end
