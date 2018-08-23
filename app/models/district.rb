class District < ApplicationRecord
  belongs_to :election
  belongs_to :state
  has_many :precincts
  has_many :municipalities
  default_scope { order(district_identifier: :asc) }
  scope :election, -> (election) { where(election: election) }

  def municipalities
    Municipality.where(district: self)
  end

  def precincts
    Precinct.where(district: self)
  end
end
